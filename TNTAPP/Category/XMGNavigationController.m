//
//  XMGNavigationController.m
//  百思不得姐
//
//  Created by xiaomage on 15/9/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "XMGNavigationController.h"

@interface XMGNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation XMGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置pop手势的代理
    self.interactivePopGestureRecognizer.delegate = self;
}

/**
 *  重写这个方法的目的:为了拦截整个push过程,拿到所有push进来的子控制器
 *
 *  @param viewController 当前push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    if (viewController != 栈底控制器) {
    if (self.viewControllers.count > 0) {
        // 当push这个子控制器时, 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        backButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, - 20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    
    // 将viewController压入栈中
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  这个代理方法的作用:决定pop手势是否有效
 *
 *  @return YES:手势有效, NO:手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
//    if (self.viewControllers.count == 1) return NO;
//    return YES;
    return self.viewControllers.count > 1;
}
@end
