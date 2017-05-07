//
//  biaoJiSelfHeaderView.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "XiangCeHeader2View.h"


@implementation XiangCeHeader2View

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    //设置它的圆角大小,半径.(四个角的圆角其实都是四分之一的圆,这个圆的半径就是 cornerRadius,矩形宽度的一半)
//    _guanzuIcon.layer.cornerRadius = _guanzuIcon.frame.size.width/2;
//    //设置为yes，就可以使用圆角
//    _guanzuIcon.layer.masksToBounds = YES;
}

+(XiangCeHeader2View*)instance{
    
    NSArray*nibArray = [[NSBundle mainBundle] loadNibNamed:@"XiangCeHeader2View" owner:nil options:nil];
    
    XiangCeHeader2View * view1 = [nibArray objectAtIndex:0];
//    _dianZanCiShuBtn. = [UIColor colorWithRed:0/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    
    return view1;
}

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self)
//    {
//        UILabel *label = [[UILabel alloc]initWithFrame:self.bounds];
//        label.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:label];
//    }
//    return self;
//}

@end
