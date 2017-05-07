//
//  YaoYouVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/24.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YaoYouVC.h"

@interface YaoYouVC ()
{
    UIView * _fenxiangview;
    UIView * _fenxiangtubiaoview;

}

@end

@implementation YaoYouVC

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
    biaoting.text = @"邀好友得金币";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{

    UIImage * img = [UIImage imageNamed:@"yaoyouhaibao"];
    
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPwidth/img.size.width*img.size.height)];
    imgv.image = img;
    [self.view addSubview:imgv];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, imgv.frame.size.height-50, APPwidth, 20)];
    label1.text = @"1.邀请好友赚钱邀请好友赚钱邀请好友赚钱";
    label1.textColor = WenZiHeiColor;
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:15];
    [imgv addSubview:label1];
    

    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label1.frame.size.height+label1.frame.origin.y+2, APPwidth, 20)];
    label2.text = @"2.邀请好友赚钱邀请好友赚钱邀请好友赚钱";
    label2.textColor = WenZiHeiColor;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:15];
    [imgv addSubview:label2];

    
    UIButton * qdbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, imgv.frame.origin.y+imgv.frame.size.height+50,APPwidth-40, 40)];
    [qdbtn setTitle:@"邀请好友" forState:0];
    [qdbtn setTitleColor:[UIColor whiteColor] forState:0];
    [qdbtn addTarget:self action:@selector(btnCLick) forControlEvents:UIControlEventTouchUpInside];
    qdbtn.layer.cornerRadius = 8;
    qdbtn.layer.masksToBounds = YES;
    qdbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    qdbtn.backgroundColor = [UIColor colorWithRed:223/255.0 green:40/255.0 blue:53/255.0 alpha:1.0];
    [self.view addSubview:qdbtn];
    
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, qdbtn.frame.size.height+qdbtn.frame.origin.y+15, APPwidth, 20)];
    label3.text = @"呼来APP保留对该活动解释的权利";
    label3.textColor = [UIColor colorWithRed:107/255.0 green:107/255.0 blue:107/255.0 alpha:1.0];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label3];
    

    //***********分享界面****************
    _fenxiangview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _fenxiangview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    [self.view addSubview:_fenxiangview];
    _fenxiangview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangfenxiangview)];
    [_fenxiangview addGestureRecognizer:tap];
    

    
    _fenxiangtubiaoview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, 100+(APPwidth-150)/4)];
    _fenxiangtubiaoview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:_fenxiangtubiaoview];
    

    NSArray * array = @[@"微信",@"朋友圈",@"QQ",@"微博"];
    NSArray * tubiao = @[@"weixin",@"pengyouquan",@"qq",@"denglu_weibo"];

    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-150)/4*i+30*i+30, 10,(APPwidth-150)/4, (APPwidth-150)/4)];
        [btn setImage:[UIImage imageNamed:tubiao[i]] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
        [_fenxiangtubiaoview addSubview:btn];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.size.height+btn.frame.origin.y, btn.frame.size.width, 20)];
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        [_fenxiangtubiaoview addSubview:label];
        
        if (i == 0) {
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40+(APPwidth-150)/4, APPwidth, 1)];
            imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
            [_fenxiangtubiaoview addSubview:imgv];
            

            UIButton * qxbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40+(APPwidth-150)/4, APPwidth, 50)];
            [qxbtn setTitle:@"取消" forState:0];
            [qxbtn setTitleColor:[UIColor whiteColor] forState:0];
            [qxbtn addTarget:self action:@selector(yicangfenxiangview) forControlEvents:UIControlEventTouchUpInside];
            qxbtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [_fenxiangtubiaoview addSubview:qxbtn];

        }

    }

}
#pragma mark - 确定按钮
-(void)btnCLick
{
    _fenxiangview.hidden = NO;

    [UIView animateWithDuration:0.3 animations:^{
        
        
        CGRect fram = _fenxiangtubiaoview.frame;
        fram.origin.y = APPheight-(90+(APPwidth-150)/4);
        _fenxiangtubiaoview.frame = fram;
        
        
    }];
    
}


#pragma mark - 隐藏分享view
-(void)yicangfenxiangview
{
    _fenxiangview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        CGRect fram = _fenxiangtubiaoview.frame;
        fram.origin.y = APPheight;
        _fenxiangtubiaoview.frame = fram;
        
        
    }];

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
