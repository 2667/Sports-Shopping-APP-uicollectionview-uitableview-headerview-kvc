//
//  ZhangHuAnQuanVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/2.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "ZhangHuAnQuanVC.h"
#import "XGDLMMVC.h"
#import "WJDLMMVC.h"

@interface ZhangHuAnQuanVC ()

@end

@implementation ZhangHuAnQuanVC

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
    biaoting.text = @"账户安全";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    NSArray * array = @[@"修改登录密码",@"支付密码管理"];
    
    for (int i = 0; i < array.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 74+60*i, APPwidth, 60)];
        view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
        [self.view addSubview:view];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 150, 60)];
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [view addSubview:label];
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 0, 30, 60)];
        [btn setImage:[UIImage imageNamed:@"wode_dizhi_you"] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [view addSubview:btn];

        
        if (i == 0) {
            
            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 59, APPwidth-30, 1)];
            xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
            [view addSubview:xian];
            
        }
        
        
    }
}

#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"修改登录密码"]) {
        
        XGDLMMVC * xgmm = [[XGDLMMVC alloc] init];
        [self.navigationController pushViewController:xgmm animated:YES];
        

    }
    else{
        
        WJDLMMVC * wjmm = [[WJDLMMVC alloc] init];
        wjmm.biaoting = @"设置支付密码";
        [self.navigationController pushViewController:wjmm animated:YES];
        

    }
    
   
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
