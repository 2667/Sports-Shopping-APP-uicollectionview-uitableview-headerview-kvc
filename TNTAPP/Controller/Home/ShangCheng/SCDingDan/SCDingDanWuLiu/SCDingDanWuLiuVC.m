//
//  SCDingDanWuLiuVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDingDanWuLiuVC.h"
#import "SCDingDanWuLiuCell.h"

@interface SCDingDanWuLiuVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;

}

@end

@implementation SCDingDanWuLiuVC

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
    biaotinglabel.text = @"查看物流";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    //***********表头********************
    UIView * biaotouview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 90)];
    biaotouview.backgroundColor = [UIColor whiteColor];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, APPwidth-20, 50)];
    label.text = @"物流公司:天天快递    物流单号:1578549879846";
    label.textAlignment = 0;
    label.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:16];
    [biaotouview addSubview:label];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 50, APPwidth-30, 1)];
    xian.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    [biaotouview addSubview:xian];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 50, APPwidth-20, 40)];
    label2.text = @"物流信息";
    label2.textAlignment = 0;
    label2.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    label2.font = [UIFont systemFontOfSize:16];
    [biaotouview addSubview:label2];
    

    
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:_tableview];
    
    _tableview.tableHeaderView = biaotouview;
    

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
    SCDingDanWuLiuCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCDingDanWuLiuCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    
    cell.shuxian.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    
    
    
    cell.wuliuxingxi.text = @"在广东广州天河区东圃公司车陂东溪便民服务站进行签收扫描,快件已被签收";
    cell.wuliuxingxi.font = [UIFont systemFontOfSize:15];
    cell.wuliuxingxi.numberOfLines = 2;
    cell.wuliuxingxi.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    
    cell.shijian.text = @"2017-03-21  15:30:25";
    cell.shijian.font = [UIFont systemFontOfSize:15];
    cell.shijian.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    if (indexPath.row == 0) {
        
        cell.shijian.textColor = [UIColor colorWithRed:0/255.0 green:200/255.0 blue:125/255.0 alpha:1.0];
        
         cell.wuliuxingxi.textColor = [UIColor colorWithRed:0/255.0 green:200/255.0 blue:125/255.0 alpha:1.0];
  
        CGRect fram = cell.shuxian.frame;
        fram.origin.y = 25;
        fram.size.height = cell.shuxian.frame.size.height-25;
        cell.shuxian.frame = fram;
       
        cell.yuandian.image = [UIImage imageNamed:@"mall_wuliu_fuhao"];
        cell.yuandian.backgroundColor = [UIColor clearColor];

        
    }
    else{
        
        cell.yuandian.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        cell.yuandian.layer.cornerRadius = 6;
        cell.yuandian.layer.masksToBounds = YES;
        cell.yuandian.image = [UIImage imageNamed:@""];

        
        CGRect fram = cell.shuxian.frame;
        fram.origin.y = 0;
        fram.size.height = 90;
        cell.shuxian.frame = fram;
    }
    
    cell.fgxian.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
    
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
