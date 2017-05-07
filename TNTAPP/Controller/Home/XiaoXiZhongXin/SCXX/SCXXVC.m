//
//  SCXXVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/20.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCXXVC.h"
#import "SCXXCell.h"
#import "SCXXXiangQingVC.h"

@interface SCXXVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
}

@end

@implementation SCXXVC

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
    biaotinglabel.text = _biaoting;
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
    SCXXCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCXXCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    
    
    cell.shijian.text = @"2017年3月21日";
    cell.shijian.textAlignment = 1;
    cell.shijian.font =[UIFont systemFontOfSize:16];
    cell.shijian.textColor = [UIColor whiteColor];
    cell.shijian.backgroundColor = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1.0];
    cell.shijian.layer.cornerRadius = 10;
    cell.shijian.layer.masksToBounds = YES;
    
    
    cell.scdikuan.backgroundColor = [UIColor whiteColor];
    cell.scdikuan.layer.cornerRadius = 10;
    cell.scdikuan.layer.masksToBounds = YES;
    

    cell.scfukuancenggong.text = @"付款成功";
    cell.scfukuancenggong.font =[UIFont systemFontOfSize:16];
    cell.scfukuancenggong.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
    
    
    cell.scriqi.text = @"3月21日";
    cell.scriqi.font =[UIFont systemFontOfSize:13];
    cell.scriqi.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    
    cell.scjiage.font =[UIFont systemFontOfSize:40];
    cell.scjiage.textColor = [UIColor blackColor];
    cell.scjiage.textAlignment = 1;
    NSMutableAttributedString *jiagestr = [[NSMutableAttributedString alloc] initWithString:@"99.00元"];
    [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(jiagestr.length-1, 1)];
    cell.scjiage.attributedText = jiagestr;

    
    
    cell.scxian1.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    
    
    
    cell.scfukuanfs.text = @"付款方式：";
    cell.scfukuanfs.font =[UIFont systemFontOfSize:16];
    cell.scfukuanfs.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];

    cell.scfukuanfs2.text = @"余额宝";
    cell.scfukuanfs2.font =[UIFont systemFontOfSize:16];
    cell.scfukuanfs2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    
    cell.scjiaoyidueixiang.text = @"交易对象：";
    cell.scjiaoyidueixiang.font =[UIFont systemFontOfSize:16];
    cell.scjiaoyidueixiang.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];

    cell.scjiaoyidueixiang2.text = @"呼来商城";
    cell.scjiaoyidueixiang2.font =[UIFont systemFontOfSize:16];
    cell.scjiaoyidueixiang2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    

    
    cell.scspshuoming.text = @"商品说明：";
    cell.scspshuoming.font =[UIFont systemFontOfSize:16];
    cell.scspshuoming.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];

    
    cell.scspshuoming2.text = @"商品说明商品说明商品说明商品说明商品说明商品说明商品说明商品说明商品说明商品说明商品说明";
    cell.scspshuoming2.font =[UIFont systemFontOfSize:16];
    cell.scspshuoming2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    cell.scspshuoming2.numberOfLines = 0;
    
    
    cell.scxian2.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];

    
    cell.scchakanxiangqing.text = @"查看详情";
    cell.scchakanxiangqing.font =[UIFont systemFontOfSize:16];
    cell.scchakanxiangqing.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
    

    cell.scjiantou.image = [UIImage imageNamed:@"renwu_youjiantou"];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SCXXXiangQingVC * scxxxq = [[SCXXXiangQingVC alloc] init];
    [self.navigationController pushViewController:scxxxq animated:YES];

}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 390;
    
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
