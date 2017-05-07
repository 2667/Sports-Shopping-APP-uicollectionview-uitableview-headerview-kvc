//
//  TianJiaHaoYouZhiLiaoVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TianJiaHaoYouZhiLiaoVC.h"
#import "BeiZhuVC.h"

@interface TianJiaHaoYouZhiLiaoVC ()

@end

@implementation TianJiaHaoYouZhiLiaoVC

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
    biaotinglabel.text = @"添加好友";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    //**********好友头像*********
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, APPwidth, 80)];
    btn1.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:btn1];
    
    
    UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    img.backgroundColor = [UIColor orangeColor];
    [btn1 addSubview:img];
    
    
    UILabel * label1 =[[UILabel alloc] initWithFrame:CGRectMake(75, 0, btn1.frame.size.width-120, 80)];
    label1.text = @"爱笑的云";
    label1.textColor = WenZiHeiColor;
    label1.font = [UIFont systemFontOfSize:16];
    [label1 sizeToFit];
    [btn1 addSubview:label1];
    CGRect fram = label1.frame;
    fram.origin.y = 40-label1.frame.size.height/2;
    label1.frame = fram;
    
    
    UIImageView * xingbie = [[UIImageView alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+8, 32.5, 15, 15)];
    xingbie.image = [UIImage imageNamed:@"xiaoxi_nv"];
    [btn1 addSubview:xingbie];
    
    
    //**********设置备注*********
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn1.frame.origin.y+btn1.frame.size.height+15, APPwidth, 40)];
    btn2.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [btn2 addTarget:self action:@selector(beizhuclick) forControlEvents:1<<6];
    [self.view addSubview:btn2];
    
    
    
    UILabel * label2 =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, btn2.frame.size.width-40, 40)];
    label2.text = @"    设置备注";
    label2.textColor = WenZiQiangHueiColor;
    label2.font = [UIFont systemFontOfSize:16];
    [btn2 addSubview:label2];
    
    
    UIImageView * jiantou2 = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 12.5, 15, 15)];
    jiantou2.image = [UIImage imageNamed:@"xiaoxi_tianjia_you"];
    [btn2 addSubview:jiantou2];
    
    
    
    
    //**********地区*********
    UILabel * diqulabel = [[UILabel alloc] initWithFrame:CGRectMake(0, btn2.frame.origin.y+btn2.frame.size.height+15, APPwidth, 40)];
    diqulabel.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    diqulabel.font = [UIFont systemFontOfSize:16];
    diqulabel.textColor = WenZiHeiColor;
    [self.view addSubview:diqulabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"    地区     广东 广州"];
    [str addAttribute:NSForegroundColorAttributeName value:WenZiQiangHueiColor range:NSMakeRange(0,6)];
    diqulabel.attributedText = str;

    //**********添加*********
    UIButton * tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, diqulabel.frame.origin.y+diqulabel.frame.size.height+30, APPwidth-40, 40)];
    tjbtn.backgroundColor = [UIColor colorWithRed:241/255.0 green:98/255.0 blue:104/255.0 alpha:1.0];
    tjbtn.layer.cornerRadius = 8;
    tjbtn.layer.masksToBounds = YES;
    [tjbtn setTitle:@"添  加" forState:0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    tjbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [tjbtn addTarget:self action:@selector(tianjiaclick) forControlEvents:1<<6];
    [self.view addSubview:tjbtn];
    

}


#pragma mark - 点击添加
-(void)tianjiaclick
{
    
}



#pragma mark - 点击备注
-(void)beizhuclick
{
    BeiZhuVC * beizhu = [[BeiZhuVC alloc] init];
    [self.navigationController pushViewController:beizhu animated:YES];
    

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
