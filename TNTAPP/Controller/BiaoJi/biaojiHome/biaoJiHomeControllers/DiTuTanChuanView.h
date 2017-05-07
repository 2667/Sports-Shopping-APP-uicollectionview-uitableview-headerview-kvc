//
//  DiTuTanChuanView.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/2/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiTuTanChuanView : UIView

//关闭图片view
@property (weak, nonatomic) IBOutlet UIImageView *CloseImageView;

/**
 中间图片背景
 */
@property (weak, nonatomic) IBOutlet UIView *imageBackView;

/**
 图片文字描述
 */
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UIView *bottomView;





/**
 头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;



@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;


+(DiTuTanChuanView *)instance;

@end
