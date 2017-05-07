//
//  SCXiangQingVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/6.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCXiangQingVC.h"
#import "SCFanKueiVC.h"
#import "SCGouWuCheVC.h"
#import "SCTJDDVC.h"
#import "SCPJCell.h"
#import "SCXXVC.h"


@interface SCXiangQingVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
{
    UIView * _daohan;
    UIView * _caidanview;
    int _lei;

    UIScrollView * _zhengscrollview;

    UIView * _xiangqingview;
    UIWebView * _xiangqingwebview;


    
    UIView * _pinjiaview;
    UITableView * _pinjiatableview;
    UITableView * _tableview;//商品信息下的评论列表

    
    //*******规格******
    UIView * _gueigeview;
    UIView * _ggview;
    UIButton * _goumeibtn;
    UILabel * _shulianlabel;
    int _shuliang;
    NSArray * _yansearray;
    NSArray * _chimaarray;
    UILabel * _gueigelabel;

    
    
    UIView * _fenxiangview;
    UIView * _fenxiangtubiaoview;

}

@end

@implementation SCXiangQingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.view.backgroundColor = [UIColor whiteColor];
  
    _shuliang = 1;
    
    _lei = 1;
    
    [self zdyUI];

    [self zdyPJ];
    
    [self zdyXQ];
    
    [self zdydaohan];
    
    [self zdydibu];
    
    [self zdygueigeui];
    
    [self zdyfenxiang];
    
}

#pragma mark - 自定义导航
-(void)zdydaohan
{
    //**************顶部导航****************************
    _daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    [self.view addSubview:_daohan];
    
    UIView * dise = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 20)];
    dise.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_daohan addSubview:dise];
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 26, 30, 30)];
    [fanhueibtn setImage:[UIImage imageNamed:@"mall_xiangqing_fanhui"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [_daohan addSubview:fanhueibtn];
    
    NSArray * array = @[@"商品",@"详情",@"评价"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth/2-120)+80*i, 20, 80, 44)];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0] forState:0];
        [_daohan addSubview:btn];
        btn.contentHorizontalAlignment = 0;
        [btn addTarget:self action:@selector(xuanzhetian:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 5000+i;
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        
        if (btn.tag == 5000) {
            
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
            
        }
        
        
        
    }
    
    
    UIButton *  genduobtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 26, 30, 30)];
    [genduobtn addTarget:self action:@selector(genduolick) forControlEvents:UIControlEventTouchUpInside];
    [genduobtn setImage:[UIImage imageNamed:@"mall_xiangqing_gengduo"] forState:0];
    [_daohan addSubview:genduobtn];
    

    //*************菜单*****************
    _caidanview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _caidanview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_caidanview];
    _caidanview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [_caidanview addGestureRecognizer:tap];

    
    
    UIView * caidanview2 = [[UIView alloc] initWithFrame:CGRectMake(APPwidth-125, 70, 120, 150)];
    caidanview2.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    caidanview2.layer.cornerRadius = 8;
    caidanview2.layer.masksToBounds = YES;
    [_caidanview addSubview:caidanview2];
    

    NSArray * array1 = @[@"信息",@"分享",@"反馈"];
    NSArray * array2 = @[@"mall_xiangqing_new",@"mall_xiangqing_share",@"mall_xiangqing_fankui"];
    for (int i = 0; i < array1.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 50*i, 100, 50)];
        [btn setTitle:array1[i] forState:0];
        [btn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0  blue:153/255.0  alpha:1.0] forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setImage:[UIImage imageNamed:array2[i]] forState:0];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        [btn addTarget:self action:@selector(caidanclick:) forControlEvents:UIControlEventTouchUpInside];
        [caidanview2 addSubview:btn];

        if (i != 2) {
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 49, btn.frame.size.width, 1)];
            imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
            [btn addSubview:imgv];
        }
    }

}

