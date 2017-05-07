//
//  biaoJiSelfHeaderView.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "biaoJiSelfHeaderView.h"

@implementation biaoJiSelfHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(biaoJiSelfHeaderView*)instance{
    
    NSArray*nibArray = [[NSBundle mainBundle] loadNibNamed:@"biaoJiSelfHeaderView" owner:nil options:nil];
    
    biaoJiSelfHeaderView * view1 = [nibArray objectAtIndex:0];
    return view1;
}

@end
