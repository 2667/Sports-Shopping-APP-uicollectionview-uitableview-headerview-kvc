//
//  TianJiaYingHangKaEVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TianJiaYingHangKaEVC.h"

@interface TianJiaYingHangKaEVC ()<UITextFieldDelegate>
{
    UITextField * _shoujihaotext;
    
    UIButton * _xiayibubtn;

}

@end

@implementation TianJiaYingHangKaEVC

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
    
    
    NSArray * array1 = @[@"卡类型",@"手机号"];
    NSArray * array2 = @[@"中国工商银行 储蓄卡",@"请输入银行预留手机号"];
    
    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 80+60*i+15*i, APPwidth, 60)];
        view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
        [self.view addSubview:view];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 60)];
        label1.text = array1[i];
        label1.textColor = [UIColor whiteColor];
        label1.textAlignment = 0;
        label1.font = [UIFont systemFontOfSize:18];
        [view addSubview:label1];
        
        
        if (i == 0) {
            
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+10, 0, view.frame.size.width-110, 60)];
            label2.text = array2[i];
            label2.textColor = [UIColor whiteColor];
            label2.textAlignment = 0;
            label2.font = [UIFont systemFontOfSize:18];
            [view addSubview:label2];
            
 
        }
        else
        {
            _shoujihaotext = [[UITextField alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+10, 0, view.frame.size.width-145, 60)];
            _shoujihaotext.placeholder = array2[i];
            _shoujihaotext.textColor = [UIColor whiteColor];
            _shoujihaotext.autocorrectionType = UITextAutocorrectionTypeNo;
            _shoujihaotext.autocapitalizationType = UITextAutocapitalizationTypeNone;
            _shoujihaotext.delegate = self;
            _shoujihaotext.font = [UIFont systemFontOfSize:18];
            [view addSubview:_shoujihaotext];
            [_shoujihaotext setValue:[UIFont fontWithName:@"Arial" size:18]   forKeyPath:@"_placeholderLabel.font"];//修改大小
            [_shoujihaotext setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
            _shoujihaotext.textAlignment = 0;
            _shoujihaotext.keyboardType = UIKeyboardTypeNumberPad;

            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 10, 40, 40)];
            [btn setImage:[UIImage imageNamed:@"wode_yue_quxiao"] forState:0];
            [btn addTarget:self action:@selector(btnclick) forControlEvents:1<<6];
            [view addSubview:btn];

        }
       
        
        
    }
    
    UILabel * xieyilabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80+150, 140, 40)];
    xieyilabel.textColor = [UIColor whiteColor];
    xieyilabel.textAlignment = 0;
    xieyilabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:xieyilabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"同意《服务协议》"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0/255.0 green:176/255.0 blue:220/255.0 alpha:1.0] range:NSMakeRange(2,6)];
    xieyilabel.attributedText = str;

    UIButton * xieyibtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 80+150, 140, 40)];
    [xieyibtn addTarget:self action:@selector(xieyiclick) forControlEvents:1<<6];
    [self.view addSubview:xieyibtn];
    
    
    
    //**************提交*******************
    _xiayibubtn = [[UIButton alloc] initWithFrame:CGRectMake(20, xieyilabel.frame.origin.y+xieyilabel.frame.size.height+20, APPwidth-40, 50)];
    [_xiayibubtn setTitle:@"下一步" forState:0];
    [_xiayibubtn setTitleColor:[UIColor whiteColor] forState:0];
    [_xiayibubtn addTarget:self action:@selector(xiayibuClick) forControlEvents:UIControlEventTouchUpInside];
    _xiayibubtn.layer.cornerRadius = 5;
    _xiayibubtn.layer.masksToBounds = YES;
    _xiayibubtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _xiayibubtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    [self.view addSubview:_xiayibubtn];
    //    _xiayibubtn.userInteractionEnabled = NO;
    
    


    
}



#pragma mark - 下一步
-(void)xiayibuClick
{
    
}

#pragma mark - 删除输入的手机号
-(void)btnclick
{
    _shoujihaotext.text = @"";
    
}

#pragma mark - 协议点击
-(void)xieyiclick
{
    NSLog(@"点击了服务协议");
}

#pragma mark - 收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}


#pragma mark - 隐藏键盘
-(void)ycjianpan
{
    [_shoujihaotext resignFirstResponder];
    
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
