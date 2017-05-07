//
//  SCGouWuCheCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/10.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCGouWuCheCell.h"

@implementation SCGouWuCheCell




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
    _xuanzhe = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 120)];
    _xuanzhe.layer.masksToBounds = YES;
    _xuanzhe.layer.cornerRadius = 12;
    [self.contentView addSubview:_xuanzhe];
    
    
    _datu = [[UIImageView alloc] initWithFrame:CGRectMake(40, 10, 100, 100)];
    [self.contentView addSubview:_datu];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_datu.frame.origin.x+_datu.frame.size.width+10, 20, APPwidth-160-80, 20)];
    [self.contentView addSubview:_biaoting];
    
    
    _gueige = [[UIButton alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _biaoting.frame.origin.y+_biaoting.frame.size.height+5, _biaoting.frame.size.width, 20)];
    [self.contentView addSubview:_gueige];
    
    
    _gueigexuanzhejiantou = [[UIButton alloc] initWithFrame:CGRectMake(_gueige.frame.origin.x+_gueige.frame.size.width, _gueige.frame.origin.y, 20, 20)];
    [self.contentView addSubview:_gueigexuanzhejiantou];

    
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-85, _biaoting.frame.origin.y, 80, 20)];
    [self.contentView addSubview:_jiage];
    
    
    _yuanjia = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-85, _jiage.frame.origin.y+_jiage.frame.size.height, 80, 20)];
    [self.contentView addSubview:_yuanjia];
    

    
    

    _jian = [[UIButton alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, 80, 30, 30)];
    [self.contentView addSubview:_jian];
    
    
    _shuliang = [[UILabel alloc] initWithFrame:CGRectMake(_jian.frame.origin.x+_jian.frame.size.width+10, _jian.frame.origin.y, 80, 30)];
    [self.contentView addSubview:_shuliang];
    

    
    _jia = [[UIButton alloc] initWithFrame:CGRectMake(_jian.frame.size.width+_jian.frame.origin.x+100, 80, 30, 30)];
    [self.contentView addSubview:_jia];
    
    
    _youhueiquan = [[UIButton alloc] initWithFrame:CGRectMake(_jia.frame.origin.x+_jia.frame.size.width+5, _jia.frame.origin.y, APPwidth-_jia.frame.origin.x-_jia.frame.size.width-10, _jia.frame.size.height)];
    [self.contentView addSubview:_youhueiquan];
    

    
    _xian = [[UIView alloc] initWithFrame:CGRectMake(0, 119, APPwidth, 1)];
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
