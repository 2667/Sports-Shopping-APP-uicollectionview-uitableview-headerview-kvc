//
//  YZMVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/12.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YZMVC.h"
#import "XGMMVC.h"

@interface YZMVC ()<UITextFieldDelegate>
{
    UIButton * _qdbtn;
    
}

@end

@implementation YZMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    biaoting.text = @"输入验证码";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:biaoting];
    
    //返回按钮
    UIButton * fanhueibtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 33, 20, 20)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhueibtn];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, APPwidth, 20)];
    label1.text = @"验证码已发送到+86 15542158652  请查收";
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label1];
    

    for (int i = 0; i < 4; i++) {
    
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake((APPwidth-130)/2+20*i+10*i, 150, 20, 2)];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 1;
        view.layer.masksToBounds = YES;
        view.tag = 6960+i;
        [self.view addSubview:view];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y-10, 20, 20)];
        label.textColor = [UIColor whiteColor];
        label.tag = 6965+i;
        [view addSubview:label];

    }
    
    
    
//    UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(0, APPheight, 70, 20)];
//    [self.view addSubview:texf];
//    [texf becomeFirstResponder];
//    texf.keyboardType = UIKeyboardTypeNumberPad;
//    texf.delegate = self;
    

    
    _qdbtn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-130)/2-10, 200,130, 40)];
    [_qdbtn setTitle:@"确定" forState:0];
    [_qdbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    [_qdbtn addTarget:self action:@selector(queding:) forControlEvents:UIControlEventTouchUpInside];
    _qdbtn.layer.cornerRadius = 20;
    _qdbtn.layer.masksToBounds = YES;
    _qdbtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    _qdbtn.layer.borderWidth= 1.0f;
    _qdbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_qdbtn];
    
    
    
#if 0
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(60, 160, APPwidth-120, 30)];
    [self.view addSubview:view];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    label.text = @"+86";
    label.textColor = [UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    
    UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(30, 5, view.frame.size.width-70, 20)];
    texf.placeholder = @"手机号";
    texf.textColor = [UIColor whiteColor];
    texf.autocorrectionType = UITextAutocorrectionTypeNo;
    texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [view addSubview:texf];
    [texf setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];//修改大小
    [texf setValue:[UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
    texf.textAlignment = 1;
    texf.font = [UIFont systemFontOfSize:14];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 26, view.frame.size.width, 1)];
    xian.backgroundColor = [UIColor whiteColor];
    [view addSubview:xian];
    _shoujihaocwimv = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width-20, 5, 15, 15)];
    _shoujihaocwimv.image = [UIImage imageNamed:@"denglu_tanhao"];
    [view addSubview:_shoujihaocwimv];
    
    
    
    
    UIButton * xiayibubtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 240,APPwidth-200, 40)];
    [xiayibubtn setTitle:@"下一步" forState:0];
    [xiayibubtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    [xiayibubtn addTarget:self action:@selector(xiayibu) forControlEvents:UIControlEventTouchUpInside];
    xiayibubtn.layer.cornerRadius = 20;
    xiayibubtn.layer.masksToBounds = YES;
    xiayibubtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    xiayibubtn.layer.borderWidth= 1.0f;
    xiayibubtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:xiayibubtn];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, xiayibubtn.frame.origin.y+xiayibubtn.frame.size.height+20, APPwidth, 20)];
    label2.text = @"登录表示您同意《呼来用户协议》";
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label2];
    [label2 sizeToFit];
    
    CGRect fram = label2.frame;
    fram.origin.x = APPwidth/2-label2.frame.size.width/2;
    label2.frame = fram;
    
    
    UIButton * xieyibtn = [[UIButton alloc] initWithFrame:CGRectMake(label2.frame.origin.x+label2.frame.size.width+3, label2.frame.origin.y,12, 12)];
    [xieyibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [xieyibtn setBackgroundImage:[UIImage imageNamed:@"denglu_xieyi"] forState:0];
    [self.view addSubview:xieyibtn];
    
    
    
//    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 20)];
//    label3.text = @"注册即代表您已阅读并同意优行宝";
//    label3.textColor = [UIColor whiteColor];
//    label3.textAlignment = NSTextAlignmentCenter;
//    label3.font = [UIFont systemFontOfSize:12];
//    [self.view addSubview:label3];
#endif
    
    
}



#pragma mark - 下一步
-(void)queding:(UIButton *)btn
{
    
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    
    XGMMVC * xgmm = [[XGMMVC alloc] init];
    [self.navigationController pushViewController:xgmm animated:YES];
    
    
}


#pragma mark - Return 收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@",string);
    
    NSLog(@"%d",range);
    return YES;
    
}

#pragma mark - 返回
-(void)fanhuei
{
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(void)viewWillAppear:(BOOL)animated{
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
    [_qdbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    _qdbtn.backgroundColor = [UIColor clearColor];
    

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
