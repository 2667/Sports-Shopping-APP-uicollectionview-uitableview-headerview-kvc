//
//  BtItemTool.m
//  274t-APP框架搭建
//
//  Created by Inspirr Mac on 16/11/15.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BtItemTool.h"

@implementation BtItemTool

+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{

    UIButton *btn = [[UIButton alloc]init];
    //[btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //[btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    
    [btn setBackgroundImage:[UIImage imageNamed:image]  forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage]  forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
