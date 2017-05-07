//
//  XTXXVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/28.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "XTXXVC.h"
#import "XTXiaoXiCell.h"

@interface XTXXVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
}


@end

@implementation XTXXVC

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
    biaotinglabel.text = @"系统消息";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:_tableview];
    
    
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
    XTXiaoXiCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[XTXiaoXiCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    
    
    cell.shijian.text = @"2017年3月21日";
    cell.shijian.textAlignment = 1;
    cell.shijian.font =[UIFont systemFontOfSize:16];
    cell.shijian.textColor = [UIColor whiteColor];
    cell.shijian.backgroundColor = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1.0];
    cell.shijian.layer.cornerRadius = 10;
    cell.shijian.layer.masksToBounds = YES;
    
    
    cell.dikuan.backgroundColor = [UIColor whiteColor];
    cell.dikuan.layer.cornerRadius = 10;
    cell.dikuan.layer.masksToBounds = YES;
    
    
    cell.icon.backgroundColor = [UIColor orangeColor];
    cell.icon.layer.cornerRadius = 20;
    cell.icon.layer.masksToBounds = YES;
    
    cell.biaoting.text = @"有新版本啦~ 快去更新!";
    cell.biaoting.textColor = WenZiHeiColor;
    cell.biaoting.font = [UIFont systemFontOfSize:16];
    
    
    cell.neirong.text = @"更新版本内容更新版本内容更新版本内容更新版本内容更新版本内容更新版本内容更新版本内容更新版本内容";
    cell.neirong.textColor = WenZiQiangHueiColor;
    cell.neirong.font = [UIFont systemFontOfSize:13];
    cell.neirong.numberOfLines = 0;
    

    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
    
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
