//
//  YuETiXianVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YuETiXianVC.h"
#import "YHKXuanZheVC.h"

@interface YuETiXianVC ()<UITextFieldDelegate>
{
    UITextField * _txjietext;
    UIButton * _tjbtn;
}

@end

@implementation YuETiXianVC

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
    biaoting.text = @"余额提现";
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
   
    
    
    //**************提现金额*******************
    UIView * txjeview = [[UIView alloc] initWithFrame:CGRectMake(0, yhkbtn.frame.origin.y+yhkbtn.frame.size.height+10, APPwidth, 150)];
    txjeview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:txjeview];

    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 120, 20)];
    label3.text = @"提现金额";
    label3.textColor = [UIColor whiteColor];
    label3.font = [UIFont systemFontOfSize:18];
    [txjeview addSubview:label3];
    
    UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(15, 50, 40, 30)];
    label4.text = @"￥";
    label4.textColor = [UIColor whiteColor];
    label4.font = [UIFont systemFontOfSize:35];
    [txjeview addSubview:label4];
    
    
    _txjietext = [[UITextField alloc] initWithFrame:CGRectMake(label4.frame.origin.x+label4.frame.size.width, label4.frame.origin.y, APPwidth-100, 40)];
    _txjietext.placeholder = @"请输入提现金额";
    _txjietext.textColor = [UIColor whiteColor];
    _txjietext.autocorrectionType = UITextAutocorrectionTypeNo;
    _txjietext.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _txjietext.delegate = self;
    _txjietext.font = [UIFont systemFontOfSize:45];
    [txjeview addSubview:_txjietext];
    
    [_txjietext setValue:[UIFont fontWithName:@"Arial" size:20]   forKeyPath:@"_placeholderLabel.font"];//修改大小
    [_txjietext setValue:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
    [_txjietext setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_txjietext setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];

    _txjietext.textAlignment = 0;
    _txjietext.keyboardType = UIKeyboardTypeNumberPad;

    
    
    UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(15, _txjietext.frame.origin.y+_txjietext.frame.size.height+30, APPwidth/2, 20)];
    label5.text = @"可提现余额2000元";
    label5.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    label5.font = [UIFont systemFontOfSize:14];
    [txjeview addSubview:label5];
    
    
    
    UIButton * quanbubtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-70, _txjietext.frame.origin.y+_txjietext.frame.size.height+20,60, 40)];
    [quanbubtn setTitle:@"全部提现" forState:0];
    [quanbubtn setTitleColor:[UIColor colorWithRed:143/255.0 green:187/255.0 blue:224/255.0 alpha:1.0] forState:0];
    [quanbubtn addTarget:self action:@selector(quanbuClick) forControlEvents:UIControlEventTouchUpInside];
    quanbubtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [txjeview addSubview:quanbubtn];
    

    //**************提交*******************
    _tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, txjeview.frame.origin.y+txjeview.frame.size.height+40,APPwidth-40, 50)];
    [_tjbtn setTitle:@"提现" forState:0];
    [_tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    [_tjbtn addTarget:self action:@selector(txClick) forControlEvents:UIControlEventTouchUpInside];
    _tjbtn.layer.cornerRadius = 5;
    _tjbtn.layer.masksToBounds = YES;
    _tjbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _tjbtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    [self.view addSubview:_tjbtn];
    _tjbtn.userInteractionEnabled = NO;

    
}


#pragma mark - 银行卡选择
-(void)yhkbtnclick
{
    YHKXuanZheVC * yhk = [[YHKXuanZheVC alloc] init];
    [self.navigationController pushViewController:yhk animated:YES];
}

#pragma mark - 提现
-(void)txClick
{
    NSLog(@"可提现");
}


#pragma mark - 全部提现
-(void)quanbuClick
{
    _txjietext.text = @"2000.00";
    
    _tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    _tjbtn.userInteractionEnabled = YES;

}

#pragma mark - 收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}

#pragma mark - 结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if(textField.text.length > 0)
    {
        _tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        _tjbtn.userInteractionEnabled = YES;

    }
    else
    {
        _tjbtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _tjbtn.userInteractionEnabled = NO;

    }

}

#pragma mark - 输入中
-(BOOL)textField:(UITextField *)field shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
   
    NSLog(@"%lu",_txjietext.text.length);
//    NSLog(@"%@",_txjietext.text);

    if (_txjietext.text.length-1 > 0) {
        
        _tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        _tjbtn.userInteractionEnabled = YES;

//        if (_txjietext.text.length == 0) {
//            _tjbtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
//            _tjbtn.userInteractionEnabled = NO;
//
//        }
        
    }
    else
    {
        _tjbtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _tjbtn.userInteractionEnabled = NO;
    }

    return YES;
    
}

#pragma mark - 隐藏键盘
-(void)ycjianpan
{
    [_txjietext resignFirstResponder];

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
