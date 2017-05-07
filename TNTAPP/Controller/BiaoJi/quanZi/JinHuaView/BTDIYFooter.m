//
//  BTDIYFooter.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTDIYFooter.h"

@implementation BTDIYFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



//实现父类声明的方法
-(void)prepare{
    [super prepare];
    UISwitch* s= [[UISwitch alloc]init];
    s.on =YES;
    [self addSubview:s];

}


@end
