//
//  RenZhengVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/2.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RenZhengVC.h"

@interface RenZhengVC ()<UITextFieldDelegate>

@end

@implementation RenZhengVC

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
    biaoting.text = @"实名认证";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, APPwidth-20, 40)];
    label1.text = @"认证关系到服务推荐及提现，请务必填写本人真实信息";
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = 0;
    label1.font = [UIFont systemFontOfSize:16];
    label1.numberOfLines = 2;
    [self.view addSubview:label1];
    

    NSArray * array = @[@"请输入真实姓名，认证通过后不可修改",@"请输入18位身份证号"];
    NSArray * array2 = @[@"手持身份证照",@"身份证背面照"];

    for (int i = 0; i < array.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, label1.frame.origin.y+label1.frame.size.height+20+60*i, APPwidth, 60)];
        view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
        [self.view addSubview:view];
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 59, APPwidth-30, 1)];
        xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        [view addSubview:xian];
        
        
        UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, view.frame.size.width-30, 60)];
        texf.placeholder = array[i];
        texf.textColor = [UIColor whiteColor];
        texf.autocorrectionType = UITextAutocorrectionTypeNo;
        texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        texf.tag = 6950+i;
        texf.delegate = self;
        texf.font = [UIFont systemFontOfSize:18];
        [view addSubview:texf];
        [texf setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];
        [texf setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
        
        //上传身份证
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(20+(APPwidth-60)/2*i+20*i, label1.frame.origin.y+label1.frame.size.height+160, (APPwidth-60)/2, (APPwidth-60)/2)];
        imgv.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:imgv];
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0,imgv.frame.size.height-30, imgv.frame.size.width, 30)];
        label2.text = array2[i];
        label2.textColor = [UIColor whiteColor];
        label2.textAlignment = 1;
        label2.font = [UIFont systemFontOfSize:16];
        label2.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3];
        [imgv addSubview:label2];

        
        UIButton * sctpbtn = [[UIButton alloc] initWithFrame:CGRectMake(imgv.frame.origin.x, imgv.frame.size.height+imgv.frame.origin.y+15,imgv.frame.size.width, 50)];
        [sctpbtn setTitle:@"上传图片" forState:0];
        [sctpbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
        [sctpbtn addTarget:self action:@selector(sctp:) forControlEvents:UIControlEventTouchUpInside];
        sctpbtn.layer.cornerRadius = 5;
        sctpbtn.layer.masksToBounds = YES;
        sctpbtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
        sctpbtn.layer.borderWidth= 1.0f;
        sctpbtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.view addSubview:sctpbtn];
        

        
    }
    

    
    UIButton * _tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 160+((APPwidth-60)/2)+210,APPwidth-40, 50)];
    [_tjbtn setTitle:@"提 交" forState:0];
    [_tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    [_tjbtn addTarget:self action:@selector(sctp:) forControlEvents:UIControlEventTouchUpInside];
    _tjbtn.layer.cornerRadius = 5;
    _tjbtn.layer.masksToBounds = YES;
    _tjbtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    _tjbtn.layer.borderWidth= 1.0f;
    _tjbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    _tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [self.view addSubview:_tjbtn];
    

    
    
}

#pragma mark - 上传图片
-(void)sctp:(UIButton *)btn
{
    NSLog(@"上传图片");
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
