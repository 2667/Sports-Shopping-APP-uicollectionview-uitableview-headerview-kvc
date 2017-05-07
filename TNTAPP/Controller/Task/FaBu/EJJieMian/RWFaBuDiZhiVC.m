//
//  RWFaBuDiZhiVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/17.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWFaBuDiZhiVC.h"

@interface RWFaBuDiZhiVC ()<HZAreaPickerDelegate>
{

    UITextField * _dizhitext;
    
    
    //城市选择器
    HZAreaPickerView * _cityPicker;
    NSString * _citystr;
    

}

@end

@implementation RWFaBuDiZhiVC

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
    biaoting.text = @"位置";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont fontWithName:@"Alba Matter" size:18];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{

#if 0
    //*************输入地址***************
    UIView * shurudiziview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 65)];
    shurudiziview.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:shurudiziview];
    
    
    _dizhitext = [[UITextField alloc] initWithFrame:CGRectMake(15, 15, APPwidth-30, 35)];
    _dizhitext.placeholder = @"输入地址";
    [_dizhitext setValue:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    _dizhitext.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    _dizhitext.font = [UIFont systemFontOfSize:16];
    _dizhitext.backgroundColor = [UIColor colorWithRed:75/255.0 green:75/255.0 blue:75/255.0 alpha:1.0];
    _dizhitext.textAlignment = 1;
    _dizhitext.layer.cornerRadius = 17.5;
    _dizhitext.layer.masksToBounds = YES;
    [shurudiziview addSubview:_dizhitext];
    
#endif
    //*************当前位置***************
    UIView * danqiandiziview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 80)];
    danqiandiziview.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:danqiandiziview];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 40)];
    label.text = @"   当前位置";
    label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:15];
    label.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [danqiandiziview addSubview:label];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, APPwidth-25, 40)];
    label1.text = @"南沙区南沙街道双山大道中大城4栋809";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    [danqiandiziview addSubview:label1];
    
    //*************选择地址***************
    UIView * xuanzhediziview = [[UIView alloc] initWithFrame:CGRectMake(0, danqiandiziview.frame.origin.y+danqiandiziview.frame.size.height, APPwidth, 250)];
    xuanzhediziview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:xuanzhediziview];
    
    
    UIButton * qxbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, 50, 40)];
    [qxbtn setTitle:@"取消" forState:0];
    [qxbtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
    qxbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [qxbtn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
    [xuanzhediziview addSubview:qxbtn];
    
    
    UIButton * qdbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 0, 50, 40)];
    [qdbtn setTitle:@"确定" forState:0];
    [qdbtn setTitleColor:[UIColor colorWithRed:196/255.0 green:148/255.0 blue:61/255.0 alpha:1.0] forState:0];
    qdbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [qdbtn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
    [xuanzhediziview addSubview:qdbtn];
    

    UIView * diziview = [[UIView alloc] initWithFrame:CGRectMake(0, 40, APPwidth, 200)];
    diziview.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [xuanzhediziview addSubview:diziview];
    
    
    
    [self cancelLocatePicker];
    _cityPicker = [[[HZAreaPickerView alloc] initWithStyle:HZAreaPickerWithStateAndCityAndDistrict delegate:self] init];
    [_cityPicker showInView:diziview];
    CGRect fram2 = _cityPicker.frame;
    fram2.origin.y = 0;
    _cityPicker.frame = fram2;
    _cityPicker.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    


}


#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"取消"]) {
        
        [self.navigationController popViewControllerAnimated:YES];

    }
    else{
        
        [self.navigationController popViewControllerAnimated:YES];

    }
}

#pragma mark - 城市选择器里的方法
-(void)cancelLocatePicker
{
    [_cityPicker cancelPicker];
    _cityPicker.delegate = nil;
    _cityPicker = nil;
}


#pragma mark - HZAreaPicker delegate 城市选择器代理方法
-(void)pickerDidChaneStatus:(HZAreaPickerView *)picker
{
    
    
    _citystr = [NSString stringWithFormat:@"%@-%@-%@",picker.locate.state,picker.locate.city,picker.locate.district];
    
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
