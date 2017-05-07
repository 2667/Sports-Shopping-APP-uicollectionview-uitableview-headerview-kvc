//
//  BiaoJiCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/10.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "BiaoJiCell.h"

@implementation BiaoJiCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self zdycell];
    }
    return self;
}


//自定义cell
-(void)zdycell
{
    _zuobiaoimv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self.contentView addSubview:_zuobiaoimv];
    

    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self.contentView addSubview:_jiage];
    

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
