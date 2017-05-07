//
//  UIImageView+XMGExtension.m
//  百思不得姐
//
//  Created by xiaomage on 15/10/9.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UIImageView+XMGExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (XMGExtension)
- (void)setHeaderWithURL:(NSString *)url
{
    [self setCircleHeaderWithURL:url];
}

- (void)setCircleHeaderWithURL:(NSString *)url
{
    UIImage *placeholder = [UIImage circleImageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 下载失败, 不做任何处理, 让它显示占位图片
        if (image == nil) return;
        self.image = [image circleImage];
    }];
}

- (void)setRectHeaderWithURL:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
@end
