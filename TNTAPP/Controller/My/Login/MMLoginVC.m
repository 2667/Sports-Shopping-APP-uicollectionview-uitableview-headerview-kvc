//
//  MMLoginVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/12.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "MMLoginVC.h"
#import "WJMMVC.h"


@interface MMLoginVC ()<UITextFieldDelegate>
{
    UITextField * _shoujihaotextf;
    UITextField * _mimatextf;

    UIButton * _denlubtn;
    
    BOOL _xsmimabool;
    UIImageView * _shoujihaocwimv;
    
    BOOL _xieyibool;
    
}

@end

@implementation MMLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _xieyibool = YES;
    
    _xsmimabool = YES;
    
    [self zdyUI];
}



#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UIImageView *benjiimgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    benjiimgV.image = [UIImage imageNamed:@"denglu_beijing"];
    [self.view addSubview:benjiimgV];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shoujianpan)];
    [benjiimgV addGestureRecognizer:tap];
    
    
    //标题
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    biaoting.text = @"密码登录";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:biaoting];
    
    //返回按钮
    UIButton * fanhueibtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 33, 20, 20)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhueibtn];
    
   
    
    NSArray * tubiao = @[@"denglu_shoujihao",@"dengli_mimashou"];
    NSArray * tishi = @[@"请输入手机号",@"请输入密码"];
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
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width-25, 5, 25, 25)];
            [btn setImage:[UIImage imageNamed:@"denglu_guanyan"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"denglu_kaiyan"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(xianshimimi:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
            
        }
        else
        {
            _shoujihaocwimv = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width-20, 5, 15, 15)];
            _shoujihaocwimv.image = [UIImage imageNamed:@"denglu_tanhao"];
            [view addSubview:_shoujihaocwimv];
        }
    }
    
    _shoujihaotextf = (UITextField *)[self.view viewWithTag:6950];
    _mimatextf = (UITextField *)[self.view viewWithTag:6951];
    _mimatextf.secureTextEntry = YES;
    
    
    UIButton * wjmmbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-140-x, 270,140, 20)];
    [wjmmbtn setTitle:@"忘记密码?" forState:0];
    [wjmmbtn setTitleColor:[UIColor colorWithRed:0/255.0 green:160/255.0 blue:231/255.0 alpha:1.0] forState:0];
    [wjmmbtn addTarget:self action:@selector(wjmm) forControlEvents:UIControlEventTouchUpInside];
    wjmmbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    wjmmbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:wjmmbtn];
    
    

    
    _denlubtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 320,APPwidth-120, 40)];
    [_denlubtn setTitle:@"登 录" forState:0];
    [_denlubtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    [_denlubtn addTarget:self action:@selector(denlu:) forControlEvents:UIControlEventTouchUpInside];
    _denlubtn.layer.cornerRadius = 20;
    _denlubtn.layer.masksToBounds = YES;
    _denlubtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    _denlubtn.layer.borderWidth= 1.0f;
    _denlubtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_denlubtn];
    

    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, _denlubtn.frame.origin.y+_denlubtn.frame.size.height+20, APPwidth, 20)];
    label2.text = @"登录表示您同意《呼来用户协议》";
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label2];
    [label2 sizeToFit];
    
    CGRect fram = label2.frame;
    fram.origin.x = APPwidth/2-label2.frame.size.width/2;
    label2.frame = fram;
    
    
    UIButton * xieyibtn = [[UIButton alloc] initWithFrame:CGRectMake(label2.frame.origin.x+label2.frame.size.width+3, label2.frame.origin.y,15, 15)];
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

#pragma mark - 显示密码
-(void)xianshimimi:(UIButton *)btn
{
    if (_xsmimabool == YES) {
        
        btn.selected = YES;
        
        _mimatextf.secureTextEntry = NO;
        
        _xsmimabool = NO;
        
    }
    else
    {
        btn.selected = NO;
        
        _mimatextf.secureTextEntry = YES;
        
        _xsmimabool = YES;
        

    }
   

}


#pragma mark - 登录
-(void)denlu:(UIButton *)btn
{
    
    
    [_denlubtn setTitleColor:[UIColor whiteColor] forState:0];
    _denlubtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    

    NSArray * array =  self.navigationController.viewControllers;
    [self.navigationController popToViewController:array[0] animated:YES];
    

}


#pragma mark - 忘记密码
-(void)wjmm
{
    WJMMVC * wjmm = [[WJMMVC alloc] init];
    [self.navigationController pushViewController:wjmm animated:YES];
    

    NSLog(@"忘记密码");
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
