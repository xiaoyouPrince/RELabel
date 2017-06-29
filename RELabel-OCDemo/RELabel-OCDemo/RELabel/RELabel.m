//
//  RELabel.m
//  RELabel-OCDemo
//
//  Created by 渠晓友 on 2017/6/23.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//


#define DEFAULT_MATCH_COLOR [UIColor colorWithRed: 87 / 255.0 green: 196 / 255.0 blue: 251 / 255.0 alpha:1.0f];

#import "RELabel.h"

@interface RELabel()

@property (nonatomic, strong) NSTextStorage *textStorage;
@property (nonatomic, strong) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSTextContainer *textContainer;

@property (nonatomic, strong) NSArray *linkRanges;
@property (nonatomic, strong) NSArray *userRanges;
@property (nonatomic, strong) NSArray *topicRanges;
@property (nonatomic, strong) NSArray *customRanges;

@property (nonatomic, assign) NSRange selectedRange;
@property (nonatomic, assign) BOOL isSelected;

@end

@implementation RELabel

- (void)setTapType:(TapHandlerType)tapType
{
    if (tapType == TapHandlerTypeNone) {
        
    }
}

#pragma mark -- 系统方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
      
        [self setDefaultValue];
        
        [self prepareTextSystem];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super initWithCoder:aDecoder]) {
       
        [self setDefaultValue];
        
        [self prepareTextSystem];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置容器的大小为Label的尺寸
    self.textContainer.size = self.frame.size;
}

- (void)drawTextInRect:(CGRect)rect
{
    // 背景
    if (self.selectedRange.length) {
        
        UIColor *selectedColor = self.isSelected ? [UIColor colorWithWhite:0.7 alpha:0.2] : [UIColor clearColor];
  
        [self.textStorage setAttributes:@{NSBackgroundColorAttributeName : selectedColor} range:self.selectedRange];
        
        [self.layoutManager drawBackgroundForGlyphRange:self.selectedRange atPoint:CGPointMake(0, 0)];
    }
    
    // 字形
    NSRange range = NSMakeRange(0, self.textStorage.length);
    [self.layoutManager drawGlyphsForGlyphRange:range atPoint:CGPointZero];
}

/**
    设置默认属性 --- 这些东西直接用懒加载？？
 */
- (void)setDefaultValue{
    
    _matchTextColor = DEFAULT_MATCH_COLOR;
//    _matchTypes = @[ @TapHandlerTypeUser, @TapHandlerTypeTopic, @TapHandlerTypeLink];
    _matchTypes = @[ @1, @2, @3];
    
    _textStorage = [NSTextStorage new];
    _textContainer = [NSTextContainer new];
    _layoutManager = [NSLayoutManager new];
    
    _linkRanges = [NSMutableArray new];
    _userRanges = [NSMutableArray new];
    _topicRanges = [NSMutableArray new];
    _customRanges = [NSMutableArray new];
    
    _tapType = TapHandlerTypeNone; // @0
  
}





#pragma mark -- 重写系统属性

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self prepareText];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self prepareText];
}

- (void)setFont:(UIFont *)font{
    
    [super setFont:font];
    
    [self prepareText];
}

- (void)setTextColor:(UIColor *)textColor
{
    [super setTextColor:textColor];
    
    [self prepareText];
}


#pragma mark -- 设置自定义属性

- (void)setMatchTextColor:(UIColor *)matchTextColor
{
    _matchTextColor = matchTextColor;
    
    [self prepareText];
}

- (void)setCustomMatchString:(NSString *)customMatchString
{
    _customMatchString = customMatchString;
    
    // 如果用户自己设置自定义匹配字符串，直接匹配类型为空
    self.matchTypes = @[ @0];
    
    [self prepareText];
}

- (void)setMatchTypes:(NSArray *)matchTypes
{
    _matchTypes = matchTypes;
    
    [self prepareText];
}


#pragma mark -- 懒加载私有属性

#pragma mark -- 文字系统和匹配
// 准备文本系统
- (void)prepareTextSystem{
    
    [self prepareText];
    
    [self.textStorage addLayoutManager:self.layoutManager];
    
    [self.layoutManager addTextContainer:self.textContainer];
    
    [self setUserInteractionEnabled:YES];
    
    self.textContainer.lineFragmentPadding = 0;
    
}

// 准备文本
- (void)prepareText{
    
    // 1.准备字符串
    NSAttributedString * attrString = [NSAttributedString new];
    if (self.attributedText) {
        attrString = self.attributedText;
    }else if (self.text)
    {
        attrString = [[NSAttributedString alloc] initWithString:self.text];
    }
    
    self.selectedRange = NSMakeRange(0, 0);
    
    // 2.准备换行模型
    NSMutableAttributedString *attrStringM = [self addLineBreakForAttrStr:attrString];
    
    [attrStringM addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attrStringM.length)];
    
    // 3.textStorage 内容
    [self.textStorage setAttributedString:attrStringM];
    
    // 5.根据用户匹配类型进行对应匹配
    for (NSNumber *number in self.matchTypes) {
        
        TapHandlerType type = TapHandlerTypeNone;
        if ([number  isEqual: @0]) {
            type = TapHandlerTypeNone;
        }else if ([number  isEqual: @1]) {
            type = TapHandlerTypeUser;
        }else if ([number  isEqual: @2]) {
            type = TapHandlerTypeTopic;
        }else if ([number  isEqual: @3]) {
            type = TapHandlerTypeLink;
        }
        
        switch (type) {
            case TapHandlerTypeNone:
                
                [self matchCustomString:self.customMatchString]; // 有就有，没有直接就空了
                
                break;
                
            case TapHandlerTypeUser:
                
                [self matchUser];

                break;
            case TapHandlerTypeTopic:
                
                [self matchTopic];
                
                break;
            case TapHandlerTypeLink:
                
                [self matchLink];
                
                break;
                
            default:
                break;
        }
    }
    
    [self setNeedsDisplay];

}

- (void)matchUser{
    
    
}

- (void)matchTopic{
    
}

- (void)matchLink{
    
}

- (void)matchCustomString:(NSString *)customString{
    
}

- (NSArray *)getRangesForPattern:(NSString *)pattern
{
    
//    NSRange range = NSMakeRange(0, 0);
//    
////    NSArray *a = [NSArray arrayWithObjects:range, nil];
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    
    return [self getRangesFromResultWithRegex:regex];
}

- (NSArray *)getLinkRanges{
    
    NSDataDetector * detector = [NSDataDetector alloc] initWithTypes:<#(NSTextCheckingTypes)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>
    
}

- (NSArray *)getRangesFromResultWithRegex:(NSRegularExpression *)regex
{
    
}



#pragma mark -- 字符串匹配的封装


#pragma mark -- 点击交互封装

#pragma mark -- 换行补充

- (NSMutableAttributedString *)addLineBreakForAttrStr:(NSAttributedString *)attrString{
    
    NSMutableAttributedString *attrStringM = [[NSMutableAttributedString alloc]initWithAttributedString:attrString];
    
    if (attrStringM.length == 0) {
        return attrStringM;
    }
    
    NSRange range = NSMakeRange(0, 0);
    NSMutableDictionary * attribute = (NSMutableDictionary *)[attrStringM attributesAtIndex:0 effectiveRange:&range];
    NSMutableParagraphStyle *paragraphStyle = attribute[NSParagraphStyleAttributeName];
    
    if (paragraphStyle != nil) {
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    }else{
        paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        attribute[NSParagraphStyleAttributeName] = paragraphStyle;
        
        [attrStringM setAttributes:attribute range:range];
    }

    return attrStringM;
    
}




@end
