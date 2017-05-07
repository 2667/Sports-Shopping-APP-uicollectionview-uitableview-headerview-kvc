//
//  BiaoJiQuanZiTableViewCell.m
//  TNTAPP
//
//  Created by mac on 17/3/3.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RenWuPinJiaCell.h"

@implementation RenWuPinJiaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //        设置uiview圆角,
    //设置它的圆角大小,半径.(四个角的圆角其实都是四分之一的圆,这个圆的半径就是 cornerRadius,矩形宽度的一半)
//    _priceLabel.layer.cornerRadius = _priceLabel.frame.size.height/4.5;
//    _priceLabel.layer.cornerRadius = 15;
//    //设置为yes，就可以使用圆角
//    _priceLabel.layer.masksToBounds = YES;
    
    // Initialization code
    
    [self setWaiKuan:_upFirstBtn];
    [self setWaiKuan:_upSecondBtn];
    [self setWaiKuan:_upThirdBtn];
    [self setWaiKuan:_downFirstBtn];
[self setWaiKuan:_downSecondBtn];
    [self setWaiKuan:_downThirdBtn];
   
    
}

-(void)setWaiKuan:(UIButton*)label{

    label.layer.cornerRadius = 4;//边框圆角大小
    label.layer.masksToBounds = YES;
    label.layer.borderColor = [UIColor grayColor].CGColor;//边框颜色
    label.layer.borderWidth = 1;//边框宽度
}

- (IBAction)upFirstBtnClicked:(id)sender {
    NSLog(@"upFirstBtnClicked内容是");
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
