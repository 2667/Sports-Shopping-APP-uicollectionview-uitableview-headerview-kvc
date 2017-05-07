//
//  BiaoJiQuanZiTableViewCell.m
//  TNTAPP
//
//  Created by mac on 17/3/3.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "firstRenWuCell.h"

@implementation firstRenWuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //        设置uiview圆角,
    //设置它的圆角大小,半径.(四个角的圆角其实都是四分之一的圆,这个圆的半径就是 cornerRadius,矩形宽度的一半)
//    _priceLabel.layer.cornerRadius = _priceLabel.frame.size.height/4.5;
    _leftImageView.layer.cornerRadius = _leftImageView.frame.size.height/2;
    //设置为yes，就可以使用圆角
    _leftImageView.layer.masksToBounds = YES;
    
    _RightImageView.layer.cornerRadius = _RightImageView.frame.size.height/2;
    //设置为yes，就可以使用圆角
    _RightImageView.layer.masksToBounds = YES;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
