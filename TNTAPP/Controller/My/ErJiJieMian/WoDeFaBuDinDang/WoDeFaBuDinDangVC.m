//
//  WoDeFaBuDinDangVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/15.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WoDeFaBuDinDangVC.h"
#import "WoDeFaBuDinDangCell.h"
#import "YiGuoQiDingDanVC.h"
#import "QiangDaoRenWuCell.h"
#import "RWLingQuJiLuVC.h"
#import "RWYuYueVC.h"


@interface WoDeFaBuDinDangVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView * _zhengscrollview;

    UIView * _yidongxian;
    
    UITableView * _wonengtableview;
    
    
    UITableView * _woyaotableview;

    
    UIView * _qiandaodingdanview;
    UITableView * _qiandaotableview;

    
}

@end

@implementation WoDeFaBuDinDangVC

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
    biaoting.text = @"我发布的";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
       
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    UIView * biaotou = [self biaotou];
    
    
    [self.view addSubview:biaotou];
    

    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+110, APPwidth, APPheight-64-110)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];

    

    
    //*******************wo要订单列表*******************
    _woyaotableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, _zhengscrollview.frame.size.height)];
    _woyaotableview.delegate = self;
    _woyaotableview.dataSource = self;
    _woyaotableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_zhengscrollview addSubview:_woyaotableview];
    _woyaotableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
//    _woyaotableview.tableHeaderView = [self biaotou];
    
    
    //*******************wo能订单列表*******************
    _wonengtableview = [[UITableView alloc] initWithFrame:CGRectMake(APPwidth, 0, APPwidth, _zhengscrollview.frame.size.height)];
    _wonengtableview.delegate = self;
    _wonengtableview.dataSource = self;
    _wonengtableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_zhengscrollview addSubview:_wonengtableview];
    _wonengtableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
//    _wonengtableview.tableHeaderView = [self biaotou];
    
   

    
    //**************签到订单********************
    _qiandaotableview = [[UITableView alloc] initWithFrame:CGRectMake(APPwidth*2, 0, APPwidth, _zhengscrollview.frame.size.height)];
    _qiandaotableview.delegate = self;
    _qiandaotableview.dataSource = self;
    _qiandaotableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_zhengscrollview addSubview:_qiandaotableview];
    _qiandaotableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
//    _qiandaotableview.tableHeaderView = [self biaotou];
    
    
    //商家入驻提示图片
    _qiandaodingdanview = [[UIView alloc] initWithFrame:CGRectMake(APPwidth*2, 0, APPwidth, _zhengscrollview.frame.size.height)];
    _qiandaodingdanview.backgroundColor = [UIColor colorWithRed:33/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_qiandaodingdanview];
    _qiandaodingdanview.hidden = YES;
    
    
    UIView * baidiview = [[UIView alloc] initWithFrame:CGRectMake(30, 20, APPwidth-60, _qiandaodingdanview.frame.size.height-100)];
    baidiview.backgroundColor = [UIColor whiteColor];
    baidiview.layer.cornerRadius = 10;
    baidiview.layer.masksToBounds = YES;
    [_qiandaodingdanview addSubview:baidiview];
    
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(60, 20, baidiview.frame.size.width-120, baidiview.frame.size.width-120)];
    imgv.image = [UIImage imageNamed:@"renwu_ruzhuyindao"];
    [baidiview addSubview:imgv];
    
    NSArray * array = @[@"商家专属",@"商家推广不在愁",@"立即入驻"];
    for (int i = 0; i < array.count; i++) {
        
        if (i == 0 || i == 1) {
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, baidiview.frame.size.height-120+20*i+10*i, baidiview.frame.size.width, 20)];
            label.text = array[i];
            label.textColor = WenZiHeiColor;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:16];
            [baidiview addSubview:label];

            if (i == 1) {
               
                label.font = [UIFont systemFontOfSize:12];

            }
            
        }
        else{
            
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(baidiview.frame.size.width/2-60, baidiview.frame.size.height-120+20*i+10*i, 120, 30)];
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            btn.layer.cornerRadius = 15;
            btn.layer.masksToBounds = YES;
            [btn setTitle:array[i] forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn addTarget:self action:@selector(shangjiarz) forControlEvents:UIControlEventTouchUpInside];
            [baidiview addSubview:btn];
            

        }
        

    }
    
    
    _zhengscrollview.contentSize = CGSizeMake(APPwidth*3, 0);
    CGPoint point =  _zhengscrollview.contentOffset;
    point.x = APPwidth;
    _zhengscrollview.contentOffset = point;


}

