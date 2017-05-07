//
//  JiNengLeiXingVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/17.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "JiNengLeiXingVC.h"

@interface JiNengLeiXingVC ()
{
    UIScrollView * _zhengscrollview;

}

@end

@implementation JiNengLeiXingVC

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
    biaoting.text = _biaoting;
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont fontWithName:@"Alba Matter" size:18];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 74, APPwidth, APPheight-74)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    

    
    NSArray * array = @[@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"兼职家教",@"其他"];
    for (int i = 0; i< array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(15, 50*i, APPwidth-30, 50)];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor whiteColor] forState:0];
        btn.contentHorizontalAlignment = 1;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_zhengscrollview addSubview:btn];
        
        

        UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(15, 50*(i+1), APPwidth-15, 1)];
        xian.image = [UIImage imageNamed:@"shouye-fengexian"];
        [_zhengscrollview addSubview:xian];
        
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
