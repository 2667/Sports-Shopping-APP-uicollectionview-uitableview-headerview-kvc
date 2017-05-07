//
//  QianDaoDingDanCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/23.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "QianDaoDingDanCell.h"

@implementation QianDaoDingDanCell



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
    
    

    _fengexian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 10)];
    [self.contentView addSubview:_fengexian];
    

    
    _zhutu = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 100, 100)];
    [self.contentView addSubview:_zhutu];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+10, 25, APPwidth-190, 30)];
    [self.contentView addSubview:_biaoting];
    
    
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _biaoting.frame.size.height+_biaoting.frame.origin.y+5, _biaoting.frame.size.width-25, 30)];
    [self.contentView addSubview:_jiage];
    
  
    _shijianimgv = [[UIImageView alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _jiage.frame.size.height+_jiage.frame.origin.y+6.5, 15, 15)];
    [self.contentView addSubview:_shijianimgv];

    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(_shijianimgv.frame.origin.x+23, _jiage.frame.size.height+_jiage.frame.origin.y+5, _jiage.frame.size.width-25, 18)];
    [self.contentView addSubview:_shijian];
    
    
    
    _zhuantai = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-70, 25, 60, 30)];
    [self.contentView addSubview:_zhuantai];
    
    
    _zhuantaibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-80, _shijian.frame.origin.y-10, 70, 30)];
    [self.contentView addSubview:_zhuantaibtn];
    
    
    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(10, _zhutu.frame.origin.y+_zhutu.frame.size.height+10, APPwidth-20, 1)];
    [self.contentView addSubview:_xian];
    
    
    _city = [[UILabel alloc] initWithFrame:CGRectMake(10, _xian.frame.origin.y+_xian.frame.size.height+10, APPwidth-100, 20)];
    [self.contentView addSubview:_city];
    

    
    _dizhi = [[UILabel alloc] initWithFrame:CGRectMake(10, _city.frame.origin.y+_city.frame.size.height, APPwidth-100, 20)];
    [self.contentView addSubview:_dizhi];
    

    
    _juliimgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-80, _xian.frame.size.height+_xian.frame.origin.y+22.5, 15, 15)];
    [self.contentView addSubview:_juliimgv];
    
    
    _juli = [[UILabel alloc] initWithFrame:CGRectMake(_juliimgv.frame.origin.x+23, _xian.frame.size.height+_xian.frame.origin.y+5, 60, 50)];
    [self.contentView addSubview:_juli];
    
    

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
