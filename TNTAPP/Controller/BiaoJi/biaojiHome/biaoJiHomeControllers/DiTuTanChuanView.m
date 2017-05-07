//
//  DiTuTanChuanView.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/2/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "DiTuTanChuanView.h"

@implementation DiTuTanChuanView

-(void)awakeFromNib{
    [super awakeFromNib];
    //设置它的圆角大小,半径.(四个角的圆角其实都是四分之一的圆,这个圆的半径就是 cornerRadius,矩形宽度的一半)
    _imageBackView.layer.cornerRadius = 5;
    //设置为yes，就可以使用圆角
    _imageBackView.layer.masksToBounds = YES;
    
    
//    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:_bottomView.bounds byRoundingCorners:UIRectCornerTopRight|UIRectCornerTopRight|UIRectCornerBottomRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
//    
//    CAShapeLayer * layer = [[CAShapeLayer alloc]init];
//    
//    layer.frame = _bottomView.bounds;
//    
//    layer.path = path.CGPath;
//    
//    _bottomView.layer.mask = layer;
    
    //调用
//    [self setMaskTo:_bottomView byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight];
    _bottomView.layer.cornerRadius = 5;
//    //设置为yes，就可以使用圆角
    _bottomView.layer.masksToBounds = YES;
    
    _headerImageView.layer.cornerRadius = _headerImageView.frame.size.width/2;
    //    //设置为yes，就可以使用圆角
    _headerImageView.layer.masksToBounds = YES;
    _detailLabel.textAlignment = NSTextAlignmentLeft;

}


- (IBAction)leftBtnClicked:(id)sender {
    
 _middleImageView.image = [UIImage imageNamed:@"beauty1"];
    
}


- (IBAction)rightBtnClicked:(id)sender {
    
    _middleImageView.image = [UIImage imageNamed:@"beauty2"];
    
}



- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(5.0, 5.0)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(DiTuTanChuanView *)instance
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"DiTuTanChuanView" owner:self options:nil];
    DiTuTanChuanView * view = [nibView objectAtIndex:0];
    
    
    return view;
}


@end
