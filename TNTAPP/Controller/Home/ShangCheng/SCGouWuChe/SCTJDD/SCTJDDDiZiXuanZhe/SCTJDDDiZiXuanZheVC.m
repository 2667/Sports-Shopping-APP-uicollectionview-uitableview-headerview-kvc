//
//  SCTJDDDiZiXuanZheVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/22.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCTJDDDiZiXuanZheVC.h"
#import "WoDeDiZhiCell.h"
#import "WoDeDiZhiVC.h"

@interface SCTJDDDiZiXuanZheVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
}



@end

@implementation SCTJDDDiZiXuanZheVC

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
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 63, APPwidth, 1)];
    xian.image =[UIImage imageNamed:@"shouye-fengexian"];
    [daohan addSubview:xian];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 26, 30, 30)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    biaoting.text = @"选择收货地址";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    UIButton *  bianjibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 22, 60, 40)];
    [bianjibtn setTitle:@"管理" forState:UIControlStateNormal];
    bianjibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [bianjibtn addTarget:self action:@selector(glclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:bianjibtn];
    
}


#pragma mark - 自定义UI
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
    return 3;
    
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    WoDeDiZhiCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[WoDeDiZhiCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    
    cell.name.text = @"收货人姓名";
    cell.name.textColor = WenZiHeiColor;
    cell.name.font = [UIFont systemFontOfSize:16];
    [cell.name sizeToFit];
    
    
    cell.dianhua.text = @"155****4168";
    cell.dianhua.textColor = WenZiHeiColor;
    cell.dianhua.font = [UIFont systemFontOfSize:16];
    [cell.dianhua sizeToFit];
   
    
    cell.dizhi.text = @"广东 广州 南沙区 双山大到66号";
    cell.dizhi.textColor = WenZiQiangHueiColor;
    cell.dizhi.font = [UIFont systemFontOfSize:14];
    
    
    cell.fenge.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    
    cell.backgroundColor = [UIColor whiteColor];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController popViewControllerAnimated:YES];

    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
    
}




#pragma mark - 管理
-(void)glclick
{
    WoDeDiZhiVC * dizhi = [[WoDeDiZhiVC alloc] init];
    [self.navigationController pushViewController:dizhi animated:YES];
    

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
