//
//  ViewController.m
//  RELabel-OCDemo
//
//  Created by 渠晓友 on 2017/6/23.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import "ViewController.h"
#import "RELabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet RELabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


//    self.label.matchTypes = TapHandlerTypeNone;
    
    
}


- (void)viewDidAppear:(BOOL)animated
{
    
    RELabel *myLabel = [RELabel new];
    
    myLabel.frame = CGRectMake(50, 250, 250, 100);
    
    myLabel.text = @"@xiaoyouPrince : 你好，d434，这个话题#羊毛卷#的地址是https://github/xiaoyouPrince/RELabel";
    
    
    
//    self.label.matchTextColor = [UIColor redColor];

}

@end