#pragma mark - 创建表头
-(UIView *)biaotou
{
    //*****************表头**********************
    UIView * biaotouview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 110)];
    biaotouview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    NSArray * array = @[@"Wo能",@"Wo要",@"签到任务"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth/3*i, 10, APPwidth/3, 50)];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0] forState:0];
        btn.titleLabel.font = [UIFont fontWithName:@"Alba Matter" size:16];
        btn.contentHorizontalAlignment = 0;
        btn.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 5500+i;
        [biaotouview addSubview:btn];
        
        if (i == 0) {
            
            UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(0, 50, APPwidth, 50)];
            btn.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
            [btn addTarget:self action:@selector(yiguoqiClick) forControlEvents:UIControlEventTouchUpInside];
            [biaotouview addSubview:btn];
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 16, 18, 18)];
            imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
            [btn addSubview:imgv];
            
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, btn.frame.size.width-50, 50)];
            label.text = @"已过期";
            label.textAlignment = 0;
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
            [btn addSubview:label];
            
            
            
        }
    }
    
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 51, APPwidth, 1)];
    xian.image = [UIImage imageNamed:@"shouye-fengexian"];
    [biaotouview addSubview:xian];
    
    
    _yidongxian = [[UIView alloc] initWithFrame:CGRectMake(0, 48, APPwidth/3, 2)];
    _yidongxian.backgroundColor = [UIColor colorWithRed:255/255.0 green:186/255.0 blue:61/255.0 alpha:1.0];
    [biaotouview addSubview:_yidongxian];
    
    
    if ([_biaoting isEqualToString:@"需求管理"]) {
        
        CGRect fram = _yidongxian.frame;
        fram.origin.x = APPwidth/3;
        _yidongxian.frame = fram;
    }
    
    
//    [_zhengscrollview addSubview:biaotouview];
    
    return biaotouview;
    
}

#pragma mark - 创建签到订单界面
-(void)zdyqiandao
{
    
}


#pragma mark - 选择条按钮点击
-(void)btnClick:(UIButton *)btn
{
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect fram = _yidongxian.frame;
        fram.origin.x = btn.frame.origin.x;
        _yidongxian.frame = fram;
        
        
    }];

    switch (btn.tag) {
     
        //wo要
        case 5500:
        {
            [UIView animateWithDuration:0.3 animations:^{
                
                CGPoint point =  _zhengscrollview.contentOffset;
                point.x = 0;
                _zhengscrollview.contentOffset = point;

            }];
            
            
        }
            break;
            
            
            //wo能
        case 5501:
        {
            [UIView animateWithDuration:0.3 animations:^{
                
                CGPoint point =  _zhengscrollview.contentOffset;
                point.x = APPwidth;
                _zhengscrollview.contentOffset = point;
                
            }];
            
        }
            break;
            

            
            //签到订单
        case 5502:
        {
            [UIView animateWithDuration:0.3 animations:^{
                
                CGPoint point =  _zhengscrollview.contentOffset;
                point.x = APPwidth*2;
                _zhengscrollview.contentOffset = point;
                
            }];
        }
            break;
            

        default:
            break;
    }
}


#pragma mark - 已过期
-(void)yiguoqiClick
{
    YiGuoQiDingDanVC * ygq = [[YiGuoQiDingDanVC alloc] init];
    [self.navigationController pushViewController:ygq animated:YES];
    
}

#pragma mark - 商家入驻
-(void)shangjiarz
{
    NSLog(@"商家认证");
    
}


