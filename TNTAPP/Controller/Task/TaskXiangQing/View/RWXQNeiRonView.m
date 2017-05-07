//
//  RWXQNeiRonView.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/11.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWXQNeiRonView.h"

@implementation RWXQNeiRonView


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
    
}


-(void)setup{
    [[NSBundle mainBundle] loadNibNamed:@"RWXQNeiRonView" owner:self options:nil];
    [self addSubview:self.view];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
