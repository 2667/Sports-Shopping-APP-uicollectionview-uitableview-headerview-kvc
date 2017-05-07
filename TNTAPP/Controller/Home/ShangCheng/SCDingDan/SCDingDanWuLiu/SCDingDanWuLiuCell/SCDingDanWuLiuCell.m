//
//  SCDingDanWuLiuCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDingDanWuLiuCell.h"

@implementation SCDingDanWuLiuCell



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

    
    _shuxian = [[UIView alloc] initWithFrame:CGRectMake(21, 0, 1, 90)];
    [self.contentView addSubview:_shuxian];
    

    _yuandian = [[UIImageView alloc] initWithFrame:CGRectMake(15, 25, 12, 12)];
    [self.contentView addSubview:_yuandian];
    

    
    _wuliuxingxi = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, APPwidth-50, 40)];
    [self.contentView addSubview:_wuliuxingxi];
    

    _shijian = [[UILabel alloc] initWithFrame:CGRectMake(40, _wuliuxingxi.frame.origin.y+_wuliuxingxi.frame.size.height+5, APPwidth-50, 20)];
    [self.contentView addSubview:_shijian];
    
    
    _fgxian = [[UIView alloc] initWithFrame:CGRectMake(40, _shijian.frame.origin.y+_shijian.frame.size.height+9, APPwidth-50, 1)];
    [self.contentView addSubview:_fgxian];
    

    NSLog(@"%.2f",_fgxian.frame.origin.y);


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
