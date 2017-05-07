//
//  MyVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/19.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "MyVC.h"
#import "LoginVC.h"
#import "QianDaoVC.h"
#import "SCDDPinJiaVC.h"
#import "SCDDTueiHuoVC.h"
#import "ChuShouDinDangVC.h"
#import "WoDeFaBuDinDangVC.h"
#import "WoDeJinBiVC.h"
#import "YaoYouVC.h"
#import "WoDeDiZhiVC.h"
#import "WoDeYuEVC.h"
#import "YouHueiQuanVC.h"
#import "SheZhiVC.h"
#import "RenZhengVC.h"
#import "GeRenZiLiaoVC.h"
#import "SCShouYeVC.h"
#import "SCDingDanVC.h"
#import "QianDaoDingDanVC.h"
#import "ShangJiaRuZhuVC.h"
#import "RuZhuTongGuo.h"



@interface MyVC ()
{
    UIScrollView * _zhengscrollview;

}

@end

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];

    [self zdyUI];
    
//    [self rk];
   
}

#pragma mark - 其他入口
-(void)rk
{
    UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget: self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"登录" forState:0];
    [btn setTitleColor:[UIColor orangeColor] forState:0];
    [self.view addSubview:btn];
    
    
    UIButton * btn2 =[[UIButton alloc] initWithFrame:CGRectMake(100, 170, 150, 50)];
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2 addTarget: self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"签到" forState:0];
    [btn2 setTitleColor:[UIColor orangeColor] forState:0];
    [self.view addSubview:btn2];
    
    
    UIButton * btn3 =[[UIButton alloc] initWithFrame:CGRectMake(100, 240, 150, 50)];
    btn3.backgroundColor = [UIColor whiteColor];
    [btn3 addTarget: self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"商城订单评价" forState:0];
    [btn3 setTitleColor:[UIColor orangeColor] forState:0];
    [self.view addSubview:btn3];
    
    
    UIButton * btn4 =[[UIButton alloc] initWithFrame:CGRectMake(100, 310, 150, 50)];
    btn4.backgroundColor = [UIColor whiteColor];
    [btn4 addTarget: self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"退款" forState:0];
    [btn4 setTitleColor:[UIColor orangeColor] forState:0];
    [self.view addSubview:btn4];
    

}


#pragma mark - 自定义UI
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight-49)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    
    UIView * ztlview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 20)];
    ztlview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:ztlview];
    

    
    //***************用户信息*********************
    UIView * yonghuview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 160)];
    yonghuview.backgroundColor = [UIColor colorWithRed:13/255.0 green:149/255.0 blue:201/255.0 alpha:1.0];
    [_zhengscrollview addSubview:yonghuview];

    
    UIButton * shezibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 10, 30, 30)];
    [shezibtn setImage:[UIImage imageNamed:@"wode-_shezhi"] forState:0];
    [shezibtn addTarget:self action:@selector(shezhi) forControlEvents:1<<6];
    [yonghuview addSubview:shezibtn];
    
    UIButton * _touxianbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 50, 70, 70)];
    _touxianbtn.layer.cornerRadius = 35;
    _touxianbtn.layer.masksToBounds = YES;
    _touxianbtn.backgroundColor = [UIColor whiteColor];
    [_touxianbtn addTarget:self action:@selector(toixianbtn) forControlEvents:1<<6];
    [yonghuview addSubview:_touxianbtn];
    
    
