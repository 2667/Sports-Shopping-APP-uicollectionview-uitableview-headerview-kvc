//
//  WoDeDiZhiCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/24.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WoDeDiZhiCell.h"

@implementation WoDeDiZhiCell


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
   
    _sanchu = [[UIButton alloc] initWithFrame:CGRectMake(0, 75/2-12.5, 45, 45)];
    [self.contentView addSubview:_sanchu];

    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, 120, 20)];
    [self.contentView addSubview:_name];
    
    _dianhua = [[UILabel alloc] initWithFrame:CGRectMake(_name.frame.origin.x+_name.frame.size.width+20, 25, 100, 20)];
    [self.contentView addSubview:_dianhua];
    
    _dizhi = [[UILabel alloc] initWithFrame:CGRectMake(15, _name.frame.origin.y+_name.frame.size.height+5, APPwidth-50, 20)];
    [self.contentView addSubview:_dizhi];
    
    _jiantou = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 75/2, 20, 20)];
    [self.contentView addSubview:_jiantou];
    
    _fenge = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 10)];
    [self.contentView addSubview:_fenge];
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
