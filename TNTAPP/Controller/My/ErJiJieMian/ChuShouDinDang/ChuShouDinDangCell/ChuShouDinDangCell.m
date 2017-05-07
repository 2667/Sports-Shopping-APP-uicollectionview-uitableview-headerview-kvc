//
//  ChuShouDinDangCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "ChuShouDinDangCell.h"

@implementation ChuShouDinDangCell


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
    
    _fenge = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 10)];
    [self.contentView addSubview:_fenge];
    

    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 30)];
    [self.contentView addSubview:_biaoting];
    
    
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x+_biaoting.frame.size.width+2, 20, 60, 30)];
    [self.contentView addSubview:_jiage];
    
    
    _zhutu = [[UIImageView alloc] initWithFrame:CGRectMake(10, _biaoting.frame.size.height+_biaoting.frame.origin.y+10, 100, 100)];
    [self.contentView addSubview:_zhutu];
    
    
    _zhuantai = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-40, 20, 30, 30)];
    [self.contentView addSubview:_zhuantai];
    
    
    _diziimv = [[UIImageView alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+8, _zhutu.frame.origin.y+10, 15, 15)];
    [self.contentView addSubview:_diziimv];
    
    _dizi = [[UILabel alloc] initWithFrame:CGRectMake(_diziimv.frame.origin.x+_diziimv.frame.size.width+5,_diziimv.frame.origin.y, APPwidth-_diziimv.frame.origin.x-_diziimv.frame.size.width-25, 15)];
    [self.contentView addSubview:_dizi];
    
    
    
    
    _shijianimv = [[UIImageView alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+8, _diziimv.frame.origin.y+_diziimv.frame.size.height+18, 15, 15)];
    [self.contentView addSubview:_shijianimv];
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(_shijianimv.frame.origin.x+_shijianimv.frame.size.width+5,_shijianimv.frame.origin.y, _dizi.frame.size.width, 15)];
    [self.contentView addSubview:_shijian];
    

    
    _danhaoimv = [[UIImageView alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+8, _shijianimv.frame.origin.y+_shijianimv.frame.size.height+18, 15, 15)];
    [self.contentView addSubview:_danhaoimv];
    
    _danhao = [[UILabel alloc] initWithFrame:CGRectMake(_danhaoimv.frame.origin.x+_danhaoimv.frame.size.width+5,_danhaoimv.frame.origin.y, _dizi.frame.size.width, 15)];
    [self.contentView addSubview:_danhao];
    

    
    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, _zhutu.frame.size.height+_zhutu.frame.origin.y+15, APPwidth, 1)];
    [self.contentView addSubview:_xian];
    

    
    _touxianimv = [[UIImageView alloc] initWithFrame:CGRectMake(10, _xian.frame.size.height+_xian.frame.origin.y+11, 50, 50)];
    [self.contentView addSubview:_touxianimv];
    
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(_touxianimv.frame.origin.x+_touxianimv.frame.size.width+10, _touxianimv.frame.origin.y, 100, 50)];
    [self.contentView addSubview:_name];
    
    
    
    _daiqueren = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-210,_touxianimv.frame.origin.y+7.5, 90, 35)];
    [self.contentView addSubview:_daiqueren];
    
    
    _daipingjia = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-110,_touxianimv.frame.origin.y+7.5, 90, 35)];
    [self.contentView addSubview:_daipingjia];
    

    
    
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
