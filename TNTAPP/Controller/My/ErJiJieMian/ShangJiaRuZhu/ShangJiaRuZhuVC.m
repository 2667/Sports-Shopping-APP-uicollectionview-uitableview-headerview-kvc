//
//  ShangJiaRuZhuVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/23.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "ShangJiaRuZhuVC.h"
#import "ShangJiaRuZhuBiao.h"

@interface ShangJiaRuZhuVC ()
{
    UIScrollView * _zhengscrollview;

}

@end

@implementation ShangJiaRuZhuVC

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
    biaoting.text = @"入驻";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
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

    
    UIImage * img = [UIImage imageNamed:@"ruzhu_yinddao-1"];
    
    UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth,APPwidth/img.size.width*img.size.height)];
    imgv.image = img;
    [_zhengscrollview addSubview:imgv];
    
    

    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(60, imgv.frame.origin.y+imgv.frame.size.height+20,APPwidth-120, 40)];
    [btn setTitle:@"准备好了" forState:0];
    [btn addTarget:self action:@selector(btnCLick) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [_zhengscrollview addSubview:btn];
    
    
    
    _zhengscrollview.contentSize = CGSizeMake(0, btn.frame.origin.y+btn.frame.size.height+20);

    

}

#pragma mark - 按钮点击
-(void)btnCLick
{
    
    ShangJiaRuZhuBiao * sjrzb = [[ShangJiaRuZhuBiao alloc] init];
    [self.navigationController pushViewController:sjrzb animated:YES];
    
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
