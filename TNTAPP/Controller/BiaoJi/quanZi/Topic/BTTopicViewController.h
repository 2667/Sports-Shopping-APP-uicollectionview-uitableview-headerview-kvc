//
//  BTTopicViewController.h
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/16.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTTopic.h"
//@interface BTTopicViewController : UITableViewController
@interface BTTopicViewController : UIViewController

/** 帖子类型 */
-(BTTopicType)type;

@property(nonatomic,strong)UITableView *tableView;

@end
