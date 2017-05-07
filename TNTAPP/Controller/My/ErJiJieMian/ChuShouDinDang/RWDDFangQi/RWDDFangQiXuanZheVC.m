//
//  RWDDFangQiXuanZheVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/23.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWDDFangQiXuanZheVC.h"
#import "RWDDFangQiVC.h"
#import "QuXiaoGueiZeVC.h"

@interface RWDDFangQiXuanZheVC ()

@end

@implementation RWDDFangQiXuanZheVC

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
    biaoting.text = @"取消订单";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-40, APPheight/2-120, 80, 80)];
    imgv.image = [UIImage imageNamed:@"renwu_youzequxiao"];
    [self.view addSubview:imgv];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, imgv.frame.origin.y+imgv.frame.size.height+20, APPwidth-20, 30)];
    label.text = @"超时取消，取消需支付10元取消费。";
    label.textColor = WenZiHeiColor;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = 1;
    [self.view addSubview:label];
    
    NSArray * array = @[@"暂不取消",@"确认取消"];
    for (int i = 0; i < array.count; i++) {
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(40, (APPheight-160)+40*i+10*i,APPwidth-80, 40)];
        [btn setTitle:array[i] forState:0];
        [btn addTarget:self action:@selector(btnCLick:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.view addSubview:btn];
       
        if (i == 0) {
            
            btn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
            btn.layer.borderWidth= 1.0f;
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];

        }
        else
        {
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            [btn setTitleColor:[UIColor whiteColor] forState:0];

            
            UIButton * gzbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-50, btn.frame.origin.y+btn.frame.size.height+10,100, 30)];
            [gzbtn setTitle:@"  取消规则" forState:0];
            [gzbtn setTitleColor:WenZiHeiColor forState:0];
            [gzbtn addTarget:self action:@selector(gzCLick) forControlEvents:UIControlEventTouchUpInside];
            gzbtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [self.view addSubview:gzbtn];

            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7.5, 15, 15)];
            img.image = [UIImage imageNamed:@"ruzhu_tishi3"];
            [gzbtn addSubview:img];
            
        }

 
        
    }

}



#pragma mark - 按钮点击
-(void)btnCLick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"暂不取消"]) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        
        RWDDFangQiVC * rwddqx = [[RWDDFangQiVC alloc] init];
        [self.navigationController pushViewController:rwddqx animated:YES];

    }
}

#pragma mark -  取消规则
-(void)gzCLick
{
    QuXiaoGueiZeVC * qxgz = [[QuXiaoGueiZeVC alloc] init];
    [self.navigationController pushViewController:qxgz animated:YES];
    
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
