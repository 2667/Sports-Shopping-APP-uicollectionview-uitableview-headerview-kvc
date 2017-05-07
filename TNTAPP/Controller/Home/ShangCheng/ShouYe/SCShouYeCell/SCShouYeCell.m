//
//  SCShouYeCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/5.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCShouYeCell.h"

@implementation SCShouYeCell


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
    

    _datu = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, APPwidth-30, 200)];
    [self.contentView addSubview:_datu];
    
    
    _datudise = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _datu.frame.size.width, _datu.frame.size.height)];
    [_datu addSubview:_datudise];
    

    
    
    _dikuan = [[UIImageView alloc] initWithFrame:CGRectMake(_datu.frame.size.width/2-100, _datu.frame.size.height/2-60, 200, 120)];
    [_datu addSubview:_dikuan];
    
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, _dikuan.frame.size.width, 20)];
    [_dikuan addSubview:_shijian];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(0, _shijian.frame.origin.y+_shijian.frame.size.height+5, _dikuan.frame.size.width, 20)];
    [_dikuan addSubview:_biaoting];
    
    
    _kaishou = [[UIButton alloc] initWithFrame:CGRectMake(_dikuan.frame.size.width/2-40, _biaoting.frame.origin.y+_biaoting.frame.size.height+10, 80, 30)];
    [_dikuan addSubview:_kaishou];
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
