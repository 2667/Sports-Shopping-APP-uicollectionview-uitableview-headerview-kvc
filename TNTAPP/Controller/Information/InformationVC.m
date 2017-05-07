//
//  InformationVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/19.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "InformationVC.h"
#import "XiaoXiLieBiaoCell.h"
#import "NSString+PinYin.h"
#import "LiaoTianJieMianVC.h"
#import "TianJiaHaoYouVC.h"

@interface InformationVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _xiaoxitableview;
 
    UITableView * _haoyoutableview;
    NSMutableArray * _haoyoushujuyuan;
    
    UIView * _caidanview;
    

}

@end

@implementation InformationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _haoyoushujuyuan = [[NSMutableArray alloc] init];
    
    
    NSArray *array = @[@"啊芳", @"彪哥", @"小陈", @"陈阿敏", @"小九月", @"罗志祥", @"刘德华", @"罗中旭", @"何炅", @"谢娜", @"杜海涛", @"李维嘉", @"赵薇", @"林心如", @"霍建华", @"陈坤", @"韩庚", @"汪涵", @"大张伟", @"钱枫", @"小五", @"马云", @"安以轩", @"大S",@"小S",@"周杰伦",@"蔡康永"];
    _haoyoushujuyuan = [[array arrayWithPinYinFirstLetterFormat]mutableCopy];
    
    
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
    
    
    
    UISegmentedControl * _segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"消息",@"好友", nil]];
    _segment.frame = CGRectMake(APPwidth/2-60, 26, 120, 30);
    _segment.selectedSegmentIndex = 0;
    _segment.tintColor = [UIColor colorWithRed:63/255.0 green:70/255.0 blue:78/255.0 alpha:1.0];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,  [UIFont systemFontOfSize:16],UITextAttributeFont ,[UIColor orangeColor],UITextAttributeTextShadowColor ,nil];
    [_segment setTitleTextAttributes:dic forState:UIControlStateSelected];
    
    NSDictionary *dics = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil];
    [_segment setTitleTextAttributes:dics forState:UIControlStateNormal];
    
    [_segment addTarget:self action:@selector(qiehuan:) forControlEvents:UIControlEventValueChanged];
    [daohan addSubview:_segment];
    

    
    
    UIButton *  jiabtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-30, 29.5, 25, 25)];
    [jiabtn setImage:[UIImage imageNamed:@"xiaoxi_gengduo"] forState:UIControlStateNormal];
    [jiabtn addTarget:self action:@selector(jiaclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:jiabtn];
    

    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    
    //*************消息列表*****************
    _xiaoxitableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _xiaoxitableview.delegate = self;
    _xiaoxitableview.dataSource = self;
    _xiaoxitableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_xiaoxitableview];

    
    
    //*************好友列表*****************
    _haoyoutableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _haoyoutableview.delegate = self;
    _haoyoutableview.dataSource = self;
    _haoyoutableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_haoyoutableview];
    _haoyoutableview.hidden = YES;
    _haoyoutableview.sectionIndexColor = WenZiHeiColor;


    
    //*************下拉菜单*****************
    _caidanview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _caidanview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_caidanview];
    _caidanview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [_caidanview addGestureRecognizer:tap];
    
    
    
    UIView * caidanview2 = [[UIView alloc] initWithFrame:CGRectMake(APPwidth-105, 70, 100, 100)];
    caidanview2.backgroundColor = [UIColor colorWithRed:63/255.0 green:70/255.0 blue:78/255.0 alpha:1.0];
    caidanview2.layer.cornerRadius = 3;
    caidanview2.layer.masksToBounds = YES;
    [_caidanview addSubview:caidanview2];
    
    
    NSArray * array1 = @[@"添加好友",@"扫一扫"];
    NSArray * array2 = @[@"xiaoxi_tianjiahaoyou",@"xiaoxi_saoyisao"];
    for (int i = 0; i < array1.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 50*i, 80, 50)];
        [btn setTitle:array1[i] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(caidanclick:) forControlEvents:UIControlEventTouchUpInside];
        [caidanview2 addSubview:btn];
        
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 17.5, 15, 15)];
        imgv.image = [UIImage imageNamed:array2[i]];
        [btn addSubview:imgv];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 50)];
        label.text = array1[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = 1;
        [btn addSubview:label];
        
        if (i == 0) {
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 49, btn.frame.size.width, 1)];
            imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
            [btn addSubview:imgv];
        }
    }
    

}




#pragma mark - 点击加号
-(void)jiaclick
{
    _caidanview.hidden = NO;

}



#pragma mark - 消息和好友之间的切换
-(void)qiehuan:(UISegmentedControl *)seg{
  
    if (seg.selectedSegmentIndex == 0) {
        
        _xiaoxitableview.hidden = NO;
        _haoyoutableview.hidden = YES;

    }
    else{
        
        _xiaoxitableview.hidden = YES;
        _haoyoutableview.hidden = NO;
    }
    
}


