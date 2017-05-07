//
//  BTUser.h
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/17.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTUser : NSObject

/** 用户名 */
@property(nonatomic,copy)NSString* username;
/** 头像 */
@property(nonatomic,copy)NSString* profile_image;
/** 性别 */
@property(nonatomic,copy)NSString* sex;

@end
