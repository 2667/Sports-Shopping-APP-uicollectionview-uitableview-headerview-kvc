//
//  XMGExtensionConfig.m
//  百思不得姐
//
//  Created by xiaomage on 15/10/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "XMGExtensionConfig.h"
#import <MJExtension.h>
#import "BTTopic.h"
#import "BTComment.h"

@implementation XMGExtensionConfig
+ (void)load
{
    [NSObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    
    [BTTopic setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"top_cmt" : @"top_cmt[0]",
                 @"small_image" : @"image0",
                 @"middle_image" : @"image2",
                 @"large_image" : @"image1"
                 };
    }];
}
@end