#pragma mark - 下拉菜单点击
-(void)caidanclick:(UIButton *)btn
{
    _caidanview.hidden = YES;

    if ([btn.titleLabel.text isEqualToString:@"添加好友"]) {
       
        TianJiaHaoYouVC * tjhy = [[TianJiaHaoYouVC alloc] init];
        [self.navigationController pushViewController:tjhy animated:YES];
        
    }
    else{
        
        
    }
}



#pragma mark - 隐藏下拉菜单
-(void)dealTap
{
    _caidanview.hidden = YES;
}



#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _xiaoxitableview) {
        
        return 20;

    }
    else{
        
        NSDictionary *dict = _haoyoushujuyuan[section];
        NSMutableArray *array = dict[@"content"];
        return [array count];

    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView == _xiaoxitableview) {
        
        return 1;
        
    }
    else{
        return _haoyoushujuyuan.count;
    }
}


//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    
    XiaoXiLieBiaoCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[XiaoXiLieBiaoCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    

    if (tableView == _xiaoxitableview) {
        
        
        cell.touxiang.layer.cornerRadius = 5;
        cell.touxiang.layer.masksToBounds = YES;
        cell.touxiang.backgroundColor = [UIColor orangeColor];
        
        
        cell.name.text = @"爱笑的云";
        cell.name.textColor = WenZiHeiColor;
        cell.name.font = [UIFont systemFontOfSize:16];
        cell.name.textAlignment = 0;
        
        
        cell.shijian.text = @"早上 06:32";
        cell.shijian.textColor = WenZiQiangHueiColor;
        cell.shijian.font = [UIFont systemFontOfSize:12];
        cell.shijian.textAlignment = 2;
        
        
        
        cell.neirong.text = @"在吗？ 有事找你";
        cell.neirong.textColor = WenZiQiangHueiColor;
        cell.neirong.font = [UIFont systemFontOfSize:12];
        cell.neirong.textAlignment = 0;
        
        
        
        cell.shuliang.text = @"12";
        cell.shuliang.textColor = [UIColor whiteColor];
        cell.shuliang.font = [UIFont systemFontOfSize:10];
        cell.shuliang.textAlignment = 1;
        cell.shuliang.backgroundColor = [UIColor redColor];
        cell.shuliang.layer.cornerRadius = 10;
        cell.shuliang.layer.masksToBounds = YES;
        
        
        cell.xian.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        
        
      
    }
    else{
        
        NSDictionary *dict = _haoyoushujuyuan[indexPath.section];
        NSMutableArray *array = dict[@"content"];

        
        cell.touxiang.layer.cornerRadius = 5;
        cell.touxiang.layer.masksToBounds = YES;
        cell.touxiang.backgroundColor = [UIColor orangeColor];
        
        
        cell.name.text = array[indexPath.row];
        cell.name.textColor = WenZiHeiColor;
        cell.name.font = [UIFont systemFontOfSize:16];
        cell.name.textAlignment = 0;
        CGRect fram = cell.name.frame;
        fram.origin.y = 35-cell.name.frame.size.height/2;
        cell.name.frame = fram;

        cell.xian.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];

        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LiaoTianJieMianVC * liaotian = [[LiaoTianJieMianVC alloc] init];

    if (tableView == _xiaoxitableview) {
        
        liaotian.biaoting = @"爱笑的云";
    }
    else
    {
        NSDictionary *dict = _haoyoushujuyuan[indexPath.section];
        NSMutableArray *array = dict[@"content"];
        liaotian.biaoting = array[indexPath.row];
    }
    
    [self.navigationController pushViewController:liaotian animated:YES];

}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == _haoyoutableview) {
        NSDictionary *dict = _haoyoushujuyuan[section];
        NSString *title = dict[@"firstLetter"];
               return title;

    }
    
   
    
    return nil;
    
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == _haoyoutableview) {
       
        NSMutableArray *resultArray = [NSMutableArray array];
        for (NSDictionary *dict in _haoyoushujuyuan) {
            NSString *title = dict[@"firstLetter"];
            [resultArray addObject:title];
        }
        return resultArray;
    }
    return nil;

}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    
    //以下e.g.实现了将索引0对应到section 1里。其他的正常对应。
    
    //    if (index == 0) {
    //        return 1;
    //    }
    //    return index;
    
    if (tableView == _haoyoutableview) {
        return index;

    }
    
    return nil;

}



//左滑出现删除按钮
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _xiaoxitableview) {
        return YES;

    }
    return NO;
}

//执行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //        [self.RoomNames removeObjectAtIndex:indexPath.row];         // Delete the row from the data source.
        //        [self.MainTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


/**
 *  修改Delete按钮文字为“删除”
 */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
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
