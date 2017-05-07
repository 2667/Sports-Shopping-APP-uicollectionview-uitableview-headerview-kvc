//
//  YuEChongZhiVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YuEChongZhiVC.h"
#import "YHKXuanZheVC.h"
#import "YuEChongZhiEVC.h"

@interface YuEChongZhiVC ()<UITextFieldDelegate>
{
    UITextField * _chongzhijietext;
    
    UIButton * _xiayibubtn;

    
}

@end

@implementation YuEChongZhiVC

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
    biaoting.text = @"账户充值";
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
    
    
    //**************银行卡*******************
    UIButton * yhkbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 74, APPwidth, 100)];
    yhkbtn.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [yhkbtn addTarget:self action:@selector(yhkbtnclick) forControlEvents:1<<6];
    [self.view addSubview:yhkbtn];
    
    
    
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    imgv.backgroundColor = [UIColor whiteColor];
    imgv.layer.cornerRadius = 30;
    imgv.layer.masksToBounds = YES;
    [yhkbtn addSubview:imgv];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 25, 120, 20)];
    label1.text = @"中国工商银行";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    [yhkbtn addSubview:label1];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, 120, 20)];
    label2.text = @"尾号3223储蓄卡";
    label2.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    label2.font = [UIFont systemFontOfSize:15];
    [yhkbtn addSubview:label2];
    
    UIImageView * imgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(yhkbtn.frame.size.width-30, 41, 18, 18)];
    imgv2.image = [UIImage imageNamed:@"wode_dizhi_you"];
    [yhkbtn addSubview:imgv2];
    
    
    //**************输入金额*******************

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, yhkbtn.frame.origin.y+yhkbtn.frame.size.height+10, APPwidth, 60)];
    view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:view];
    
    
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 60)];
    label3.text = @"金额";
    label3.textColor = [UIColor whiteColor];
    label3.textAlignment = 0;
    label3.font = [UIFont systemFontOfSize:18];
    [view addSubview:label3];
    
    
    _chongzhijietext = [[UITextField alloc] initWithFrame:CGRectMake(label3.frame.origin.x+label3.frame.size.width+10, 0, view.frame.size.width-145, 60)];
    _chongzhijietext.placeholder = @"请输入充值金额";
    _chongzhijietext.textColor = [UIColor whiteColor];
    _chongzhijietext.autocorrectionType = UITextAutocorrectionTypeNo;
    _chongzhijietext.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _chongzhijietext.delegate = self;
    _chongzhijietext.font = [UIFont systemFontOfSize:16];
    [view addSubview:_chongzhijietext];
    [_chongzhijietext setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];//修改大小
    [_chongzhijietext setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
    _chongzhijietext.textAlignment = 0;
    _chongzhijietext.keyboardType = UIKeyboardTypeNumberPad;
    
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 10, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"wode_yue_quxiao"] forState:0];
    [btn addTarget:self action:@selector(shanchuclick) forControlEvents:1<<6];
    [view addSubview:btn];
    

    
    //**************提交*******************
    _xiayibubtn = [[UIButton alloc] initWithFrame:CGRectMake(20, view.frame.origin.y+view.frame.size.height+40, APPwidth-40, 50)];
    [_xiayibubtn setTitle:@"下一步" forState:0];
    [_xiayibubtn setTitleColor:[UIColor whiteColor] forState:0];
    [_xiayibubtn addTarget:self action:@selector(xiayibuClick) forControlEvents:UIControlEventTouchUpInside];
    _xiayibubtn.layer.cornerRadius = 5;
    _xiayibubtn.layer.masksToBounds = YES;
    _xiayibubtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _xiayibubtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    [self.view addSubview:_xiayibubtn];
    
}


#pragma mark - 下一步
-(void)xiayibuClick
{
    
    YuEChongZhiEVC * cze = [[YuEChongZhiEVC alloc] init];
    [self.navigationController pushViewController:cze animated:YES];
    

}

#pragma mark - 银行卡选择
-(void)yhkbtnclick
{
    YHKXuanZheVC * yhk = [[YHKXuanZheVC alloc] init];
    [self.navigationController pushViewController:yhk animated:YES];
}



#pragma mark - 清空金额输入框
-(void)shanchuclick
{
    _chongzhijietext.text = @"";
}



#pragma mark - 收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}


#pragma mark - 隐藏键盘
-(void)ycjianpan
{
    [_chongzhijietext resignFirstResponder];
    
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
