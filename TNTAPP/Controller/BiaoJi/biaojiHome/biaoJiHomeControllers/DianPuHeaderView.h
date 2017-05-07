//
//  biaoJiSelfHeaderView.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "buttonView.h"
//#import "BigButton.h"
//@class buttonView;
//@class biaoJiSelfTwoLabelView;
//#import "shangPuHeGeRenZhuYeView.h"

#import "XuanZheButtonView.h"
#import "ShiJinXuanZheView.h"

@protocol DianPuHeaderViewDelegate <NSObject>

//- (void)guanZuRenShuBtnClicked:(UIButton*)btn;
//
//
//- (void)dianZanCiShuBtnClicked:(UIButton*)btn;
//
//- (void)shiPingRenZhenBtnClicked:(UIButton*)btn;
//
//
//- (void)guanZhuBtnClicked:(UIButton*)btn;
//
//
//- (void)SiXinBtnClicked:(UIButton*)btn;
//
//- (void)pushController;

@end


@interface DianPuHeaderView : UIView
//@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property(nonatomic,weak)id<DianPuHeaderViewDelegate> delegate;
//头像
//@property (weak, nonatomic) IBOutlet UIImageView *guanzuIcon;
//
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//
//@property (weak, nonatomic) IBOutlet shangPuHeGeRenZhuYeView *JinDianKanKanView;


///**
// 编辑按钮
// */
//@property (weak, nonatomic) IBOutlet BigButton *Btn;
//
///**
// 完成按钮
// */
//@property (weak, nonatomic) IBOutlet BigButton *siXinBtn;

@property (weak, nonatomic) IBOutlet ShiJinXuanZheView *moRenView;


@property (weak, nonatomic) IBOutlet XuanZheButtonView *SelectView;



+(DianPuHeaderView*)instance;

@end
