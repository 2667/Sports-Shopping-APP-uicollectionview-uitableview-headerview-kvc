//
//  JinBiChouJiangVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/21.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "JinBiChouJiangVC.h"

@interface JinBiChouJiangVC ()
{
    UIScrollView * _zhengscrollview;
    UIImageView * _zhuanpanimv;
    
    UIView * _gueizheview;
    UIView * _ggbaidiview;
    
    UIView * _zhongjiangview;

}

@end

@implementation JinBiChouJiangVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:231/255.0 green:65/255.0 blue:67/255.0 alpha:1.0];
    
    
    [self zdyUI];

    [self zdydhl];
    
    [self zdyGueiZhe];
    
    [self zdyZhongJiang];
    
    
}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuei"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = @"金币抽奖";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    UIButton *  jilubtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-85, 22, 80, 40)];
    [jilubtn setTitle:@"抽奖记录" forState:UIControlStateNormal];
    jilubtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [jilubtn addTarget:self action:@selector(jiluclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:jilubtn];
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    UIImageView * beijiimgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    beijiimgv1.image = [UIImage imageNamed:@"choujiang_beijing"];
    [self.view addSubview:beijiimgv1];
    
    
    UIImage * img = [UIImage imageNamed:@"choujiang_top"];
    UIImageView * beijiimgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, APPwidth-40, img.size.width/(APPwidth-40)*img.size.height)];
    beijiimgv2.image = img;
    [self.view addSubview:beijiimgv2];
    

    
    UILabel * jihueilabel = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-90, beijiimgv2.frame.origin.y+beijiimgv2.frame.size.height+10, 180, 40)];
    jihueilabel.backgroundColor = [UIColor colorWithRed:228/255.0 green:44/255.0 blue:58/255.0 alpha:1.0];
    jihueilabel.text = @"您还有7次机会";
    jihueilabel.textColor = [UIColor whiteColor];
    jihueilabel.layer.borderColor=[[UIColor colorWithRed:210/255.0 green:18/255.0 blue:39/255.0 alpha:1.0]CGColor];
    jihueilabel.layer.borderWidth= 1.0f;
    jihueilabel.layer.cornerRadius = 20;
    jihueilabel.layer.masksToBounds = YES;
    jihueilabel.textAlignment = 1;
    [self.view addSubview:jihueilabel];
    

    UIButton * _gueizhebtn = [[UIButton alloc] initWithFrame:CGRectMake(jihueilabel.frame.origin.x+jihueilabel.frame.size.width+20, jihueilabel.frame.origin.y, 80, 20)];
    [_gueizhebtn setTitle:@"规则" forState:0];
    [_gueizhebtn setTitleColor:[UIColor whiteColor] forState:0];
    _gueizhebtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_gueizhebtn setImage:[UIImage imageNamed:@"choujiang_xiala"] forState:0];
    [_gueizhebtn setImage:[UIImage imageNamed:@"choujiang_xiala"] forState:UIControlStateSelected];
    _gueizhebtn.imageEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
    _gueizhebtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [_gueizhebtn addTarget:self action:@selector(gueizhe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_gueizhebtn];
    
    
    float x = 0;
    float y = 250;
    float fex = 15;
    float fey = 0;
    for (int i = 0; i < 9; i++) {
        
        if ( i % 3 == 0 && i != 0 ) {
            
            x = 0;
            fex = 15;

            y = y + (APPwidth-40)/3-30;
            fey = fey+5;
        }
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(x+fex, y+fey, (APPwidth-40)/3, (APPwidth-40)/3-30)];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = YES;
        view.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
        view.layer.borderWidth= 1.0f;
        [self.view addSubview:view];
        
        if (i == 4) {
            
            view.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];

        }
        
        x = x + (APPwidth-40)/3;
        fex = fex+5;
    }
    
    
    UIImage * ksimg = [UIImage imageNamed:@"choujiang-button"];
    UIButton * kaishibtn = [[UIButton alloc] initWithFrame:CGRectMake(40, y+(APPwidth-40)/3, APPwidth-80, (APPwidth-80)/ksimg.size.width*ksimg.size.height)];
    [kaishibtn setImage:ksimg forState:UIControlStateNormal];
    [kaishibtn addTarget:self action:@selector(kaishichoujiang) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kaishibtn];
    
    NSArray * array1 = @[@"每次抽奖消耗100金币",@"每次抽奖消耗700金币"];
    NSArray * array2 = @[@"choujiang_100dianji",@"choujiang_700dianji"];
    NSArray * array3 = @[@"1",@"7"];

    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/2*i, APPheight-50, APPwidth/2, 50)];
        view.backgroundColor = [UIColor colorWithRed:46/255.0 green:32/255.0 blue:25/255.0 alpha:1.0];
        [self.view addSubview:view];
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, -6, view.frame.size.width, 56)];
        [btn setBackgroundImage:[UIImage imageNamed:array2[i]] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(jinbiqiehuanbtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 6900+i;
        [view addSubview:btn];
        
        
        if (btn.tag == 6900) {
            
            btn.selected = YES;
        }
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, -10, btn.frame.size.width, 30)];
        label1.text = array3[i];
        label1.textColor = [UIColor whiteColor];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.font = [UIFont fontWithName:@"DINOT" size:35];
        [btn addSubview:label1];
       
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, btn.frame.size.height-30, btn.frame.size.width, 20)];
        label2.text = array1[i];
        label2.textColor = [UIColor whiteColor];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:14];
        [btn addSubview:label2];
        


    }
    
    
    
}


