//
//  ShangJiaRuZhuBiao.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/24.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "ShangJiaRuZhuBiao.h"
#import "JiNengLeiXingVC.h"
#import "RWFaBuDiZhiVC.h"
#import "SJYingYeShiJianVC.h"
#import "PingPaiLogoVC.h"

@interface ShangJiaRuZhuBiao ()
{
    UIScrollView * _zhengscrollview;

}

@end

@implementation ShangJiaRuZhuBiao

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    
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
    biaoting.text = @"入驻";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    
    //***************账号信息***************************
    UIView * zhanghuview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 80)];
    zhanghuview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:zhanghuview];
   
    
    UILabel * yhminglabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, APPwidth-30, 50)];
    yhminglabel.textColor = [UIColor whiteColor];
    yhminglabel.font = [UIFont systemFontOfSize:16];
    [zhanghuview addSubview:yhminglabel];
    NSMutableAttributedString * yhmingstr = [[NSMutableAttributedString alloc] initWithString:@"哆啦A梦(158****1488)"];
    [yhmingstr addAttribute:NSForegroundColorAttributeName value:WenZiShenHueiColor range:NSMakeRange(4,13)];
    yhminglabel.attributedText = yhmingstr;
    
    
    UIButton * smrzbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 50, 100, 20)];
    [smrzbtn setTitle:@"实名认证" forState:0];
    [smrzbtn setTitleColor:WenZiQiangHueiColor forState:0];
    smrzbtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [smrzbtn setImage:[UIImage imageNamed:@"ruzhu_renzheng"] forState:0];
    smrzbtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [zhanghuview addSubview:smrzbtn];
    
 
    //***************门店名称***************************
    UIView * mendiannameview = [[UIView alloc] initWithFrame:CGRectMake(0, zhanghuview.frame.origin.y+zhanghuview.frame.size.height+10, APPwidth, 100)];
    mendiannameview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:mendiannameview];
    NSArray * mdmcarray = @[@"门店名称",@" "];
    NSArray * mdmcarray2 = @[@"例：麦当劳",@"金洲店"];
    
    for (int i = 0; i < mdmcarray.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 50*i, APPwidth, 50)];
        [mendiannameview addSubview:view];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 50)];
        label.text = mdmcarray[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [view addSubview:label];
       
        UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, view.frame.size.width-label.frame.origin.x-label.frame.size.width-20, 50)];
        texf.placeholder = mdmcarray2[i];
        texf.textColor = [UIColor whiteColor];
        texf.autocorrectionType = UITextAutocorrectionTypeNo;
        texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        texf.font = [UIFont systemFontOfSize:15];
        [view addSubview:texf];
        
        [texf setValue:[UIFont fontWithName:@"Arial" size:15]   forKeyPath:@"_placeholderLabel.font"];//修改大小
        [texf setValue:WenZiShenHueiColor forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
            
 
        if (i == 0) {
           
            UIImageView * xian =[[UIImageView alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 49, view.frame.size.width-label.frame.origin.x-label.frame.size.width-20,1)];
            xian.image = [UIImage imageNamed:@"shouye-fengexian"];
            [view addSubview:xian];
        }
    }
    
    
    //***************门店地址  门店电话***************************
    UIView * mendiandianhuaiview = [[UIView alloc] initWithFrame:CGRectMake(0, mendiannameview.frame.origin.y+mendiannameview.frame.size.height+10, APPwidth, 150)];
    mendiandianhuaiview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:mendiandianhuaiview];
   
    NSArray * mddharray = @[@"门店地址",@" ",@"门店电话"];
    NSArray * mddharray2 = @[@" ",@"请填写详细地址",@"例：020-8888888,18788888888"];

    for (int i = 0; i < mddharray.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 50*i, APPwidth, 50)];
        [mendiandianhuaiview addSubview:view];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 50)];
        label.text = mddharray[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [view addSubview:label];
        
        if (i == 0) {
            
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, APPwidth-label.frame.origin.x-label.frame.size.width-20, 50)];
            label2.text = @"省-市-区";
            label2.textColor = [UIColor whiteColor];
            label2.font = [UIFont systemFontOfSize:15];
            label2.textAlignment = 0;
            [view addSubview:label2];
            
            
            UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-25, 17.5, 15,15)];
            imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
            [view addSubview:imgv];
            
            
            UIImageView * xian =[[UIImageView alloc] initWithFrame:CGRectMake(0, 49, label2.frame.size.width,1)];
            xian.image = [UIImage imageNamed:@"shouye-fengexian"];
            [label2 addSubview:xian];
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, APPwidth-label.frame.origin.x-label.frame.size.width-20, 50)];
            [btn setTitle:@"门店地址" forState:0];
            [btn setTitleColor:[UIColor clearColor] forState:0];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:1<<6];
            [view addSubview:btn];

            
            UIImageView * xian2 =[[UIImageView alloc] initWithFrame:CGRectMake(10, 99, APPwidth-20,1)];
            xian2.image = [UIImage imageNamed:@"shouye-fengexian"];
            [view addSubview:xian2];

        }
       
        else
        {
            UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, view.frame.size.width-label.frame.origin.x-label.frame.size.width-20, 50)];
            texf.placeholder = mddharray2[i];
            texf.textColor = [UIColor whiteColor];
            texf.autocorrectionType = UITextAutocorrectionTypeNo;
            texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
            texf.font = [UIFont systemFontOfSize:15];
            [view addSubview:texf];
            
            [texf setValue:[UIFont fontWithName:@"Arial" size:15]   forKeyPath:@"_placeholderLabel.font"];//修改大小
            [texf setValue:WenZiShenHueiColor forKeyPath:@"_placeholderLabel.textColor"];//修改颜色


            
        }
        
        
        
    }

    
    //***************营业时间***************************
    UIView * yiyeshijianview = [[UIView alloc] initWithFrame:CGRectMake(0, mendiandianhuaiview.frame.origin.y+mendiandianhuaiview.frame.size.height+10, APPwidth, 50)];
    yiyeshijianview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:yiyeshijianview];
    NSArray * yysjarray = @[@"营业时间"];
    for (int i = 0; i < yysjarray.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50*i, APPwidth, 50)];
        [btn setTitle:yysjarray[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:1<<6];
        [yiyeshijianview addSubview:btn];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 50)];
        label.text = yysjarray[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label];
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, APPwidth-label.frame.origin.x-label.frame.size.width-35, 50)];
        label2.text = @"请选择";
        label2.textColor = WenZiShenHueiColor;
        label2.font = [UIFont systemFontOfSize:15];
        label2.textAlignment = 2;
        [btn addSubview:label2];
        
        
        UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-25, 17.5, 15,15)];
        imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
        [btn addSubview:imgv];
        
        
    }
    

    
    //***************经营品类 logo***************************
    UIView * logoview = [[UIView alloc] initWithFrame:CGRectMake(0, yiyeshijianview.frame.origin.y+yiyeshijianview.frame.size.height+10, APPwidth, 100)];
    logoview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:logoview];

    NSArray * logoarray = @[@"经营品类",@"品牌Logo"];
    NSArray * logoarray2 = @[@"请选择",@"请上传"];

    for (int i = 0; i < logoarray.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50*i, APPwidth, 50)];
        [btn setTitle:logoarray[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:1<<6];
        [logoview addSubview:btn];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 50)];
        label.text = logoarray[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label];
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, APPwidth-label.frame.origin.x-label.frame.size.width-35, 50)];
        label2.text = logoarray2[i];
        label2.textColor = WenZiShenHueiColor;
        label2.font = [UIFont systemFontOfSize:15];
        label2.textAlignment = 2;
        [btn addSubview:label2];
        
        
        UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-25, 17.5, 15,15)];
        imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
        [btn addSubview:imgv];
        
        if (i == 0) {
            
            UIImageView * xian =[[UIImageView alloc] initWithFrame:CGRectMake(10, 49, APPwidth-20,1)];
            xian.image = [UIImage imageNamed:@"shouye-fengexian"];
            [btn addSubview:xian];
            
        }
        
    }

    //***************营业执照 经营许可证***************************
    UIView * yiyezhizhaoview = [[UIView alloc] initWithFrame:CGRectMake(0, logoview.frame.origin.y+logoview.frame.size.height+10, APPwidth, 100)];
    yiyezhizhaoview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:yiyezhizhaoview];
    
    NSArray * yyzzarray = @[@"营业执照",@"经营许可证"];
    for (int i = 0; i < yyzzarray.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50*i, APPwidth, 50)];
        [btn setTitle:yyzzarray[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:1<<6];
        [yiyezhizhaoview addSubview:btn];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 50)];
        label.text = yyzzarray[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label];
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, APPwidth-label.frame.origin.x-label.frame.size.width-35, 50)];
        label2.text = @"请上传";
        label2.textColor = WenZiShenHueiColor;
        label2.font = [UIFont systemFontOfSize:15];
        label2.textAlignment = 2;
        [btn addSubview:label2];
        

        UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-25, 17.5, 15,15)];
        imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
        [btn addSubview:imgv];
        
        if (i == 0) {
           
            UIImageView * xian =[[UIImageView alloc] initWithFrame:CGRectMake(10, 49, APPwidth-20,1)];
            xian.image = [UIImage imageNamed:@"shouye-fengexian"];
            [btn addSubview:xian];
            
        }
        
    }
    
    
    //***************提交***************************
    UIView * tjview = [[UIView alloc] initWithFrame:CGRectMake(0, yiyezhizhaoview.frame.origin.y+yiyezhizhaoview.frame.size.height+10, APPwidth, 60)];
    tjview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:tjview];
    

    
    UIButton * tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 10,APPwidth-120, 40)];
    [tjbtn setTitle:@"提 交" forState:0];
    [tjbtn addTarget:self action:@selector(tjCLick) forControlEvents:UIControlEventTouchUpInside];
    tjbtn.layer.cornerRadius = 10;
    tjbtn.layer.masksToBounds = YES;
    tjbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    [tjview addSubview:tjbtn];
    

    
    _zhengscrollview.contentSize = CGSizeMake(0, tjview.frame.origin.y+tjview.frame.size.height);
    
    

    
}


