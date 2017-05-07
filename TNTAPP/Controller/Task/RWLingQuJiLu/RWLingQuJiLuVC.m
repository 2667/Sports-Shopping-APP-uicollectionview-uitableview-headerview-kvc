//
//  RWLingQuJiLuVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWLingQuJiLuVC.h"
#import "RWLingQuJiLuCell.h"

@interface RWLingQuJiLuVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;

}

@end

@implementation RWLingQuJiLuVC

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
    biaoting.text = @"125人已领取";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:18];
    [daohan addSubview:biaoting];
    
    
    
}

#pragma mark - 自定义UI
-(void)zdyUI
{
    //*************头部信息***************
    UIView * toubuview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 200)];
    [self.view addSubview:toubuview];
    
    UIView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(10, 199, APPwidth, 1)];
    xian.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    [toubuview addSubview:xian];

    
    
    UIImageView * _touxiangimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-40, 20, 80, 80)];
    _touxiangimv.backgroundColor = [UIColor orangeColor];
    [toubuview addSubview:_touxiangimv];
    
    UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 105, APPwidth, 20)];
    namelabel.text = @"星巴克";
    namelabel.textColor = [UIColor blackColor];
    namelabel.textAlignment = NSTextAlignmentCenter;
    namelabel.font = [UIFont systemFontOfSize:18];
    [toubuview addSubview:namelabel];
    
    NSArray * array = @[@"签到 52.15元",@"进店 47.56元"];
    for (int i = 0; i < array.count; i++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(_touxiangimv.frame.origin.x+15, namelabel.frame.origin.y+namelabel.frame.size.height+15+25*i, 100, 20)];
        label1.textColor = [UIColor colorWithRed:255/255.0 green:178/255.0 blue:31/255.0 alpha:1.0];
        label1.font = [UIFont systemFontOfSize:15];
        [toubuview addSubview:label1];
       
        NSMutableAttributedString * jindianstr = [[NSMutableAttributedString alloc] initWithString:array[i]];
        [jindianstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1.0] range:NSMakeRange(0,2)];
        label1.attributedText = jindianstr;

        
        if (i == 0) {
            
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, namelabel.frame.origin.y+namelabel.frame.size.height+15+25*i, label1.frame.origin.x-10, 45)];
            label2.textColor = [UIColor blackColor];
            label2.font = [UIFont systemFontOfSize:24];
            label2.text = @"余额";
            label2.textAlignment = 2;
            [toubuview addSubview:label2];
 
        }
 
    }

    
    //*************列表***************
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, toubuview.frame.origin.y+toubuview.frame.size.height, APPwidth, APPheight-toubuview.frame.origin.y-toubuview.frame.size.height)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    RWLingQuJiLuCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[RWLingQuJiLuCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.xian.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    
    
    cell.touxiang.backgroundColor = [UIColor orangeColor];
    cell.touxiang.layer.cornerRadius = 30;
    cell.touxiang.layer.masksToBounds = YES;
    
    
    cell.name.text = @"用户名称";
    cell.name.font = [UIFont systemFontOfSize:16];
    cell.name.textColor = [UIColor blackColor];
    
    
    cell.shijian.text = @"2017-02-21 10:40";
    cell.shijian.font = [UIFont systemFontOfSize:14];
    cell.shijian.textColor = [UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1.0];
    

    
    cell.qiandao.font = [UIFont systemFontOfSize:16];
    cell.qiandao.textColor = [UIColor colorWithRed:255/255.0 green:178/255.0 blue:31/255.0 alpha:1.0];
    NSMutableAttributedString * qiandaostr = [[NSMutableAttributedString alloc] initWithString:@"签到 3.25元"];
    [qiandaostr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1.0] range:NSMakeRange(0,2)];
    cell.qiandao.attributedText = qiandaostr;
    cell.qiandao.textAlignment = 2;

    
    cell.jindian.font = [UIFont systemFontOfSize:16];
    cell.jindian.textColor = [UIColor colorWithRed:255/255.0 green:178/255.0 blue:31/255.0 alpha:1.0];
    NSMutableAttributedString * jindianstr = [[NSMutableAttributedString alloc] initWithString:@"进店 3.25元"];
    [jindianstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1.0] range:NSMakeRange(0,2)];
    cell.jindian.attributedText = jindianstr;
    cell.jindian.textAlignment = 2;

    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
    
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
