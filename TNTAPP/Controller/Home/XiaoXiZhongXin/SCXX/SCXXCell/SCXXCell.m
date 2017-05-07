//
//  SCXXCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCXXCell.h"

@implementation SCXXCell



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
    
    
    _scdikuan = [[UIView alloc] initWithFrame:CGRectMake(10, _shijian.frame.origin.y+_shijian.frame.size.height+10, APPwidth-20, 317)];
    [self.contentView addSubview:_scdikuan];

    
    _scfukuancenggong = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, _scdikuan.frame.size.width-20, 20)];
    [_scdikuan addSubview:_scfukuancenggong];
    
//    @property (nonatomic,strong) UILabel * scriqi;
    _scriqi = [[UILabel alloc] initWithFrame:CGRectMake(10, _scfukuancenggong.frame.origin.y+_scfukuancenggong.frame.size.height, _scdikuan.frame.size.width-20, 20)];
    [_scdikuan addSubview:_scriqi];
    
    
//    @property (nonatomic,strong) UILabel * scjiage;
    _scjiage = [[UILabel alloc] initWithFrame:CGRectMake(10, _scriqi.frame.origin.y+_scriqi.frame.size.height+15, _scdikuan.frame.size.width-20, 40)];
    [_scdikuan addSubview:_scjiage];
    
    
//    @property (nonatomic,strong) UIView * scxian1;
    _scxian1 = [[UIView alloc] initWithFrame:CGRectMake(10, _scjiage.frame.origin.y+_scjiage.frame.size.height+10, _scdikuan.frame.size.width-20, 1)];
    [_scdikuan addSubview:_scxian1];
    
    
//    @property (nonatomic,strong) UILabel * scfukuanfs;
    _scfukuanfs = [[UILabel alloc] initWithFrame:CGRectMake(10, _scxian1.frame.size.height+_scxian1.frame.origin.y+10, 90, 30)];
    [_scdikuan addSubview:_scfukuanfs];
    
    
    _scfukuanfs2 = [[UILabel alloc] initWithFrame:CGRectMake(_scfukuanfs.frame.origin.x+_scfukuanfs.frame.size.width,_scfukuanfs.frame.origin.y, _scdikuan.frame.size.width-110, 30)];
    [_scdikuan addSubview:_scfukuanfs2];
    

    
//    @property (nonatomic,strong) UILabel * scjiaoyidueixiang;
    _scjiaoyidueixiang = [[UILabel alloc] initWithFrame:CGRectMake(10, _scfukuanfs.frame.size.height+_scfukuanfs.frame.origin.y, 90, 30)];
    [_scdikuan addSubview:_scjiaoyidueixiang];
    
    
    _scjiaoyidueixiang2 = [[UILabel alloc] initWithFrame:CGRectMake(_scjiaoyidueixiang.frame.origin.x+_scjiaoyidueixiang.frame.size.width,_scjiaoyidueixiang.frame.origin.y, _scdikuan.frame.size.width-110, 30)];
    [_scdikuan addSubview:_scjiaoyidueixiang2];
    

    
//    @property (nonatomic,strong) UILabel * scspshuoming;
    _scspshuoming = [[UILabel alloc] initWithFrame:CGRectMake(10, _scjiaoyidueixiang.frame.size.height+_scjiaoyidueixiang.frame.origin.y, 90, 30)];
    [_scdikuan addSubview:_scspshuoming];
    
    
//    @property (nonatomic,strong) UILabel * scshuoming;
    _scspshuoming2 = [[UILabel alloc] initWithFrame:CGRectMake(_scspshuoming.frame.size.width+_scspshuoming.frame.origin.x, _scspshuoming.frame.origin.y, _scdikuan.frame.size.width-110, 70)];
    [_scdikuan addSubview:_scspshuoming2];
    
    
//    @property (nonatomic,strong) UIView * scxian2;
    _scxian2 = [[UIView alloc] initWithFrame:CGRectMake(10, _scspshuoming2.frame.origin.y+_scspshuoming2.frame.size.height+10, _scdikuan.frame.size.width-20, 1)];
    [_scdikuan addSubview:_scxian2];
    
    
//    @property (nonatomic,strong) UILabel * scchakanxiangqing;
    _scchakanxiangqing = [[UILabel alloc] initWithFrame:CGRectMake(10, _scxian2.frame.origin.y+_scxian2.frame.size.height+10, 100, 30)];
    [_scdikuan addSubview:_scchakanxiangqing];
    
    
//    @property (nonatomic,strong) UIImageView * scjiantou;
    _scjiantou = [[UIImageView alloc] initWithFrame:CGRectMake(_scdikuan.frame.size.width-30, _scchakanxiangqing.frame.origin.y+7, 16, 16)];
    [_scdikuan addSubview:_scjiantou];
    
    NSLog(@"%.2f",_scchakanxiangqing.frame.origin.y+_scchakanxiangqing.frame.size.height);

    
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