#pragma mark - 自定义底部按钮
-(void)zdydibu
{
    //*************底部按钮****************************
    UIView * dibuview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-50, APPwidth, 50)];
    dibuview.backgroundColor = [UIColor colorWithRed:46/255.0 green:49/255.0 blue:54/255.0 alpha:1.0];
    [self.view addSubview:dibuview];
    
    NSArray * array2 = @[@"加入购物车",@"立即购买"];
    NSArray * array3 = @[@"Mall_shouye_cart",@"mall_xiangqing_kefu"];

    for (int i = 0; i < array2.count; i++) {
        
        UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(80*i, 0, 80, 50)];
        [btn1 setImage:[UIImage imageNamed:array3[i]] forState:0];
        [btn1 addTarget:self action:@selector(dibugwcrk:) forControlEvents:1<<6];
        btn1.tag = 5170+i;
        [dibuview addSubview:btn1];
        
        
        UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(160+(APPwidth-160)/2*i, 0, (APPwidth-160)/2, 50)];
        btn2.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        [btn2 setTitle:array2[i] forState:0];
        [btn2 setTitleColor:[UIColor whiteColor] forState:0];
        btn2.contentHorizontalAlignment = 0;
        btn2.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn2 addTarget:self action:@selector(dibuclick:) forControlEvents:1<<6];
        [dibuview addSubview:btn2];
        
        if (i == 1) {
            
            btn2.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
            
        }
    }
    
    

}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight-50)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    _zhengscrollview.delegate = self;
    [self.view addSubview:_zhengscrollview];
    
   
   //**************主图****************************
    UIImageView * _zutuimv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPwidth)];
    _zutuimv.image = [UIImage imageNamed:@"QQ20170206-135925"];
    [_zhengscrollview addSubview:_zutuimv];

    
    //**************标题 价格****************************
    UIView * biaotingview = [[UIView alloc] initWithFrame:CGRectMake(0, _zutuimv.frame.origin.y+_zutuimv.frame.size.height, APPwidth, 200)];
    biaotingview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:biaotingview];

    UILabel * biaotinglabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, APPwidth-20, 30)];
    biaotinglabel.text = @"自然堂 雪润洁面套装 美白补水 长效修复";
    biaotinglabel.textColor = [UIColor blackColor];
    biaotinglabel.font = [UIFont systemFontOfSize:16];
    [biaotingview addSubview:biaotinglabel];
    
    
    UILabel * jiagelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, biaotinglabel.frame.origin.y+biaotinglabel.frame.size.height, APPwidth/2-10, 30)];
    jiagelabel.textColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:62/255.0 alpha:1.0];
    jiagelabel.font = [UIFont systemFontOfSize:20];
    [biaotingview addSubview:jiagelabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"¥99.00-¥156.00"];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(3, 5)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(str.length-3, 3)];
    jiagelabel.attributedText = str;
    [jiagelabel sizeToFit];
    


    UILabel * yuanjialabel = [[UILabel alloc] initWithFrame:CGRectMake(jiagelabel.frame.origin.x, jiagelabel.frame.origin.y+jiagelabel.frame.size.height+5, jiagelabel.frame.size.width, 20)];
    yuanjialabel.font = [UIFont systemFontOfSize:14];
    yuanjialabel.textAlignment = 0;
    yuanjialabel.textColor = [UIColor colorWithRed:174/255.0 green:174/255.0 blue:174/255.0 alpha:1.0];
    NSString * zstr = @"¥199.00-456.00";
    NSDictionary *zhxDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *zhxStr = [[NSMutableAttributedString alloc]initWithString:zstr attributes:zhxDic];
    yuanjialabel.attributedText = zhxStr;
    [biaotingview addSubview:yuanjialabel];

    
    UILabel * xiaolianglabel = [[UILabel alloc] initWithFrame:CGRectMake(yuanjialabel.frame.origin.x+yuanjialabel.frame.size.width+5, yuanjialabel.frame.origin.y, APPwidth-yuanjialabel.frame.size.width-yuanjialabel.frame.origin.x-10, 20)];
    xiaolianglabel.font = [UIFont systemFontOfSize:14];
    xiaolianglabel.textAlignment = 0;
    xiaolianglabel.textColor = [UIColor colorWithRed:174/255.0 green:174/255.0 blue:174/255.0 alpha:1.0];
    xiaolianglabel.text = @"销量：1574";
    xiaolianglabel.textAlignment = 1;
    [biaotingview addSubview:xiaolianglabel];

    
    
    
    UILabel * Ubinlabel = [[UILabel alloc] initWithFrame:CGRectMake(jiagelabel.frame.origin.x+jiagelabel.frame.size.width+10, jiagelabel.frame.origin.y, 100, 30)];
    Ubinlabel.text = @"U币最高可减免10.00";
    Ubinlabel.textColor = [UIColor whiteColor];
    Ubinlabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:62/255.0 alpha:1.0];
    Ubinlabel.font = [UIFont systemFontOfSize:13];
    [biaotingview addSubview:Ubinlabel];
    [Ubinlabel sizeToFit];
    CGRect fram = Ubinlabel.frame;
    fram.origin.y = jiagelabel.frame.origin.y+jiagelabel.frame.size.height/2-10;
    fram.size.height = 20;
    fram.size.width = Ubinlabel.frame.size.width+8;
    Ubinlabel.frame = fram;
    Ubinlabel.textAlignment = 1;
    


#if 0
    UIImageView * djsview = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-150, 0, 140, shulianlabel.frame.origin.y+shulianlabel.frame.size.height-10)];
    djsview.image = [UIImage imageNamed:@"mall_xiangqing_tejiaBJ"];
    [biaotingview addSubview:djsview];

    
    UIImageView * xian1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, shulianlabel.frame.origin.y+shulianlabel.frame.size.height+10, APPwidth, 1)];
    xian1.image = [UIImage imageNamed:@"shouye-fengexian"];
    [biaotingview addSubview:xian1];
    
    
    UILabel * yunfeilabel = [[UILabel alloc] initWithFrame:CGRectMake(10, xian1.frame.origin.y+xian1.frame.size.height+10, 50, 20)];
    yunfeilabel.text = @"运费：0.00";
    yunfeilabel.textColor = [UIColor whiteColor];
    yunfeilabel.font = [UIFont systemFontOfSize:13];
    [yunfeilabel sizeToFit];
    [biaotingview addSubview:yunfeilabel];
    

    
    UILabel * xiaolianlabel = [[UILabel alloc] initWithFrame:CGRectMake(yunfeilabel.frame.origin.x+yunfeilabel.frame.size.width+30, yunfeilabel.frame.origin.y, 50, 20)];
    xiaolianlabel.text = @"月销量：2104笔";
    xiaolianlabel.textColor = [UIColor whiteColor];
    xiaolianlabel.font = [UIFont systemFontOfSize:13];
    [xiaolianlabel sizeToFit];
    [biaotingview addSubview:xiaolianlabel];
    
