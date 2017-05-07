//
//  friendHeaderView.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/9.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "friendHeaderView.h"

@implementation friendHeaderView

//
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        [self setup];
//    }
//    return self;
//    
//}
//
//
//-(void)setup{
//    [[NSBundle mainBundle] loadNibNamed:@"friendHeaderView" owner:self options:nil];
//    [self addSubview:self.view];
//}


+(friendHeaderView*)instance{
    
    NSArray*nibArray = [[NSBundle mainBundle] loadNibNamed:@"friendHeaderView" owner:nil options:nil];
    
    friendHeaderView * view1 = [nibArray objectAtIndex:0];
    return view1;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
