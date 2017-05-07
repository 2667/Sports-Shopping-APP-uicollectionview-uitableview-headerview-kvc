//
//  DiTuLieBiaoTableViewCell.m
//  TNTAPP
//
//  Created by mac on 17/2/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "DiTuLieBiaoTableViewCell.h"

@implementation DiTuLieBiaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+ (id)returnCell{
    return [[NSBundle mainBundle] loadNibNamed:@"DiTuLieBiaoTableViewCell" owner:nil options:nil][0];
}

- (IBAction)firstBtnClicked:(id)sender {
    
}

- (IBAction)secondBtnClicked:(id)sender {
    
}

- (IBAction)thirdBtnClicked:(id)sender {
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
