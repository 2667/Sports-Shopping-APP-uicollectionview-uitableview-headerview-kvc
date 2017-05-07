//
//  JinBiMingXiCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/20.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "JinBiMingXiCell.h"

@implementation JinBiMingXiCell


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
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 50, 50)];
    [self.contentView addSubview:_icon];
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(90, 15, APPwidth-150, 25)];
    [self.contentView addSubview:_biaoting];
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, APPwidth-150, 25)];
    [self.contentView addSubview:_shijian];
    
    _jingbi = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-120, 15, 110, 50)];
    [self.contentView addSubview:_jingbi];
    

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
