//
//  WoDeFaBuDinDangCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/15.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WoDeFaBuDinDangCell.h"

@implementation WoDeFaBuDinDangCell


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

    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, APPwidth-15, 20)];
    [self.contentView addSubview:_biaoting];
    
    
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(10, _biaoting.frame.origin.y+_biaoting.frame.size.height+10, 60, 20)];
    [self.contentView addSubview:_jiage];
    
    
    _tupiansv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _jiage.frame.size.height+_jiage.frame.origin.y+10, APPwidth, 150)];
    [self.contentView addSubview:_tupiansv];
    

    _liulanlang = [[UILabel alloc] initWithFrame:CGRectMake(10, _tupiansv.frame.origin.y+_tupiansv.frame.size.height, 150, 50)];
    [self.contentView addSubview:_liulanlang];
    
    _caidan = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-70, _tupiansv.frame.origin.y+_tupiansv.frame.size.height+10, 60, 30)];
    [self.contentView addSubview:_caidan];
    
    
    _congxingfabu = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-140, _tupiansv.frame.origin.y+_tupiansv.frame.size.height+10, 60, 30)];
    [self.contentView addSubview:_congxingfabu];
    

    
    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(_caidan.frame.origin.x-100, _liulanlang.frame.origin.y, 90, 50)];
    [self.contentView addSubview:_shijian];
    

    
    _shijianimv = [[UIImageView alloc] initWithFrame:CGRectMake(_shijian.frame.origin.x-20, _tupiansv.frame.origin.y+_tupiansv.frame.size.height+17.5, 15, 15)];
    [self.contentView addSubview:_shijianimv];
        
    
    _xian = [[UIButton alloc] initWithFrame:CGRectMake(0, 270, APPwidth, 10)];
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
