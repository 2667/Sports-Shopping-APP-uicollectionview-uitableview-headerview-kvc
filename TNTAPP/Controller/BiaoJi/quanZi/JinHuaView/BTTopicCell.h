//
//  BTTopicCell.h
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BTTopic;
@protocol TopicCellDelegate <NSObject>

-(void)headerImageVieClicked;

@end


@interface BTTopicCell : UITableViewCell



/** 帖子模型数据 */
@property(nonatomic,strong)BTTopic* topic;
@property(nonatomic,weak)id<TopicCellDelegate> delegate;

@end
