//
//  WoDeDiZhiVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/24.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WoDeDiZhiVC.h"
#import "WoDeDiZhiCell.h"
#import "WoDeDiZhiXingZengVC.h"

@interface WoDeDiZhiVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
    NSMutableArray * _shujuyuan;
    UIButton *  _bianjibtn;
    
    int _geshu;
}

@end

@implementation WoDeDiZhiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    _geshu = 6;
    _shujuyuan = [[NSMutableArray alloc] init];
    for (int i = 0; i < _geshu ; i++) {
        
        [_shujuyuan addObject:[NSString stringWithFormat:@"%d",i]];
    }

    
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
    biaoting.text = @"收货地址";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
 
    _bianjibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 22, 60, 40)];
    [_bianjibtn setTitle:@"编辑" forState:UIControlStateNormal];
    _bianjibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_bianjibtn addTarget:self action:@selector(bianjiclick:) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:_bianjibtn];
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-114)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:_tableview];

    

    UIButton * xingzengbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, APPheight-50,APPwidth, 50)];
    [xingzengbtn setTitle:@"新增收货地址" forState:0];
    [xingzengbtn setTitleColor:[UIColor whiteColor] forState:0];
    [xingzengbtn addTarget:self action:@selector(btnCLick) forControlEvents:UIControlEventTouchUpInside];
    xingzengbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    xingzengbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [self.view addSubview:xingzengbtn];
}



#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _shujuyuan.count;
    
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
    cell.name.textColor = [UIColor whiteColor];
    cell.name.font = [UIFont systemFontOfSize:16];
    [cell.name sizeToFit];

    cell.dianhua.text = @"155****4168";
    cell.dianhua.textColor = [UIColor whiteColor];
    cell.dianhua.font = [UIFont systemFontOfSize:16];
    [cell.dianhua sizeToFit];

    
    cell.dizhi.text = @"广东 广州 南沙区 双山大到66号";
    cell.dizhi.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    cell.dizhi.font = [UIFont systemFontOfSize:14];
   
    
    if ([_bianjibtn.titleLabel.text isEqualToString:@"编辑"]) {
      
        [cell.sanchu setImage:[UIImage imageNamed:@""] forState:0];

        CGRect fram1 = cell.name.frame;
        fram1.origin.x = 15;
        fram1.origin.y = 25;
        cell.name.frame = fram1;
        
        CGRect fram2 = cell.dianhua.frame;
        fram2.origin.x = cell.name.frame.origin.x+cell.name.frame.size.width+20;
        fram2.origin.y = 25;
        cell.dianhua.frame = fram2;

        
        CGRect fram3 = cell.dizhi.frame;
        fram3.origin.x = 15;
        fram3.origin.y = cell.name.frame.origin.y+cell.name.frame.size.height+5;
        fram3.size.width = APPwidth-50;
        cell.dizhi.frame = fram3;

        
    }
    else{
        
        [cell.sanchu setImage:[UIImage imageNamed:@"wode_dizhi_shanchu"] forState:0];
        [cell.sanchu addTarget:self action:@selector(sanchuclick) forControlEvents:1<<6];
       
        CGRect fram1 = cell.name.frame;
        fram1.origin.x = 55;
        fram1.origin.y = 25;
        cell.name.frame = fram1;
        
        CGRect fram2 = cell.dianhua.frame;
        fram2.origin.x = cell.name.frame.origin.x+cell.name.frame.size.width+20;
        fram2.origin.y = 25;
        cell.dianhua.frame = fram2;
        
        CGRect fram3 = cell.dizhi.frame;
        fram3.origin.x = 55;
        fram3.origin.y = cell.name.frame.origin.y+cell.name.frame.size.height+5;
        fram3.size.width = APPwidth-95;
        cell.dizhi.frame = fram3;
        

    }

    cell.jiantou.image = [UIImage imageNamed:@"renwu_youjiantou"];
    
    cell.fenge.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    
    cell.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WoDeDiZhiXingZengVC * xingzeng = [[WoDeDiZhiXingZengVC alloc] init];
    xingzeng.leixing = @"修改地址";
    xingzeng.diziarray = @[@"收货人姓名",@"15547854125",@"广东 广州市",@"南沙区44号",@"510000"];
    [self.navigationController pushViewController:xingzeng animated:YES];
    

}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
    
}

#pragma mark - 删除地址
-(void)sanchuclick
{
    
    [_shujuyuan removeAllObjects];
    
    _geshu--;
    
    for (int i = 0; i < _geshu ; i++) {
        
        [_shujuyuan addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    
    [_tableview reloadData];
    
}

#pragma mark - 新增收货地址按钮
-(void)btnCLick
{
    WoDeDiZhiXingZengVC * xingzeng = [[WoDeDiZhiXingZengVC alloc] init];
    xingzeng.leixing = @"新增收货地址";
    [self.navigationController pushViewController:xingzeng animated:YES];
    
}



#pragma mark - 编辑
-(void)bianjiclick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"编辑"]) {
        
        [_bianjibtn setTitle:@"完成" forState:UIControlStateNormal];
        [_tableview reloadData];
        
    }
    else{
        
        [_bianjibtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_tableview reloadData];

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