#pragma mark - 创建规则
-(void)zdyGueiZhe
{
    //************规则****************
    _gueizheview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _gueizheview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    [self.view addSubview:_gueizheview];
    _gueizheview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicanggueizhe)];
    [_gueizheview addGestureRecognizer:tap];
    
    
    _ggbaidiview = [[UIView alloc] initWithFrame:CGRectMake(0, _gueizheview.frame.size.height+15, APPwidth, 200)];
    _ggbaidiview.backgroundColor = [UIColor whiteColor];
    [_gueizheview addSubview:_ggbaidiview];
    
    
    UIImage * img2 = [UIImage imageNamed:@"choujiang_shuoming"];
    UIImageView * gzimgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, -15, APPwidth, img2.size.width/APPwidth*img2.size.height)];
    gzimgv.image = img2;
    [_ggbaidiview addSubview:gzimgv];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, -15, APPwidth, 30)];
    label.text = @"抽奖规则";
    label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = 1;
    [_ggbaidiview addSubview:label];
    

    UIView * wenziview = [[UIView alloc] initWithFrame:CGRectMake(0, 50, APPwidth, 150)];
    wenziview.backgroundColor = [UIColor whiteColor];
    [_ggbaidiview addSubview:wenziview];
    

    UILabel * choujianggueizhe = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, APPwidth-20, 150)];
    choujianggueizhe.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    choujianggueizhe.textAlignment = NSTextAlignmentLeft;
    choujianggueizhe.font = [UIFont systemFontOfSize:14];
    choujianggueizhe.numberOfLines = 0;
    NSString *labelText = @"1、无论新/老用户每天均可获得免费抽奖1次,每人最多可抽奖7次/天；\n2、用户抽奖前需选择“每次抽奖消耗100金币”或“每次抽奖消耗700金币”再进行开始抽奖，消耗700金币的抽奖比消耗100金币的抽奖几率更大；\n3、本活动最终解释权归呼来所有。";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:7.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    choujianggueizhe.attributedText = attributedString;
    [wenziview addSubview:choujianggueizhe];
    [choujianggueizhe sizeToFit];
    
   
}



#pragma mark - 创建中奖
-(void)zdyZhongJiang
{
    //************中奖****************
    _zhongjiangview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _zhongjiangview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    [self.view addSubview:_zhongjiangview];
    _zhongjiangview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangjieguo)];
    [_zhongjiangview addGestureRecognizer:tap];
    
    
    UIImage * img1 = [UIImage imageNamed:@"choujiang_xingyun"];
    UIImageView * zjimgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-img1.size.width/2, APPheight/2-img1.size.height/2-20, img1.size.width, img1.size.height)];
    zjimgv.image = img1;
    [_zhongjiangview addSubview:zjimgv];
    

    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, zjimgv.frame.size.height+zjimgv.frame.origin.y-90, APPwidth-20, 50)];
    label.text = @"恭喜您！\n获得5000金币";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 2;
    label.shadowColor = [UIColor colorWithRed:165/255.0 green:18/255.0 blue:28/255.0 alpha:1.0];
    label.shadowOffset = CGSizeMake(0, 1.0);
    [_zhongjiangview addSubview:label];
    

    
    UIButton * chabtn = [[UIButton alloc]initWithFrame:CGRectMake(APPwidth/2-5, zjimgv.frame.origin.y+zjimgv.frame.size.height, 30, 30)];
    [chabtn setImage:[UIImage imageNamed:@"choujiang-guanbi"] forState:UIControlStateNormal];
    [chabtn addTarget:self action:@selector(yicangjieguo) forControlEvents:UIControlEventTouchUpInside];
    [_zhongjiangview addSubview:chabtn];
    

    

}