#if 0
    UIButton * dlbtn = [[UIButton alloc] initWithFrame:CGRectMake(_touxianimv.frame.origin.x+_touxianimv.frame.size.width+10, _touxianimv.frame.origin.y+20, 80, 30)];
    [dlbtn setTitle:@"点击登录" forState:0];
    [dlbtn setTitleColor:[UIColor whiteColor] forState:0];
    dlbtn.layer.borderWidth = 1;
    dlbtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    dlbtn.layer.cornerRadius = 8;
    dlbtn.layer.masksToBounds = YES;
    dlbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [dlbtn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
    [yonghuview addSubview:dlbtn];
#endif

    
#if 1
    
    UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(105, _touxianbtn.frame.origin.y+10, 150, 30)];
    namelabel.text = @"微笑_._f";
    namelabel.textColor = [UIColor whiteColor];
    namelabel.font = [UIFont systemFontOfSize:20];
    namelabel.textAlignment = 0;
    [yonghuview addSubview:namelabel];

    
    NSArray * array  = @[@"wode_shiming_weirenzheng",@"wode_shangjia_weirenzheng"];
    NSArray * rzarray  = @[@"个人认证",@"商家认证"];

    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(105+30*i, namelabel.frame.origin.y+30, 20, 20)];
        [btn setImage:[UIImage imageNamed:array[i]] forState:0];
        [btn addTarget:self action:@selector(renzheng:) forControlEvents:1<<6];
        [btn setTitle:rzarray[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [yonghuview addSubview:btn];
        
    }
    
    UIButton * grzybtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-130, _touxianbtn.frame.origin.y+35-17.5, 120, 35)];
    [grzybtn setImage:[UIImage imageNamed:@"wode_gerenzhuye"] forState:0];
    [grzybtn setTitle:@"个人主页" forState:0];
    [grzybtn setTitleColor:[UIColor whiteColor] forState:0];
    grzybtn.titleLabel.font = [UIFont systemFontOfSize:14];
    grzybtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
    grzybtn.layer.cornerRadius = 17.5;
    grzybtn.layer.masksToBounds = YES;
    grzybtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [yonghuview addSubview:grzybtn];
    
    
    UIButton * dizibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-130, yonghuview.frame.size.height-35, 120, 25)];
    [dizibtn setImage:[UIImage imageNamed:@"wode_dingwei"] forState:0];
    [dizibtn setTitle:@"广州市 南沙区" forState:0];
    [dizibtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5] forState:0];
    dizibtn.titleLabel.font = [UIFont systemFontOfSize:14];
    dizibtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [yonghuview addSubview:dizibtn];

