//
//  HomeCVCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/19.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "HomeCVCell.h"

@implementation HomeCVCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self zdycell];
    }
    return self;
}


//自定义cell
-(void)zdycell
{
    
    
    
    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(-10, 0, APPwidth, 2)];
    [self.contentView addSubview:_xian];
    
    
    _datu = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.contentView.frame.size.width,150)];
    [self.contentView addSubview:_datu];
    
    _wenzidise = [[UIView alloc] initWithFrame:CGRectMake(0, _datu.frame.size.height-40, _datu.frame.size.width, 40)];
    [_datu addSubview:_wenzidise];

    
    _rwmiaoshu = [[UILabel alloc] initWithFrame:CGRectMake(10, _datu.frame.size.height-40, _datu.frame.size.width-20, 20)];
    _rwmiaoshu.font = [UIFont systemFontOfSize:11];
    _rwmiaoshu.textColor = [UIColor whiteColor];
    [_datu addSubview:_rwmiaoshu];
    
    
    _rwjianli = [[UILabel alloc] initWithFrame:CGRectMake(10, _datu.frame.size.height-20, _datu.frame.size.width-20, 20)];
    _rwjianli.font = [UIFont systemFontOfSize:11];
    _rwjianli.textColor = [UIColor whiteColor];
    [_datu addSubview:_rwjianli];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_datu.frame.origin.x, _datu.frame.origin.y+_datu.frame.size.height+5, _datu.frame.size.width-25, 20)];
    [self.contentView addSubview:_biaoting];
    
    
    _xihuan = [[UIImageView alloc] initWithFrame:CGRectMake(_datu.frame.size.width-20, _biaoting.frame.origin.y+2.5, 15, 15)];
    [self.contentView addSubview:_xihuan];
    
    
    _dizitubiao = [[UIImageView alloc] initWithFrame:CGRectMake(0, _biaoting.frame.origin.y+_biaoting.frame.size.height+5, 15, 15)];
    [self.contentView addSubview:_dizitubiao];
    
    
    _dizi = [[UILabel alloc] initWithFrame:CGRectMake(_dizitubiao.frame.origin.x+_dizitubiao.frame.size.width+4, _dizitubiao.frame.origin.y, _datu.frame.size.width/2+20, 15)];
    [self.contentView addSubview:_dizi];
    
    
    
    _chakan = [[UILabel alloc] initWithFrame:CGRectMake(_datu.frame.size.width-30, _dizi.frame.origin.y, 30, 15)];
    [self.contentView addSubview:_chakan];
    

    _chakantubiao = [[UIImageView alloc] initWithFrame:CGRectMake(_chakan.frame.origin.x-19, _dizitubiao.frame.origin.y, 15, 15)];
    [self.contentView addSubview:_chakantubiao];
    

}


@end
