//
//  BTRecommendTag.h
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/17.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTRecommendTag : NSObject
/** 名字 */
@property(nonatomic,copy)NSString* theme_name;
/** 图片 */
@property(nonatomic,copy)NSString* image_list;
/** 订阅数 */
@property(nonatomic,assign)NSInteger sub_number;

@end
