//
//  SCXXXiangQingVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCXXXiangQingVC.h"
#import "SCDingDanWuLiuVC.h"


@interface SCXXXiangQingVC ()
{
    UIScrollView * _zhengscrollview;

}

@end

@implementation SCXXXiangQingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    
    [self zdydhl];
    
    [self zdyUI];
    
}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuei"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = @"账单详情";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_zhengscrollview];
    

    UIImageView * logoimgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-70, 15, 50, 50)];
    logoimgv.backgroundColor = [UIColor orangeColor];
    logoimgv.layer.cornerRadius = 25;
    logoimgv.layer.masksToBounds = YES;
    [_zhengscrollview addSubview:logoimgv];
    
    
    UILabel * dianminglabel = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-10, 15, APPwidth/2, 50)];
    dianminglabel.text = @"呼来商城";
    dianminglabel.textAlignment = 0;
    dianminglabel.textColor = [UIColor blackColor];
    dianminglabel.font = [UIFont systemFontOfSize:20];
    [_zhengscrollview addSubview:dianminglabel];
    
    
    
    UILabel * jiagelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, dianminglabel.frame.origin.y+dianminglabel.frame.size.height+30, APPwidth, 30)];
    jiagelabel.text = @"-99.00";
    jiagelabel.textAlignment = 1;
    jiagelabel.textColor = [UIColor blackColor];
    jiagelabel.font = [UIFont systemFontOfSize:40];
    [_zhengscrollview addSubview:jiagelabel];
    

    UILabel * ddztlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, jiagelabel.frame.origin.y+jiagelabel.frame.size.height+10, APPwidth, 30)];
    ddztlabel.text = @"等待确认收货";
    ddztlabel.textAlignment = 1;
    ddztlabel.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    ddztlabel.font = [UIFont systemFontOfSize:18];
    [_zhengscrollview addSubview:ddztlabel];
    
    NSArray * array1 = @[@"付款方式",@"商品说明",@"收货地址",@"物流信息",@"订单编号",@"创建时间"];
    NSArray * array2 = @[@"余额宝",@"商品说明商品说明商品说明商品说明商品说明商品说品说明",@"广州市南沙区双山大道中大城四栋",@"已发货",@"201703211428",@"2017-03-21 14:28"];

    float y = ddztlabel.frame.origin.y+ddztlabel.frame.size.height+20;
    
    for (int i = 0; i < array1.count; i++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, y, 100, 50)];
        label1.text = array1[i];
        label1.textAlignment = 0;
        label1.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
        label1.font = [UIFont systemFontOfSize:16];
        [_zhengscrollview addSubview:label1];

        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+10, y, APPwidth-label1.frame.size.width-label1.frame.origin.x-25, 50)];
        label2.text = array2[i];
        label2.textAlignment = 2;
        label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label2.font = [UIFont systemFontOfSize:16];
        [_zhengscrollview addSubview:label2];
        

        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, label1.frame.origin.y+label1.frame.size.height, APPwidth-30, 1)];
        xian.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        [_zhengscrollview addSubview:xian];
        
        if (i == 1) {
           
            label2.textAlignment = 0;
            label2.numberOfLines = 0;
            [label2 sizeToFit];
            
        
            CGRect fram2 = label2.frame;
            fram2.origin.y = label1.frame.origin.y+15;
            label2.frame = fram2;


            y = label2.frame.origin.y+label2.frame.size.height+30;
            
            CGRect fram = xian.frame;
            fram.origin.y = label2.frame.origin.y+label2.frame.size.height+30;
            xian.frame = fram;
            

            
        }
        else
        {
            y = y + 50;
 
        }
        
        if (i == 3) {
            
            CGRect fram = label2.frame;
            fram.size.width = label2.frame.size.width-30;
            label2.frame = fram;
            
            UIImageView * jiantouimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-35, label2.frame.origin.y+17, 16, 16)];
            jiantouimv.image = [UIImage imageNamed:@"renwu_youjiantou"];
            [_zhengscrollview addSubview:jiantouimv];
            
            
            UIButton * wuliubtn = [[UIButton alloc] initWithFrame:CGRectMake(15, label1.frame.origin.y, APPwidth-30, 50)];
            [wuliubtn addTarget:self action:@selector(wuliu) forControlEvents:1<<6];
            [_zhengscrollview addSubview:wuliubtn];
            
            
        }
        
    }
    
    
    CGRect fram =  _zhengscrollview.frame;
    fram.size.height = y;
    _zhengscrollview.frame = fram;

    _zhengscrollview.contentSize = CGSizeMake(0, y);

    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, APPheight-50, APPwidth, 50)];
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [btn setTitle:@"确认收货" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:1<<6];
    [self.view addSubview:btn];

    
}

#pragma mark - 按钮点击
-(void)btnclick
{
    
}

#pragma mark - 查看物流
-(void)wuliu
{
    SCDingDanWuLiuVC * scddwl = [[SCDingDanWuLiuVC alloc] init];
    [self.navigationController pushViewController:scddwl animated:YES];
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
