//
//  YHKXuanZheVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YHKXuanZheVC.h"
#import "TianJiaYingHangKaVC.h"


@interface YHKXuanZheVC ()
{
    UIImageView * _guoimgv;
    
}

@end

@implementation YHKXuanZheVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
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
    biaoting.text = @"银行卡选择";
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

    NSArray * array1 = @[@"中国工商银行",@"中国农业银行",@"中国建设银行",@"中国银行"];
    NSArray * array2 = @[@"尾号1253储蓄卡",@"尾号1253储蓄卡",@"尾号1253储蓄卡",@"尾号1253储蓄卡"];

    for (int i = 0; i < array1.count; i++) {
        
        UIButton * yhkbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 74+100*i, APPwidth, 100)];
        yhkbtn.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
        [yhkbtn addTarget:self action:@selector(yhkxuanzheclick:) forControlEvents:1<<6];
        yhkbtn.tag = 5860+i;
        [self.view addSubview:yhkbtn];
        
        
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        imgv.backgroundColor = [UIColor whiteColor];
        imgv.layer.cornerRadius = 30;
        imgv.layer.masksToBounds = YES;
        [yhkbtn addSubview:imgv];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 25, 120, 20)];
        label1.text = array1[i];
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:16];
        [yhkbtn addSubview:label1];
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, 120, 20)];
        label2.text = array2[i];
        label2.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
        label2.font = [UIFont systemFontOfSize:15];
        [yhkbtn addSubview:label2];
        
        
        UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(20, 99, APPwidth-20, 1)];
        xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        [yhkbtn addSubview:xian];
        
        

    }
    
    
    _guoimgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-40, 74+40, 20, 20)];
    _guoimgv.image = [UIImage imageNamed:@"wode_gouxuan"];
    [self.view addSubview:_guoimgv];
    

    
}

#pragma mark - 银行卡选择
-(void)yhkxuanzheclick:(UIButton *)btn
{
    NSLog(@"银行卡选择");
    
//    [UIView animateWithDuration:0.3 animations:^{
    
        CGRect fram = _guoimgv.frame;
        fram.origin.y = btn.frame.origin.y+btn.frame.size.height/2-10;
        _guoimgv.frame = fram;
        
//    }];
    

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
