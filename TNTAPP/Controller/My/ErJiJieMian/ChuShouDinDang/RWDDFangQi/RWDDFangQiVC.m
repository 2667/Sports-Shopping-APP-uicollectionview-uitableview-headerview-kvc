//
//  RWDDFangQiVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/14.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWDDFangQiVC.h"

@interface RWDDFangQiVC ()<UITextViewDelegate>
{
    UITextView * _yuanyitextv;
    UILabel * _tslabel;
    UILabel * _zishulabel;


}

@end

@implementation RWDDFangQiVC

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
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 63, APPwidth, 1)];
    xian.image =[UIImage imageNamed:@"shouye-fengexian"];
    [daohan addSubview:xian];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 26, 30, 30)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    biaoting.text = @"取消原因";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
  
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, APPwidth, 30)];
    label1.text = @"您正在申请取消订单 请告诉Ta原因";
    label1.textAlignment = 1;
    label1.textColor = [UIColor colorWithRed:37/255.0 green:37/255.0 blue:37/255.0 alpha:1.0];
    label1.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, APPwidth, 20)];
    label2.text = @"合理的取消理由更能打动Ta";
    label2.textAlignment = 1;
    label2.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    label2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label2];
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, label2.frame.size.height+label2.frame.origin.y+30, APPwidth, 1)];
    xian.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:0.5];
    [self.view addSubview:xian];
    
    
    NSArray * array = @[@"已协商一致后提出申请",@"距离太远,无法按时到达",@"临时有事无法执行任务",@"联系不上对方",@"其他"];
    for (int i = 0; i< array.count; i++) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(30, 60*i+xian.frame.size.height+xian.frame.origin.y, APPwidth-90, 60)];
        label.text = array[i];
        label.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:label];
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(20, label.frame.size.height+label.frame.origin.y, APPwidth-40, 1)];
        xian.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:0.5];
        [self.view addSubview:xian];
        
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth-60, label.frame.origin.y+15, 30, 30)];
        [btn setImage:[UIImage imageNamed:@"mall_weixuanzhong"] forState:0];
        [btn setImage:[UIImage imageNamed:@"mall_xuanzhong"] forState:UIControlStateSelected];
        btn.tag = 5300+i;
        [btn addTarget:self action:@selector(yuanyixuanzhe:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        if (btn.tag == 5300) {
            
            btn.selected = YES;
        }
    }

    //*****************原因输入框********************
    _yuanyitextv = [[UITextView alloc] initWithFrame:CGRectMake(20, xian.frame.origin.y+xian.frame.size.height+60*array.count, APPwidth-40, 120)];
    _yuanyitextv.delegate = self;
    _yuanyitextv.font = [UIFont systemFontOfSize:18];
    _yuanyitextv.layer.borderWidth = 1;
    _yuanyitextv.layer.borderColor = [[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:0.5] CGColor];
    _yuanyitextv.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0];
    [self.view addSubview:_yuanyitextv];
    _yuanyitextv.hidden = YES;
    
    
    _tslabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, APPwidth, 15)];
    _tslabel.text = @"我想说的";
    _tslabel.textColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
    _tslabel.font = [UIFont systemFontOfSize:15];
    [_yuanyitextv addSubview:_tslabel];
    
    
    
    _zishulabel = [[UILabel alloc] initWithFrame:CGRectMake(_yuanyitextv.frame.size.width-70, _yuanyitextv.frame.size.height-25, 50, 15)];
    _zishulabel.text = @"0/20";
    _zishulabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    _zishulabel.font = [UIFont systemFontOfSize:15];
    _zishulabel.textAlignment = 2;
    [_yuanyitextv addSubview:_zishulabel];
    

    
    //*****************提交按钮********************
    UIView * diseview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 60)];
    diseview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:diseview];
    
    
    UIButton * tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-80, 10,160, 40)];
    [tjbtn setTitle:@"提交" forState:0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    [tjbtn addTarget:self action:@selector(tjClick) forControlEvents:UIControlEventTouchUpInside];
    tjbtn.layer.cornerRadius = 5;
    tjbtn.layer.masksToBounds = YES;
    tjbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [diseview addSubview:tjbtn];

}

#pragma mark - 原因选择
-(void)yuanyixuanzhe:(UIButton *)btn
{
    for(int i = 5300;i< 5305;i++)
    {
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        btn1.selected = NO;
    }
    
    btn.selected = YES;
    
    if (btn.tag == 5304) {
        
        _yuanyitextv.hidden = NO;
    }
    else
    {
        _yuanyitextv.hidden = YES;

    }
}




#pragma mark - 提交
-(void)tjClick
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
