//
//  ChuShouDinDangVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "ChuShouDinDangVC.h"
#import "ChuShouDinDangCell.h"
#import "RWDDPingJiaVC.h"
#import "RWYuYueVC.h"
#import "RWDDFangQiXuanZheVC.h"

@interface ChuShouDinDangVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
    
    UIView * _yidongxian;
    
}

@end

@implementation ChuShouDinDangVC

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
    
    
    UISegmentedControl * _segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"我购买的",@"我出售的", nil]];
    _segment.frame = CGRectMake(APPwidth/2-90, 26, 180, 30);
    _segment.selectedSegmentIndex = 0;
    _segment.tintColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,  [UIFont systemFontOfSize:16],UITextAttributeFont ,[UIColor whiteColor],UITextAttributeTextShadowColor ,nil];
    [_segment setTitleTextAttributes:dic forState:UIControlStateSelected];
    [_segment addTarget:self action:@selector(qiehuan) forControlEvents:UIControlEventValueChanged];
    [daohan addSubview:_segment];
    
    
    
    //删除
    UIButton * shanchubtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 26, 30, 30)];
    [shanchubtn setImage:[UIImage imageNamed:@"renwu_gengduo1"] forState:UIControlStateNormal];
    [shanchubtn addTarget:self action:@selector(shanchu) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:shanchubtn];
    

}

#pragma mark - 自定义界面
-(void)zdyUI
{
    //*****************表头**********************
    UIView * biaotouview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 100)];
    biaotouview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    NSArray * array = @[@"全部",@"进行中",@"待付款",@"待评价"];
    NSArray * array2 = @[@"renwu_quanbu",@"renwu_jinxingzhong",@"renwu_daifukuan",@"renwu_daipingjia"];

    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth/4*i, 10, APPwidth/4, 80)];
        btn.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [biaotouview addSubview:btn];
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width/2-12.5, 10, 25, 25)];
        imgv.image = [UIImage imageNamed:array2[i]];
        [btn addSubview:imgv];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, btn.frame.size.width, 20)];
        label.text = array[i];
        label.textAlignment = 1;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        [btn addSubview:label];
        
        
        
    }
    
    _yidongxian = [[UIView alloc] initWithFrame:CGRectMake(10, biaotouview.frame.size.height-12, APPwidth/4-20, 2)];
    _yidongxian.backgroundColor = [UIColor colorWithRed:255/255.0 green:186/255.0 blue:61/255.0 alpha:1.0];
    [biaotouview addSubview:_yidongxian];
    
    
    //*******************订单列表*******************
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    _tableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];

//    _tableview.tableHeaderView = biaotouview;
    

}



#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
    
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    ChuShouDinDangCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[ChuShouDinDangCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    
    cell.biaoting.text = @"小学，初中英语专业辅导";
    cell.biaoting.textColor = [UIColor whiteColor];
    cell.biaoting.font = [UIFont systemFontOfSize:16];
    [cell.biaoting sizeToFit];
    
    
    cell.jiage.backgroundColor = [UIColor colorWithRed:255/255.0 green:114/255.0 blue:59/255.0 alpha:1.0];
    cell.jiage.textColor = [UIColor whiteColor];
    cell.jiage.textAlignment = 1;
    cell.jiage.layer.cornerRadius = 5;
    cell.jiage.layer.masksToBounds = YES;
    cell.jiage.font = [UIFont systemFontOfSize:18];
    NSMutableAttributedString *jiagestr = [[NSMutableAttributedString alloc] initWithString:@"￥200"];
    [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 1)];//设置不同字号
    cell.jiage.attributedText = jiagestr;
    [cell.jiage sizeToFit];
    CGRect fram1 = cell.jiage.frame;
    fram1.size.width = cell.jiage.frame.size.width+10;
    fram1.origin.x = cell.biaoting.frame.size.width+15;
    cell.jiage.frame = fram1;
    
    