#endif
    
    
    //***************余额 金币 抽奖 优惠券*********************
    UIView * yueview = [[UIView alloc] initWithFrame:CGRectMake(0, yonghuview.frame.origin.y+yonghuview.frame.size.height, APPwidth, 80)];
    yueview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [_zhengscrollview addSubview:yueview];
    NSArray * array1 = @[@"620.00 元 ",@"620 金币",@"15 个 "];
    NSArray * array2 = @[@"余额",@"金币",@"优惠"];
    NSArray * array0 = @[@"wode_yue",@"wode_jinbi",@"wode_youhuijuan-1"];

    for (int i = 0; i < array1.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/3*i, 0, APPwidth/3, 80)];
        [btn setTitle:array2[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [yueview addSubview:btn];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, APPwidth/3, 20)];
        label1.text = array1[i];
        label1.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:61/255.0 alpha:1.0];
        label1.font = [UIFont systemFontOfSize:18];
        label1.textAlignment = 1;
        [btn addSubview:label1];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:array1[i]];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(str.length-3, 3)];//设置不同字号
        label1.attributedText = str;
        
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width/2-20, 50, 15, 15)];
        imv.image = [UIImage imageNamed:array0[i]];
        [btn addSubview:imv];
        
        

        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.size.width/2, 50, btn.frame.size.height/2, 15)];
        label2.text = array2[i];
        label2.textColor = [UIColor whiteColor];
        label2.font = [UIFont systemFontOfSize:15];
        label2.textAlignment = 0;
        [btn addSubview:label2];
        
    }
    
    
    //***************订单*********************
    UIView * dingdanview = [[UIView alloc] initWithFrame:CGRectMake(0, yueview.frame.origin.y+yueview.frame.size.height+10, APPwidth, 80)];
    dingdanview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [_zhengscrollview addSubview:dingdanview];
    NSArray * array3 = @[@"签到订单",@"任务订单",@"商城订单"];
    NSArray * array4 = @[@"wode_goumaidingdan",@"wode_shouchudingdan",@"wode_shouchudingdan"];
    for (int i = 0; i < array3.count; i++) {
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/3*i, 0, APPwidth/3, 80)];
        [btn setTitle:array3[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [dingdanview addSubview:btn];
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(20, btn.frame.size.height/2-10, 20, 20)];
        img.image = [UIImage imageNamed:array4[i]];
        [btn addSubview:img];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, btn.frame.size.height/2-15, btn.frame.size.width-40, 30)];
        label1.text = array3[i];
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:16];
        label1.textAlignment = 0;
        [btn addSubview:label1];
        
      }

    
    //***************其他入口*********************
    UIView * qitaview = [[UIView alloc] initWithFrame:CGRectMake(0, dingdanview.frame.origin.y+dingdanview.frame.size.height+10, APPwidth, 300)];
    qitaview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [_zhengscrollview addSubview:qitaview];
    
    NSArray * array5 = @[@"商家入驻",@"需求管理",@"金币商城",@"我的关注",@"邀友赚钱",@"地址管理",@"在线客服"];
    NSArray * array6 = @[@"wode_shangjiaruzhu",@"wode_xuqiuguanli",@"wode_jinbishangcheng",@"wode_guanzhu",@"wode_yaoyouzhuanqian",@"wode_dizhiguanli",@"wode_zaixiankefu"];

    float x = 0;
    float y = 0;
    for (int i = 0; i < array5.count; i++) {
        
        if (i != 0 && i % 3 == 0) {
            
            x = 0;
            y = y + 100;
            
            
        }
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, APPwidth/3, 100)];
        [btn setTitle:array5[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [qitaview addSubview:btn];
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width/2-12.5, 20, 25, 25)];
        img.image = [UIImage imageNamed:array6[i]];
        [btn addSubview:img];
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, btn.frame.size.width, 20)];
        label1.text = array5[i];
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:15];
        label1.textAlignment = 1;
        [btn addSubview:label1];

        x = x + APPwidth/3;
        
        if (i < 2) {
        
            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 100*i+100, APPwidth, 1)];
            xian.backgroundColor = [UIColor colorWithRed:41/255.0 green:47/255.0 blue:53/255.0 alpha:1.0];
            [qitaview addSubview:xian];
        }
    }
    
    
    
    
    _zhengscrollview.contentSize = CGSizeMake(0, qitaview.frame.origin.y+qitaview.frame.size.height-30);

}


