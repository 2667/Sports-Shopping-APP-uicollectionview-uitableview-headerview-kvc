//
//  BeiZhuVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "BeiZhuVC.h"

@interface BeiZhuVC ()<UITextFieldDelegate>
{
    UITextField * _text;
}

@end

@implementation BeiZhuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self zdydhl];
    
    [self zdyUI];
    
    
    
}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = @"修改备注";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
    UIButton * wcbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 26, 40, 30)];
    [wcbtn setTitle:@"完成" forState:0];
    wcbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [wcbtn addTarget:self action:@selector(wcclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:wcbtn];
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(20, 90, APPwidth-30, 20)];
    label.text = @"备注名";
    label.font =[UIFont systemFontOfSize:16];
    label.textAlignment = 0;
    label.textColor = WenZiShenHueiColor;
    [self.view addSubview:label];
    
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, label.frame.origin.y+label.frame.size.height+5, APPwidth, 40)];
    view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:view];
    

    
    _text = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, view.frame.size.width-30, 40)];
    _text.placeholder = @"请输入备注";
    _text.textColor = [UIColor blackColor];
    _text.font = [UIFont systemFontOfSize:16];
    _text.autocorrectionType = UITextAutocorrectionTypeNo;
    _text.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _text.delegate = self;
    _text.returnKeyType =UIReturnKeyDone;
    [view addSubview:_text];
    _text.text = @"爱笑的云";
    


    
}




#pragma mark - 完成
-(void)wcclick
{
    
    
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
