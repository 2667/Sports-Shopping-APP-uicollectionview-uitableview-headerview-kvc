//
//  YiGuoQiDingDanVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/23.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YiGuoQiDingDanVC.h"
#import "WoDeFaBuDinDangCell.h"
#import "RWYuYueVC.h"

@interface YiGuoQiDingDanVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
}


@end

@implementation YiGuoQiDingDanVC

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
    biaoting.text = @"已过期的";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 10)];
    xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    //*******************订单列表*******************
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    _tableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    _tableview.tableHeaderView = xian;
    
    
}


#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    WoDeFaBuDinDangCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[WoDeFaBuDinDangCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.biaoting.text = @"小学、初中英语专业辅导";
    cell.biaoting.textColor = [UIColor whiteColor];
    cell.biaoting.font = [UIFont systemFontOfSize:18];
    
    
    cell.jiage.text = @"￥200";
    cell.jiage.backgroundColor = [UIColor colorWithRed:255/255.0 green:114/255.0 blue:59/255.0 alpha:1.0];
    cell.jiage.textColor = [UIColor whiteColor];
    cell.jiage.textAlignment = 1;
    cell.jiage.layer.cornerRadius = 5;
    cell.jiage.layer.masksToBounds = YES;
    cell.jiage.font = [UIFont systemFontOfSize:14];
    [cell.jiage sizeToFit];
    CGRect fram1 = cell.jiage.frame;
    fram1.size.width = cell.jiage.frame.size.width+10;
    fram1.origin.x = cell.biaoting.frame.origin.x;
    cell.jiage.frame = fram1;
    
    
    cell.tupiansv.backgroundColor = [UIColor orangeColor];
    
    cell.liulanlang.text = @"浏览1824次";
    cell.liulanlang.textColor = [UIColor colorWithRed:82/255.0 green:82/255.0 blue:82/255.0 alpha:1.0];
    cell.liulanlang.font = [UIFont systemFontOfSize:14];
    
    
    
    cell.congxingfabu.layer.borderWidth = 1;
    cell.congxingfabu.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] CGColor];
    cell.congxingfabu.layer.cornerRadius = 8;
    cell.congxingfabu.layer.masksToBounds = YES;
    [cell.congxingfabu setTitle:@"重新发布" forState:0];
    [cell.congxingfabu setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    cell.congxingfabu.titleLabel.font = [UIFont systemFontOfSize:11];
    
    
    [cell.caidan setImage:[UIImage imageNamed:@"renwu_dian"] forState:0];
    cell.caidan.layer.borderWidth = 1;
    cell.caidan.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] CGColor];
    cell.caidan.layer.cornerRadius = 8;
    cell.caidan.layer.masksToBounds = YES;
    
    
    cell.xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    
    cell.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RWYuYueVC * yy = [[RWYuYueVC alloc] init];
    yy.biaoting = @"已过期";
    [self.navigationController pushViewController:yy animated:YES];
    

}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 280;
    
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
