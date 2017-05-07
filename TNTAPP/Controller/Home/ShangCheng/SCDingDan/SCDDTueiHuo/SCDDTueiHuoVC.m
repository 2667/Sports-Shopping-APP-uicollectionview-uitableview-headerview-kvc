//
//  SCDDTueiHuoVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/8.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDDTueiHuoVC.h"
#import "SCDDTueiHuoBiaoVC.h"

@interface SCDDTueiHuoVC ()

@end

@implementation SCDDTueiHuoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
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
    biaoting.text = @"退货退款";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
}

#pragma mark - 创建界面
-(void)zdyUI
{
    
    NSArray * array1 = @[@"退货且退款",@"退款"];
    NSArray * array2 = @[@"需要退回已收到的商品",@"未收到商品，或与商家协商一致"];
    NSArray * array3 = @[@"mall_tuihuo",@"mall_tuikuan"];

    for (int i =0; i < array1.count; i++) {
        
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(20, 100+120*i, APPwidth-40, 100)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn setTitle:array1[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 40, 40)];
        imv.image = [UIImage imageNamed:array3[i]];
        [btn addSubview:imv];
        

        UILabel * label1 =[[UILabel alloc] initWithFrame:CGRectMake(70, 20, btn.frame.size.width-100, 30)];
        label1.text = array1[i];
        label1.font = [UIFont systemFontOfSize:18];
        label1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        [btn addSubview:label1];
        
        UILabel * label2 =[[UILabel alloc] initWithFrame:CGRectMake(70, 50, btn.frame.size.width-100, 30)];
        label2.text = array2[i];
        label2.font = [UIFont systemFontOfSize:14];
        label2.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
        [btn addSubview:label2];
        

        UIImage * img = [UIImage imageNamed:@"mall_fanhuijian"];
        UIImageView * imv2 = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width-img.size.width-10, 50-img.size.height/2, img.size.width, img.size.height)];
        imv2.image = img;
        [btn addSubview:imv2];
        

        
    }

}

#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{

    SCDDTueiHuoBiaoVC * scddthb = [[SCDDTueiHuoBiaoVC alloc] init];
    scddthb.biaoting = btn.titleLabel.text;
    [self.navigationController pushViewController:scddthb animated:YES];



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
