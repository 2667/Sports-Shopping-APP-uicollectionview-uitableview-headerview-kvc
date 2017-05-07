//
//  TianJiaYingHangKaVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TianJiaYingHangKaVC.h"
#import "TianJiaYingHangKaEVC.h"

@interface TianJiaYingHangKaVC ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextField * _chikaretext;
    UITextField * _kahaotext;
    UIButton * _xiayibubtn;

    
    UIAlertView * _chikarshoumingarv;
}

@end

@implementation TianJiaYingHangKaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    
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
    biaoting.text = @"添加银行卡";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ycjianpan)];
    [self.view addGestureRecognizer:tap];
    

    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 74, APPwidth-20, 30)];
    label.text = @"请绑定持卡人本人的银行卡";
    label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label.textAlignment = 0;
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    
    NSArray * array1 = @[@"持卡人",@"卡号"];
    NSArray * array2 = @[@"请输入持卡人姓名",@"请输入卡号"];
    NSArray * array3 = @[@"wode_yue_tishi",@"wode_yue_quxiao"];

    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, label.frame.origin.y+label.frame.size.height+10+60*i, APPwidth, 60)];
        view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
        [self.view addSubview:view];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 60)];
        label1.text = array1[i];
        label1.textColor = [UIColor whiteColor];
        label1.textAlignment = 0;
        label1.font = [UIFont systemFontOfSize:18];
        [view addSubview:label1];
        
        
        UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+10, 0, view.frame.size.width-145, 60)];
        texf.placeholder = array2[i];
        texf.textColor = [UIColor whiteColor];
        texf.autocorrectionType = UITextAutocorrectionTypeNo;
        texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        texf.tag = 5870+i;
        texf.delegate = self;
        texf.font = [UIFont systemFontOfSize:16];
        [view addSubview:texf];
        [texf setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];//修改大小
        [texf setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
        texf.textAlignment = 0;
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 10, 40, 40)];
        [btn setImage:[UIImage imageNamed:array3[i]] forState:0];
        btn.tag = 5872+i;
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        [view addSubview:btn];

        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(20, 59, APPwidth-20, 1)];
        xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        [view addSubview:xian];
        
        
    }

    
    //**************提交*******************
    _xiayibubtn = [[UIButton alloc] initWithFrame:CGRectMake(20, label.frame.origin.y+label.frame.size.height+40+120, APPwidth-40, 50)];
    [_xiayibubtn setTitle:@"下一步" forState:0];
    [_xiayibubtn setTitleColor:[UIColor whiteColor] forState:0];
    [_xiayibubtn addTarget:self action:@selector(xiayibuClick) forControlEvents:UIControlEventTouchUpInside];
    _xiayibubtn.layer.cornerRadius = 5;
    _xiayibubtn.layer.masksToBounds = YES;
    _xiayibubtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _xiayibubtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    [self.view addSubview:_xiayibubtn];
//    _xiayibubtn.userInteractionEnabled = NO;
    
    

    
    _chikaretext = (UITextField *)[self.view viewWithTag:5870];
    _kahaotext = (UITextField *)[self.view viewWithTag:5871];
    _kahaotext.keyboardType = UIKeyboardTypeNumberPad;

}


-(void)btnclick:(UIButton *)btn
{
    
    
    switch (btn.tag) {
        
        case 5872:
        {
            _chikarshoumingarv = [[UIAlertView alloc] initWithTitle:@"持卡人说明" message:@"为保证资金安全，只能绑定认证用户本人的银行卡" delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
            _chikarshoumingarv.alertViewStyle = UIAlertViewStyleDefault;
            [_chikarshoumingarv show];
            
        }
            break;
            
            
        case 5873:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 弹出框代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"取消");
            break;
        case 1:
            NSLog(@"确定");
            break;
            
        default:
            break;
    }
    
    
}

#pragma mark - 下一步
-(void)xiayibuClick
{
    TianJiaYingHangKaEVC * tjyhk = [[TianJiaYingHangKaEVC alloc] init];
    [self.navigationController pushViewController:tjyhk animated:YES];
    
}


#pragma mark - 收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}


#pragma mark - 隐藏键盘
-(void)ycjianpan
{
    [_chikaretext resignFirstResponder];
    
    [_kahaotext resignFirstResponder];
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
