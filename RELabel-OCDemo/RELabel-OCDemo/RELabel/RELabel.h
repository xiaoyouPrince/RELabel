//
//  RELabel.h
//  RELabel-OCDemo
//
//  Created by 渠晓友 on 2017/6/23.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RELabel : UILabel

typedef NS_ENUM(NSInteger , TapHandlerType){
  
    TapHandlerTypeNone = 0 ,
    TapHandlerTypeUser,
    TapHandlerTypeTopic,
    TapHandlerTypeLink
};
@property (nonatomic, assign) TapHandlerType tapType;


@end


