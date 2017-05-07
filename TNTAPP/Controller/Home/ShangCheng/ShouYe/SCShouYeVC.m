//
//  SCShouYeVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/5.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCShouYeVC.h"
#import "SCShouYeCell.h"
#import "SCXiangQingVC.h"
#import "SCShangPingLieBiaoVC.h"
#import "SCGouWuCheVC.h"
#import "SCDingDanVC.h"
#import "SCXXVC.h"


@interface SCShouYeVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITextField * _sousuotext;
    UIScrollView * _zhengscrollview;
    UIView * _yidongtiao;
   
    UITableView * _jijiangshangxiantablev;

   
    UIView * _sousuoview;
    BOOL _sousuobool;
}

@end

@implementation SCShouYeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _sousuobool = YES;

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
    [sousuobtn addTarget:self action:@selector(sousuoclick) forControlEvents:UIControlEventTouchUpInside];
    [sousuobtn setImage:[UIImage imageNamed:@"Mall_shouye_search"] forState:0];
    [sskuan addSubview:sousuobtn];


    
    UIButton *  xiaoxibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 26, 30, 30)];
    [xiaoxibtn addTarget:self action:@selector(xiaoxiclick:) forControlEvents:UIControlEventTouchUpInside];
    [xiaoxibtn setImage:[UIImage imageNamed:@"mall_xiangqing_more"] forState:0];
    [xiaoxibtn setImage:[UIImage imageNamed:@"mall_xiangqing_more-diandian"] forState:UIControlStateSelected];
    [daohan addSubview:xiaoxibtn];
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    
#if 1
    //***********************轮播图******************************
    UIScrollView * lbtscview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 180)];
    lbtscview.backgroundColor = [UIColor whiteColor];
    lbtscview.showsHorizontalScrollIndicator = NO;
    lbtscview.showsVerticalScrollIndicator = NO;
    lbtscview.bounces = NO;
    [_zhengscrollview addSubview:lbtscview];

    for (int i = 0; i < 3; i++) {
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth*i, 0, APPwidth, lbtscview.frame.size.height)];
        imgv.image = [UIImage imageNamed:@"shouyexiaotu3"];
        [lbtscview addSubview:imgv];
    }
    
    //***********************秒杀******************************
    UIView * miaoshaview = [[UIView alloc] initWithFrame:CGRectMake(0, lbtscview.frame.origin.y+lbtscview.frame.size.height+5, APPwidth, 340)];
    [_zhengscrollview addSubview:miaoshaview];
    
    UIImage * mximg = [UIImage imageNamed:@"Mall_shouye_titleBJ"];
    UIImageView * mxtoubuimgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPwidth/mximg.size.width*mximg.size.height)];
    mxtoubuimgv.image = mximg;
    [miaoshaview addSubview:mxtoubuimgv];
    
    
    UIView * miaoshadise = [[UIView alloc] initWithFrame:CGRectMake(0, mxtoubuimgv.frame.origin.y+mxtoubuimgv.frame.size.height+5, APPwidth, 275)];
    miaoshadise.backgroundColor= [UIColor whiteColor];
    [miaoshaview addSubview:miaoshadise];
    float x = 10;
    float y = 5;
    for (int i = 0 ; i< 4; i++) {
        
        if (i== 2) {
        
            x = 10;
            y = y + 135;
        }
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, (APPwidth-25)/2, 130)];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [[UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1.0] CGColor];
        [btn addTarget:self action:@selector(mxclick:)forControlEvents:UIControlEventTouchUpInside];
        [miaoshadise addSubview:btn];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 90, 30)];
        label.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        [btn addSubview:label];
        

        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, label.frame.origin.y+label.frame.size.height+8, 100, 20)];
        label1.text = @"奢华如斯";
        label1.font = [UIFont systemFontOfSize:14];
        label1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        [btn addSubview:label1];
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, label1.frame.origin.y+label1.frame.size.height, btn.frame.size.width/2, 20)];
        label2.text = @"无法惊扰的格调";
        label2.font = [UIFont systemFontOfSize:10];
        label2.textColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0];
        [btn addSubview:label2];

        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, label2.frame.origin.y+label2.frame.size.height+8, 50, 25)];
        label3.text = @"￥90";
        label3.layer.cornerRadius = 12.5;
        label3.layer.masksToBounds = YES;
        label3.textAlignment = NSTextAlignmentCenter;
        label3.textColor = [UIColor whiteColor];
        label3.backgroundColor = [UIColor colorWithRed:255/255.0 green:37/255.0 blue:94/255.0 alpha:1.0];
        label3.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label3];
        

        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width-(btn.frame.size.width/2-10), btn.frame.size.height/2-(btn.frame.size.width/2-10)/2+15, btn.frame.size.width/2-10, btn.frame.size.width/2-10)];
        imgv.image = [UIImage imageNamed:@"QQ20170205-151635"];
        [btn addSubview:imgv];
        

        
        x = x + (APPwidth-25)/2+5;
        
    }
    
    CGRect fram1 = miaoshaview.frame;
    fram1.size.height = miaoshadise.frame.origin.y+miaoshadise.frame.size.height+5;
    miaoshaview.frame = fram1;
    
    //***********************精选商品******************************
    UIView * jingxuanview = [[UIView alloc] initWithFrame:CGRectMake(0, miaoshaview.frame.origin.y+miaoshaview.frame.size.height+5, APPwidth, 510)];
    [_zhengscrollview addSubview:jingxuanview];
    

    UIImage * jximg = [UIImage imageNamed:@"Mall_shouye_titleBJ2"];
    UIImageView * jxtoubuimgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPwidth/jximg.size.width*jximg.size.height)];
    jxtoubuimgv.image = jximg;
    [jingxuanview addSubview:jxtoubuimgv];
    
    
    UIImageView * jxhaibao = [[UIImageView alloc] initWithFrame:CGRectMake(10, jxtoubuimgv.frame.origin.y+jxtoubuimgv.frame.size.height+5, APPwidth-20, 120)];
    jxhaibao.image = [UIImage imageNamed:@"shouyexiaotu4"];
    [jingxuanview addSubview:jxhaibao];
    
    UIView * jxdise = [[UIView alloc] initWithFrame:CGRectMake(0, jxhaibao.frame.origin.y+jxhaibao.frame.size.height+5, APPwidth, 260)];
    jxdise.backgroundColor= [UIColor whiteColor];
    [jingxuanview addSubview:jxdise];
    
    for (int i = 0 ; i< 3; i++) {
        
        if (i == 0) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, APPwidth/2-30, 240)];
            [btn addTarget:self action:@selector(jinxuanclick:) forControlEvents:1<<6];
            [jxdise addSubview:btn];
            
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
            label1.text = @"奢华如斯";
            label1.font = [UIFont systemFontOfSize:20];
            label1.textColor = [UIColor colorWithRed:255/255.0 green:112/255.0 blue:94/255.0 alpha:1.0];
            [btn addSubview:label1];
            
            
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, label1.frame.origin.y+label1.frame.size.height+10, btn.frame.size.width-15, 20)];
            label2.text = @"无法惊扰的格调";
            label2.font = [UIFont systemFontOfSize:16];
            label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
            [btn addSubview:label2];
            
            UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, label2.frame.origin.y+label2.frame.size.height+15, 50, 25)];
            label3.text = @"GO";
            label3.layer.cornerRadius = 12.5;
            label3.layer.masksToBounds = YES;
            label3.textAlignment = NSTextAlignmentCenter;
            label3.textColor = [UIColor whiteColor];
            label3.backgroundColor = [UIColor colorWithRed:255/255.0 green:112/255.0 blue:94/255.0 alpha:1.0];
            [btn addSubview:label3];
            
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width-(btn.frame.size.width/2+50), btn.frame.size.height-(btn.frame.size.width/2+40), btn.frame.size.width/2+40, btn.frame.size.width/2+40)];
            imgv.image = [UIImage imageNamed:@"QQ20170205-151635"];
            [btn addSubview:imgv];
            
            
            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(btn.frame.size.width-1, 0, 1, btn.frame.size.height)];
            xian.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
            [btn addSubview:xian];
           
        }
        
        if (i != 0) {
        
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-30, 120*(i-1)+10, APPwidth-(APPwidth/2-30)-10, 120)];
            [btn addTarget:self action:@selector(jinxuanclick:) forControlEvents:1<<6];
            [jxdise addSubview:btn];
            
            
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
            label1.text = @"奢华如斯";
            label1.font = [UIFont systemFontOfSize:16];
            label1.textColor = [UIColor colorWithRed:255/255.0 green:85/255.0 blue:142/255.0 alpha:1.0];
            [btn addSubview:label1];
            
            
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, label1.frame.origin.y+label1.frame.size.height, btn.frame.size.width/2, 20)];
            label2.text = @"无法惊扰的格调";
            label2.font = [UIFont systemFontOfSize:12];
            label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
            [btn addSubview:label2];
            
            UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, label2.frame.origin.y+label2.frame.size.height+8, 50, 25)];
            label3.text = @"GO";
            label3.layer.cornerRadius = 12.5;
            label3.layer.masksToBounds = YES;
            label3.textAlignment = NSTextAlignmentCenter;
            label3.textColor = [UIColor whiteColor];
            label3.backgroundColor = [UIColor colorWithRed:255/255.0 green:85/255.0 blue:142/255.0 alpha:1.0];
            [btn addSubview:label3];
            
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width-(btn.frame.size.width/2-10), btn.frame.size.height/2-(btn.frame.size.width/2-10)/2, btn.frame.size.width/2-10, btn.frame.size.width/2-10)];
            imgv.image = [UIImage imageNamed:@"QQ20170205-151635"];
            [btn addSubview:imgv];
            
            

            
            if (i == 1) {
                
                label1.textColor = [UIColor colorWithRed:75/255.0 green:112/255.0 blue:248/255.0 alpha:1.0];
                label3.backgroundColor = [UIColor colorWithRed:75/255.0 green:112/255.0 blue:248/255.0 alpha:1.0];

                UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 119, btn.frame.size.width, 1)];
                xian.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
                [btn addSubview:xian];
                
 
            }
            
        }
        
        
    }

    UIButton * jxgenduobtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-50, jxdise.frame.origin.y+jxdise.frame.size.height+15, 100, 30)];
    [jxgenduobtn setTitle:@"查看更多" forState:0];
    [jxgenduobtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:0];
    jxgenduobtn.titleLabel.font = [UIFont systemFontOfSize:14];
    jxgenduobtn.layer.cornerRadius = 10;
    jxgenduobtn.layer.masksToBounds = YES;
    jxgenduobtn.layer.borderWidth = 1;
    jxgenduobtn.layer.borderColor = [[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] CGColor];
    [jxgenduobtn addTarget:self action:@selector(chakangenduo) forControlEvents:1<<6];
    [jingxuanview addSubview:jxgenduobtn];
    
    
    CGRect fram2 = jingxuanview.frame;
    fram2.size.height = jxgenduobtn.frame.origin.y+jxgenduobtn.frame.size.height+15;
    jingxuanview.frame = fram2;
    
    //***********************即将上线******************************
    UIImage * jjimg = [UIImage imageNamed:@"Mall_shouye_titleBJ3"];
    UIImageView * jjtoubuimgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, jingxuanview.frame.origin.y+jingxuanview.frame.size.height, APPwidth, APPwidth/jjimg.size.width*jjimg.size.height)];
    jjtoubuimgv.image = jjimg;
    [_zhengscrollview addSubview:jjtoubuimgv];
    
    
    CGRect fram = _zhengscrollview.frame;
    fram.size.height = jjtoubuimgv.frame.origin.y+jjtoubuimgv.frame.size.height;
    _zhengscrollview.frame = fram;
    _zhengscrollview.contentSize = CGSizeMake(0, jjtoubuimgv.frame.origin.y+jjtoubuimgv.frame.size.height);

    
    _jijiangshangxiantablev = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _jijiangshangxiantablev.delegate = self;
    _jijiangshangxiantablev.dataSource = self;
    _jijiangshangxiantablev.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_jijiangshangxiantablev];
    _jijiangshangxiantablev.tableHeaderView = _zhengscrollview;


    NSArray * array = @[@"Mall_shouye_cart-1",@"Mall_shouye_ding",@"Mall_shouye_shang"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, APPheight-150+40*i+10*i, 40, 40)];
        [btn setImage:[UIImage imageNamed:array[i]] forState:0];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        btn.tag = 5440+i;
        [self.view addSubview:btn];
        
    }
    
   
