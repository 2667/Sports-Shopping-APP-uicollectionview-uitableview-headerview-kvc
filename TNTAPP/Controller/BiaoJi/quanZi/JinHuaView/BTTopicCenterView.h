//
//  BTTopicCenterView.h
//  277t-从子类xib向父类文件中拖控件声明属性
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface BTTopicCenterView : UIView

@class BTTopic;

@interface BTTopicCenterView : UIView
{
// 私有变量 , 其他类无法访问,只能够该类内部单独使用
    __weak UIImageView *_imageView;
}

+ (instancetype)centerView;

/** 帖子模型数据 */
@property (nonatomic, strong) BTTopic *topic;

@end
