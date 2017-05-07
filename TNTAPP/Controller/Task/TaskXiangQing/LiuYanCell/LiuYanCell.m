//
//  LiuYanCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/11.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "LiuYanCell.h"

@implementation LiuYanCell


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

    
    _touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [self.contentView addSubview:_touxiang];
    
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(_touxiang.frame.origin.x+_touxiang.frame.size.width+10, 10, APPwidth-180, 40)];
    [self.contentView addSubview:_name];
    
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-110, 10,100, 40)];
    [self.contentView addSubview:_shijian];
    

    _neirong = [[UILabel alloc] initWithFrame:CGRectMake(_name.frame.origin.x, _touxiang.frame.origin.y+_touxiang.frame.size.height-10, APPwidth-_name.frame.origin.x-15, 50)];
    [self.contentView addSubview:_neirong];
 
    
    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 99, APPwidth, 1)];
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
