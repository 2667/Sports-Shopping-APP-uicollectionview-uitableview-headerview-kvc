//
//  GeRenGuanZuTableViewCell.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/16.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "DuiHuaTaTableViewCell.h"

@implementation DuiHuaTaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+ (id)returnCell{
    
    
    return [[NSBundle mainBundle] loadNibNamed:@"DuiHuaTaTableViewCell" owner:nil options:nil][0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
