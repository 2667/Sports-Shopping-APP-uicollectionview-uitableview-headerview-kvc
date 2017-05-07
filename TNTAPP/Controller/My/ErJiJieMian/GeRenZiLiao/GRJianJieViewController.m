//
//  GRJianJieViewController.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/6.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "GRJianJieViewController.h"

@interface GRJianJieViewController ()<UITextViewDelegate>
{
    UITextView * _textv;
    UILabel * _tslabel;
    UILabel *  _zishulabel;

}

@end

@implementation GRJianJieViewController

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
    biaoting.text = _biaoting;
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    UIButton * bcbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 26, 40, 30)];
    [bcbtn setTitle:@"保存" forState:0];
    bcbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [bcbtn addTarget:self action:@selector(baochuen) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:bcbtn];
    

}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    //************输入框***************
    _textv = [[UITextView alloc] initWithFrame:CGRectMake(15, 80, APPwidth-30, 200)];
    _textv.delegate = self;
    _textv.font = [UIFont systemFontOfSize:18];
//    _textv.layer.borderWidth = 1;
//    _textv.layer.borderColor = [[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:0.5] CGColor];
    _textv.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:_textv];
    
    
    _tslabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, APPwidth-50, 15)];
    _tslabel.text = [NSString stringWithFormat:@"请输入%@",_biaoting];
    _tslabel.textColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
    _tslabel.font = [UIFont systemFontOfSize:15];
    [_textv addSubview:_tslabel];
    
    
    
   _zishulabel = [[UILabel alloc] initWithFrame:CGRectMake(_textv.frame.size.width-70, _textv.frame.size.height-25, 50, 15)];
    _zishulabel.text = @"0/100";
    _zishulabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    _zishulabel.font = [UIFont systemFontOfSize:15];
    _zishulabel.textAlignment = 2;
    [_textv addSubview:_zishulabel];

    
}

#pragma mark - 保存
-(void)baochuen
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
