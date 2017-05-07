//
//  shangPuHeGeRenZhuYeView.m
//  TNTAPP
//
//  Created by mac on 17/3/2.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "shangPuHeGeRenZhuYeView.h"

@implementation shangPuHeGeRenZhuYeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    //    _DownLabel.textColor = [UIColor colorWithRed:0/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    if (self) {
        [self setup];
    }
    return self;
    
}


-(void)setup{
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:self.view];
}


@end
