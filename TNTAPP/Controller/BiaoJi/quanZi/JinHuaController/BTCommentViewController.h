//
//  BTCommentViewController.h
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/22.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BTTopic;
@interface BTCommentViewController : UIViewController

/** 帖子模型数据 */
@property(nonatomic,strong)BTTopic* topic;

@end