#pragma mark - 按钮点击
-(void)btnClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"门店地址"]) {
        
        RWFaBuDiZhiVC * dizi = [[RWFaBuDiZhiVC alloc] init];
        [self.navigationController pushViewController:dizi animated:YES];
        

    }
    else if ([btn.titleLabel.text isEqualToString:@"营业时间"]) {
        
        SJYingYeShiJianVC * sjyysj = [[SJYingYeShiJianVC alloc] init];
        [self.navigationController pushViewController:sjyysj animated:YES];
        

    }
    else if ([btn.titleLabel.text isEqualToString:@"经营品类"]) {

        JiNengLeiXingVC * nx = [[JiNengLeiXingVC alloc] init];
        nx.biaoting = @"商家类型";
        [self.navigationController pushViewController:nx animated:YES];

        
    }
    else if ([btn.titleLabel.text isEqualToString:@"品牌Logo"]) {
        
        PingPaiLogoVC * logo = [[PingPaiLogoVC alloc] init];
        logo.biaoting = @"品牌Logo";
        [self.navigationController pushViewController:logo animated:YES];
        
    }
    else if ([btn.titleLabel.text isEqualToString:@"营业执照"]) {
        
        NSLog(@"营业执照");
        PingPaiLogoVC * logo = [[PingPaiLogoVC alloc] init];
        logo.biaoting = @"营业执照";
        [self.navigationController pushViewController:logo animated:YES];
    

    }
    else if ([btn.titleLabel.text isEqualToString:@"经营许可证"]) {
        
        NSLog(@"经营许可证");
        PingPaiLogoVC * logo = [[PingPaiLogoVC alloc] init];
        logo.biaoting = @"经营许可证";
        [self.navigationController pushViewController:logo animated:YES];
        

    }
    

    
}

#pragma mark - 提交资料
-(void)tjCLick
{
    NSLog(@"提交资料");
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
