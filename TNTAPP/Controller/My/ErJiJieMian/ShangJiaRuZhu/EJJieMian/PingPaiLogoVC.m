//
//  PingPaiLogoVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/24.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "PingPaiLogoVC.h"

@interface PingPaiLogoVC ()
{
    UIScrollView * _zhengscrollview;

}

@end

@implementation PingPaiLogoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
    
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
    
    
    UIButton *  tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 22, 60, 40)];
    [tjbtn setTitle:@"确认上传" forState:UIControlStateNormal];
    [tjbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    tjbtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [tjbtn addTarget:self action:@selector(tjclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:tjbtn];
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    [self.view addSubview:_zhengscrollview];
    


    //*************logo展示区****************
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 240)];
    view1.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:view1];
    
    if ([_biaoting isEqualToString:@"品牌Logo"]) {
        
        
        UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(40, 20, APPwidth-80, 200)];
        view2.backgroundColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0];
        [view1 addSubview:view2];
        
        UIImageView * logoimgv = [[UIImageView alloc] initWithFrame:CGRectMake(view2.frame.size.width/2-50, 40, 100, 100)];
        logoimgv.backgroundColor = [UIColor whiteColor];
        [view2 addSubview:logoimgv];
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        borderLayer.bounds = CGRectMake(0, 0, logoimgv.frame.size.width, logoimgv.frame.size.height);
        borderLayer.position = CGPointMake(CGRectGetMidX(logoimgv.bounds), CGRectGetMidY(logoimgv.bounds));
        borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:0].CGPath;
        borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
        borderLayer.lineDashPattern = @[@2, @2];
        borderLayer.fillColor = [UIColor clearColor].CGColor;
        borderLayer.strokeColor = [UIColor blackColor].CGColor;
        [logoimgv.layer addSublayer:borderLayer];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, logoimgv.frame.origin.y+logoimgv.frame.size.height+15, view2.frame.size.width, 20)];
        label.text = @"LOGO图片尽量居中";
        label.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        [view2 addSubview:label];
        
        

    }
    else if([_biaoting isEqualToString:@"经营许可证"]){
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(40, 20, APPwidth-80, 200)];
        imgv.backgroundColor = [UIColor orangeColor];
        [view1 addSubview:imgv];
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        borderLayer.bounds = CGRectMake(0, 0, imgv.frame.size.width, imgv.frame.size.height);
        borderLayer.position = CGPointMake(CGRectGetMidX(imgv.bounds), CGRectGetMidY(imgv.bounds));
        borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:0].CGPath;
        borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
        borderLayer.lineDashPattern = @[@2, @2];
        borderLayer.fillColor = [UIColor clearColor].CGColor;
        borderLayer.strokeColor = [UIColor blackColor].CGColor;
        [imgv.layer addSublayer:borderLayer];
        

        
    }
    
    //*************选择logo****************
    UIView * view4 = [[UIView alloc] initWithFrame:CGRectMake(0, view1.frame.origin.y+view1.frame.size.height+10, APPwidth, 120)];
    view4.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:view4];

    
    
    UIButton * xuanzhebtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 20, 80, 80)];
    [xuanzhebtn setImage:[UIImage imageNamed:@"renwu_tianjiazhaopian"] forState:0];
    [view4 addSubview:xuanzhebtn];
    
    _zhengscrollview.contentSize = CGSizeMake(0, view4.frame.origin.y+view4.frame.size.height+10);
    

    if ([_biaoting isEqualToString:@"营业执照"]) {
        
        UIImage * img = [UIImage imageNamed:@"ruzhu_zhizhao"];
    
        UIImageView * imgv2 =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth,APPwidth/img.size.width*img.size.height)];
        imgv2.image = img;
        [view1 addSubview:imgv2];

        CGRect fram = view1.frame;
        fram.size.height = APPwidth/img.size.width*img.size.height;
        view1.frame = fram;
        
        
        CGRect fram2 = view4.frame;
        fram2.origin.y = view1.frame.origin.y+view1.frame.size.height+10;
        view4.frame = fram2;
        
        
        
        UIView * view5 = [[UIView alloc] initWithFrame:CGRectMake(0, view4.frame.origin.y+view4.frame.size.height+10, APPwidth, 150)];
        view5.backgroundColor = [UIColor whiteColor];
        [_zhengscrollview addSubview:view5];
        
        _zhengscrollview.contentSize = CGSizeMake(0, view5.frame.origin.y+view5.frame.size.height+10);

        
        NSArray * array = @[@"长期有效",@"有效期",@"注册号"];
        NSArray * array2 = @[@" ",@"请输入有效期",@"请与营业执照上保持一致"];

        for (int i = 0; i < array.count; i++) {
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 50*i, 80, 50)];
            label.text = array[i];
            label.textColor = WenZiHeiColor;
            label.font = [UIFont systemFontOfSize:16];
            [view5 addSubview:label];
            
            if (i > 0) {
            
                UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 50*i, APPwidth-30, 1)];
                xian.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
                [view5 addSubview:xian];
                

                UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 50*i, view5.frame.size.width-label.frame.origin.x-label.frame.size.width-20, 50)];
                texf.placeholder = array2[i];
                texf.textColor = [UIColor whiteColor];
                texf.autocorrectionType = UITextAutocorrectionTypeNo;
                texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
                texf.font = [UIFont systemFontOfSize:15];
                texf.textAlignment = 2;
                [view5 addSubview:texf];
                
                [texf setValue:[UIFont fontWithName:@"Arial" size:15]   forKeyPath:@"_placeholderLabel.font"];//修改大小
                [texf setValue:WenZiQiangHueiColor forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
    
            }
            else{
                
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-60, 15, 40, 20)];
                [btn setImage:[UIImage imageNamed:@"renwu_guan"] forState:0];
                [btn setImage:[UIImage imageNamed:@"renwu_kai"] forState:UIControlStateSelected];
                [btn addTarget:self action:@selector(changqiyouxiao:) forControlEvents:UIControlEventTouchUpInside];
                [view5 addSubview:btn];
            }
            
        }
        
    }
    
}

#pragma mark - 长期有效
-(void)changqiyouxiao:(UIButton *)btn
{
    
    if (btn.selected == NO) {
    
        [UIView animateWithDuration:0.3 animations:^{
            
            btn.selected = YES;
            
        }];
        

    }
    else{
        
        [UIView animateWithDuration:0.3 animations:^{
            
            btn.selected = NO;
            
        }];

    }

    
}

#pragma mark - 提交
-(void)tjclick
{
    NSLog(@"提交");
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
