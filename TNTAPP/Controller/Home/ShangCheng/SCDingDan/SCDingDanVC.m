//
//  SCDingDanVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/14.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDingDanVC.h"
#import "SCDingDanCell.h"
#import "SCDingDanXiangQingVC.h"
#import "SCDDPinJiaVC.h"
#import "SCDDTueiHuoVC.h"
#import "SCDDZhueiJiaPingLuen.h"

@interface SCDingDanVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView * _yidongxian;
    
    UITableView * _tableview;

}

@end

@implementation SCDingDanVC

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
    biaotinglabel.text = @"我的订单";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    UIView * toubuview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 50)];
    toubuview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:toubuview];
    
    NSArray * array = @[@"全部",@"待付款",@"待收货",@"待评价"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth/4*i, 0, APPwidth/4, 50)];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.contentHorizontalAlignment = 0;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 5650+i;
        [toubuview addSubview:btn];
        
        if (i == 0) {
            
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:170/255.0 blue:0/255.0 alpha:1.0] forState:0];

        }
    }

    
    _yidongxian = [[UIView alloc] initWithFrame:CGRectMake(15, 48, APPwidth/4-30, 2)];
    _yidongxian.backgroundColor = [UIColor colorWithRed:255/255.0 green:170/255.0 blue:0/255.0 alpha:1.0];
    [toubuview addSubview:_yidongxian];
    

    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, toubuview.frame.origin.y+toubuview.frame.size.height+10, APPwidth, APPheight-toubuview.frame.origin.y-toubuview.frame.size.height-10) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    
    

    
}


#pragma mark - 订单状态之间的切换
-(void)btnClick:(UIButton *)btn
{
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect fram = _yidongxian.frame;
        fram.origin.x = btn.frame.origin.x+15;
        _yidongxian.frame = fram;
        
    }];
    
    for (int i = 5650; i < 5654; i++) {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor blackColor] forState:0];

    }
    
    [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:170/255.0 blue:0/255.0 alpha:1.0] forState:0];


    
    switch (btn.tag) {
        
        case 5650:
        {
            
        }
            break;
            
            
        case 5651:
        {
            
        }
            break;

            
            
        case 5652:
        {
            
        }
            break;

            
            
        case 5653:
        {
            
        }
            break;

            
        default:
            break;
    }
}




#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 10;
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    SCDingDanCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCDingDanCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    
   
    
    cell.datu.image = [UIImage imageNamed:@"shouyexiaotu1"];


    cell.biaoting.text = @"自然堂 美白补水3件套";
    cell.biaoting.textAlignment = 0;
    cell.biaoting.font = [UIFont systemFontOfSize:15];
    cell.biaoting.textColor = [UIColor blackColor];
    
    cell.gueige.text = @"颜色分类：补水6件套";
    cell.gueige.textAlignment = 0;
    cell.gueige.font = [UIFont systemFontOfSize:14];
    cell.gueige.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    
    cell.biaoqian.text = @"七天包换";
    cell.biaoqian.textAlignment = 1;
    cell.biaoqian.font = [UIFont systemFontOfSize:13];
    cell.biaoqian.textColor = [UIColor whiteColor];
    cell.biaoqian.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    
    
    cell.jiage.text = @"¥99.00";
    cell.jiage.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    cell.jiage.font = [UIFont systemFontOfSize:16];
    cell.jiage.textAlignment = 2;
    
    
    cell.yuanjia.text = @"¥199.00";
    cell.yuanjia.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    cell.yuanjia.font = [UIFont systemFontOfSize:11];
    cell.yuanjia.textAlignment = 2;
    
    cell.shuliang.text = @"x2";
    cell.shuliang.font = [UIFont systemFontOfSize:15];
    cell.shuliang.textColor = [UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0];
    cell.shuliang.textAlignment = 2;
  
    
    cell.xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    SCDingDanXiangQingVC * ddxq = [[SCDingDanXiangQingVC alloc] init];
    [self.navigationController pushViewController:ddxq animated:YES];
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
    
}



//设置头部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100;
}


//设置尾部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 120;
}


//自定义头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 50)];
    view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 50)];
    label.font =[UIFont systemFontOfSize:17];
    label.textAlignment = 0;
    label.textColor = [UIColor colorWithRed:255/255.0 green:170/255.0 blue:0/255.0 alpha:1.0];
    label.text = @"   等待买家付款中";
    label.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [view addSubview:label];

    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 5, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"mall_xiangqing_kefu"] forState:0];
//    [btn addTarget:self action:@selector(xuanzhe:) forControlEvents:1<<6];
    [view addSubview:btn];
    
    
    UILabel * label2 =[[UILabel alloc] initWithFrame:CGRectMake(0, 50, APPwidth, 50)];
    label2.font =[UIFont systemFontOfSize:16];
    label2.textAlignment = 0;
    label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label2.text = @"   订单编号：20170314161845";
    [view addSubview:label2];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(10, 99, APPwidth-20, 1)];
    xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [view addSubview:xian];
    
    
    
    return view;
    
}


//自定义尾部视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 100)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel * hejilabel =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth-10, 50)];
    hejilabel.font =[UIFont systemFontOfSize:18];
    hejilabel.textAlignment = 2;
    hejilabel.textColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [view addSubview:hejilabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"合计：¥105.00"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] range:NSMakeRange(0,3)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(3, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(str.length-3, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(4, str.length-7)];
    hejilabel.attributedText = str;

    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(10, 49, APPwidth-20, 1)];
    xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [view addSubview:xian];
    
    
    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(0, 110, APPwidth, 10)];
    xian2.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    [view addSubview:xian2];
    

    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-110, 60, 100, 40)];
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [btn setTitle:@"付款" forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.00 alpha:1.0] CGColor];
    btn.layer.cornerRadius = 8;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(dingdancaozhouClick:) forControlEvents:1<<6];
    [view addSubview:btn];
    
   

    
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-220, 60, 100, 40)];
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2 setTitle:@"取消订单" forState:0];
    btn2.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn2 setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
    btn2.layer.borderWidth = 1;
    btn2.layer.borderColor = [[UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.00 alpha:1.0] CGColor];
    btn2.layer.cornerRadius = 8;
    btn2.layer.masksToBounds = YES;
    [btn2 addTarget:self action:@selector(dingdancaozhouClick:) forControlEvents:1<<6];
    [view addSubview:btn2];
    
    
    if (section == 1) {
        
        [btn setTitle:@"评价" forState:0];
        [btn2 setTitle:@"退款" forState:0];

    }
    return view;
    
}

#pragma mark - 订单操作
-(void)dingdancaozhouClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"评价"]) {
        
        SCDDPinJiaVC * ddpj= [[SCDDPinJiaVC alloc] init];
        [self.navigationController pushViewController:ddpj animated:YES];
        
        
//        SCDDZhueiJiaPingLuen * ddpj= [[SCDDZhueiJiaPingLuen alloc] init];
//        [self.navigationController pushViewController:ddpj animated:YES];
        
    }
    else if ([btn.titleLabel.text isEqualToString:@"退款"]) {
        
        SCDDTueiHuoVC * ddtk= [[SCDDTueiHuoVC alloc] init];
        [self.navigationController pushViewController:ddtk animated:YES];
        
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
