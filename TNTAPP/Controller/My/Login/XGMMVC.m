//
//  XGMMVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "XGMMVC.h"
#import "XGCGVC.h"

@interface XGMMVC ()<UITextFieldDelegate>
{
    UILabel * _biaoting;
    UIButton * _wcbtn;
    
    UIView * _mimakuanview;
}

@end

@implementation XGMMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self zdyUI];
    
}




#pragma mark - 自定义UI
-(void)zdyUI
{
    
    UIImageView *benjiimgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    benjiimgV.image = [UIImage imageNamed:@"denglu_beijing"];
    [self.view addSubview:benjiimgV];
    
    //标题
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    _biaoting.text = @"输入新密码";
    _biaoting.textColor = [UIColor whiteColor];
    _biaoting.textAlignment = NSTextAlignmentCenter;
    _biaoting.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_biaoting];
    
    //返回按钮
    UIButton * fanhueibtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 33, 20, 20)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fanhueibtn];
    
    
    _mimakuanview = [[UIView alloc] initWithFrame:CGRectMake(0, 160, APPwidth, 90)];
    [self.view addSubview:_mimakuanview];
    NSArray * tishi = @[@"请输入新密码",@"重新输入密码"];
    float x;
    if (APPwidth == 320) {
        
        x = 20;
    }
    else if (APPwidth == 375)
    {
        x = 20;
    }
    else
    {
        x = 50;
    }

    for (int i = 0; i < tishi.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(x, 40*i+30*i, APPwidth-x*2, 40)];
        [_mimakuanview addSubview:view];
        
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        imv.image = [UIImage imageNamed:@"dengli_mimashou"];
        [view addSubview:imv];
        
        
        UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(30, 5, view.frame.size.width-70, 20)];
        texf.placeholder = tishi[i];
        texf.textColor = [UIColor whiteColor];
        texf.autocorrectionType = UITextAutocorrectionTypeNo;
        texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        texf.tag = 6950+i;
        texf.delegate = self;
        [view addSubview:texf];
        
        [texf setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];//修改大小
        [texf setValue:[UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 29, view.frame.size.width, 1)];
        xian.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.5];
        [view addSubview:xian];
        
        if (i == 0 ) {
            
           
            
        }
        
    }
    
//    _shoujihaotextf = (UITextField *)[self.view viewWithTag:6950];
//    _mimatextf = (UITextField *)[self.view viewWithTag:6951];
//    _mimatextf.secureTextEntry = YES;
    
   
    
    _wcbtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 300,APPwidth-120, 40)];
    [_wcbtn setTitle:@"完 成" forState:0];
    [_wcbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    [_wcbtn addTarget:self action:@selector(wanche:) forControlEvents:UIControlEventTouchUpInside];
    _wcbtn.layer.cornerRadius = 20;
    _wcbtn.layer.masksToBounds = YES;
    _wcbtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0]CGColor];
    _wcbtn.layer.borderWidth= 1.0f;
    _wcbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_wcbtn];
    
    
    
//    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 20)];
//    label3.text = @"注册即代表您已阅读并同意优行宝";
//    label3.textColor = [UIColor whiteColor];
//    label3.textAlignment = NSTextAlignmentCenter;
//    label3.font = [UIFont systemFontOfSize:12];
//    [self.view addSubview:label3];
    
    
    
}


#pragma mark - 完成
-(void)wanche:(UIButton *)btn
{
    NSLog(@"完成");
    
    [_wcbtn setTitleColor:[UIColor whiteColor] forState:0];
    _wcbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];

    
    if ([btn.titleLabel.text isEqualToString:@"完 成"]) {
        
        _mimakuanview.hidden = YES;
        _biaoting.text = @"新密码";
        [_wcbtn setTitle:@"立即登录" forState:0];
        CGRect fram = _wcbtn.frame;
        fram.origin.y = 180;
        _wcbtn.frame = fram;
        [_wcbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
        _wcbtn.backgroundColor = [UIColor clearColor];
        

        //标题
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, APPwidth, 20)];
        label.text = @"恭喜！您已完成修改密码";
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:label];
        

    }
    else
    {
        NSArray * array =  self.navigationController.viewControllers;
        [self.navigationController popToViewController:array[1] animated:YES];
        
 
    }
    
#if 0
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat viewWidth = 200;
    CGFloat viewHeight = 200;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((screenSize.width - viewWidth)/2, (screenSize.height - viewHeight) / 2, viewWidth, viewHeight)];
//    view.layer.cornerRadius = CGRectGetWidth(view.bounds)/2;
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, viewWidth, viewHeight);
    borderLayer.position = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    
    // //    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:CGRectGetWidth(borderLayer.bounds)/2].CGPath;
    borderLayer.lineWidth = 2;//线的粗细
    //虚线边框
    borderLayer.lineDashPattern = @[@10, @20];//线宽 和 分隔
    //实线边框
    //    borderLayer.lineDashPattern = nil;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor yellowColor].CGColor;//线的颜色
    [view.layer addSublayer:borderLayer];
    
    [self.view addSubview:view];
#endif
}


#pragma mark - Return 收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
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