#pragma mark - 开始抽奖
-(void)kaishichoujiang
{
    _zhongjiangview.hidden = NO;

}


#pragma mark - 金币抽奖等级的切换
-(void)jinbiqiehuanbtn:(UIButton *)btn
{
    for (int i = 6900; i < 6902; i++) {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
      
        NSLog(@"%ld",(long)btn1.tag);
        
        btn1.selected = NO;

    }
   
    btn.selected = YES;

}


#pragma mark - 规则
-(void)gueizhe:(UIButton *)btn
{
    

    _gueizheview.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect fram = _ggbaidiview.frame;
        fram.origin.y = _gueizheview.frame.size.height-200;
        _ggbaidiview.frame = fram;
        
    }];
}

#pragma mark - 隐藏规格
-(void)yicanggueizhe
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect fram = _ggbaidiview.frame;
        fram.origin.y = _gueizheview.frame.size.height+15;
        _ggbaidiview.frame = fram;
        
    }];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(dsqycgz) userInfo:nil repeats:NO];
    

}

#pragma mark - 定时器隐藏规则
-(void)dsqycgz
{
    _gueizheview.hidden = YES;

}

#pragma mark - 隐藏抽奖结果
-(void)yicangjieguo
{
    _zhongjiangview.hidden = YES;
 
}

#if 0
#pragma mark - *******************************************

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    [self.view addSubview:_zhengscrollview];
    
    //********************转盘抽奖***********************
    UILabel * cishulabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, APPwidth, 60)];
    cishulabel.text = @"您还有3次抽奖机会";
    cishulabel.textColor = [UIColor whiteColor];
    cishulabel.textAlignment = NSTextAlignmentCenter;
    cishulabel.font = [UIFont systemFontOfSize:20];
    [_zhengscrollview addSubview:cishulabel];

    
    UIImageView * zhuanpanyiying = [[UIImageView alloc] initWithFrame:CGRectMake(60, cishulabel.frame.origin.y+(APPwidth-80)+60-30, APPwidth-120, 40)];
    zhuanpanyiying.image = [UIImage imageNamed:@"choujiang-yinying"];
    [_zhengscrollview addSubview:zhuanpanyiying];
    
    
    _zhuanpanimv = [[UIImageView alloc] initWithFrame:CGRectMake(40, cishulabel.frame.origin.y+60, APPwidth-80, APPwidth-80)];
    _zhuanpanimv.image = [UIImage imageNamed:@"choujiang-zhuanpan"];
    [_zhengscrollview addSubview:_zhuanpanimv];
    
    
    UIButton * zhizhengbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-34, _zhuanpanimv.frame.origin.y+(_zhuanpanimv.frame.size.height/2-34-24), 68, 92)];
    [zhizhengbtn setImage:[UIImage imageNamed:@"choujiang-zhuanzhou"] forState:UIControlStateNormal];
    [_zhengscrollview addSubview:zhizhengbtn];
    
    
    UIButton * kaishibtn = [[UIButton alloc] initWithFrame:CGRectMake(40, _zhuanpanimv.frame.origin.y+_zhuanpanimv.frame.size.height+50, APPwidth-80, (APPwidth-80)/297*43)];
    [kaishibtn setImage:[UIImage imageNamed:@"choujiang-button"] forState:UIControlStateNormal];
    [kaishibtn addTarget:self action:@selector(kaishichoujiang) forControlEvents:UIControlEventTouchUpInside];
    [_zhengscrollview addSubview:kaishibtn];
    
    UILabel * jinbiyuelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kaishibtn.frame.origin.y+kaishibtn.frame.size.height+20, APPwidth/2, 30)];
    jinbiyuelabel.text = @"金币余额：";
    jinbiyuelabel.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:63/255.0 alpha:1.0];
    jinbiyuelabel.textAlignment = NSTextAlignmentRight;
    jinbiyuelabel.font = [UIFont systemFontOfSize:16];
    [_zhengscrollview addSubview:jinbiyuelabel];
    
    UIImageView * jinbikuanimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2, jinbiyuelabel.frame.origin.y, APPwidth/2/2, 30)];
    jinbikuanimv.image = [UIImage imageNamed:@"choujiang-yue"];
    [_zhengscrollview addSubview:jinbikuanimv];
    UILabel * jinbi = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, jinbikuanimv.frame.size.width, 30)];
    jinbi.text = @"36578";
    jinbi.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:63/255.0 alpha:1.0];
    jinbi.textAlignment = NSTextAlignmentCenter;
    jinbi.font = [UIFont systemFontOfSize:16];
    [jinbikuanimv addSubview:jinbi];
    
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, jinbiyuelabel.frame.origin.y+50, APPwidth, 2)];
    xian.image = [UIImage imageNamed:@"choujiang-fengexian"];
    [_zhengscrollview addSubview:xian];
   
    //********************抽奖规则***********************
    
    UILabel * gueizhelabel =[[UILabel alloc] initWithFrame:CGRectMake(15, xian.frame.origin.y+20, APPwidth-20, 20)];
    gueizhelabel.text = @"抽奖规则";
    gueizhelabel.font =[UIFont systemFontOfSize:18];
    gueizhelabel.textAlignment = NSTextAlignmentLeft;
    gueizhelabel.textColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:gueizhelabel];

    
    UILabel * choujianggueizhe = [[UILabel alloc] initWithFrame:CGRectMake(15, gueizhelabel.frame.origin.y+30, APPwidth-20, 100)];
    choujianggueizhe.textColor = [UIColor whiteColor];
    choujianggueizhe.textAlignment = NSTextAlignmentLeft;
    choujianggueizhe.font = [UIFont systemFontOfSize:15];
    choujianggueizhe.numberOfLines = 0;
    NSString *labelText = @"1、本活动新/老用户均可参加，每天有1次免费抽奖机会；\n2、每1000金币可抽奖1次，每人最多可抽奖6次；\n3、本活动最终解释权归呼来所有。";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:7.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    choujianggueizhe.attributedText = attributedString;
    [_zhengscrollview addSubview:choujianggueizhe];
    [choujianggueizhe sizeToFit];
    
    
    //********************中奖名单***********************

    UIView * zhongjianview = [[UIView alloc] initWithFrame:CGRectMake(15, choujianggueizhe.frame.origin.y+choujianggueizhe.frame.size.height+20, APPwidth-30, 150)];
    zhongjianview.layer.cornerRadius = 5;
    zhongjianview.layer.masksToBounds = YES;
    zhongjianview.backgroundColor = [UIColor colorWithRed:195/255.0 green:26/255.0 blue:46/255.0 alpha:1.0];
    zhongjianview.layer.borderColor=[[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:0.3]CGColor];
    zhongjianview.layer.borderWidth= 1.0f;
    [_zhengscrollview addSubview:zhongjianview];

    
