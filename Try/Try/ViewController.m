//
//  ViewController.m
//  Try
//
//  Created by 渠晓友 on 2017/6/30.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    MyClass *class0 = [[MyClass alloc] initWithName:nil types:TypeNone];
    MyClass *class1 = [[MyClass alloc] initWithName:nil types:TypeNone | TypeOne];
    MyClass *class2 = [[MyClass alloc] initWithName:nil types:TypeNone | TypeTwo];
    MyClass *class3 = [[MyClass alloc] initWithName:nil types:TypeNone | TypeOne | TypeTwo];
    MyClass *class4 = [[MyClass alloc] initWithName:nil types:TypeNone | TypeThree];
    MyClass *class5 = [[MyClass alloc] initWithName:nil types:TypeNone | TypeOne | TypeThree];
    MyClass *class6 = [[MyClass alloc] initWithName:nil types:TypeNone | TypeTwo | TypeThree];
    MyClass *class7 = [[MyClass alloc] initWithName:nil types:TypeNone | TypeOne | TypeTwo | TypeThree];


    [class0 showMe];
    [class1 showMe];
    [class2 showMe];
    [class3 showMe];
    [class4 showMe];
    [class5 showMe];
    [class6 showMe];
    [class7 showMe];

}
@end