#endif

    UIImageView * xian2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, yuanjialabel.frame.origin.y+yuanjialabel.frame.size.height+10, APPwidth, 1)];
    xian2.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [biaotingview addSubview:xian2];
    
    NSArray * array3 = @[@"包邮",@"7天无条件退换",@"正品保障"];
    NSArray * tubiaoarray = @[@"mall_xiangqing_baoyou",@"mall_xiangqing_tuihuan",@"mall_xiangqing_baozhang"];

    float x = 10;
    for (int i = 0; i < array3.count; i++) {
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(x, xian2.frame.origin.y+11, 25, 25)];
        imv.image = [UIImage imageNamed:tubiaoarray[i]];
        [biaotingview addSubview:imv];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(imv.frame.origin.x+imv.frame.size.width+5, imv.frame.origin.y, 50, 25)];
        label.text = array3[i];
        label.textColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:130/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:14];
        [label sizeToFit];
        [biaotingview addSubview:label];

        CGRect fram = label.frame;
        fram.origin.y = imv.frame.origin.y+12.5-label.frame.size.height/2;
        label.frame = fram;
        
        x = label.frame.origin.x+label.frame.size.width+15;
        
        
    }
    CGRect fram2 = biaotingview.frame;
    fram2.size.height = xian2.frame.origin.y+45;
    biaotingview.frame = fram2;
    

    //**************运费****************************
    UILabel * yunfeilabel = [[UILabel alloc] initWithFrame:CGRectMake(0, biaotingview.frame.origin.y+biaotingview.frame.size.height+10, APPwidth, 50)];
    yunfeilabel.text = @"    运费：0.00";
    yunfeilabel.textColor = [UIColor colorWithRed:73/255.0 green:73/255.0 blue:73/255.0 alpha:1.0];
    yunfeilabel.font = [UIFont systemFontOfSize:16];
    yunfeilabel.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:yunfeilabel];

    
    //**************商城****************************
    UIView * shangchengview = [[UIView alloc] initWithFrame:CGRectMake(0, yunfeilabel.frame.origin.y+yunfeilabel.frame.size.height+10, APPwidth, 200)];
    shangchengview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:shangchengview];

    UIImageView * logoimg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    logoimg.backgroundColor = [UIColor orangeColor];
    [shangchengview addSubview:logoimg];
    
    UILabel * scnamelabel = [[UILabel alloc] initWithFrame:CGRectMake(logoimg.frame.origin.x+logoimg.frame.size.width+10, 15, 150, 20)];
    scnamelabel.text = @"呼来商城";
    scnamelabel.textColor = [UIColor blackColor];
    scnamelabel.font = [UIFont systemFontOfSize:16];
    [scnamelabel sizeToFit];
    [shangchengview addSubview:scnamelabel];
    
    UIImageView * xinjiimg = [[UIImageView alloc] initWithFrame:CGRectMake(scnamelabel.frame.origin.x, 47.5, 100, 15)];
    xinjiimg.backgroundColor = [UIColor orangeColor];
    [shangchengview addSubview:xinjiimg];
   
    UIImageView * xian3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, logoimg.frame.origin.y+logoimg.frame.size.height+10, APPwidth, 1)];
    xian3.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [shangchengview addSubview:xian3];

    NSArray * array4 = @[@"152",@"54821"];
    NSArray * array5 = @[@"全部宝贝",@"总销量"];
    for (int i = 0; i < array4.count; i++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i, xian3.frame.origin.y+11, APPwidth/2, 20)];
        label1.text = array4[i];
        label1.textColor = [UIColor colorWithRed:73/255.0 green:73/255.0 blue:73/255.0 alpha:1.0];
        label1.font = [UIFont systemFontOfSize:18];
        label1.textAlignment = NSTextAlignmentCenter;
        [shangchengview addSubview:label1];

        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i, label1.frame.origin.y+25, APPwidth/2, 20)];
        label2.text = array5[i];
        label2.textColor = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1.0];
        label2.font = [UIFont systemFontOfSize:15];
        label2.textAlignment = NSTextAlignmentCenter;
        [shangchengview addSubview:label2];
        
        
    }
    UIButton * scjinrubtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-60, xian3.frame.origin.y+76, 120, 35)];
    [scjinrubtn setTitle:@"进城逛逛" forState:0];
    [scjinrubtn setTitleColor:[UIColor whiteColor] forState:0];
    scjinrubtn.layer.cornerRadius = 8;
    scjinrubtn.layer.masksToBounds = YES;
    scjinrubtn.titleLabel.font = [UIFont systemFontOfSize:15];
    scjinrubtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [scjinrubtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [shangchengview addSubview:scjinrubtn];
    

    CGRect fram8 = shangchengview.frame;
    fram8.size.height = scjinrubtn.frame.origin.y+scjinrubtn.frame.size.height+10;
    shangchengview.frame = fram8;
    
    //**************评价****************************
    UIView * pinjiaview = [[UIView alloc] initWithFrame:CGRectMake(0, shangchengview.frame.origin.y+shangchengview.frame.size.height+10, APPwidth, 320)];
    pinjiaview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:pinjiaview];
    
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, pinjiaview.frame.size.height)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.bounces = NO;
    [pinjiaview addSubview:_tableview];
    
    
    UIView * toubuview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 50)];
    toubuview.backgroundColor = [UIColor whiteColor];
    
    UILabel * pjlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, APPwidth-30, 50)];
    pjlabel.text = @"宝贝评价（134）";
    pjlabel.textColor = WenZiHeiColor;
    pjlabel.font = [UIFont systemFontOfSize:18];
    pjlabel.textAlignment = 0;
    [toubuview addSubview:pjlabel];

    UIView * pjxian = [[UIView alloc] initWithFrame:CGRectMake(0, 49, APPwidth, 1)];
    pjxian.backgroundColor = TNTColor(238, 238, 238);
    [toubuview addSubview:pjxian];

    
    _tableview.tableHeaderView = toubuview;
    

    
    
    _zhengscrollview.contentSize = CGSizeMake(0, pinjiaview.frame.origin.y+pinjiaview.frame.size.height-40);

    
}

