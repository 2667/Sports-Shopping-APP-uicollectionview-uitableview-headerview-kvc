//
//  XiaoXiZhongXinVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "XiaoXiZhongXinVC.h"
#import "InformationVC.h"
#import "SCXXVC.h"
#import "XTXXVC.h"
#import "TZXXVC.h"

@interface XiaoXiZhongXinVC ()

@end

@implementation XiaoXiZhongXinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    

    [self zdyUI];
    
    [self zdydhl];
    
    

}



#pragma mark - 自定义导航栏
-(void)zdydhl
{
    
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuei"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = @"消息中心";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    NSArray * array1;
    NSArray * tubiao;
    if ([_biaoting isEqualToString:@"商城入口"]) {
       
        array1 = @[@"通知消息",@"系统消息",@"商城消息"];
        tubiao = @[@"message-tongzhi",@"message-xitong",@"message-shangcheng-"];
    }
    else
    {
        
        array1 = @[@"系统消息",@"好友消息",@"通知消息",@"在线客服"];
        tubiao = @[@"xiaoxizhongxin_xitong-1",@"xiaoxizhongxin_haoyou-1",@"xiaoxizhongxin_tongzhi",@"xiaoxizhongxin_kefu-1"];
    }
    
 
    NSArray * array2 = @[@"12",@"99+",@"2",@"2"];
    
    
    for (int i = 0; i < array1.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100*i+64, APPwidth, 100)];
        [btn setTitle:array1[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 60, 60)];
        img.image = [UIImage imageNamed:tubiao[i]];
        [btn addSubview:img];
        
        
        UILabel * label1 =[[UILabel alloc] initWithFrame:CGRectMake(85, 0, btn.frame.size.width-150, 100)];
        label1.text = array1[i];
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:18];
        [btn addSubview:label1];
        
        if ([_biaoting isEqualToString:@"首页入口"]) {
            
            UILabel * label2 =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth-60, 40, 20, 20)];
            label2.text = array2[i];
            label2.textColor = [UIColor whiteColor];
            label2.font = [UIFont systemFontOfSize:9];
            label2.backgroundColor = [UIColor redColor];
            label2.layer.cornerRadius = 10;
            label2.layer.masksToBounds = YES;
            label2.textAlignment = 1;
            [btn addSubview:label2];
        }
        
        
        
        UIImageView * jiantou = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 50-10, 20, 20)];
        jiantou.image = [UIImage imageNamed:@"xiaoxizhongxin_you"];
        [btn addSubview:jiantou];
        
        
        
        UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 99, APPwidth, 1)];
        xian.image = [UIImage imageNamed:@"shouye-fengexian"];
        [btn addSubview:xian];
        
        
        
        
    }
    
    
}


#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    
    if ([btn.titleLabel.text isEqualToString:@"好友消息"]) {
        
        InformationVC * xiaoxi = [[InformationVC alloc] init];
        [self.navigationController pushViewController:xiaoxi animated:YES];
        
    }
    else if ([btn.titleLabel.text isEqualToString:@"商城消息"])
    {
        
        SCXXVC * scxx = [[SCXXVC alloc] init];
        scxx.biaoting = btn.titleLabel.text;
        [self.navigationController pushViewController:scxx animated:YES];
        

    }
    else if ([btn.titleLabel.text isEqualToString:@"系统消息"])
    {
        
        XTXXVC * xtxx = [[XTXXVC alloc] init];
        [self.navigationController pushViewController:xtxx animated:YES];
        
        
    }
    else if ([btn.titleLabel.text isEqualToString:@"通知消息"])
    {
        
        TZXXVC * tzxx = [[TZXXVC alloc] init];
        [self.navigationController pushViewController:tzxx animated:YES];
        
        
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
