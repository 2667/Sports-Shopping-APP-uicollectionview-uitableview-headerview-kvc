//
//  JSDTableViewController.h
//  JQBanTangHomeDemo
//
//  Created by jianquan on 2016/12/14.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define SCREEN_HEIGHT                      [UIScreen mainScreen].bounds.size.height
//#define SCREEN_WIDTH                       [UIScreen mainScreen].bounds.size.width
#define SCALE_6                                                   (SCREEN_WIDTH / 375)

@interface RenWuZaiBiaoJiVC : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableHeaderView;
@end