#pragma mark - 创建规格界面
-(void)zdygueigeui
{
    _gueigeview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _gueigeview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:_gueigeview];
    _gueigeview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ycgueigeui)];
    [_gueigeview addGestureRecognizer:tap];
    

    
    _ggview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight+40, APPwidth, 400)];
    _ggview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_ggview];
    

    UIImageView * _zhutuimgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, -40, 120, 120)];
    _zhutuimgv.backgroundColor = [UIColor orangeColor];
    _zhutuimgv.layer.borderWidth = 1;
    _zhutuimgv.layer.borderColor = [[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0] CGColor];
    _zhutuimgv.layer.cornerRadius = 3;
    _zhutuimgv.layer.masksToBounds = YES;
    _zhutuimgv.image = [UIImage imageNamed:@"QQ20170206-135925"];
    [_ggview addSubview:_zhutuimgv];
    
    
    NSArray * arrya = @[@"¥99.00—¥156.00",@"U币最高可减免¥10.00",@"请选择：规格"];
    for (int i = 0; i < arrya.count; i++) {
        
        UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(_zhutuimgv.frame.origin.x+_zhutuimgv.frame.size.width+10, 10+25*i, APPwidth-_zhutuimgv.frame.size.width-50, 25)];
        label.text = arrya[i];
        label.textColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:62/255.0 alpha:1.0];
        [_ggview addSubview:label];
        
        if (i == 0) {
            
            label.font = [UIFont fontWithName:@"FZDaHei-B02S" size:16];

        }
        else if (i == 1) {
           
            label.font = [UIFont systemFontOfSize:13];
        }
        else if (i == 2)
        {
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor colorWithRed:61/255.0 green:61/255.0 blue:61/255.0 alpha:1.0];

            _gueigelabel = label;
            
        }
        
        
    }
    
    
    UIButton * ycbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 10, 30, 30)];
    [ycbtn setImage:[UIImage imageNamed:@"xiangqing-delete"] forState:0];
    [ycbtn addTarget:self action:@selector(ycgueigeui) forControlEvents:1<<6];
    [_ggview addSubview:ycbtn];

    
    UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, _zhutuimgv.frame.origin.y+_zhutuimgv.frame.size.height+20, APPwidth-20, 1)];
    xian1.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    [_ggview addSubview:xian1];
    
    
    
   float gueigey = xian1.frame.origin.y+10;
    
    NSArray * array = @[@"套装分类",@"尺码分类",@"购买数量"];

    for (int j = 0; j < array.count; j++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, gueigey, APPwidth-20, 30)];
        label1.text = array[j];
        label1.font = [UIFont systemFontOfSize:16];
        label1.textColor = [UIColor blackColor];
        [_ggview addSubview:label1];
        
