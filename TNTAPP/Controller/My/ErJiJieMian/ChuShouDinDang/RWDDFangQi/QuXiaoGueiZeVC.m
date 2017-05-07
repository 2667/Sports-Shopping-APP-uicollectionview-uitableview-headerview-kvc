//
//  QuXiaoGueiZeVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/30.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "QuXiaoGueiZeVC.h"

@interface QuXiaoGueiZeVC ()

@end

@implementation QuXiaoGueiZeVC

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
    biaoting.text = @"取消规则";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    //*********扣费****************
    UIView * yuandian1 = [[UIView alloc] initWithFrame:CGRectMake(20, 97, 6, 6)];
    yuandian1.layer.cornerRadius = 4;
    yuandian1.layer.masksToBounds = YES;
    yuandian1.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [self.view addSubview:yuandian1];
    
    UILabel * koufeilabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 85, APPwidth-60, 30)];
    koufeilabel.text = @"取消扣费规则";
    koufeilabel.textColor = WenZiHeiColor;
    koufeilabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:koufeilabel];
    
    NSArray * array1 = @[@"1.服务方未到达约定服务地点，需求方XX分钟内可以免费取消，服务方已到或接单XX分钟后取消将需支付XX元取消费；",@"2.若服务方迟到（超出约定的时间），需求方可免费取消；",@"3.若服务方已到达，但迟到了（超出约定时间），确认需求方不需要继续雇佣本次服务后， 服务方可免费取消；",@"4. 若需求方迟到，需求方可免费取消；"];
    float y = koufeilabel.frame.origin.y+koufeilabel.frame.size.height+15;
    for (int i = 0; i < array1.count; i++) {
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(35, y, APPwidth-50, 30)];
        label.text = array1[i];
        label.textColor = WenZiShenHueiColor;
        label.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:label];
        label.numberOfLines = 0;
        [label sizeToFit];
        
        CGRect fram = label.frame;
        fram.origin.y = y;
        fram.origin.x = 35;
        label.frame = fram;
        
        y = y + fram.size.height+15;

    }
    
    //*********迟到****************
    y = y + 5;

    UIView * yuandian2 = [[UIView alloc] initWithFrame:CGRectMake(20, y+12, 6, 6)];
    yuandian2.layer.cornerRadius = 4;
    yuandian2.layer.masksToBounds = YES;
    yuandian2.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [self.view addSubview:yuandian2];
    
    
    UILabel * cidaolabel = [[UILabel alloc] initWithFrame:CGRectMake(35, y, APPwidth-60, 30)];
    cidaolabel.text = @"如何判定迟到";
    cidaolabel.textColor = WenZiHeiColor;
    cidaolabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:cidaolabel];
    
    NSArray * array2 = @[@"1.服务方迟到:服务方接单后，XX分钟内未能到达约定好的实施服务地点，记为服务方迟到;",@"2.需求方迟到:服务方到达约定地点后， 需求方XX分钟内未能到达约定好的实施服务地点，记为需求方迟到;"];
    y = y + 45;
    for (int i = 0; i < array2.count; i++) {
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(35, y, APPwidth-50, 30)];
        label.text = array2[i];
        label.textColor = WenZiShenHueiColor;
        label.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:label];
        label.numberOfLines = 0;
        [label sizeToFit];
        
        CGRect fram = label.frame;
        fram.origin.y = y;
        fram.origin.x = 35;
        label.frame = fram;
        
        y = y + fram.size.height+15;
        
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
