//
//  GeRenGuanZuTableViewCell.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/16.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DuiHuaTaTableViewCell : UITableViewCell

//头像
@property (weak, nonatomic) IBOutlet UIButton *guanzuIcon;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

//@property (weak, nonatomic) IBOutlet UIImageView *xinBieImageView;


//背景view
//@property (weak, nonatomic) IBOutlet UIView *backView;

//@property (weak, nonatomic) IBOutlet UIButton *guanzuBtn;
//@property (weak, nonatomic) IBOutlet buttonView *sixinBtn;

@property (weak, nonatomic) IBOutlet UILabel *genXinQianMInLabel;

@property (weak, nonatomic) IBOutlet UILabel *zaiXianKeFuLabel;

+ (id)returnCell;

@end