//*************套装分类*************
        if (j == 0) {
            
           
            float yansex = 10;
            float yansey = label1.frame.origin.y+30;
           _yansearray = @[@"补水保湿紧致肌肤",@"珍珠白四件套",@"珍珠白3件套",@"美白补水型",@"修复型"];
            int yansetag = 710000;

            for (int i = 0; i < _yansearray.count; i++) {
                
                
                UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(yansex, yansey, 40, 20)];
                label.text = _yansearray[i];
                label.font = [UIFont systemFontOfSize:13];
                label.textColor = [UIColor clearColor];
                [_ggview addSubview:label];
                [label sizeToFit];
                
                
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width+10, label.frame.size.height+10)];
                [btn setTitle:_yansearray[i] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
                btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                btn.layer.cornerRadius = 5;
                btn.layer.masksToBounds = YES;
                [btn addTarget:self action:@selector(yansexuanzhe:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = yansetag;
                btn.titleLabel.font = [UIFont systemFontOfSize:13];
                [_ggview addSubview:btn];
                
                
                
                if (btn.frame.origin.x+btn.frame.size.width>APPwidth-5) {
                    
                    CGRect fram = btn.frame;
                    fram.origin.y = btn.frame.origin.y+btn.frame.size.height+10;
                    fram.origin.x = 15;
                    btn.frame = fram;
                    
                    
                    yansey =  btn.frame.origin.y;
                    
                    
                 }
                
                if (i == 0) {
                    
                    btn.backgroundColor = [UIColor orangeColor];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    
                    _gueigelabel.text = [NSString stringWithFormat:@"规格:  %@",btn.titleLabel.text];
                    
                 }
                
                yansex = btn.frame.origin.x+btn.frame.size.width+10;
                
                yansetag++;
                
         }
        
            UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, yansey+25+10, APPwidth-20, 1)];
            xian1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
            [_ggview addSubview:xian1];
            
            
            gueigey = xian1.frame.origin.y+10;

        }
        
//*************尺码分类*************

        if (j == 1) {
            
            
            float cimax = 10;
            float cimay = label1.frame.origin.y+30;
            _chimaarray = @[@"S",@"M",@"L",@"XL",@"XXL"];
            int chimatag = 810000;

            for (int k = 0; k < _chimaarray.count; k++) {
                
                
                UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(cimax, cimay, 40, 20)];
                label.text = _chimaarray[k];
                label.font = [UIFont systemFontOfSize:13];
                label.textColor = [UIColor clearColor];
                [_ggview addSubview:label];
                [label sizeToFit];
                
                
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width+20, label.frame.size.height+10)];
                [btn setTitle:_chimaarray[k] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
                btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                btn.layer.cornerRadius = 5;
                btn.layer.masksToBounds = YES;
                [btn addTarget:self action:@selector(chimaxuanzhe:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = chimatag;
                btn.titleLabel.font = [UIFont systemFontOfSize:13];
                [_ggview addSubview:btn];
                
                
                
                if (btn.frame.origin.x+btn.frame.size.width>APPwidth-5) {
                    
                    CGRect fram = btn.frame;
                    fram.origin.y = btn.frame.origin.y+btn.frame.size.height+10;
                    fram.origin.x = 15;
                    btn.frame = fram;
                    
                    
                    cimay =  btn.frame.origin.y;
                    
                    
                }
                
                if (k == 0) {
                    
                    btn.backgroundColor = [UIColor orangeColor];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    
                     _gueigelabel.text = [NSString stringWithFormat:@"%@  %@",_gueigelabel.text,btn.titleLabel.text];
                    
                }
                
                cimax = btn.frame.origin.x+btn.frame.size.width+10;
                
                chimatag++;
                
            }
            
            UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, cimay+25+10, APPwidth-20, 1)];
            xian1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
            [_ggview addSubview:xian1];
            
            
            gueigey = xian1.frame.origin.y+20;

        }
//*************数量选择*************
        if (j == 2) {
            

            UIButton * jianbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-165, label1.frame.origin.y, 50, 30)];
            [jianbtn setImage:[UIImage imageNamed:@"xiangqing-jian1"] forState:UIControlStateNormal];
            [jianbtn setImage:[UIImage imageNamed:@"xiangqing-jian"] forState:UIControlStateSelected];
            jianbtn.tag = 5950;
            jianbtn.selected = YES;
            [jianbtn addTarget:self action:@selector(shulian:) forControlEvents:1<<6];
            [_ggview addSubview:jianbtn];
            jianbtn.selected = YES;
            jianbtn.userInteractionEnabled = NO;
          
            
            _shulianlabel = [[UILabel alloc] initWithFrame:CGRectMake(jianbtn.frame.origin.x+jianbtn.frame.size.width, jianbtn.frame.origin.y, 50, 30)];
            _shulianlabel.text = [NSString stringWithFormat:@"%d",_shuliang];
            _shulianlabel.textAlignment = NSTextAlignmentCenter;
            _shulianlabel.font =  [UIFont systemFontOfSize:18];
            _shulianlabel.textColor = [UIColor blackColor];
            [_ggview addSubview:_shulianlabel];

            
            UIButton * jiabtn = [[UIButton alloc] initWithFrame:CGRectMake(_shulianlabel.frame.origin.x+_shulianlabel.frame.size.width, _shulianlabel.frame.origin.y, 50, 30)];
            [jiabtn setImage:[UIImage imageNamed:@"xiangqing-jia"] forState:UIControlStateNormal];
            [jiabtn setImage:[UIImage imageNamed:@"xiangqing-jia1"] forState:UIControlStateSelected];
            jiabtn.tag = 5951;
            [jiabtn addTarget:self action:@selector(shulian:) forControlEvents:1<<6];
            [_ggview addSubview:jiabtn];


            CGRect fram = _ggview.frame;
            fram.size.height = jianbtn.frame.size.height+jianbtn.frame.origin.y+70;
            _ggview.frame = fram;
            
            
        }

        
    
    
    }
    
    

    _goumeibtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _ggview.frame.size.height-50, APPwidth, 50)];
    _goumeibtn.backgroundColor = [UIColor colorWithRed:254/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [_goumeibtn setTitle:@"确定" forState:0];
    _goumeibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_goumeibtn addTarget:self action:@selector(goumaiclick:) forControlEvents:1<<6];
    [_ggview addSubview:_goumeibtn];

}



