//
//  RWLingQuJiLuCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWLingQuJiLuCell.h"

@implementation RWLingQuJiLuCell


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
    
    
    _touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
    [self.contentView addSubview:_touxiang];
    

    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(85, 10, 120, 30)];
    [self.contentView addSubview:_name];
    
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(85, 40, 120, 30)];
    [self.contentView addSubview:_shijian];
    

    _qiandao = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-120, 10, 100, 30)];
    [self.contentView addSubview:_qiandao];
    
    
    _jindian = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-120, 40, 100, 30)];
    [self.contentView addSubview:_jindian];
    

    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(10, 79, APPwidth-20, 1)];
    [self.contentView addSubview:_xian];
    
    

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
