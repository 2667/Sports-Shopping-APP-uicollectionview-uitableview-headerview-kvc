//
//  XiaoXiLieBiaoCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "XiaoXiLieBiaoCell.h"

@implementation XiaoXiLieBiaoCell


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
    
    
    _touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    [self.contentView addSubview:_touxiang];
    
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, APPwidth-180, 25)];
    [self.contentView addSubview:_name];
    
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-110, 10, 100, 25)];
    [self.contentView addSubview:_shijian];
    
    
    _neirong = [[UILabel alloc] initWithFrame:CGRectMake(70, 35, APPwidth-120, 20)];
    [self.contentView addSubview:_neirong];
    
    
    _shuliang = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-30, 35, 20, 20)];
    [self.contentView addSubview:_shuliang];
    

    
    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(10, 69, APPwidth-20, 1)];
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
