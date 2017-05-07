//
//  XMGStatusBarViewController.h
//  百思不得姐
//
//  Created by xiaomage on 15/10/26.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGStatusBarViewController : UIViewController
+ (void)show;

+ (instancetype)sharedInstace;

/** 状态的显示和隐藏 */
@property (nonatomic, assign, getter=isStatusBarHidden) BOOL statusBarHidden;
/** 状态栏的样式 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@end
