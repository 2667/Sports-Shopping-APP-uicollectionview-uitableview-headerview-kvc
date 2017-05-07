//
//  QianDaoVC.h
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/16.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QianDaoVC : UIViewController


#pragma mark - 获取日
- (NSInteger)day:(NSDate *)date;
#pragma mark - 获取月
- (NSInteger)month:(NSDate *)date;
#pragma mark - 获取年
- (NSInteger)year:(NSDate *)date;
#pragma mark - 获取当月第一天周几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
#pragma mark - 获取当前月有多少天
- (NSInteger)totaldaysInMonth:(NSDate *)date;



@end
