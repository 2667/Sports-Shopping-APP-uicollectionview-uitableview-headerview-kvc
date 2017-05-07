//
//  YingHangKaVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YingHangKaVC.h"
#import "YingHangKaEVC.h"
#import "TianJiaYingHangKaVC.h"

@interface YingHangKaVC ()
{
    UIScrollView * _zhengscrollview;
    
}


@end

@implementation YingHangKaVC

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
    biaoting.text = @"银行卡";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    UIButton * jiabtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 26, 30, 30)];
    [jiabtn setImage:[UIImage imageNamed:@"wode_yue_gengduo"] forState:UIControlStateNormal];
    [jiabtn addTarget:self action:@selector(tianjiayhk) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:jiabtn];
    
    
    
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
    
    

    
    
    NSArray * array1 = @[@"中国工商银行",@"中国农业银行",@"中国建设银行",@"中国银行"];
    UIColor * color[4];
    color[0]= [UIColor colorWithRed:206/255.0 green:75/255.0 blue:89/255.0 alpha:1.0];
    color[1]= [UIColor colorWithRed:0/255.0 green:140/255.0 blue:120/255.0 alpha:1.0];
    color[2]= [UIColor colorWithRed:18/255.0 green:134/255.0 blue:192/255.0 alpha:1.0];
    color[3]= [UIColor colorWithRed:0/255.0 green:74/255.0 blue:126/255.0 alpha:1.0];
    
    for (int i = 0; i < array1.count; i++) {
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 10+120*i+10*i, APPwidth-10, 120)];
        btn.backgroundColor = color[i];
        btn.layer.cornerRadius = 8;
        btn.layer.masksToBounds = YES;
        btn.tag = 5960+i;
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        [_zhengscrollview addSubview:btn];
        
        
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        imgv.backgroundColor = [UIColor whiteColor];
        imgv.layer.cornerRadius = 30;
        imgv.layer.masksToBounds = YES;
        [btn addSubview:imgv];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 25, btn.frame.size.width-100, 20)];
        label1.text = array1[i];
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label1];
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, btn.frame.size.width-100, 20)];
        label2.text = @"储蓄卡";
        label2.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
        label2.font = [UIFont systemFontOfSize:15];
        [btn addSubview:label2];
        
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, btn.frame.size.width-10, 30)];
        label3.text = @"**** **** **** 3223";
        label3.textColor = [UIColor whiteColor];
        label3.font = [UIFont systemFontOfSize:24];
        label3.textAlignment = 2;
        [btn addSubview:label3];


        
        
    }

}

#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    
    YingHangKaEVC * yhke = [[YingHangKaEVC alloc] init];
    [self.navigationController pushViewController:yhke animated:YES];
    
}

#pragma mark - 添加银行卡
-(void)tianjiayhk
{
    
    TianJiaYingHangKaVC * tjyhke = [[TianJiaYingHangKaVC alloc] init];
    [self.navigationController pushViewController:tjyhke animated:YES];
    


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