#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _woyaotableview) {
        
        return 1;
    }
    else if (tableView == _wonengtableview)
    {
        return 2;
        
        
    }
    else{
       
        return 3;

    }
    
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    
    if (tableView == _qiandaotableview) {
        
        QiangDaoRenWuCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            
            cell = [[QiangDaoRenWuCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
        }
        
        cell.zhutu.image = [UIImage imageNamed:@"shouyexiaotu1"];
        
        cell.biaoting.text = @"签到领取奖励";
        cell.biaoting.textColor = [UIColor whiteColor];
        cell.biaoting.font = [UIFont systemFontOfSize:18];
        
        
        cell.jiage.textColor = [UIColor whiteColor];
        cell.jiage.font = [UIFont systemFontOfSize:14];
        NSMutableAttributedString *jiagestr = [[NSMutableAttributedString alloc] initWithString:@"总金额¥80  签到¥60  进店¥20"];
        [jiagestr addAttribute:NSForegroundColorAttributeName value:WenZiQiangHueiColor range:NSMakeRange(0,3)];
        [jiagestr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] range:NSMakeRange(3,3)];
        [jiagestr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:97/255.0 blue:37/255.0 alpha:1.0] range:NSMakeRange(10,3)];
        [jiagestr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:97/255.0 blue:37/255.0 alpha:1.0] range:NSMakeRange(17,3)];
        [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(4, 2)];
        [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(11, 2)];
        [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(18, 2)];
        cell.jiage.attributedText = jiagestr;
        
        
        
        cell.chanyureshu.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        cell.chanyureshu.font = [UIFont systemFontOfSize:14];
        NSMutableAttributedString *canyursstr = [[NSMutableAttributedString alloc] initWithString:@"参与人数 200·"];
        [canyursstr addAttribute:NSForegroundColorAttributeName value:WenZiQiangHueiColor range:NSMakeRange(0,4)];
        [canyursstr addAttribute:NSForegroundColorAttributeName value:WenZiQiangHueiColor range:NSMakeRange(canyursstr.length-1,1)];
        [canyursstr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(5, 4)];
        cell.chanyureshu.attributedText = canyursstr;
        

        
        cell.yiliview.backgroundColor = [UIColor clearColor];
        for (int i = 0; i < 2; i++) {
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(15*i, 0, 20, 20)];
            imgv.layer.cornerRadius = 10;
            imgv.layer.masksToBounds = YES;
            imgv.layer.borderWidth = 1;
            imgv.layer.borderColor = [[UIColor whiteColor] CGColor];
            imgv.backgroundColor = [UIColor orangeColor];
            [cell.yiliview addSubview:imgv];
            
            if (i == 1) {
                
                UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(imgv.frame.origin.x+imgv.frame.size.width+5, 0, 50, 20)];
                label.text = @"已领10";
                label.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
                label.font = [UIFont systemFontOfSize:14];
                [cell.yiliview addSubview:label];
            }
            
        }
        
        [cell.yilibtn addTarget:self action:@selector(yiliclick) forControlEvents:1<<6];
        
        
        cell.liulan.text = @"浏览1824次";
        cell.liulan.textColor = [UIColor colorWithRed:82/255.0 green:82/255.0 blue:82/255.0 alpha:1.0];
        cell.liulan.font = [UIFont systemFontOfSize:14];
        
        
        
        cell.shijian.text = @"74时48分过期";
        cell.shijian.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        cell.shijian.font = [UIFont systemFontOfSize:14];
        [cell.shijian sizeToFit];
        CGRect fram2 = cell.shijian.frame;
        fram2.origin.x = cell.caidan.frame.origin.x-cell.shijian.frame.size.width-20;
        fram2.origin.y = cell.xian.frame.origin.y+cell.xian.frame.size.height+25-cell.shijian.frame.size.height/2;
        cell.shijian.frame = fram2;
        
        
        
        cell.shijianimgv.image = [UIImage imageNamed:@"renwu_shijian"];
        CGRect fram3 = cell.shijianimgv.frame;
        fram3.origin.x = cell.shijian.frame.origin.x-22;
        cell.shijianimgv.frame = fram3;
        
        
        
        [cell.caidan setImage:[UIImage imageNamed:@"renwu_dian"] forState:0];
        cell.caidan.layer.borderWidth = 1;
        cell.caidan.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] CGColor];
        cell.caidan.layer.cornerRadius = 8;
        cell.caidan.layer.masksToBounds = YES;
        
        
        cell.xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        
        
        cell.fenge.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        
        cell.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        

    }
    else{
        
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
        
        
        
        cell.shijian.text = @"74时48分过期";
        cell.shijian.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        cell.shijian.font = [UIFont systemFontOfSize:14];
        [cell.shijian sizeToFit];
        CGRect fram2 = cell.shijian.frame;
        fram2.origin.x = cell.caidan.frame.origin.x-cell.shijian.frame.size.width-20;
        fram2.origin.y = cell.tupiansv.frame.origin.y+cell.tupiansv.frame.size.height+25-cell.shijian.frame.size.height/2;
        cell.shijian.frame = fram2;
        
        
        cell.shijianimv.image = [UIImage imageNamed:@"renwu_shijian"];
        CGRect fram3 = cell.shijianimv.frame;
        fram3.origin.x = cell.shijian.frame.origin.x-22;
        cell.shijianimv.frame = fram3;
        
        
        
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
   

    
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RWYuYueVC * yy = [[RWYuYueVC alloc] init];
    yy.biaoting = @"评价";
    [self.navigationController pushViewController:yy animated:YES];
    

}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == _qiandaotableview) {
        
        return 171;
    }
    else{
       
        return 280;

    }
    
}

#pragma mark - 已领点击
-(void)yiliclick
{
    RWLingQuJiLuVC * lqjl = [[RWLingQuJiLuVC alloc] init];
    [self.navigationController pushViewController:lqjl animated:YES];
    

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
