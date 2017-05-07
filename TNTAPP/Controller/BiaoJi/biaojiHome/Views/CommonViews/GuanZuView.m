//
//  buttonView.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/8.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "GuanZuView.h"

@implementation GuanZuView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _titleLabel.textColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f];
        [self setup];
    }
    return self;

}


-(void)setup{
     [[NSBundle mainBundle] loadNibNamed:@"GuanZuView" owner:self options:nil];
    [self addSubview:self.view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//+(buttonView *)instance
//{
//    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"buttonView" owner:self options:nil];
//    buttonView * view = [nibView objectAtIndex:0];
//    
//    return view;
//}

@end