#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{

    if ([btn.titleLabel.text isEqualToString:@"出售订单"]) {
        
        ChuShouDinDangVC * scdd = [[ChuShouDinDangVC alloc] init];
        [self.navigationController pushViewController:scdd animated:YES];
        
    }
    else if([btn.titleLabel.text isEqualToString:@"服务管理"])
    {
        WoDeFaBuDinDangVC * wdfb = [[WoDeFaBuDinDangVC alloc] init];
        wdfb.biaoting = btn.titleLabel.text;
        [self.navigationController pushViewController:wdfb animated:YES];
        

    }
    else if ([btn.titleLabel.text isEqualToString:@"需求管理"])
    {
        WoDeFaBuDinDangVC * wdfb = [[WoDeFaBuDinDangVC alloc] init];
        wdfb.biaoting = btn.titleLabel.text;
        [self.navigationController pushViewController:wdfb animated:YES];
        

    }
    else if ([btn.titleLabel.text isEqualToString:@"任务订单"])
    {
        
        ChuShouDinDangVC * scdd = [[ChuShouDinDangVC alloc] init];
        [self.navigationController pushViewController:scdd animated:YES];
        
        
    }
    else if ([btn.titleLabel.text isEqualToString:@"签到订单"])
    {

        QianDaoDingDanVC * qddd = [[QianDaoDingDanVC alloc] init];
        [self.navigationController pushViewController:qddd animated:YES];
        
        
    }
    else if([btn.titleLabel.text isEqualToString:@"商城订单"])
    {
        SCDingDanVC * dd = [[SCDingDanVC alloc] init];
        [self.navigationController pushViewController:dd animated:YES];
    }
    else if([btn.titleLabel.text isEqualToString:@"金币"])
    {
        WoDeJinBiVC * wdjb = [[WoDeJinBiVC alloc] init];
        [self.navigationController pushViewController:wdjb animated:YES];
        
        
    }
    else if([btn.titleLabel.text isEqualToString:@"余额"])
    {
        WoDeYuEVC * wdye = [[WoDeYuEVC alloc] init];
        [self.navigationController pushViewController:wdye animated:YES];
        
        
    }
    else if([btn.titleLabel.text isEqualToString:@"优惠"])
    {
        YouHueiQuanVC * youhueiquan = [[YouHueiQuanVC alloc] init];
        [self.navigationController pushViewController:youhueiquan animated:YES];
        
        
    }
    else if([btn.titleLabel.text isEqualToString:@"邀友赚钱"])
    {
        YaoYouVC * yaoyou = [[YaoYouVC alloc] init];
        [self.navigationController pushViewController:yaoyou animated:YES];
        
        
    }
    else if([btn.titleLabel.text isEqualToString:@"金币商城"])
    {
        SCShouYeVC * scsy = [[SCShouYeVC alloc] init];
        [self.navigationController pushViewController:scsy animated:YES];
    }
    else if([btn.titleLabel.text isEqualToString:@"地址管理"])
    {
        WoDeDiZhiVC * dizhi = [[WoDeDiZhiVC alloc] init];
        [self.navigationController pushViewController:dizhi animated:YES];
        
        
    }
    else if([btn.titleLabel.text isEqualToString:@"我的关注"])
    {
        QianDaoVC * qiandao = [[QianDaoVC alloc] init];
        [self.navigationController pushViewController:qiandao animated:YES];
        
        
    }

    else if ([btn.titleLabel.text isEqualToString:@"点击登录"]) {
        
      
        LoginVC * login = [[LoginVC alloc] init];
        [self.navigationController pushViewController:login animated:YES];
        

    }
    else if([btn.titleLabel.text isEqualToString:@"商家入驻"])
    {
        
        ShangJiaRuZhuVC * sjrz = [[ShangJiaRuZhuVC alloc] init];
        [self.navigationController pushViewController:sjrz animated:YES];
        
        
//        RuZhuTongGuo * rztg = [[RuZhuTongGuo alloc] init];
//        [self.navigationController pushViewController:rztg animated:YES];
        

    }
    else if([btn.titleLabel.text isEqualToString:@"商城订单评价"])
    {
        
        SCDDPinJiaVC * scddpj = [[SCDDPinJiaVC alloc] init];
        [self.navigationController pushViewController:scddpj animated:YES];
        
        
    }
    else if([btn.titleLabel.text isEqualToString:@"退款"])
    {
        
        SCDDTueiHuoVC * scddth = [[SCDDTueiHuoVC alloc] init];
        [self.navigationController pushViewController:scddth animated:YES];
        
        
    }

    else if([btn.titleLabel.text isEqualToString:@"登录"])
    {
        
        LoginVC * login = [[LoginVC alloc] init];
        [self.navigationController pushViewController:login animated:YES];
        

        
    }
    
}

#pragma mark - 头像点击
-(void)toixianbtn
{
    GeRenZiLiaoVC * grzl = [[GeRenZiLiaoVC alloc] init];
    [self.navigationController pushViewController:grzl animated:YES];
}


#pragma mark - 认证
-(void)renzheng:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"商家认证"]) {
        
        ShangJiaRuZhuVC * sjrz = [[ShangJiaRuZhuVC alloc] init];
        [self.navigationController pushViewController:sjrz animated:YES];
        

    }
    else
    {
        RenZhengVC * rz = [[RenZhengVC alloc] init];
        [self.navigationController pushViewController:rz animated:YES
         ];
        
    }
    
}

#pragma mark - 设置
-(void)shezhi
{
    
    SheZhiVC * shezhi = [[SheZhiVC alloc] init];
    [self.navigationController pushViewController:shezhi animated:YES];
    
}

//在视图即将出现的时候
-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
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