#endif
 
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
    SCShouYeCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCShouYeCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
   
    
    cell.datu.image = [UIImage imageNamed:@"shouyexiaotu3"];
    
    cell.dikuan.image = [UIImage imageNamed:@"Mall_shouye_diban"];
  
    cell.datudise.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];

    cell.shijian.text = @"今晚20:00开售";
    cell.shijian.textAlignment = NSTextAlignmentCenter;
    cell.shijian.textColor = [UIColor whiteColor];
    cell.shijian.font = [UIFont systemFontOfSize:20];
    
   
    cell.biaoting.text = @"自然堂补水护肤品专场";
    cell.biaoting.textAlignment = NSTextAlignmentCenter;
    cell.biaoting.textColor = [UIColor whiteColor];
    cell.biaoting.font = [UIFont systemFontOfSize:14];

    
    cell.kaishou.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    cell.kaishou.layer.cornerRadius = 15;
    cell.kaishou.layer.masksToBounds = YES;
    [cell.kaishou setTitle:@"开售提醒" forState:0];
    [cell.kaishou setTitleColor:[UIColor whiteColor] forState:0];
    cell.kaishou.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    cell.kaishou.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
    
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


#pragma mark - 查看更多
-(void)chakangenduo
{
    SCShangPingLieBiaoVC * splb = [[SCShangPingLieBiaoVC alloc] init];
    [self.navigationController pushViewController:splb animated:YES];
}

