//
//  YingHangKaEVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YingHangKaEVC.h"

@interface YingHangKaEVC ()
{
    UIView * _shanchuview;
    BOOL _shanchubool;
}

@end

@implementation YingHangKaEVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];

    _shanchubool = YES;
    
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
    biaoting.text = @"银行服务";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    UIButton * genduobtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 26, 30, 30)];
    [genduobtn setImage:[UIImage imageNamed:@"wode_fuwu_qita"] forState:UIControlStateNormal];
    [genduobtn addTarget:self action:@selector(genduobtn) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:genduobtn];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
        
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 74, APPwidth-10, 120)];
    btn.backgroundColor = [UIColor colorWithRed:206/255.0 green:75/255.0 blue:89/255.0 alpha:1.0];
    btn.layer.cornerRadius = 8;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
    
    
    
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    imgv.backgroundColor = [UIColor whiteColor];
    imgv.layer.cornerRadius = 30;
    imgv.layer.masksToBounds = YES;
    [btn addSubview:imgv];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 25, btn.frame.size.width-100, 20)];
    label1.text = @"中国工商银行";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    [btn addSubview:label1];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, btn.frame.size.width-100, 20)];
    label2.text = @"储蓄卡";
    label2.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    label2.font = [UIFont systemFontOfSize:15];
    [btn addSubview:label2];
    
    
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, btn.frame.size.width-10, 30)];
    label3.text = @"**** **** **** 3223";
    label3.textColor = [UIColor whiteColor];
    label3.font = [UIFont systemFontOfSize:24];
    label3.textAlignment = 2;
    [btn addSubview:label3];
    
    //*******************删除********************
    _shanchuview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, 120)];
    _shanchuview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_shanchuview];
    
    NSArray * array = @[@"删除",@"取消"];
    for (int i = 0; i < array.count; i ++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 60*i, APPwidth, 60)];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.contentHorizontalAlignment = 0;
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        [_shanchuview addSubview:btn];
        

        if (i == 0) {
            
            [btn setTitleColor:[UIColor redColor] forState:0];

            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 59, APPwidth, 1)];
            xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
            [_shanchuview addSubview:xian];
        }
    }
    
}

#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    NSLog(@"%@",btn.titleLabel.text);
    
    if ([btn.titleLabel.text isEqualToString:@"取消"]) {
       
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram = _shanchuview.frame;
            fram.origin.y = APPheight;
            _shanchuview.frame = fram;
            
        }];
        
        _shanchubool = YES;
        
    }
}


#pragma mark - 更多
-(void)genduobtn
{
    if (_shanchubool == YES) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram = _shanchuview.frame;
            fram.origin.y = APPheight-120;
            _shanchuview.frame = fram;
            
        }];
        
        _shanchubool = NO;
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram = _shanchuview.frame;
            fram.origin.y = APPheight;
            _shanchuview.frame = fram;
            
        }];
        
        _shanchubool = YES;
    }
    
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
