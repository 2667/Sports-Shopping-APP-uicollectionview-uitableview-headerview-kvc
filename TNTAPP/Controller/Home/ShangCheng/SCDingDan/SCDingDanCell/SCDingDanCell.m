//
//  SCDingDanCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/14.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDingDanCell.h"

@implementation SCDingDanCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self zdycell];
    }
    return self;
}


-(void)zdycell
{
    
    
    _datu = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 100, 100)];
    [self.contentView addSubview:_datu];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_datu.frame.origin.x+_datu.frame.size.width+10, 20, APPwidth-220, 20)];
    [self.contentView addSubview:_biaoting];
    
    
    _gueige = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _biaoting.frame.origin.y+_biaoting.frame.size.height+5, _biaoting.frame.size.width, 20)];
    [self.contentView addSubview:_gueige];
    
    
    _biaoqian = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _gueige.frame.origin.y+_gueige.frame.size.height+10, 80, 20)];
    [self.contentView addSubview:_biaoqian];
    
    

    
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-85, _biaoting.frame.origin.y, 80, 20)];
    [self.contentView addSubview:_jiage];
    
    
    _yuanjia = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-85, _jiage.frame.origin.y+_jiage.frame.size.height, 80, 20)];
    [self.contentView addSubview:_yuanjia];
    
    
   
    
    _shuliang = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-60, _yuanjia.frame.origin.y+_yuanjia.frame.size.height+10, 50, 20)];
    [self.contentView addSubview:_shuliang];
    
  
    
    _xian = [[UIView alloc] initWithFrame:CGRectMake(10, 119, APPwidth-20, 1)];
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