#pragma mark - 创建详情
-(void)zdyXQ
{
    _xiangqingview = [[UIView alloc] initWithFrame:CGRectMake(0, 20, APPwidth, APPheight-70)];
    _xiangqingview.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:_xiangqingview];

    _xiangqingview.hidden = YES;
    
    
    //*************************  商品详情URL  *************************
   
    _xiangqingwebview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, _xiangqingview.frame.size.height)];
    _xiangqingwebview.delegate = self;
    [_xiangqingwebview setScalesPageToFit:YES];
    [_xiangqingwebview setUserInteractionEnabled:YES];
    [_xiangqingview addSubview:_xiangqingwebview];
    _xiangqingwebview.backgroundColor = [UIColor yellowColor];
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.yyqasmy.com/app/shop/index.php?act=goods&op=content&goods_id=100566"]];
    NSURLRequest * request  = [[NSURLRequest alloc] initWithURL:url];
    [_xiangqingwebview loadRequest:request];
    

    //去掉UIWebView的反弹效果
    UIScrollView  *scroller = [_xiangqingwebview.subviews objectAtIndex:0];
    if (scroller) {
        for (UIView *v in [scroller subviews]) {
            if ([v isKindOfClass:[UIImageView class]]) {
                v.hidden = YES;
            }
        }
    }
    [(UIScrollView *)[[_xiangqingwebview subviews] objectAtIndex:0] setBounces:NO];
    
 
    
}


#pragma mark - 创建评价
-(void)zdyPJ
{
    _pinjiaview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64-50)];
    _pinjiaview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_pinjiaview];
    _pinjiaview.hidden = YES;
    
    
    _pinjiatableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, _pinjiaview.frame.size.height)];
    _pinjiatableview.delegate = self;
    _pinjiatableview.dataSource = self;
    _pinjiatableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _pinjiatableview.bounces = NO;
    [_pinjiaview addSubview:_pinjiatableview];
    

    UIView * toubuview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 100)];
    toubuview.backgroundColor = [UIColor whiteColor];
    
    
    UIView * xinview = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/2-40, 20, 120, 20)];
    xinview.backgroundColor = TNTColor(255, 182, 60);
    [toubuview addSubview:xinview];

    
    UILabel * fenlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth/2-70, 80)];
    fenlabel.text = @"4.6";
    fenlabel.textColor = TNTColor(255, 182, 60);
    fenlabel.font = [UIFont systemFontOfSize:35];
    fenlabel.textAlignment = 2;
    [toubuview addSubview:fenlabel];

    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-40, xinview.frame.size.height+xinview.frame.origin.y+10, 120, 20)];
    label.text = @"综合评分";
    label.textColor = WenZiHeiColor;
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = 1;
    [toubuview addSubview:label];
    
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 80, APPwidth, 1)];
    xian.backgroundColor = TNTColor(204, 204, 204);
    [toubuview addSubview:xian];
    
    
    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(0, 81, APPwidth, 19)];
    xian2.backgroundColor = TNTColor(238, 238, 238);
    [toubuview addSubview:xian2];
    
    
 
    _pinjiatableview.tableHeaderView = toubuview;
    
    
}


#pragma mark - 创建分享界面
-(void)zdyfenxiang
{
    
   
    //***********分享界面****************
    _fenxiangview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _fenxiangview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    [self.view addSubview:_fenxiangview];
    _fenxiangview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangfenxiangview)];
    [_fenxiangview addGestureRecognizer:tap];
    
    
    
    _fenxiangtubiaoview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, 100+(APPwidth-150)/4)];
    _fenxiangtubiaoview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:_fenxiangtubiaoview];
    
    
    NSArray * array = @[@"微信",@"朋友圈",@"QQ",@"微博"];
    NSArray * tubiao = @[@"weixin",@"pengyouquan",@"qq",@"denglu_weibo"];
    
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-150)/4*i+30*i+30, 10,(APPwidth-150)/4, (APPwidth-150)/4)];
        [btn setImage:[UIImage imageNamed:tubiao[i]] forState:UIControlStateNormal];
        //        [btn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
        [_fenxiangtubiaoview addSubview:btn];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.size.height+btn.frame.origin.y, btn.frame.size.width, 20)];
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        [_fenxiangtubiaoview addSubview:label];
        
        if (i == 0) {
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40+(APPwidth-150)/4, APPwidth, 1)];
            imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
            [_fenxiangtubiaoview addSubview:imgv];
            
            
            UIButton * qxbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40+(APPwidth-150)/4, APPwidth, 50)];
            [qxbtn setTitle:@"取消" forState:0];
            [qxbtn setTitleColor:[UIColor whiteColor] forState:0];
            [qxbtn addTarget:self action:@selector(yicangfenxiangview) forControlEvents:UIControlEventTouchUpInside];
            qxbtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [_fenxiangtubiaoview addSubview:qxbtn];
            
        }
        
    }
    
    
}




