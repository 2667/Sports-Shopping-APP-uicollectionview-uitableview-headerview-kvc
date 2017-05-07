//
//  BTCommentCell.h
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/23.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BTComment;

@interface BTCommentCell : UITableViewCell
/** 评论模型数据 */
@property(nonatomic,strong)BTComment* comment;

@end
