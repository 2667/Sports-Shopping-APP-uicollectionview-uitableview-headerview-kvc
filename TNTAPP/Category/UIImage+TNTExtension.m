//
//  UIImage+TNTExtension.m
//  TNTAPP
//
//  Created by mac on 17/2/20.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "UIImage+TNTExtension.h"

@implementation UIImage (TNTExtension)

+(UIImage *)initWithColor:(UIColor*)color rect:(CGRect)rect{
    CGRect imgRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    UIGraphicsBeginImageContextWithOptions(imgRect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, imgRect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
