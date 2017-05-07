//
//  GuanJunCell.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/8.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuanJunCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UIButton *LeftBtn;

//左边label
@property (weak, nonatomic) IBOutlet UILabel *biaoShiShortLabel;

@property (weak, nonatomic) IBOutlet UILabel *biaoJiLabel;



@property (weak, nonatomic) IBOutlet UILabel *titleMiddleLabel;

@property (weak, nonatomic) IBOutlet UILabel *zanRightLabel;

//@property (weak, nonatomic) IBOutlet UIImageView *RightImageView;
@property (weak, nonatomic) IBOutlet UIButton *RightBtn;


+ (id)GuanJunCell;

@end
