//
//  TaskCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/10.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell


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
    _touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 70, 70)];
    [self.contentView addSubview:_touxiang];
    
    
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(_touxiang.frame.origin.x+_touxiang.frame.size.width+10, 15, APPwidth-90-80-80, 20)];
    [self.contentView addSubview:_biaoting];
    
    
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x+_biaoting.frame.size.width+10, 15, 80, 20)];
    [self.contentView addSubview:_jiage];
    
    
    _neirong = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _biaoting.frame.origin.y+_biaoting.frame.size.height+5, APPwidth/2, 20)];
    [self.contentView addSubview:_neirong];
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(_biaoting.frame.origin.x, _neirong.frame.origin.y+_neirong.frame.size.height+5, 50, 20)];
    [self.contentView addSubview:_name];
    
    _xingbie = [[UIImageView alloc] initWithFrame:CGRectMake(_name.frame.origin.x+_name.frame.size.width, _name.frame.origin.y+4, 12, 12)];
    [self.contentView addSubview:_xingbie];
    

    _renzheng1 = [[UIImageView alloc] initWithFrame:CGRectMake(_xingbie.frame.origin.x+_xingbie.frame.size.width+8, _name.frame.origin.y+4, 12, 12)];
    [self.contentView addSubview:_renzheng1];
    

    _renzheng2 = [[UIImageView alloc] initWithFrame:CGRectMake(_renzheng1.frame.origin.x+_renzheng1.frame.size.width+3, _name.frame.origin.y+4, 12, 12)];
    [self.contentView addSubview:_renzheng2];
    

    _renzheng3 = [[UIImageView alloc] initWithFrame:CGRectMake(_renzheng2.frame.origin.x+_renzheng2.frame.size.width+3, _name.frame.origin.y+4, 12, 12)];
    [self.contentView addSubview:_renzheng3];
    

    _yuyue = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 10, 50, 50)];
    [self.contentView addSubview:_yuyue];
    


    _juliimg = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-65, _name.frame.origin.y+4, 12, 12)];
    [self.contentView addSubview:_juliimg];
    
    _julilabel = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-50, _name.frame.origin.y, 50, 20)];
    [self.contentView addSubview:_julilabel];
    

    _xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 2)];
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
