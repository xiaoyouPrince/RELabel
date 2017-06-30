//
//  MyClass.h
//  Try
//
//  Created by 渠晓友 on 2017/6/30.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject

typedef NS_ENUM(NSInteger , Type){
    
    TypeNone        = 0,
    TypeOne         = 1 << 0,   // 1
    TypeTwo         = 1 << 1,   // 2
    TypeThree       = 1 << 2    // 4
    
//    TypeNone        = 1 << 0,   // 1
//    TypeOne         = 1 << 2,   // 4
//    TypeTwo         = 1 << 4,   // 16
//    TypeThree       = 1 << 7    // 128
};

typedef void(^CallBackBlock)();


@property (nonatomic, copy) CallBackBlock block;

- (instancetype)initWithName:(NSString *)name types:(Type)types;

- (void)showMe;


@end
