//
//  SCPJCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/7.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCPJCell.h"

@implementation SCPJCell


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
   
    _touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 40, 40)];
    [self.contentView addSubview:_touxiang];
    
    
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(65, 5, 150, 40)];
    [self.contentView addSubview:_name];
    

    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-130, 5, 120, 40)];
    [self.contentView addSubview:_shijian];
    

    
    _xian = [[UIView alloc] initWithFrame:CGRectMake(0, _touxiang.frame.origin.y+_touxiang.frame.size.height+5, APPwidth, 1)];
    [self.contentView addSubview:_xian];
    

    
    _neirong = [[UILabel alloc] initWithFrame:CGRectMake(15, _xian.frame.origin.y+_xian.frame.size.height+10, APPwidth-30, 60)];
    [self.contentView addSubview:_neirong];
    

    
    _tupianscv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _neirong.frame.origin.y+_neirong.frame.size.height+15, APPwidth, 120)];
    [self.contentView addSubview:_tupianscv];
    

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
