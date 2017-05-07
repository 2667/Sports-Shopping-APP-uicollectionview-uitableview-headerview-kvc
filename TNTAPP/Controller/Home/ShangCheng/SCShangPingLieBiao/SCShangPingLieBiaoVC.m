//
//  SCShangPingLieBiaoVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/9.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCShangPingLieBiaoVC.h"
#import "SCShangPingLieBiaoCell.h"
#import "SCXiangQingVC.h"
#import "SCGouWuCheVC.h"
#import "SCDingDanVC.h"
#import "SCXXVC.h"


@interface SCShangPingLieBiaoVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>
{
    UITextField * _sousuotext;
    UIView * _sousuoview;

    
    UICollectionView * _collectionView;

}

@end

@implementation SCShangPingLieBiaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    
    [self zdydhl];
    
    [self zdyUI];
    
    [self zdysousuoui];

}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = @"商品列表";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    

#if 0
    UIView * sskuan = [[UIView alloc] initWithFrame:CGRectMake(60, 26, APPwidth-120, 30)];
    sskuan.backgroundColor = [UIColor whiteColor];
    sskuan.layer.cornerRadius =15;
    sskuan.layer.masksToBounds = YES;
    [daohan addSubview:sskuan];
    
    _sousuotext = [[UITextField alloc] initWithFrame:CGRectMake(10, 5, sskuan.frame.size.width-50, 20)];
    _sousuotext.placeholder = @"请输入关键词";
    _sousuotext.textColor = [UIColor blackColor];
    _sousuotext.font = [UIFont systemFontOfSize:14];
    _sousuotext.autocorrectionType = UITextAutocorrectionTypeNo;
    _sousuotext.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _sousuotext.delegate = self;
    [sskuan addSubview:_sousuotext];
    
    
    
    UIButton *  sousuobtn = [[UIButton alloc] initWithFrame:CGRectMake(sskuan.frame.size.width-35, 5, 20, 20)];
    [sousuobtn addTarget:self action:@selector(sousuo) forControlEvents:UIControlEventTouchUpInside];
    [sousuobtn setImage:[UIImage imageNamed:@"Mall_shouye_search"] forState:0];
    
    [sskuan addSubview:sousuobtn];
#endif
    
    UIButton *  xiaoxibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 26, 30, 30)];
    [xiaoxibtn addTarget:self action:@selector(xiaoxiclick) forControlEvents:UIControlEventTouchUpInside];
    [xiaoxibtn setImage:[UIImage imageNamed:@"mall_xiangqing_more"] forState:0];
    [xiaoxibtn setImage:[UIImage imageNamed:@"mall_xiangqing_more-diandian"] forState:UIControlStateSelected];
    [daohan addSubview:xiaoxibtn];

    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    //*********************************商品列表******************************************
    float cvx = (APPwidth-30)/2;
    
    //先创建UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //修改item大小
    layout.itemSize = CGSizeMake(cvx, cvx+85);
    //上下左右偏移
    layout.sectionInset = UIEdgeInsetsMake(0, 8, 8, 8);
    //左右两个item的最小间距
    layout.minimumInteritemSpacing = 8;
    //上下两个item的最小间距
    layout.minimumLineSpacing = 10;
    //滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    //分类collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    //注册collectionView
    [_collectionView registerClass:[SCShangPingLieBiaoCell class] forCellWithReuseIdentifier:@"Cell"];
    
    
    
    NSArray * array = @[@"Mall_shouye_cart-1",@"Mall_shouye_ding",@"Mall_shouye_shang"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, APPheight-150+40*i+10*i, 40, 40)];
        [btn setImage:[UIImage imageNamed:array[i]] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        btn.tag = 5450+i;
        [self.view addSubview:btn];
        
    }


}


