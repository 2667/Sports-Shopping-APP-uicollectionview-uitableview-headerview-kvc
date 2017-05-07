//
//  SCGouWuCheCVCell.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/10.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCGouWuCheCVCell.h"

@implementation SCGouWuCheCVCell




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self zdycell];
    }
    return self;
}


//自定义cell
-(void)zdycell
{
    _dise = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (APPwidth-30)/2, (APPwidth-30)/2+70)];
    [self.contentView addSubview:_dise];
    

   
    //图片
    _tupian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (APPwidth-30)/2, (APPwidth-30)/2)];
    [_dise addSubview:_tupian];
    
    
    //标题
    _biaoting= [[UILabel alloc] initWithFrame:CGRectMake(5, _tupian.frame.origin.y+_tupian.frame.size.height+5, ((APPwidth-30)/2)-10, 20)];
    [_dise addSubview:_biaoting];
    
    
    //价格
    _jiage = [[UILabel alloc] initWithFrame:CGRectMake(5, _biaoting.frame.origin.y+_biaoting.frame.size.height+5, ((APPwidth-30)/2)-50, 30)];
    [_dise addSubview:_jiage];
    
    
    
    _gwc = [[UIImageView alloc] initWithFrame:CGRectMake(_dise.frame.size.width-30,  _dise.frame.size.height-30, 20, 20)];
    [_dise addSubview:_gwc];
    
    
    
}



@end
