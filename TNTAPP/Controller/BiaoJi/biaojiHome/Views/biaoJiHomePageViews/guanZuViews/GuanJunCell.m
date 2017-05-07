//
//  GuanJunCell.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/8.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "GuanJunCell.h"

@implementation GuanJunCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    UINib *nib = [UINib nibWithName:@"BorrowCell" bundle:nil];
//    NSArray *objects = [nib instantiateWithOwner:nil options:nil];
}

+ (id)GuanJunCell{
    return [[NSBundle mainBundle] loadNibNamed:@"GuanJunCell" owner:nil options:nil][0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
