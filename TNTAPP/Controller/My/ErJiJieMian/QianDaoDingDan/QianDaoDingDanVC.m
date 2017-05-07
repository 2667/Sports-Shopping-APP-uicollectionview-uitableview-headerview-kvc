//
//  QianDaoDingDanVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/22.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "QianDaoDingDanVC.h"
#import "QianDaoDingDanCell.h"
#import "RWYuYueVC.h"


@interface QianDaoDingDanVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
}

@end

@implementation QianDaoDingDanVC

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
    biaoting.text = @"签到订单";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{

    //*******************订单列表*******************
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    _tableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];

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
    QianDaoDingDanCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[QianDaoDingDanCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.fengexian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    cell.zhutu.image = [UIImage imageNamed:@"shouyexiaotu1"];

    
    cell.biaoting.textColor = [UIColor whiteColor];
    cell.biaoting.textAlignment = 0;
    cell.biaoting.font = [UIFont systemFontOfSize:16];
    NSMutableAttributedString *biaoqingstr = [[NSMutableAttributedString alloc] initWithString:@"[星巴克] 签到奖励"];
    [biaoqingstr addAttribute:NSForegroundColorAttributeName value:WenZiQiangHueiColor range:NSMakeRange(0,5)];
    cell.biaoting.attributedText = biaoqingstr;

    
    
    cell.zhuantai.text = @"进行中";
    cell.zhuantai.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    cell.zhuantai.textAlignment = 2;
    cell.zhuantai.font = [UIFont systemFontOfSize:13];
    

    
    
    cell.jiage.text = @"¥200.00";
    cell.jiage.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    cell.jiage.textAlignment = 0;
    cell.jiage.font = [UIFont systemFontOfSize:16];
    

    cell.shijianimgv.image = [UIImage imageNamed:@"renwu_shijian"];

    
    cell.shijian.text = @"08:30-22:30有效";
    cell.shijian.textColor = WenZiQiangHueiColor;
    cell.shijian.textAlignment = 0;
    cell.shijian.font = [UIFont systemFontOfSize:12];
    

    cell.zhuantaibtn.layer.borderWidth = 1;
    cell.zhuantaibtn.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] CGColor];
    [cell.zhuantaibtn setTitle:@"续签" forState:0];
    [cell.zhuantaibtn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    cell.zhuantaibtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
   
    cell.xian.image = [UIImage imageNamed:@"shouye-fengexian"];
    
    
    cell.city.text = @"广州市·南沙区";
    cell.city.textColor = [UIColor whiteColor];
    cell.city.textAlignment = 0;
    cell.city.font = [UIFont systemFontOfSize:15];
    

    
    cell.dizhi.text = @"双山大道中大城4栋809";
    cell.dizhi.textColor = WenZiQiangHueiColor;
    cell.dizhi.textAlignment = 0;
    cell.dizhi.font = [UIFont systemFontOfSize:12];
    

    cell.juliimgv.image = [UIImage imageNamed:@"renwu_juli"];

    
    cell.juli.text = @"300m";
    cell.juli.textColor = WenZiQiangHueiColor;
    cell.juli.textAlignment = 0;
    cell.juli.font = [UIFont systemFontOfSize:12];
    

    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = TNTColor(40, 44, 49);
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RWYuYueVC * yy = [[RWYuYueVC alloc] init];
    yy.biaoting = @"前往目的地";
    [self.navigationController pushViewController:yy animated:YES];
    

}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 196;
    
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
