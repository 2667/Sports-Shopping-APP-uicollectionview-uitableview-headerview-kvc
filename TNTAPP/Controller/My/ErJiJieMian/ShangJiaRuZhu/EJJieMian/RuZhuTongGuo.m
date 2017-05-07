//
//  RuZhuTongGuo.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/24.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RuZhuTongGuo.h"

@interface RuZhuTongGuo ()

@end

@implementation RuZhuTongGuo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    
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
    biaoting.text = @"审核通过";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-40, 100, 80, 80)];
    imgv.image = [UIImage imageNamed:@"renwu_yizhifu"];
    [self.view addSubview:imgv];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, imgv.frame.origin.y+imgv.frame.size.height+20, APPwidth-20, 30)];
    label.text = @"恭喜，审核已通过";
    label.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:25];
    label.textAlignment = 1;
    [self.view addSubview:label];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, label.frame.origin.y+label.frame.size.height, APPwidth-20, 30)];
    label2.text = @"现在可以去编辑我的店铺了";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:13];
    label2.textAlignment = 1;
    [self.view addSubview:label2];

    
    UIImage * img = [UIImage imageNamed:@"ruzhu_jindian"];
    
    UIImageView * imgv2 =[[UIImageView alloc] initWithFrame:CGRectMake(0, label2.frame.origin.y+label2.frame.size.height, APPwidth,APPwidth/img.size.width*img.size.height)];
    imgv2.image = img;
    [self.view addSubview:imgv2];
    

    UIButton * qukankanbtn = [[UIButton alloc] initWithFrame:CGRectMake(80, imgv2.frame.origin.y+imgv2.frame.size.height-10,APPwidth-160, 40)];
    [qukankanbtn setTitle:@"去看看" forState:0];
    [qukankanbtn addTarget:self action:@selector(qukankanCLick) forControlEvents:UIControlEventTouchUpInside];
    qukankanbtn.layer.cornerRadius = 10;
    qukankanbtn.layer.masksToBounds = YES;
    qukankanbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    qukankanbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [qukankanbtn setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:qukankanbtn];
    

}

#pragma mark - 去看看
-(void)qukankanCLick
{
    
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
