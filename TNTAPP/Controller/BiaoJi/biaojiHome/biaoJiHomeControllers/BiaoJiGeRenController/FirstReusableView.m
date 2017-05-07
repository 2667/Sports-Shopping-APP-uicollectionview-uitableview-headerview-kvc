//
//  ReusableView.m
//  PlainLayout
//
//  Created by hebe on 15/7/30.
//  Copyright (c) 2015年 ___ZhangXiaoLiang___. All rights reserved.
//

#import "FirstReusableView.h"
#import "HeaderViewButton.h"

#define HeaderView_height ((SCREEN_WIDTH-3)/4+43)

@implementation FirstReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat btnW= (SCREEN_WIDTH-3)/4;
        CGFloat labelW = btnW-20;
        CGFloat labelH = 21;
        for (int i=0;  i<4;i++) {
          NSLog(@"SCREEN_WIDTH内容1是%f",SCREEN_WIDTH);
            
            //初始化
            UIButton *btn1 = [[UIButton alloc]init];
            
            btn1.frame = CGRectMake(i*(btnW+1), 0,btnW, HeaderView_height);
        btn1.backgroundColor = [UIColor clearColor];
            [self addSubview:btn1];
            
            //初始化
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((btnW- labelW)/2, (HeaderView_height- labelH)/2,labelW, labelH)];
            

            label.backgroundColor = [UIColor yellowColor];
            [btn1 addSubview:label];
            label.text =@"text";
            label.textColor = [UIColor blackColor];
            label.userInteractionEnabled = NO;
            //[btn1 setBackgroundImage:[UIImage imageNamed:@"beauty1"] forState:UIControlStateNormal];
//           btn1.image = [UIImage imageNamed:@"beauty1"];
            btn1.tag = 600+i;
            [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    return self;
}


-(void)btnClicked:(UIButton*)btn{
    NSLog(@"btn内容是%zd",btn.tag);
//    if (self.delegate respondsToSelector:@selector(<#selector#>)) {
//        <#statements#>
//    }

}


//for (int i=0;  i<3;i++) {
//    
//    //初始化
//    HeaderViewButton *btn1 = [HeaderViewButton instance];
//    
//    btn1.frame = CGRectMake(i*(btnW+1), 0,btnW, HeaderView_height);
//    btn1.backgroundColor = [UIColor yellowColor];
//    [self addSubview:btn1];
//    
//}


//-(void)setText:(NSString *)text
//{
//    _text = text;
//
//    ((UILabel *)self.subviews[0]).text = text;
//}

@end