#if 1
    UILabel * zhongjianmingdan = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, zhongjianview.frame.size.width, zhongjianview.frame.size.height-10)];
    zhongjianmingdan.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:63/255.0 alpha:1.0];
    zhongjianmingdan.textAlignment = NSTextAlignmentCenter;
    zhongjianmingdan.font = [UIFont systemFontOfSize:15];
    zhongjianmingdan.numberOfLines = 0;
    NSString *labelText2 = @"恭喜*******8888抽取20元红包\n恭喜*******8888抽取100元红包\n恭喜*******8888抽取道具卡\n恭喜*******8888抽取道具卡\n恭喜*******8888抽取208元红包\n恭喜*******8888抽取208元红包\n恭喜*******8888抽取208元红包\n";
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:labelText2];
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle2 setLineSpacing:7.0f];
    [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle2 range:NSMakeRange(0, [labelText2 length])];
    zhongjianmingdan.attributedText = attributedString2;
    [zhongjianview addSubview:zhongjianmingdan];
    [zhongjianmingdan sizeToFit];
    
    
    CGRect fram = zhongjianmingdan.frame;
    fram.origin.x = zhongjianview.frame.size.width/2-zhongjianmingdan.frame.size.width/2;
    zhongjianmingdan.frame = fram;

#endif
    
    _zhengscrollview.contentSize = CGSizeMake(0, zhongjianview.frame.origin.y+zhongjianview.frame.size.height+20);

}



#pragma mark - 开始抽奖
-(void)kaishichoujiang
{
    
   NSNumber * number = [NSNumber numberWithFloat:(arc4random() % 20) + 20];

    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = number;
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [_zhuanpanimv.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    

}
#endif
#pragma mark - *******************************************

#pragma mark - 抽奖记录
-(void)jiluclick
{
    NSLog(@"点击了抽奖记录");
}


#pragma mark - 返回
-(void)fanhuei
{
    [self.navigationController popViewControllerAnimated:YES];

}




-(void)viewWillAppear:(BOOL)animated{
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
}



-(void)viewWillDisappear:(BOOL)animated
{
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
