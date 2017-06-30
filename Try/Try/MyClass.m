//
//  MyClass.m
//  Try
//
//  Created by 渠晓友 on 2017/6/30.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import "MyClass.h"
#import <UIKit/UIKit.h>

@interface MyClass ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger types;

@end

@implementation MyClass

- (instancetype)init
{
    if (self = [super init]) {
        
        
    }
    return self;
}


- (instancetype)initWithName:(NSString *)name types:(Type)types
{
    if (self = [super init]) {
        
        _name = name;
        
        self.types = types;// 监听 types 的 数值就行
    }
    return self;
}

- (void)showMe
{
    // 根据类型进行打印
    
    NSLog(@"----------self.types = %zd ----------",self.types);

    
    // 这里只进行几种类型的判断
    //  0 -- > 只有default
    //  1 -- > 只有 1
    //  2 -- > 只有 2
    //  4 -- > 只有 4
    //  3 -- > 只有 1+2
    //  5 -- > 只有 1+4
    //  6 -- > 只有 2+4
    //  7 -- > 全有
    switch (self.types) {
        case 0:
            
            // 只有default
            NSLog(@"----------self.types = %zd ------这个是只有 0 的-------",self.types);
            
            
            break;
            
        case 1:
            
            // 只有default
            
            break;
            
        case 2:
            
            // 只有default
            
            break;
            
        default:
            break;
    }
}







@end
