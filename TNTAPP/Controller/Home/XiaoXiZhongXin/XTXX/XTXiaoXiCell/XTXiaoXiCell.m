//
//  XTXiaoXiCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "XTXiaoXiCell.h"

@implementation XTXiaoXiCell


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
    
    
    _dikuan = [[UIView alloc] initWithFrame:CGRectMake(10, _shijian.frame.origin.y+_shijian.frame.size.height+10, APPwidth-20, 100)];
    [self.contentView addSubview:_dikuan];
    
    
    
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [_dikuan addSubview:_icon];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_icon.frame.origin.x+_icon.frame.size.width+10, 10, _dikuan.frame.size.width-70, 30)];
    [_dikuan addSubview:_biaoting];
    
    
    _neirong = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _biaoting.frame.origin.y+_biaoting.frame.size.height+10, _biaoting.frame.size.width, 40)];
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
