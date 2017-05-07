//
//  WJMMVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/12.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WJMMVC.h"
#import "YZMVC.h"


@interface WJMMVC ()<UITextFieldDelegate>
{
    UIImageView * _shoujihaocwimv;

    UIButton * _xiayibubtn;
    
    BOOL _xieyibool;
}

@end

@implementation WJMMVC

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
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    biaoting.text = @"忘记密码";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:biaoting];
    
    //返回按钮
    UIButton * fanhueibtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 33, 20, 20)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhueibtn];
    
    
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

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(x, 160, APPwidth-x*2, 30)];
    [self.view addSubview:view];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    label.text = @"+86";
    label.textColor = [UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:18];
    [view addSubview:label];
    
    
    UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(50, 5, view.frame.size.width-90, 20)];
    texf.placeholder = @"手机号";
    texf.textColor = [UIColor whiteColor];
    texf.autocorrectionType = UITextAutocorrectionTypeNo;
    texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [view addSubview:texf];
    [texf setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];//修改大小
    [texf setValue:[UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
    texf.textAlignment = 1;
    texf.delegate = self;
    texf.font = [UIFont systemFontOfSize:18];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 29, view.frame.size.width, 1)];
    xian.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.5];
    [view addSubview:xian];
    
    _shoujihaocwimv = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width-20, 5, 15, 15)];
    _shoujihaocwimv.image = [UIImage imageNamed:@"denglu_tanhao"];
    [view addSubview:_shoujihaocwimv];


    
    
    _xiayibubtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 240,APPwidth-200, 40)];
    [_xiayibubtn setTitle:@"下一步" forState:0];
    [_xiayibubtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    [_xiayibubtn addTarget:self action:@selector(xiayibu:) forControlEvents:UIControlEventTouchUpInside];
    _xiayibubtn.layer.cornerRadius = 20;
    _xiayibubtn.layer.masksToBounds = YES;
    _xiayibubtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    _xiayibubtn.layer.borderWidth= 1.0f;
    _xiayibubtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_xiayibubtn];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, _xiayibubtn.frame.origin.y+_xiayibubtn.frame.size.height+20, APPwidth, 20)];
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



#pragma mark - 下一步
-(void)xiayibu:(UIButton *)btn
{
    NSLog(@"下一步");
    
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    

    YZMVC * yzm = [[YZMVC alloc] init];
    [self.navigationController pushViewController:yzm animated:YES];
    

}


-(void)wjmm
{
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
   
    [_xiayibubtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    _xiayibubtn.backgroundColor = [UIColor clearColor];
    

    
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
