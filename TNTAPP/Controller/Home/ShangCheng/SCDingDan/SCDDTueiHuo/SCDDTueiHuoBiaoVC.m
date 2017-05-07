//
//  SCDDTueiHuoBiaoVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/9.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDDTueiHuoBiaoVC.h"

@interface SCDDTueiHuoBiaoVC ()
{
    UITextView * _shoumingtextv;
    
    UIView * _tkyuanyiview;
    
}

@end

@implementation SCDDTueiHuoBiaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];

    [self zdydhl];
    
    [self zdyUI];
    
    [self zdyyuanyi];
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
    
    NSArray * array1 = @[@"退货原因",@"退款金额",@"退款方式",@"退货说明"];
    NSArray * array2 = @[@"    请选择退货原因",@"    99.98",@"    按原路返回",@"    填写退货说明，退货处理更便捷"];
    

    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 100*i+64, APPwidth, 100)];
        [self.view addSubview:view];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 100, 20)];
        label1.text = array1[i];
        label1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        [label1 sizeToFit];
        [view addSubview:label1];
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+1, label1.frame.origin.y+label1.frame.size.height-12, 10, 15)];
        label2.text = @"*";
        label2.textColor = [UIColor redColor];
        [view addSubview:label2];

        
        if (i != 3) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(15, 50, APPwidth-30, 40)];
            btn.backgroundColor = [UIColor whiteColor];
            btn.layer.cornerRadius = 8;
            btn.layer.masksToBounds = YES;
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [[UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1.0] CGColor];
            [btn setTitle:array2[i] forState:0];
            [btn setTitleColor:[UIColor colorWithRed:134/255.0 green:134/255.0 blue:134/255.0 alpha:1.0] forState:0];
            btn.titleLabel.font =[UIFont systemFontOfSize:16];
            btn.contentHorizontalAlignment = 1;
            [view addSubview:btn];
            
            if (i == 0) {
                
                UIImage * img = [UIImage imageNamed:@"mall_xialajian"];
                UIImageView * imv2 = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width-img.size.width-10, 20-img.size.height/2, img.size.width, img.size.height)];
                imv2.image = img;
                [btn addSubview:imv2];
                
                [btn addTarget:self action:@selector(yuanyixuanzhe) forControlEvents:UIControlEventTouchUpInside];

                
            }
            if (i == 1 || i == 2) {
                
                [btn setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:0];
                
                
            }
        }
        else
        {
            CGRect fram = view.frame;
            fram.size.height = 220;
            view.frame = fram;
            
            
            UIView * kuanview = [[UIView alloc] initWithFrame:CGRectMake(15, 50, APPwidth-30, 80)];
            kuanview.backgroundColor = [UIColor whiteColor];
            kuanview.layer.cornerRadius = 8;
            kuanview.layer.masksToBounds = YES;
            kuanview.layer.borderWidth = 1;
            kuanview.layer.borderColor = [[UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1.0] CGColor];
            [view addSubview:kuanview];

            
            UIButton * sctpkuanbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 150, APPwidth-30, 60)];
            CAShapeLayer *borderLayer = [CAShapeLayer layer];
            borderLayer.bounds = CGRectMake(0, 0, sctpkuanbtn.frame.size.width, sctpkuanbtn.frame.size.height);
            borderLayer.position = CGPointMake(CGRectGetMidX(sctpkuanbtn.bounds), CGRectGetMidY(sctpkuanbtn.bounds));
            borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:5].CGPath;
            borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
            borderLayer.lineDashPattern = @[@5, @5];
            borderLayer.fillColor = [UIColor clearColor].CGColor;
            borderLayer.strokeColor = [UIColor blackColor].CGColor;
            [sctpkuanbtn.layer addSublayer:borderLayer];
            [view addSubview:sctpkuanbtn];

            UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
            imv.image = [UIImage imageNamed:@"mall_camera"];
            [sctpkuanbtn addSubview:imv];
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 60)];
            label.text = @"上传凭证，最多3张";
            label.textColor = [UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1.0];
            label.font = [UIFont systemFontOfSize:14];
            [sctpkuanbtn addSubview:label];
            [label sizeToFit];
            CGRect fram1 = label.frame;
            fram1.origin.x = sctpkuanbtn.frame.size.width-label.frame.size.width-10;
            fram1.origin.y = sctpkuanbtn.frame.size.height/2-label.frame.size.height/2;
            label.frame = fram1;

        }
        
        
    }
    
    
    UIButton * tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, APPheight-80, APPwidth-30, 60)];
    tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    tjbtn.layer.cornerRadius = 8;
    tjbtn.layer.masksToBounds = YES;
    [tjbtn setTitle:@"提交申请" forState:0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    tjbtn.titleLabel.font =[UIFont systemFontOfSize:16];
    tjbtn.contentHorizontalAlignment = 0;
    [self.view addSubview:tjbtn];
    
}

#pragma mark - 创建退款原因选择界面
-(void)zdyyuanyi
{
    _tkyuanyiview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _tkyuanyiview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    [self.view addSubview:_tkyuanyiview];
    _tkyuanyiview.hidden = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [_tkyuanyiview addGestureRecognizer:tap];
    
    UIView * diseview = [[UIView alloc] initWithFrame:CGRectMake(30, APPheight/2-210, APPwidth-60, 420)];
    diseview.backgroundColor = [UIColor whiteColor];
    diseview.layer.shadowColor = [UIColor blackColor].CGColor;    diseview.layer.shadowOffset = CGSizeMake(2,2);    diseview.layer.shadowOpacity = 0.3;
    diseview.layer.shadowRadius = 6;
    [_tkyuanyiview addSubview:diseview];
    
    NSArray * array = @[@"不想买了",@"拍错了/订单信息错误",@"商家未按约定时间发货",@"未收到货",@"和商家协商一致",@"收到的商品破损",@"其他"];
    for (int i = 0; i< array.count; i++) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 60*i, diseview.frame.size.width-70, 60)];
        label.text = array[i];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:18];
        [diseview addSubview:label];
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 60*i+60, diseview.frame.size.width, 1)];
        xian.backgroundColor = [UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:0.5];
        [diseview addSubview:xian];
        

        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(diseview.frame.size.width-50, 15+60*i, 30, 30)];
        [btn setImage:[UIImage imageNamed:@"mall_weixuanzhong"] forState:0];
        [btn setImage:[UIImage imageNamed:@"mall_xuanzhong"] forState:UIControlStateSelected];
        btn.tag = 5200+i;
        [btn addTarget:self action:@selector(yuanyixuanzhe:) forControlEvents:UIControlEventTouchUpInside];
        [diseview addSubview:btn];
    }
    
    
}

#pragma mark - 退款原因选择
-(void)yuanyixuanzhe:(UIButton *)btn
{
    for(int i = 5200;i< 5207;i++)
    {
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        btn1.selected = NO;
    }
    
    btn.selected = YES;
    
}

#pragma mark - 显示退款原因选择界面
-(void)yuanyixuanzhe
{
    _tkyuanyiview.hidden = NO;

}


#pragma mark - 点击隐藏原因选择界面
-(void)dealTap
{
    _tkyuanyiview.hidden = YES;
  
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
