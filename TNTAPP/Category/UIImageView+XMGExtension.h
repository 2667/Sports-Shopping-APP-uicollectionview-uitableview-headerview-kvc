//
//  UIImageView+XMGExtension.h
//  百思不得姐
//
//  Created by xiaomage on 15/10/9.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XMGExtension)
/**
 *  用默认的方式设置头像(默认是圆形)
 */
- (void)setHeaderWithURL:(NSString *)url;

/**
 *  设置圆形头像
 */
- (void)setCircleHeaderWithURL:(NSString *)url;

/**
 *  设置方形头像
 */
- (void)setRectHeaderWithURL:(NSString *)url;
@end
