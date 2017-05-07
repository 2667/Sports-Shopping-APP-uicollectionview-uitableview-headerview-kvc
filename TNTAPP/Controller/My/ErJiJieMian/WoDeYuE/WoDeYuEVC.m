//
//  WoDeYuEVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WoDeYuEVC.h"
#import "YingHangKaVC.h"
#import "YuEChongZhiVC.h"
#import "YuETiXianVC.h"
#import "JinBiMingXiVC.h"

@interface WoDeYuEVC ()
{
    UIScrollView * _zhengscrollview;

}

@end

@implementation WoDeYuEVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self zdydhl];
    
    [self zdyUI];
}



#pragma mark - 自定义导航栏
-(void)zdydhl
{
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 63, APPwidth, 1)];
    xian.image =[UIImage imageNamed:@"shouye-fengexian"];
    [daohan addSubview:xian];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 26, 30, 30)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    biaoting.text = @"我的余额";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    UIButton * mxbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 26, 40, 30)];
    
    [mxbtn setTitle:@"明细" forState:0];
    mxbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [mxbtn addTarget:self action:@selector(jinbimx) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:mxbtn];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    
    
    //**************余额**************
    UIView * yueview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth,210)];
    yueview.backgroundColor = [UIColor colorWithRed:0/255.0 green:131/255.0 blue:202/255.0 alpha:1.0];
    [_zhengscrollview addSubview:yueview];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 150, 20)];
    label1.text = @"账户余额(元)";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    [_zhengscrollview addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, label1.frame.origin.y+label1.frame.size.height+10, 180, 50)];
    label2.text = @"136.00";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:50];
    [_zhengscrollview addSubview:label2];
    
    
    UIButton * mdhbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-165, 20, 155, 20)];
    [mdhbtn setTitle:@"今天没兑换金币" forState:0];
    [mdhbtn setTitleColor:[UIColor whiteColor] forState:0];
    mdhbtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [mdhbtn setImage:[UIImage imageNamed:@"wode_yue_meiduihuan"] forState:0];
    mdhbtn.imageEdgeInsets = UIEdgeInsetsMake(0, 135, 0, 0);
    [mdhbtn addTarget:self action:@selector(mdhbtnclick) forControlEvents:1<<6];
    [_zhengscrollview addSubview:mdhbtn];
    
    
    NSArray * array1 = @[@"昨日收益(元)",@"累计收益(元)"];
    NSArray * array2 = @[@"5.00",@"89.00"];
    for (int i = 0; i < array1.count; i++) {
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i+20, label2.frame.origin.y+label2.frame.size.height+20, APPwidth/2-20, 20)];
        label3.text = array1[i];
        label3.textColor = [UIColor whiteColor];
        label3.font = [UIFont systemFontOfSize:16];
        [_zhengscrollview addSubview:label3];
        
        
        UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(label3.frame.origin.x, label3.frame.origin.y+label3.frame.size.height+20, label3.frame.size.width, 30)];
        label4.text = array2[i];
        label4.textColor = [UIColor whiteColor];
        label4.font = [UIFont systemFontOfSize:30];
        [_zhengscrollview addSubview:label4];
        
        if (i == 0) {
            
            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/2, label3.frame.origin.y, 1, 75)];
            xian.backgroundColor = [UIColor whiteColor];
            [_zhengscrollview addSubview:xian];
            
            
            
        }
    }
    

    //**************提现  银行卡**************
    NSArray * array3 = @[@"提现",@"充值",@"银行卡管理"];
    NSArray * array4 = @[@"wode_yue_tixian",@"wode_yue_chongzhi",@"wode_yue_yinhangka"];
    for (int i = 0; i < array3.count; i++) {
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, yueview.frame.origin.y+yueview.frame.size.height+60*i+10*i, APPwidth,60)];
        btn.backgroundColor = [UIColor colorWithRed:49/255.0 green:54/255.0 blue:60/255.0 alpha:1.0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        btn.tag = 5900+i;
        [_zhengscrollview addSubview:btn];

        
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(15, 22, 24, 24)];
        imgv.image = [UIImage imageNamed:array4[i]];
        [btn addSubview:imgv];
        

    
        UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 100, 60)];
        label4.text = array3[i];
        label4.textColor = [UIColor whiteColor];
        label4.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label4];
        
        
        UIImageView * imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 21, 18, 18)];
        imgv1.image = [UIImage imageNamed:@"wode_dizhi_you"];
        [btn addSubview:imgv1];
        

        if(i == 0)
        {
            UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-140, 0, 100, 60)];
            label5.text = array3[i];
            label5.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            label5.font = [UIFont systemFontOfSize:16];
            [btn addSubview:label5];
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"136.00元"];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(str.length-1,1)];
            label5.attributedText = str;
            label5.textAlignment = 2;
            
        }
        
        
    }
    
    UILabel * bqlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, APPheight-30, APPwidth, 20)];
    bqlabel.text = @"本服务由呼来提供";
    bqlabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    bqlabel.font = [UIFont systemFontOfSize:12];
    bqlabel.textAlignment = 1;
    [self.view addSubview:bqlabel];
    
}


#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    
    switch (btn.tag) {
       
            //提现
        case 5900:
        {

            YuETiXianVC * yetx = [[YuETiXianVC alloc] init];
            [self.navigationController pushViewController:yetx animated:YES];
            
        }
            break;
            
            //充值
        case 5901:
        {
        
            YuEChongZhiVC * yecz = [[YuEChongZhiVC alloc] init];
            [self.navigationController pushViewController:yecz animated:YES];
            

        }
            break;
            
            //银行卡
        case 5902:
        {
            
            YingHangKaVC * yhk = [[YingHangKaVC alloc] init];
            [self.navigationController pushViewController:yhk animated:YES];


        }
            break;
            
        default:
            break;
    }
}


#pragma mark - 今日没有兑换
-(void)mdhbtnclick
{
    
    NSLog(@"没有兑换");
}


#pragma mark - 余额明细
-(void)jinbimx
{

    JinBiMingXiVC * mx = [[JinBiMingXiVC alloc] init];
    mx.biaoting = @"余额明细";
    [self.navigationController pushViewController:mx animated:YES];

    
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
