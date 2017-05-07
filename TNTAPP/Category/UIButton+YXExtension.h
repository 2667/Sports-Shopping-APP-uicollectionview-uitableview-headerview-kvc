//
//  UIButton+YXExtension.h
//  YXFMRadio168
//
//  Created by shiqin on 2017/1/12.
//  Copyright © 2017年 mifo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, YXButtonEdgeInsetsStyle) {
    /**
     * image在上，label在下
     */
    YXButtonEdgeInsetsStyleTop, // image在上，label在下
    /**
     * image在左，label在右
     */
    YXButtonEdgeInsetsStyleLeft, // image在左，label在右
    /**
     * image在下，label在上
     */
    YXButtonEdgeInsetsStyleBottom, // image在下，label在上
    /**
     * image在右，label在左
     */
    YXButtonEdgeInsetsStyleRight // image在右，label在左
};


@interface UIButton (YXExtension)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)yx_layoutButtonWithEdgeInsetsStyle:(YXButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

@end
