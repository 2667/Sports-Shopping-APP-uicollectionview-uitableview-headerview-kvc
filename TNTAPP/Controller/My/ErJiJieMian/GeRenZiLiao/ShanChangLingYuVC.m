//
//  ShanChangLingYuVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/6.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "ShanChangLingYuVC.h"

@interface ShanChangLingYuVC ()

@end

@implementation ShanChangLingYuVC

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
    biaoting.text = @"擅长领域";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{

    NSArray * array1 = @[@"居家生活",@"运动健康",@"教育培训"];
    NSArray * array2 = @[@"拿快递",@"搬家",@"搬运",@"维修",@"占位排队",@"其他"];
    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 64+200*i, APPwidth, 200)];
        [self.view addSubview:view];
        
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        imgv.layer.cornerRadius = 20;
        imgv.layer.masksToBounds = YES;
        imgv.backgroundColor = [UIColor orangeColor];
        [view addSubview:imgv];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, APPwidth-70, 40)];
        label.text = array1[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [view addSubview:label];
        
        float x = 20;
        float y = label.frame.origin.y+label.frame.size.height+20;
        
        for (int j = 0; j < array2.count; j++) {
            
            if (j%4 == 0 && j != 0) {
                
                y = y + 60;
                x = 20;

            }
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, (APPwidth-100)/4, 40)];
            btn.layer.cornerRadius = 20;
            btn.layer.masksToBounds = YES;
            [btn setTitle:array2[j] forState:0];
            [btn setTitleColor:[UIColor colorWithRed:248/255.0 green:174/255.0 blue:59/255.0 alpha:1.0] forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            btn.layer.borderColor = [[UIColor colorWithRed:248/255.0 green:174/255.0 blue:59/255.0 alpha:1.0] CGColor];
            btn.layer.borderWidth = 1;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
            
            [view addSubview:btn];
            
            x = x + (APPwidth-100)/4+20;
        }
    }

}

#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    if (btn.selected == 0) {
        
        btn.selected = YES;

        btn.backgroundColor = [UIColor colorWithRed:248/255.0 green:174/255.0 blue:59/255.0 alpha:1.0];
        
    }
    else{
        
        btn.selected = NO;

         btn.backgroundColor = [UIColor clearColor];
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