#pragma mark - 秒杀商品点击
-(void)mxclick:(UIButton *)btn
{
    SCXiangQingVC * scxq = [[SCXiangQingVC alloc] init];
    [self.navigationController pushViewController:scxq animated:YES];
}

#pragma mark - 精选商品点击
-(void)jinxuanclick:(UIButton *)btn
{
    SCXiangQingVC * scxq = [[SCXiangQingVC alloc] init];
    [self.navigationController pushViewController:scxq animated:YES];
}

#pragma mark - 点击消息
-(void)xiaoxiclick:(UIButton *)btn
{

    SCXXVC * scxx = [[SCXXVC alloc] init];
    scxx.biaoting = @"商城消息";
    [self.navigationController pushViewController:scxx animated:YES];
    

}

#pragma mark - 点击搜索
-(void)sousuoclick
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
        case 5440:
        {
            SCGouWuCheVC * gwc = [[SCGouWuCheVC alloc] init];
            [self.navigationController pushViewController:gwc animated:YES];
        }
            break;
            
            //订单
        case 5441:
        {
            
            SCDingDanVC * dd = [[SCDingDanVC alloc] init];
            [self.navigationController pushViewController:dd animated:YES];
        }
            break;

            
            //回到顶部
        case 5442:
        {
            [UIView animateWithDuration:0.2 animations:^{
                
                CGPoint point =  _jijiangshangxiantablev.contentOffset;
                point.y = 0;
                _jijiangshangxiantablev.contentOffset = point;
                
            }];
            

        }
            break;

            
        default:
            break;
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
