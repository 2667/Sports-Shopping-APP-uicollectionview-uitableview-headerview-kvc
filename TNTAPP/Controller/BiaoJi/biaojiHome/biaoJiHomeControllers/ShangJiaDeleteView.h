//
//  biaoJiSelfHeaderView.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeleteButton.h"
//#import "buttonView.h"
//#import "BigButton.h"
//@class buttonView;
//@class biaoJiSelfTwoLabelView;
//#import "shangPuHeGeRenZhuYeView.h"

@protocol ShangJiaDeleteViewDelegate <NSObject>

- (void)guanZuRenShuBtnClicked:(UIButton*)btn;


- (void)dianZanCiShuBtnClicked:(UIButton*)btn;

- (void)shiPingRenZhenBtnClicked:(UIButton*)btn;


- (void)guanZhuBtnClicked:(UIButton*)btn;


- (void)SiXinBtnClicked:(UIButton*)btn;

- (void)pushController;

@end


@interface ShangJiaDeleteView : UIView
//@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property(nonatomic,weak)id<ShangJiaDeleteViewDelegate> delegate;
//头像
//@property (weak, nonatomic) IBOutlet UIImageView *guanzuIcon;
//
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

//@property (weak, nonatomic) IBOutlet shangPuHeGeRenZhuYeView *JinDianKanKanView;


/**
 关注按钮
 */
//@property (weak, nonatomic) IBOutlet BigButton *guanZhuBtn;
//
///**
// 私信按钮
// */
//@property (weak, nonatomic) IBOutlet BigButton *siXinBtn;

/**
 添加商品btn
 */
@property (weak, nonatomic) IBOutlet DeleteButton *AddBtn;

@property (weak, nonatomic) IBOutlet DeleteButton *DeleteBtn;


+(ShangJiaDeleteView*)instance;

@end
