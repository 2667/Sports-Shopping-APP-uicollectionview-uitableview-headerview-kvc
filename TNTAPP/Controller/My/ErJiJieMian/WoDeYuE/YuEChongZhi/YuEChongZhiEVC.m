//
//  YuEChongZhiEVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YuEChongZhiEVC.h"

@interface YuEChongZhiEVC ()

@end

@implementation YuEChongZhiEVC

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
    biaoting.text = @"账户充值";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}



#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-50, 100, 100, 100)];
    imgv.image = [UIImage imageNamed:@"wode_yue_tijiao"];
    [self.view addSubview:imgv];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0,imgv.frame.origin.y+imgv.frame.size.height+20, APPwidth, 44)];
    label1.text = @"申请已提交";
    label1.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label1];
    
    

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, label1.frame.origin.y+label1.frame.size.height+20, APPwidth, 140)];
    view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:view];
    
    NSArray * array1 = @[@"储蓄卡",@"提现金额",@"剩余金额"];
    NSArray * array2 = @[@"工商银行 尾号3223",@"￥200.00",@"￥252.00"];

    for (int i =0; i<array1.count; i++) {
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(20,10+40*i, (APPwidth-30)/2, 40)];
        label2.text = array1[i];
        label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label2.textAlignment = 0;
        label2.font = [UIFont systemFontOfSize:16];
        [view addSubview:label2];
        
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-10, 10+40*i, APPwidth/2, 40)];
        label3.text = array2[i];
        label3.textColor = [UIColor whiteColor];
        label3.textAlignment = 2;
        label3.font = [UIFont systemFontOfSize:18];
        [view addSubview:label3];

        
    }
    
    
    //**************完成*******************
    UIButton * wcbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, view.frame.origin.y+view.frame.size.height+40,APPwidth-40, 50)];
    [wcbtn setTitle:@"完成" forState:0];
    [wcbtn setTitleColor:[UIColor whiteColor] forState:0];
    [wcbtn addTarget:self action:@selector(wcClick) forControlEvents:UIControlEventTouchUpInside];
    wcbtn.layer.cornerRadius = 5;
    wcbtn.layer.masksToBounds = YES;
    wcbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    wcbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [self.view addSubview:wcbtn];
    

    
}

#pragma mark - 完成
-(void)wcClick
{
    NSArray * array =  self.navigationController.viewControllers;
    [self.navigationController popToViewController:array[1] animated:YES];

    
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