#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _tableview) {
        
        return 1;
    }
    else{
        return 10;
 
    }
    
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    SCPJCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCPJCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.touxiang.backgroundColor = [UIColor orangeColor];
    cell.touxiang.layer.cornerRadius = 20;
    cell.touxiang.layer.masksToBounds = YES;
    
    
    cell.name.text = @"哆啦A梦";
    cell.name.textColor = WenZiHeiColor;
    cell.name.font = [UIFont systemFontOfSize:16];
    cell.name.textAlignment = 0;
    
    
    cell.shijian.text = @"2月22日  14:42";
    cell.shijian.textColor = WenZiQiangHueiColor;
    cell.shijian.font = [UIFont systemFontOfSize:13];
    cell.shijian.textAlignment = 2;

    
    cell.xian.backgroundColor = TNTColor(238, 238, 238);
    
    
    cell.neirong.text = @"评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容";
    cell.neirong.textColor = WenZiShenHueiColor;
    cell.neirong.font = [UIFont systemFontOfSize:15];
    cell.neirong.numberOfLines = 0;

    
    cell.tupianscv.backgroundColor = [UIColor clearColor];
    for (int i =0; i < 4; i++) {
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10+cell.tupianscv.frame.size.height*i+10*i, 0, cell.tupianscv.frame.size.height, cell.tupianscv.frame.size.height)];
        imgv.layer.cornerRadius = 10;
        imgv.layer.masksToBounds = YES;
        imgv.backgroundColor = TNTColor(220, 220, 220);
        [cell.tupianscv addSubview:imgv];
        
    }
    
    cell.tupianscv.contentSize = CGSizeMake(cell.tupianscv.frame.size.height*4+50, 0);
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 270;
    
}


#pragma mark - 顶部选择按钮
-(void)xuanzhetian:(UIButton *)btn
{
    
    if (btn.tag == 5000) {
        
        _zhengscrollview.hidden = NO;
        _xiangqingview.hidden = YES;
        _pinjiaview.hidden = YES;
        _lei = 1;

        //图片的偏移位置
        CGPoint point =  _zhengscrollview.contentOffset;
        if (point.y > 0) {
          
            _daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
            for (int i = 5000; i < 5003; i++) {
                
                UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
                [btn1 setTitleColor:[UIColor whiteColor] forState:0];
            }
            
        }
        else{
           
            _daohan.backgroundColor = [UIColor clearColor];
            for (int i = 5000; i < 5003; i++) {
                
                UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
                [btn1 setTitleColor:[UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0] forState:0];
            }
            
        }
        
        [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    }
    else if (btn.tag == 5001)
    {
        _zhengscrollview.hidden = YES;
        _xiangqingview.hidden = NO;
        _pinjiaview.hidden = YES;
        _lei = 2;
        _daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        
        for (int i = 5000; i < 5003; i++) {
            
            UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
            [btn1 setTitleColor:[UIColor whiteColor] forState:0];
        }
        
        
        [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    }
    else if (btn.tag == 5002)
    {
        _zhengscrollview.hidden = YES;
        _xiangqingview.hidden = YES;
        _pinjiaview.hidden = NO;
        _lei = 3;
        _daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];

        for (int i = 5000; i < 5003; i++) {
            
            UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
            [btn1 setTitleColor:[UIColor whiteColor] forState:0];
        }
        
        
        [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
    }
}

                                   
                                   
#pragma mark - 底部购买和加入购物车点击
-(void)dibuclick:(UIButton *)btn
{

    [_goumeibtn setTitle:btn.titleLabel.text forState:0];

    _gueigeview.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _ggview.frame;
        fram.origin.y = APPheight-_ggview.frame.size.height;
        _ggview.frame = fram;
        
    }];
    
}

                                   
#pragma mark - 底部购物车入口以及客服
-(void)dibugwcrk:(UIButton *)btn
{

    switch (btn.tag) {
     
        //购物车
        case 5170:
        {
            SCGouWuCheVC * gwc = [[SCGouWuCheVC alloc] init];
            [self.navigationController pushViewController:gwc animated:YES];
        }
            break;
            
            
            //客服
        case 5171:
        {
            
        }
            break;
            

        default:
            break;
    }
}

