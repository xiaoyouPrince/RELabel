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
    }
    return self;
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
- (void)prepareTextSystem{
    
}

- (void)prepareText{
    
    NSAttributedString * attrString = [NSAttributedString new];

}

#pragma mark -- 字符串匹配的封装


#pragma mark -- 点击交互封装

#pragma mark -- 换行补充




@end