//    CGRect fram2 = cell.jiage.frame;
//    fram2.size.width = APPwidth;
//    fram2.size.height = cell.jiage.frame.size.height+10;
//    cell.jiage.frame = fram2;

    
    
    
    cell.zhuantai.text = @"任务进行中";
    cell.zhuantai.textColor = [UIColor colorWithRed:214/255.0 green:150/255.0 blue:54/255.0 alpha:1.0];
    cell.zhuantai.font = [UIFont systemFontOfSize:13];
    [cell.zhuantai sizeToFit];
    CGRect fram2 = cell.zhuantai.frame;
    fram2.origin.x = APPwidth-cell.zhuantai.frame.size.width-10;
    cell.zhuantai.frame = fram2;

    
    
    
    cell.zhutu.image = [UIImage imageNamed:@"shouyexiaotu1"];
    
    cell.diziimv.image = [UIImage imageNamed:@"renwu_weizhi"];
    
    cell.dizi.text = @"广州市 南沙区";
    cell.dizi.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    cell.dizi.font = [UIFont systemFontOfSize:12];
    
    
    cell.shijianimv.image = [UIImage imageNamed:@"renwu_shijian"];
    
    cell.shijian.text = @"2017-02-13 14:20";
    cell.shijian.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    cell.shijian.font = [UIFont systemFontOfSize:12];
    

    cell.danhaoimv.image = [UIImage imageNamed:@"renwu_dingdanhao"];
    
    cell.danhao.text = @"订单号 201702131420";
    cell.danhao.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    cell.danhao.font = [UIFont systemFontOfSize:12];
    

    cell.xian.image = [UIImage imageNamed:@"shouye-fengexian"];
    
    cell.touxianimv.backgroundColor = [UIColor orangeColor];
    cell.touxianimv.layer.cornerRadius = 25;
    cell.touxianimv.layer.masksToBounds = YES;
    
    
    cell.name.text = @"幸运草";
    cell.name.textColor = [UIColor whiteColor];
    cell.name.font = [UIFont systemFontOfSize:16];
    
//    [cell.daiqueren setTitle:@"取消订单" forState:0];
//    cell.daiqueren.titleLabel.font = [UIFont systemFontOfSize:15];
//    [cell.daiqueren setTitleColor:[UIColor colorWithRed:214/255.0 green:150/255.0 blue:54/255.0 alpha:1.0] forState:0];
//    cell.daiqueren.layer.borderWidth = 1;
//    cell.daiqueren.layer.borderColor = [[UIColor colorWithRed:214/255.0 green:150/255.0 blue:54/255.0 alpha:1.0] CGColor];
//    cell.daiqueren.layer.cornerRadius = 8;
//    cell.daiqueren.layer.masksToBounds = YES;
//    [cell.daiqueren addTarget:self action:@selector(cellbtnClick:) forControlEvents:1<<6];
//    
//
//    
//    
//    [cell.daipingjia setTitle:@"待评价" forState:0];
//    [cell.daipingjia setTitleColor:[UIColor colorWithRed:214/255.0 green:150/255.0 blue:54/255.0 alpha:1.0] forState:0];
//    cell.daipingjia.titleLabel.font = [UIFont systemFontOfSize:15];
//    cell.daipingjia.layer.borderWidth = 1;
//    cell.daipingjia.layer.borderColor = [[UIColor colorWithRed:214/255.0 green:150/255.0 blue:54/255.0 alpha:1.0] CGColor];
//    cell.daipingjia.layer.cornerRadius = 8;
//    cell.daipingjia.layer.masksToBounds = YES;
//    [cell.daipingjia addTarget:self action:@selector(cellbtnClick:) forControlEvents:1<<6];


    
    cell.fenge.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];

    cell.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RWYuYueVC * yy = [[RWYuYueVC alloc] init];
    yy.biaoting = @"已结束";
    [self.navigationController pushViewController:yy animated:YES];
    

}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 246;
    
}


#pragma mark - 按钮点击
-(void)cellbtnClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"取消订单"]) {
        
        RWDDFangQiXuanZheVC * rwddqx = [[RWDDFangQiXuanZheVC alloc] init];
        [self.navigationController pushViewController:rwddqx animated:YES];
    }
    else if ([btn.titleLabel.text isEqualToString:@"待评价"])
    {
        RWDDPingJiaVC * rwddpj = [[RWDDPingJiaVC alloc] init];
        [self.navigationController pushViewController:rwddpj animated:YES];
    }
    
}

#pragma mark - 订单状态按钮点击
-(void)btnClick:(UIButton *)btn
{
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect fram = _yidongxian.frame;
        fram.origin.x = btn.frame.origin.x+10;
        _yidongxian.frame = fram;
        
        
    }];
    
}


#pragma mark - 删除
-(void)shanchu
{
    NSLog(@"点击了删除");
    
}

#pragma mark - 我出售的和我购买的之间的切换
-(void)qiehuan
{
    NSLog(@"切换");

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