#pragma mark - 隐藏规格选择界面
-(void)ycgueigeui
{
    _gueigeview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _ggview.frame;
        fram.origin.y = APPheight+40;
        _ggview.frame = fram;
        
    }];
    
    
}


#pragma mark - 菜单点击事件
-(void)caidanclick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"信息"]) {

        _caidanview.hidden = YES;


        SCXXVC * scxx = [[SCXXVC alloc] init];
        scxx.biaoting = @"商城消息";
        [self.navigationController pushViewController:scxx animated:YES];
        
        
    }
    else if ([btn.titleLabel.text isEqualToString:@"分享"]) {
        
        
        _fenxiangview.hidden = NO;
        
        _caidanview.hidden = YES;

        [UIView animateWithDuration:0.3 animations:^{
            
            
            CGRect fram = _fenxiangtubiaoview.frame;
            fram.origin.y = APPheight-(90+(APPwidth-150)/4);
            _fenxiangtubiaoview.frame = fram;
            
            
        }];


    }
    else if ([btn.titleLabel.text isEqualToString:@"反馈"]) {
        
        _caidanview.hidden = YES;

        SCFanKueiVC * fankuei = [[SCFanKueiVC alloc] init];
        [self.navigationController pushViewController:fankuei animated:YES];


    }


}
        
#pragma mark - 右上角更多按钮
-(void)genduolick
{
    _caidanview.hidden = NO;
}

#pragma mark - 商品数量增减
-(void)shulian:(UIButton *)btn
{
    
    switch (btn.tag) {
        
             //减
        case 5950:
        {
            
            _shuliang--;

        }
            break;
            
            //加
        case 5951:
        {
            
            _shuliang++;
                
        }
            break;
            
        default:
            break;
    }
    
    _shulianlabel.text = [NSString stringWithFormat:@"%d",_shuliang];
    
    if (_shuliang == 1) {
        
        UIButton * btn = (UIButton *)[self.view viewWithTag:5950];
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        
    }
    else
    {
        UIButton * btn = (UIButton *)[self.view viewWithTag:5950];
        btn.selected = NO;
        btn.userInteractionEnabled = YES;
    }

    
    if (_shuliang == 10) {
        
        UIButton * btn = (UIButton *)[self.view viewWithTag:5951];
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        
    }
    else
    {
        UIButton * btn = (UIButton *)[self.view viewWithTag:5951];
        btn.selected = NO;
        btn.userInteractionEnabled = YES;
    }
    

    
}

#pragma mark - 颜色选择
-(void)yansexuanzhe:(UIButton *)btn
{

    for(int i = 710000;i< _yansearray.count+710000;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    NSArray * array = [_gueigelabel.text componentsSeparatedByString:@"  "];

    _gueigelabel.text = [NSString stringWithFormat:@"%@  %@  %@",array[0],btn.titleLabel.text,array[2]];
                       
}



#pragma mark - 尺码选择
-(void)chimaxuanzhe:(UIButton *)btn
{
    
    for(int i = 810000;i< _chimaarray.count+810000;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    
    NSArray * array = [_gueigelabel.text componentsSeparatedByString:@"  "];
    
    _gueigelabel.text = [NSString stringWithFormat:@"%@  %@  %@",array[0],array[1],btn.titleLabel.text];

}

#pragma mark - 确认购买或加入购物车
-(void)goumaiclick:(UIButton *)btn
{
             
    _gueigeview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _ggview.frame;
        fram.origin.y = APPheight+40;
        _ggview.frame = fram;
        
    }];
    

    
    if ([btn.titleLabel.text isEqualToString:@"加入购物车"]) {
        
        
    }
    else
    {
        SCTJDDVC * tjdd = [[SCTJDDVC alloc] init];
        [self.navigationController pushViewController:tjdd animated:YES];
        

    }
}


#pragma mark - scrollView的移动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == _zhengscrollview) {
        
        //图片的偏移位置
        CGPoint point =  scrollView.contentOffset;
        
        if (point.y > 0) {
            
            [UIView animateWithDuration:0.6 animations:^{
                
                _daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
                
                for (int i = 5001; i < 5003; i++) {
                    
                    UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
                    [btn1 setTitleColor:[UIColor whiteColor] forState:0];
                }
                
            }];
            
            
        }
        else
        {
            
            [UIView animateWithDuration:0.6 animations:^{
                
                _daohan.backgroundColor = [UIColor clearColor];
                
                for (int i = 5001; i < 5003; i++) {
                    
                    UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
                    [btn1 setTitleColor:[UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0] forState:0];
                }
            }];
        }
        

    }
    
}


#pragma mark - 隐藏菜单
-(void)dealTap
{
    _caidanview.hidden = YES;
}



#pragma mark - 隐藏分享view
-(void)yicangfenxiangview
{
    _fenxiangview.hidden = YES;
    

    [UIView animateWithDuration:0.3 animations:^{
        
        
        CGRect fram = _fenxiangtubiaoview.frame;
        fram.origin.y = APPheight;
        _fenxiangtubiaoview.frame = fram;
        
        
    }];
    
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
