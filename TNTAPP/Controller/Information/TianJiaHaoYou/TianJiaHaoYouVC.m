//
//  TianJiaHaoYouVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TianJiaHaoYouVC.h"
#import "TianJiaHaoYouZhiLiaoVC.h"

@interface TianJiaHaoYouVC ()<UITextFieldDelegate>
{
    UITextField * _text;
}

@end

@implementation TianJiaHaoYouVC

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
    biaotinglabel.text = @"添加好友";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 80, APPwidth,40)];
    view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:view];
    
    
    UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
    img.image = [UIImage imageNamed:@"xiaoxi_tianjia"];
    [view addSubview:img];
    

    _text = [[UITextField alloc] initWithFrame:CGRectMake(50, 0, view.frame.size.width-60, 40)];
    _text.placeholder = @"请输入好友账号";
    _text.textColor = [UIColor blackColor];
    _text.font = [UIFont systemFontOfSize:16];
    _text.autocorrectionType = UITextAutocorrectionTypeNo;
    _text.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _text.delegate = self;
    _text.returnKeyType =UIReturnKeySearch;
    [view addSubview:_text];
    

    

}


#pragma mark - 点击搜索
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
    
    TianJiaHaoYouZhiLiaoVC * hyzl = [[TianJiaHaoYouZhiLiaoVC alloc] init];
    [self.navigationController pushViewController:hyzl animated:YES];
    
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
