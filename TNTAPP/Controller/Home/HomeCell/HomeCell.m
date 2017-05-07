//
//  HomeCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/20.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell


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
    


    
    _touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    [self.contentView addSubview:_touxiang];
    
  
    _jine = [[UILabel alloc] initWithFrame:CGRectMake(_touxiang.frame.origin.x+_touxiang.frame.size.width+10, 10, 60, 20)];
    [self.contentView addSubview:_jine];
    

    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_jine.frame.origin.x+_jine.frame.size.width+10, 10, 150, 20)];
    [self.contentView addSubview:_biaoting];
    

    _jiantou = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-25, 10, 17, 17)];
    [self.contentView addSubview:_jiantou];
    
    _xinbieimv = [[UIImageView alloc] initWithFrame:CGRectMake(_jine.frame.origin.x, _biaoting.frame.size.height+_biaoting.frame.origin.y+5, 16, 16)];
    [self.contentView addSubview:_xinbieimv];
    
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(_xinbieimv.frame.origin.x+_xinbieimv.frame.size.width+3,_xinbieimv.frame.origin.y-2, 80, 20)];
    [self.contentView addSubview:_name];
    
    
    _rztubiao1 = [[UIImageView alloc] initWithFrame:CGRectMake(_name.frame.origin.x+_name.frame.size.width+10, _biaoting.frame.size.height+_biaoting.frame.origin.y+5, 16, 16)];
    [self.contentView addSubview:_rztubiao1];
    

    _rztubiao2 = [[UIImageView alloc] initWithFrame:CGRectMake(_rztubiao1.frame.origin.x+_rztubiao1.frame.size.width+3, _biaoting.frame.size.height+_biaoting.frame.origin.y+5, 16, 16)];
    [self.contentView addSubview:_rztubiao2];
   
    
    _rztubiao3 = [[UIImageView alloc] initWithFrame:CGRectMake(_rztubiao2.frame.origin.x+_rztubiao2.frame.size.width+3, _biaoting.frame.size.height+_biaoting.frame.origin.y+5, 16, 16)];
    [self.contentView addSubview:_rztubiao3];
    
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(_xinbieimv.frame.origin.x,_xinbieimv.frame.origin.y+_xinbieimv.frame.size.height+5, 80, 16)];
    [self.contentView addSubview:_shijian];
    
    
    _tupian = [[UIScrollView alloc] initWithFrame:CGRectMake(10, _touxiang.frame.origin.y+_touxiang.frame.size.height+10, APPwidth-10, 180)];
    [self.contentView addSubview:_tupian];

    
    _neirong = [[UILabel alloc] initWithFrame:CGRectMake(15,_tupian.frame.origin.y+_tupian.frame.size.height+5, APPwidth-30, 40)];
    [self.contentView addSubview:_neirong];
    
    
    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(10, _neirong.frame.origin.y+_neirong.frame.size.height+10, APPwidth-20, 1)];
    [self.contentView addSubview:_xian];
    

    _diziimv = [[UIImageView alloc] initWithFrame:CGRectMake(10, _xian.frame.size.height+_xian.frame.origin.y+5, 10, 10)];
    [self.contentView addSubview:_diziimv];
    
    
    _dizi = [[UILabel alloc] initWithFrame:CGRectMake(30,_xian.frame.origin.y+_xian.frame.size.height, 150, 20)];
    [self.contentView addSubview:_dizi];
    
    
    _xihuanimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-110, _xian.frame.size.height+_xian.frame.origin.y+5, 10, 10)];
    [self.contentView addSubview:_xihuanimv];
    
    
    _xihuan = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-95,_xian.frame.origin.y+_xian.frame.size.height, 35, 20)];
    [self.contentView addSubview:_xihuan];
    
    
    
    _pinluenimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-55, _xian.frame.size.height+_xian.frame.origin.y+5, 10, 10)];
    [self.contentView addSubview:_pinluenimv];
    
    
    _pinluen = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-40,_xian.frame.origin.y+_xian.frame.size.height, 35, 20)];
    [self.contentView addSubview:_pinluen];
    

    

    _xian2 = [[UIView alloc] initWithFrame:CGRectMake(0, _dizi.frame.origin.y+_dizi.frame.size.height, APPwidth, 10)];
    [self.contentView addSubview:_xian2];
    
    
    _haibao = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 200)];
    [self.contentView addSubview:_haibao];
   
    
    _haibaoxian = [[UIView alloc] initWithFrame:CGRectMake(0, _haibao.frame.origin.y+_haibao.frame.size.height, APPwidth, 10)];
    [self.contentView addSubview:_haibaoxian];
    

    

    
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
