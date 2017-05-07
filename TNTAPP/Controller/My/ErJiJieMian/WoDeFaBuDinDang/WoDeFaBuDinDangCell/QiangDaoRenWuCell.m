//
//  QiangDaoRenWuCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/23.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "QiangDaoRenWuCell.h"

@implementation QiangDaoRenWuCell



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
    
    _zhutu = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    [self.contentView addSubview:_zhutu];
    

    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+10, 10, APPwidth-130, 30)];
    [self.contentView addSubview:_biaoting];
    
    
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+10, _biaoting.frame.origin.y+_biaoting.frame.size.height+10, APPwidth-130, 20)];
    [self.contentView addSubview:_jiage];
    
    
    
    _chanyureshu = [[UILabel alloc] initWithFrame:CGRectMake(_zhutu.frame.origin.x+_zhutu.frame.size.width+10, _jiage.frame.origin.y+_jiage.frame.size.height+10, 100, 20)];
    [self.contentView addSubview:_chanyureshu];
    
    
    _yiliview = [[UIView alloc] initWithFrame:CGRectMake(_chanyureshu.frame.origin.x+_chanyureshu.frame.size.width+5, _chanyureshu.frame.origin.y, APPwidth-_chanyureshu.frame.origin.x-_chanyureshu.frame.size.width-10, 30)];
    [self.contentView addSubview:_yiliview];
    
    
    _yilibtn = [[UIButton alloc] initWithFrame:CGRectMake(_chanyureshu.frame.origin.x+_chanyureshu.frame.size.width+5, _chanyureshu.frame.origin.y, APPwidth-_chanyureshu.frame.origin.x-_chanyureshu.frame.size.width-10, 30)];
    [self.contentView addSubview:_yilibtn];

    
    _xian = [[UIButton alloc] initWithFrame:CGRectMake(10, _zhutu.frame.origin.y+_zhutu.frame.size.height+10, APPwidth-20, 1)];
    [self.contentView addSubview:_xian];
    

    _liulan = [[UILabel alloc] initWithFrame:CGRectMake(10, _xian.frame.origin.y+_xian.frame.size.height, 150, 50)];
    [self.contentView addSubview:_liulan];
    
    
    _caidan = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-70, _xian.frame.origin.y+_xian.frame.size.height+10, 60, 30)];
    [self.contentView addSubview:_caidan];
    
    
    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(_caidan.frame.origin.x-100, _liulan.frame.origin.y, 90, 50)];
    [self.contentView addSubview:_shijian];
    
    
    
    _shijianimgv = [[UIImageView alloc] initWithFrame:CGRectMake(_shijian.frame.origin.x-20, _shijian.frame.origin.y+17.5, 15, 15)];
    [self.contentView addSubview:_shijianimgv];
    
    
    
    _fenge = [[UIView alloc] initWithFrame:CGRectMake(0, _shijian.frame.origin.y+50, APPwidth, 10)];
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
