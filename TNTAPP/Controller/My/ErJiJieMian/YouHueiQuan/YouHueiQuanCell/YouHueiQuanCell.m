//
//  YouHueiQuanCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/1.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YouHueiQuanCell.h"

@implementation YouHueiQuanCell



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
    
    _diseone = [[UIView alloc] initWithFrame:CGRectMake(15, 15, APPwidth-30, 100)];
    [self.contentView addSubview:_diseone];
    
    
    _disetwo = [[UIView alloc] initWithFrame:CGRectMake(15, _diseone.frame.origin.y+_diseone.frame.size.height, APPwidth-30, 30)];
    [self.contentView addSubview:_disetwo];
    

    _yuanone = [[UIView alloc] initWithFrame:CGRectMake(110, 10, 10, 10)];
    [self.contentView addSubview:_yuanone];
    

    _yuantwo = [[UIView alloc] initWithFrame:CGRectMake(110, _disetwo.frame.origin.y+_disetwo.frame.size.height-5, 10, 10)];
    [self.contentView addSubview:_yuantwo];
    
    
    _xuxian = [[UIImageView alloc] initWithFrame:CGRectMake(_yuanone.frame.origin.x+2, _yuanone.frame.origin.y+_yuanone.frame.size.height, _diseone.frame.size.height-5, _diseone.frame.size.height-5)];
    [self.contentView addSubview:_xuxian];
    
    
    _jine = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 95, 30)];
    [_diseone addSubview:_jine];
    
    _yhq = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 95, 20)];
    [_diseone addSubview:_yhq];
    
    _biaoti = [[UILabel alloc] initWithFrame:CGRectMake(130, 30, _diseone.frame.size.width-130, 30)];
    [_diseone addSubview:_biaoti];
    
    _fubiaoti = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, _diseone.frame.size.width-130, 20)];
    [_diseone addSubview:_fubiaoti];
    
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, _disetwo.frame.size.width-80, 30)];
    [_disetwo addSubview:_shijian];
    
    
    _yishiyong = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-100, 40, 70, 70)];
    [self.contentView addSubview:_yishiyong];
    
    
    _yiguoqi = [[UILabel alloc] initWithFrame:CGRectMake(_disetwo.frame.size.width-40, 0, 40, 30)];
    [_disetwo addSubview:_yiguoqi];


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
