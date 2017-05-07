//
//  NSDate+XMGExtension.h
//  百思不得姐
//
//  Created by xiaomage on 15/10/16.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XMGExtension)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为明天
 */
- (BOOL)isTomorrow;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;
@end
