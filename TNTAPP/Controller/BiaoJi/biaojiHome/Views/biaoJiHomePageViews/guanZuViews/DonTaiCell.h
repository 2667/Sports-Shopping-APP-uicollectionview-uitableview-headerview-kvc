//
//  GuanJunCell.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/8.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonTaiCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UIButton *imageButton1;

@property (weak, nonatomic) IBOutlet UIButton *imageButton2;

@property (weak, nonatomic) IBOutlet UIButton *imageButton3;

@property (weak, nonatomic) IBOutlet UIButton *imageButton4;

@property (weak, nonatomic) IBOutlet UIButton *imageButton5;


//左边label
@property (weak, nonatomic) IBOutlet UILabel *biaoJiDonTaiLabel;

@property (weak, nonatomic) IBOutlet UILabel *genXinleBiaoJiLabel;

//@property (weak, nonatomic) IBOutlet UIImageView *RightImageView;
@property (weak, nonatomic) IBOutlet UIButton *RightBtn;


+ (id)DonTaiCell;

@end
