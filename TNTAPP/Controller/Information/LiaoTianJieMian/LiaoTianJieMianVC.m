//
//  LiaoTianJieMianVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "LiaoTianJieMianVC.h"
#import "ChaKanHaoYouVC.h"

@interface LiaoTianJieMianVC ()

@end

@implementation LiaoTianJieMianVC

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
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = _biaoting;
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    

    
    UIButton *  caidanbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 26, 30, 30)];
    [caidanbtn addTarget:self action:@selector(caidanclick) forControlEvents:UIControlEventTouchUpInside];
    [caidanbtn setImage:[UIImage imageNamed:@"mall_xiangqing_more"] forState:0];
    [daohan addSubview:caidanbtn];
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{

}

#pragma mark - 菜单点击
-(void)caidanclick
{
    ChaKanHaoYouVC * chakanhaoyou = [[ChaKanHaoYouVC alloc] init];
    chakanhaoyou.biaoting = _biaoting;
    [self.navigationController pushViewController:chakanhaoyou animated:YES];
    
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
