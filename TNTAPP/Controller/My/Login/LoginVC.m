//
//  LoginVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/12.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "LoginVC.h"
#import "MMLoginVC.h"
#import "DXLoginVC.h"

@interface LoginVC ()
{
    BOOL _xieyibool;
}

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _xieyibool = YES;
    
    [self zdyUI];
   
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UIImageView *benjiimgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    benjiimgV.image = [UIImage imageNamed:@"denglu_beijing"];
    [self.view addSubview:benjiimgV];
    
    //标题
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, APPwidth-80, 44)];
    biaoting.text = @"选择您喜欢的登录方式";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:biaoting];
    
    //返回按钮
    UIButton * fanhueibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-30, 33, 20, 20)];
    [fanhueibtn setImage:[UIImage imageNamed:@"denglu_guanbi"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhueibtn];
    
    //logo
    UIImageView * logoimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-50, 100, 100, 100)];
    logoimv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:logoimv];
    

    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 240, 100, 20)];
    label1.text = @"社交登录";
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label1];
    
    UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(label1.frame.origin.x-50, 250, 50, 1)];
    xian1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:xian1];

    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(label1.frame.origin.x+100, 250, 50, 1)];
    xian2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:xian2];

    NSArray * tubiao = @[@"denglu_weixin",@"denglu_QQ",@"denglu_weibo"];
    for (int i = 0; i <3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-160)/3*i+50+30*i, label1.frame.origin.y+40,(APPwidth-160)/3, (APPwidth-160)/3)];
        [btn setImage:[UIImage imageNamed:tubiao[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
    }
    
    NSArray * array = @[@"短信登录",@"密码登录"];
    for (int i = 0; i <2; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-130)/2*i+50+30*i, label1.frame.origin.y+90+(APPwidth-160)/3,(APPwidth-130)/2, 40)];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
        [btn addTarget:self action:@selector(btnCLick:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 20;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
        btn.layer.borderWidth= 1.0f;
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.tag = 6800+i;
        [self.view addSubview:btn];
        
        
    }

    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label1.frame.origin.y+160+(APPwidth-160)/3, APPwidth, 20)];
    label2.text = @"登录表示您同意《呼来用户协议》";
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label2];
    [label2 sizeToFit];
    
    CGRect fram = label2.frame;
    fram.origin.x = APPwidth/2-label2.frame.size.width/2;
    label2.frame = fram;
    
    
    UIButton * xieyibtn = [[UIButton alloc] initWithFrame:CGRectMake(label2.frame.origin.x+label2.frame.size.width, label2.frame.origin.y,15, 15)];
    [xieyibtn addTarget:self action:@selector(xieyi:) forControlEvents:UIControlEventTouchUpInside];
    [xieyibtn setBackgroundImage:[UIImage imageNamed:@"denglu_xieyi"] forState:0];
    [xieyibtn setBackgroundImage:[UIImage imageNamed:@"denglu_weigou"] forState:UIControlStateSelected];
    [self.view addSubview:xieyibtn];
    
    

//    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 20)];
//    label3.text = @"注册即代表您已阅读并同意优行宝";
//    label3.textColor = [UIColor whiteColor];
//    label3.textAlignment = NSTextAlignmentCenter;
//    label3.font = [UIFont systemFontOfSize:12];
//    [self.view addSubview:label3];


    
}


#pragma mark - 按钮点击
-(void)btnCLick:(UIButton *)btn
{
    for(int i = 6800;i<6802;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
        btn1.backgroundColor = [UIColor clearColor];
        
    }
    
    if ([btn.titleLabel.text isEqualToString:@"密码登录"]) {
        
        MMLoginVC * mm = [[MMLoginVC alloc] init];
        [self.navigationController pushViewController:mm animated:YES];
        
    }
    else if([btn.titleLabel.text isEqualToString:@"短信登录"])
    {
        DXLoginVC * dx = [[DXLoginVC alloc] init];
        [self.navigationController pushViewController:dx animated:YES];
    }
    
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
}


#pragma mark - 同意协议
-(void)xieyi:(UIButton *)btn
{
    if (_xieyibool == YES) {
        
        btn.selected = YES;
        
        _xieyibool = NO;
        
    }
    else{
        
        btn.selected = NO;
        
        _xieyibool = YES;

    }
    
}

#pragma mark - 返回
-(void)fanhuei
{
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(void)viewWillAppear:(BOOL)animated{
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
    for(int i = 6800;i<6802;i++)
    {
        
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
        btn1.backgroundColor = [UIColor clearColor];
        
    }
    
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
