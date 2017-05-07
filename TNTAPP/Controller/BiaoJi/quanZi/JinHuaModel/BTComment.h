//
//  BTComment.h
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/17.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BTUser;
@interface BTComment : NSObject
/** id */
@property(nonatomic,copy)NSString* ID;

/** 评论内容 */
@property(nonatomic,copy)NSString* content;
/** 发表这条评论的用户 */
@property(nonatomic,strong)BTUser* user;
/** 被点赞数 */
@property(nonatomic,assign)NSInteger like_count;
/** 音频文件的时长 */
@property(nonatomic,assign)NSInteger voicetime;
/** 音频文件的路径 */
@property(nonatomic,copy)NSString* voiceurl;

@end