#pragma mark - 创建搜索界面
-(void)zdysousuoui
{
    
    _sousuoview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, APPheight-64)];
    _sousuoview.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:_sousuoview];
    
    
    UILabel * label  =[[UILabel alloc] initWithFrame:CGRectMake(15, 20, APPwidth-30, 30)];
    label.text = @"热搜";
    label.textColor = [UIColor blackColor];
    [_sousuoview addSubview:label];
    
    
    NSArray * array = @[@"时尚女装",@"半身裙",@"2017夏季新款",@"美白补水面膜",@"便捷书桌",@"自然堂",@"固态硬盘",@"碎花连衣裙"];
    
    
    float x = 15;
    float y = label.frame.origin.y+label.frame.size.height+20;
    
    for (int i = 0; i < array.count; i++) {
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, 40, 20)];
        label.text = array[i];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor clearColor];
        [_sousuoview addSubview:label];
        [label sizeToFit];
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width+20, label.frame.size.height+15)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.layer.cornerRadius = (label.frame.size.height+15)/2;
        btn.layer.masksToBounds = YES;
        //        [btn addTarget:self action:@selector(xuanzhe:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_sousuoview addSubview:btn];
        
        
        
        if (btn.frame.origin.x+btn.frame.size.width>APPwidth-5) {
            
            CGRect fram = btn.frame;
            fram.origin.y = btn.frame.origin.y+btn.frame.size.height+10;
            fram.origin.x = 15;
            btn.frame = fram;
            
            
            y =  btn.frame.origin.y;
            
            
        }
        
        
        x = btn.frame.origin.x+btn.frame.size.width+20;
        
        
        
    }
    
}



#pragma mark -  UICollectionView
//每个分区有多少个Item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 10;
    
}


//Item的显示内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SCShangPingLieBiaoCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    

    cell.dise.backgroundColor = [UIColor whiteColor];
    cell.dise.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.dise.layer.shadowOffset = CGSizeMake(4,4);
    cell.dise.layer.shadowOpacity = 0.1;
    cell.dise.layer.shadowRadius = 6;

    
    cell.tupian.image = [UIImage imageNamed:@"QQ20170206-135925"];
    
    cell.biaoting.text = @"商品名称商品名称商品名称商品名称商品";
    cell.biaoting.textColor = [UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0];
    cell.biaoting.numberOfLines = 2;
    cell.biaoting.font = [UIFont systemFontOfSize:14];
    
    
    cell.jiage.text = @"¥99.00";
    cell.jiage.textColor = [UIColor blackColor];
    cell.jiage.font = [UIFont systemFontOfSize:18];
    
    
    cell.gwc.image = [UIImage imageNamed:@"Mall_shouye_cart"];
    
    return cell;
}




-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SCXiangQingVC * scxq = [[SCXiangQingVC alloc] init];
    [self.navigationController pushViewController:scxq animated:YES];
}



//段头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(APPwidth, 10);
}


#pragma mark - ****************UITextField代理方法*************
#pragma mark - 点击Return隐藏键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - text开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect fram = _sousuoview.frame;
        fram.origin.y = 64;
        _sousuoview.frame = fram;
        
    }];
    
}

#pragma mark - 结束编辑

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect fram = _sousuoview.frame;
        fram.origin.y = APPheight;
        _sousuoview.frame = fram;
        
    }];
    
}



#pragma mark - 搜索
-(void)sousuo
{
    [_sousuotext resignFirstResponder];
    
    NSLog(@"点击搜索");
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect fram = _sousuoview.frame;
        fram.origin.y = APPheight;
        _sousuoview.frame = fram;
        
    }];
    

    
    SCShangPingLieBiaoVC * splb = [[SCShangPingLieBiaoVC alloc] init];
    [self.navigationController pushViewController:splb animated:YES];
    
}



#pragma mark - 底部按钮点击
-(void)btnclick:(UIButton *)btn
{
    switch (btn.tag) {
            
            
            //购物车
        case 5450:
        {
            SCGouWuCheVC * gwc = [[SCGouWuCheVC alloc] init];
            [self.navigationController pushViewController:gwc animated:YES];
        }
            break;
            
            //订单
        case 5451:
        {
            
            SCDingDanVC * dd = [[SCDingDanVC alloc] init];
            [self.navigationController pushViewController:dd animated:YES];
        }
            break;
            
            
            //回到顶部
        case 5452:
        {
            [UIView animateWithDuration:0.2 animations:^{
                
                CGPoint point = _collectionView.contentOffset;
                point.y = 0;
                _collectionView.contentOffset = point;
                
            }];
            
            
        }
            break;
            
            
        default:
            break;
    }
    
}


#pragma mark - 点击消息
-(void)xiaoxiclick
{
    
    SCXXVC * scxx = [[SCXXVC alloc] init];
    scxx.biaoting = @"商城消息";
    [self.navigationController pushViewController:scxx animated:YES];
    
    
    
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
