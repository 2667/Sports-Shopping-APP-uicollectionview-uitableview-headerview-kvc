//
//  TZXXCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TZXXCell.h"

@implementation TZXXCell
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
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-65, 15, 130, 40)];
    [self.contentView addSubview:_shijian];
    
    
    _dikuan = [[UIView alloc] initWithFrame:CGRectMake(10, _shijian.frame.origin.y+_shijian.frame.size.height+10, APPwidth-20, 140)];
    [self.contentView addSubview:_dikuan];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, _dikuan.frame.size.width-30, 30)];
    [_dikuan addSubview:_biaoting];
    
    
    _hongdian = [[UIView alloc] initWithFrame:CGRectMake(10,10, 10, 10)];
    [_dikuan addSubview:_hongdian];
    
    
    _zhutu = [[UIImageView alloc] initWithFrame:CGRectMake(15, _biaoting.frame.origin.y+_biaoting.frame.size.height+10, 80, 80)];
    [_dikuan addSubview:_zhutu];
    
    
    _neirong = [[UILabel alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+10, _zhutu.frame.origin.y, _dikuan.frame.size.width-120, 20)];
    [_dikuan addSubview:_neirong];
    
    
    
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
