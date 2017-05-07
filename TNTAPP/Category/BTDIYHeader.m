//
//  BTDIYHeader.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTDIYHeader.h"

@implementation BTDIYHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//实现父类声明的方法
-(void)prepare{

    // - (void)prepare NS_REQUIRES_SUPER;
    [super prepare];
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.textColor = [UIColor yellowColor];
    [self setTitle:@"下拉肯定可以刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开马上就可以刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"哥正在帮你刷新..." forState:MJRefreshStateRefreshing];
    //自动调整透明度x
    self.automaticallyChangeAlpha = YES;
    
}

@end
