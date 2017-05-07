//
//  WJDLMMVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/2.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WJDLMMVC.h"

@interface WJDLMMVC ()<UITextFieldDelegate>

@end

@implementation WJDLMMVC

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
    
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    NSArray * array = @[@" ",@"请输入验证码",@"请输入6-18位新密码",@"请再次输入新密码"];
    
    for (int i = 0; i < array.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 74+60*i, APPwidth, 60)];
        view.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
        [self.view addSubview:view];
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 59, APPwidth-30, 1)];
        xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        [view addSubview:xian];
        
        if (i == 0) {
            
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, APPwidth-30, 60)];
            label.text = @"188*****1253";
            label.textColor = [UIColor whiteColor];
            label.textAlignment = 0;
            label.font = [UIFont systemFontOfSize:18];
            [view addSubview:label];
            
            
        }
        else{
            
            UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, view.frame.size.width-70, 60)];
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
            
            
            if (i != 1) {
                
                UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-35, 0, 20, 60)];
                [btn1 setImage:[UIImage imageNamed:@"denglu_guanyan"] forState:0];
                [view addSubview:btn1];
                
                UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-60, 0, 20, 60)];
                [btn2 setImage:[UIImage imageNamed:@"wode_quxiao"] forState:0];
                [view addSubview:btn2];

            }
            
        }
        
    }
    
    
    UIButton * _tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100+60*4,APPwidth-40, 50)];
    [_tjbtn setTitle:@"提 交" forState:0];
    [_tjbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    [_tjbtn addTarget:self action:@selector(tj) forControlEvents:UIControlEventTouchUpInside];
    _tjbtn.layer.cornerRadius = 10;
    _tjbtn.layer.masksToBounds = YES;
    _tjbtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    _tjbtn.layer.borderWidth= 1.0f;
    _tjbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_tjbtn];
    
   
    
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
