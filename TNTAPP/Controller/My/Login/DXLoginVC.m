//
//  DXLoginVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/12.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "DXLoginVC.h"

@interface DXLoginVC ()<UITextFieldDelegate>
{
    UITextField * _shoujihaotextf;
    UITextField * _yanzhenmatextf;
    UIButton * _yzmbtn;

    UIImageView * _shoujihaocwimv;
    
    BOOL _xieyibool;
   
    int _daojishi;
    NSTimer * _yzmjishiqitimer;

}


@end

@implementation DXLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _xieyibool = YES;

    _daojishi = 60;
    
    [self zdyUI];
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UIImageView *benjiimgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    benjiimgV.image = [UIImage imageNamed:@"denglu_beijing"];
    [self.view addSubview:benjiimgV];
    
    //标题
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    biaoting.text = @"短信登录";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:biaoting];
    
    //返回按钮
    UIButton * fanhueibtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 33, 20, 20)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhueibtn];

    
    NSArray * tubiao = @[@"denglu_shoujihao",@"denglu_yanzhengma"];
    NSArray * tishi = @[@"请输入手机号",@"请输入验证码"];
    
    NSLog(@"%.2f   %.2f",APPwidth,APPheight);
    
    float x;
    if (APPwidth == 320) {
        
        x = 20;
    }
    else if (APPwidth == 375)
    {
         x = 20;
    }
    else
    {
         x = 50;
    }
    for (int i = 0; i < tubiao.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(x, 160+40*i+30*i, APPwidth-x*2, 40)];
        [self.view addSubview:view];
        
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        imv.image = [UIImage imageNamed:tubiao[i]];
        [view addSubview:imv];
        
        
        UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(30, 5, view.frame.size.width-70, 20)];
        texf.placeholder = tishi[i];
        texf.textColor = [UIColor whiteColor];
        texf.autocorrectionType = UITextAutocorrectionTypeNo;
        texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        texf.tag = 6950+i;
        texf.delegate = self;
        texf.font = [UIFont systemFontOfSize:18];
        [view addSubview:texf];
        
        [texf setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];//修改大小
        [texf setValue:[UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 29, view.frame.size.width, 1)];
        xian.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.5];
        [view addSubview:xian];
        
        if (i == 1 ) {
            
            xian.frame = CGRectMake(0, 29, view.frame.size.width-130, 1);
            texf.frame = CGRectMake(30, 5, view.frame.size.width-70-100, 20);
            
            _yzmbtn = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width-120, 0, 120, 30)];
            _yzmbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            [_yzmbtn setTitle:@"获取验证码" forState:0];
            [_yzmbtn setTitleColor:[UIColor whiteColor] forState:0];
            [_yzmbtn addTarget:self action:@selector(fasongyzm:) forControlEvents:UIControlEventTouchUpInside];
            _yzmbtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [view addSubview:_yzmbtn];
            
        }
        else
        {
            _shoujihaocwimv = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width-20, 5, 15, 15)];
            _shoujihaocwimv.image = [UIImage imageNamed:@"denglu_tanhao"];
            [view addSubview:_shoujihaocwimv];
        }
    }
    
    _shoujihaotextf = (UITextField *)[self.view viewWithTag:6950];
    _yanzhenmatextf = (UITextField *)[self.view viewWithTag:6951];
    
    
    
    UIButton * denlubtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 300,APPwidth-120, 40)];
    [denlubtn setTitle:@"登 录" forState:0];
    [denlubtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    [denlubtn addTarget:self action:@selector(denlu:) forControlEvents:UIControlEventTouchUpInside];
    denlubtn.layer.cornerRadius = 20;
    denlubtn.layer.masksToBounds = YES;
    denlubtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    denlubtn.layer.borderWidth= 1.0f;
    denlubtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:denlubtn];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, denlubtn.frame.origin.y+denlubtn.frame.size.height+20, APPwidth, 20)];
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



#pragma mark - 登录
-(void)denlu:(UIButton *)btn
{
    NSLog(@"登录");
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];

    NSArray * array =  self.navigationController.viewControllers;
    [self.navigationController popToViewController:array[0] animated:YES];
    

}


#pragma mark - 获取验证码
-(void)fasongyzm:(UIButton *)btn
{
    NSLog(@"获取验证码");
    
    if ([btn.titleLabel.text isEqualToString:@"获取验证码"]) {
        
        _yzmjishiqitimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(yzmjishiqi:) userInfo:nil repeats:YES];
    }
}




#pragma mark - 60秒的定时器
-(void)yzmjishiqi:(NSTimer *)timer
{
    
    _daojishi--;
    
    _yzmbtn.backgroundColor = [UIColor clearColor];
    _yzmbtn.layer.borderWidth= 1.0f;
    _yzmbtn.layer.borderColor=[[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.5]CGColor];
    [_yzmbtn setTitle:[NSString stringWithFormat:@"%d秒后重发",_daojishi] forState:UIControlStateNormal];
    
    
    if (_daojishi == -1) {
        
        
        [_yzmjishiqitimer invalidate];
        _daojishi = 60;

        
        _yzmbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        [_yzmbtn setTitle:@"获取验证码" forState:0];
        [_yzmbtn setTitleColor:[UIColor whiteColor] forState:0];
        _yzmbtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
        
    }
    
    
    
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


#pragma mark - Return 收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
