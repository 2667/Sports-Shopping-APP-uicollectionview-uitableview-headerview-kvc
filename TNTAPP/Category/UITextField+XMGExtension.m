//
//  UITextField+XMGExtension.m
//  百思不得姐
//
//  Created by xiaomage on 15/9/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UITextField+XMGExtension.h"

//#define XMGPlaceholderColorKey @"placeholderLabel.textColor"

static NSString * const TNTPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (XMGExtension)
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (placeholderColor == nil) { // 清空占位文字颜色, 恢复默认的占位文字颜色
        [self setValue:TNTGrayColor(255 * 0.7) forKeyPath:TNTPlaceholderColorKey];
    } else {
        // 保存之前的占位文字
        NSString *placeholder = self.placeholder;
        
        self.placeholder = @" "; // 保证placeholderLabel被创建了
        [self setValue:placeholderColor forKeyPath:TNTPlaceholderColorKey];
        
        // 恢复之前的占位文字
        self.placeholder = placeholder;
    }
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:TNTPlaceholderColorKey];
}
@end
