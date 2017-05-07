//
//  HomeVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/19.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "HomeVC.h"
#import "HomeCell.h"
#import "HomeCVCell.h"
#import "JinBiChouJiangVC.h"
#import "JiBuVC.h"
#import "BiaoJiViewController.h"
#import "SCShouYeVC.h"
#import "XiaoXiZhongXinVC.h"
#import "TaskXiangQingVC.h"
#import "WoDeJinBiVC.h"


@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIButton * _daohanreqibtn;
    
    SCGIFImageView* gifImageView;
    
    UIScrollView * _zhengscrollview;
    
    UIImageView * _wenhaoimgv;
    UIButton * _wenhaobtn;
    BOOL _wenhaobool;
    
    UIView * _zhuanxiaogview;
    UIView * _toutiaoview;
    UIView * _xianshiview;
    UIScrollView * _qiandaosv;

   

    UIView * _caidanview;
    BOOL _caidanbool;
    
    
    UIView * _reliview;
    BOOL _relibool;
    int nian;
    int yue;
    UILabel * _riqilabel;
    UIView * _riliview;
    
    int _danqiannian;
    int _danqianyue;
    int _danqianri;

    
    UICollectionView * _zueixingfabucollectionView;

    UITableView * _tableview;
    UIView * _yidongview;

    
}

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    _wenhaobool = YES;
    
    _caidanbool = YES;
    
    _relibool = YES;
    
    [self zdydhl];
    
    [self zdyUI];
    
    [self zdycaidan];
    
    [self zdyreli];
    
}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 63, APPwidth, 1)];
    xian.backgroundColor =[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
    [daohan addSubview:xian];
    
    _daohanreqibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 100, 44)];
    [_daohanreqibtn setTitle:@"12月19日" forState:UIControlStateNormal];
    [_daohanreqibtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _daohanreqibtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_daohanreqibtn addTarget:self action:@selector(reliclick) forControlEvents:UIControlEventTouchUpInside];
    _daohanreqibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_daohanreqibtn setImage:[UIImage imageNamed:@"shouye-rili"] forState:0];
    [daohan addSubview:_daohanreqibtn];
    _daohanreqibtn.imageEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
    
    
    UIButton *  xiaoxibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-90, 22, 40, 40)];
    [xiaoxibtn setImage:[UIImage imageNamed:@"shouye-xinxi-dianji"] forState:UIControlStateNormal];
    [xiaoxibtn addTarget:self action:@selector(xiaoxiclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:xiaoxibtn];
    
    
    UIButton *  caidanbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-45, 22, 40, 40)];
    [caidanbtn setImage:[UIImage imageNamed:@"shouye_fenlei"] forState:UIControlStateNormal];
    [caidanbtn addTarget:self action:@selector(caidanclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:caidanbtn];
    

    
}


#pragma mark - 自定义界面
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    

//***************步数统计********************

    UIView * busutongji = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 400)];
    busutongji.backgroundColor = [UIColor colorWithRed:42/255.0 green:47/255.0 blue:60/255.0 alpha:1.0];
    [_zhengscrollview addSubview:busutongji];
    
    
    float x;
    if (APPwidth == 320) {
        
        x = 30;
    }
    else if (APPwidth == 375)
    {
        x = 40;
    }
    else
    {
        x = 60;
    }

//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"动态图-透底2.gif" ofType:nil];
//    NSData* imageData = [NSData dataWithContentsOfFile:filePath];
//    gifImageView = [[SCGIFImageView alloc] initWithFrame:CGRectMake(x, 20, APPwidth-x*2,APPwidth-x*2)];
//    [gifImageView setData:imageData];
//    [busutongji addSubview:gifImageView];
    
//    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(printMessage) userInfo:nil repeats:YES];
//   [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

//    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

    
    UIImageView * jidutiaoimv =[[UIImageView alloc] initWithFrame:CGRectMake(x, 20, APPwidth-x*2,APPwidth-x*2)];
    jidutiaoimv.image =[UIImage imageNamed:@"shouye_jindutiao"];
    [busutongji addSubview:jidutiaoimv];
    

//    
//    //进入计步的按钮
//    UIButton * jibubtn = [[UIButton alloc] initWithFrame:CGRectMake(70, 20, APPwidth-140, APPwidth-140)];
//    [jibubtn addTarget:self action:@selector(jibuclick) forControlEvents:UIControlEventTouchUpInside];
//    [busutongji addSubview:jibubtn];
//    
    
    //*************圆形进度条内数据展示************************
    UILabel * zbslabel = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-45, 90, 90, 20)];
    zbslabel.textColor = [UIColor whiteColor];
    zbslabel.text = @"当前总步数:";
    zbslabel.textAlignment = NSTextAlignmentCenter;
    zbslabel.font = [UIFont systemFontOfSize:14];
    [busutongji addSubview:zbslabel];

    
    UILabel * zongbushulabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, APPwidth, 60)];
    zongbushulabel.textColor = [UIColor whiteColor];
    zongbushulabel.textAlignment = NSTextAlignmentCenter;
    zongbushulabel.font = [UIFont fontWithName:@"DINOT" size:50];
    [busutongji addSubview:zongbushulabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"1.63亿步"];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(4, 2)];//设置不同字号
    zongbushulabel.attributedText = str;
    [zongbushulabel sizeToFit];
    CGRect fram = zongbushulabel.frame;
    fram.origin.y = 110;
    fram.origin.x = APPwidth/2-zongbushulabel.frame.size.width/2;
    zongbushulabel.frame = fram;
    
    
    UILabel * chajulabel = [[UILabel alloc] initWithFrame:CGRectMake(0, zongbushulabel.frame.origin.y+zongbushulabel.frame.size.height+10, APPwidth, 20)];
    chajulabel.textColor = WenZiQiangHueiColor;
    chajulabel.textAlignment = NSTextAlignmentCenter;
    chajulabel.font = [UIFont systemFontOfSize:12];
    [busutongji addSubview:chajulabel];
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:@"距昨日总步数只差1.31万步"];
    [str2 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] range:NSMakeRange(8, 4)];
    chajulabel.attributedText = str2;
    [chajulabel sizeToFit];
    CGRect cjfram = chajulabel.frame;
    cjfram.origin.x = APPwidth/2-chajulabel.frame.size.width/2-(chajulabel.frame.size.height+6)/2;
    cjfram.origin.y = zongbushulabel.frame.origin.y+zongbushulabel.frame.size.height;
    chajulabel.frame = cjfram;

    
    _wenhaobtn = [[UIButton alloc] initWithFrame:CGRectMake(chajulabel.frame.origin.x+chajulabel.frame.size.width, chajulabel.frame.origin.y-3, chajulabel.frame.size.height+6, chajulabel.frame.size.height+6)];
    [_wenhaobtn setImage:[UIImage imageNamed:@"shouye_wenhao"] forState:0];
    [_wenhaobtn addTarget:self action:@selector(wenhaoclick) forControlEvents:1<<6];
    [busutongji addSubview:_wenhaobtn];
    _wenhaobtn.userInteractionEnabled = YES;
    
    _wenhaoimgv = [[UIImageView alloc] initWithFrame:CGRectMake(chajulabel.frame.origin.x,_wenhaobtn.frame.origin.y+_wenhaobtn.frame.size.height, chajulabel.frame.size.width+chajulabel.frame.size.height+6, 50)];
    _wenhaoimgv.image =[UIImage imageNamed:@"shouye_tishikuang"];
    [busutongji addSubview:_wenhaoimgv];
    _wenhaoimgv.hidden = YES;

    UILabel * wenhaolabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, _wenhaoimgv.frame.size.width-10, 40)];
    wenhaolabel.text = @"每日结算汇率时间为23:00~24:00隔天使用";
    wenhaolabel.textColor = [UIColor whiteColor];
    wenhaolabel.textAlignment = NSTextAlignmentCenter;
    wenhaolabel.font = [UIFont systemFontOfSize:11];
    wenhaolabel.numberOfLines = 2;
    [_wenhaoimgv addSubview:wenhaolabel];
    
    UIImage * zyimg = [UIImage imageNamed:@"shouye_zengyibianqian_hong"];

    UILabel * hueilvlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _wenhaoimgv.frame.origin.y+_wenhaoimgv.frame.size.height+10, APPwidth, 20)];
    hueilvlabel.text = @"15.6%";
    hueilvlabel.textColor = [UIColor whiteColor];
    hueilvlabel.textAlignment = NSTextAlignmentCenter;
    hueilvlabel.font = [UIFont systemFontOfSize:16];
    [hueilvlabel sizeToFit];
    [busutongji addSubview:hueilvlabel];
    CGRect hlfram = hueilvlabel.frame;
    hlfram.origin.x = APPwidth/2-hueilvlabel.frame.size.width/2-((hueilvlabel.frame.size.height-3)/zyimg.size.height*zyimg.size.width)/2;
    hlfram.origin.y = _wenhaoimgv.frame.origin.y+_wenhaoimgv.frame.size.height+10;
    hueilvlabel.frame = hlfram;
   
    UIImageView * _zengyiimgv = [[UIImageView alloc] initWithFrame:CGRectMake(hueilvlabel.frame.origin.x+hueilvlabel.frame.size.width+2,hueilvlabel.frame.origin.y+1.5, (hueilvlabel.frame.size.height-3)/zyimg.size.height*zyimg.size.width, hueilvlabel.frame.size.height-3)];
    _zengyiimgv.image = zyimg;
    [busutongji addSubview:_zengyiimgv];

    
    
    
    UILabel * yjhueilvlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, hueilvlabel.frame.origin.y+hueilvlabel.frame.size.height, APPwidth, 20)];
    yjhueilvlabel.text = @"预计明日兑换汇率";
    yjhueilvlabel.textColor = WenZiQiangHueiColor;
    yjhueilvlabel.textAlignment = NSTextAlignmentCenter;
    yjhueilvlabel.font = [UIFont systemFontOfSize:11];
    [busutongji addSubview:yjhueilvlabel];
    
    
    
    
    UIImageView * jiantouimv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-10,jidutiaoimv.frame.origin.y+jidutiaoimv.frame.size.height, 20, 20)];
    jiantouimv.image =[UIImage imageNamed:@"shouye_jiantou"];
    [busutongji addSubview:jiantouimv];
    
    UIButton * jiahaobtn =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth-70, jiantouimv.frame.origin.y-15, 50, 50)];
    [jiahaobtn setImage:[UIImage imageNamed:@"shouye_duixiananniu"] forState:0];
    [jiahaobtn addTarget:self action:@selector(jiahaoClick) forControlEvents:UIControlEventTouchUpInside];
    [busutongji addSubview:jiahaobtn];

    
    NSArray * tubiao = @[@"shouye_paobu",@"shouye_huilv",@"shouye_shouyi"];
    NSArray * wenzi = @[@"6524步",@"8.27%",@"3668金"];
    NSArray * biaoting = @[@"个人步数",@"兑换汇率",@"金币收益"];

    for (int i = 0; i < tubiao.count ; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/3*i, jiantouimv.frame.size.height+jiantouimv.frame.origin.y+30, APPwidth/3, 50)];
        [busutongji addSubview:view];
        
        
    
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 20)];
        label.text = wenzi[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:wenzi[i]];
        [str addAttribute:NSForegroundColorAttributeName value:WenZiQiangHueiColor range:NSMakeRange(str.length-1,1)];//设置不同颜色
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(str.length-1,1)];//设置不同字号
        label.attributedText = str;
        
        
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, view.frame.size.width, 20)];
        label2.text = biaoting[i];
        label2.textColor = WenZiQiangHueiColor;
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:12];
        [label2 sizeToFit];
        [view addSubview:label2];
        CGRect fram = label2.frame;
        fram.origin.y = 25;
        fram.origin.x = view.frame.size.width/2-label2.frame.size.width/2+9;
        label2.frame = fram;
        
       
        UIImageView * imv =[[UIImageView alloc] initWithFrame:CGRectMake(label2.frame.origin.x-18, 25, 15, 15)];
        imv.image =[UIImage imageNamed:tubiao[i]];
        [view addSubview:imv];

        
    }
    
    CGRect bushufram = busutongji.frame;
    bushufram.size.height = jiantouimv.frame.size.height+jiantouimv.frame.origin.y+80;
    busutongji.frame = bushufram;

    
    //***************4个模块入口********************
    UIView * mokuairkview = [[UIView alloc] initWithFrame:CGRectMake(0, busutongji.frame.origin.y+busutongji.frame.size.height+10, APPwidth, 160)];
    mokuairkview.backgroundColor = [UIColor colorWithRed:42/255.0 green:47/255.0 blue:60/255.0 alpha:1.0];
    [_zhengscrollview addSubview:mokuairkview];
    
    
    NSArray * mokuairktu = @[@"shouye_shangcheng",@"shouye_yundongjilu",@"shouye_choujiang",@"shouye_huodong"];
    NSArray * mokuaiwenzi = @[@"金币商城",@"运动记录",@"金币抽奖",@"最新活动"];
    
    float mkrkx = 0;
    float mkrky = 0;
    for (int i = 0; i < mokuairktu.count; i++) {
        
        if ( i == 2) {
            
            mkrkx = 0;
            mkrky = 80;
        }
       
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(mkrkx, mkrky, APPwidth/2, 80)];
        [btn setImage:[UIImage imageNamed:mokuairktu[i]] forState:UIControlStateNormal];
        [btn setTitle:mokuaiwenzi[i] forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:WenZiQiangHueiColor forState:0];
        btn.tag = 6000+i;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        [btn addTarget:self action:@selector(rukoClick:) forControlEvents:UIControlEventTouchUpInside];
        [mokuairkview addSubview:btn];

        
        mkrkx = mkrkx + APPwidth/2;
        
    }
    
    
    //*******************专享*******************
    _zhuanxiaogview = [[UIView alloc] initWithFrame:CGRectMake(0, mokuairkview.frame.origin.y+mokuairkview.frame.size.height+10, APPwidth, 250)];
    _zhuanxiaogview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_zhuanxiaogview];
    
    UIView * zxxian = [[UIView alloc] initWithFrame:CGRectMake(15, 5, 2, 25)];
    zxxian.backgroundColor = [UIColor colorWithRed:255/255.0 green:187/255.0 blue:61/255.0 alpha:1.0];
    [_zhuanxiaogview addSubview:zxxian];
    
    UILabel * zxlabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 100, 35)];
    zxlabel.text = @"新用户专享";
    zxlabel.textColor = [UIColor whiteColor];
    zxlabel.font = [UIFont systemFontOfSize:16];
    [_zhuanxiaogview addSubview:zxlabel];
    
    UIImageView * zxxianimv = [[UIImageView alloc] initWithFrame:CGRectMake(0, zxlabel.frame.origin.y+zxlabel.frame.size.height, APPwidth, 2)];
    zxxianimv.image = [UIImage imageNamed:@"shouye-fengexian"];
    [_zhuanxiaogview addSubview:zxxianimv];
    
    for (int i = 0; i < 3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(((APPwidth-30)/3)*i+5*i+10, zxxianimv.frame.origin.y+zxxianimv.frame.size.height+20, (APPwidth-30)/3, (APPwidth-30)/3)];
        [btn setImage:[UIImage imageNamed:@"shouyexiaotu1"] forState:0];
        btn.backgroundColor = [UIColor colorWithRed:49/255.0 green:55/255.0 blue:62/255.0 alpha:1.0];
        [_zhuanxiaogview addSubview:btn];
    }
    
    CGRect fram1 = _zhuanxiaogview.frame;
    fram1.size.height = zxxianimv.frame.origin.y+zxxianimv.frame.size.height+40+(APPwidth-30)/3;
    _zhuanxiaogview.frame = fram1;
    
    //*******************头条*******************
    _toutiaoview = [[UIView alloc] initWithFrame:CGRectMake(0, _zhuanxiaogview.frame.origin.y+_zhuanxiaogview.frame.size.height+10, APPwidth, 40)];
    _toutiaoview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_toutiaoview];
    
    UIImageView * ttimv = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
    ttimv.image = [UIImage imageNamed:@"shouye_laba"];
    [_toutiaoview addSubview:ttimv];
    
    UILabel * ttlabel1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 100, 40)];
    ttlabel1.text = @"任务头条";
    ttlabel1.textColor = [UIColor whiteColor];
    ttlabel1.font = [UIFont systemFontOfSize:16];
    [_toutiaoview addSubview:ttlabel1];
    

    UIImageView * ttjtimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-18, 12.5, 15, 15)];
    ttjtimv.image = [UIImage imageNamed:@"shouye-gengduo"];
    [_toutiaoview addSubview:ttjtimv];
    
    UILabel * ttlabel2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-120, 0, 100, 40)];
    ttlabel2.text = @"领取金币";
    ttlabel2.textColor = [UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0];
    ttlabel2.font = [UIFont systemFontOfSize:16];
    ttlabel2.textAlignment = NSTextAlignmentRight;
    [_toutiaoview addSubview:ttlabel2];
    

    //*******************限时*******************
    _xianshiview = [[UIView alloc] initWithFrame:CGRectMake(0, _toutiaoview.frame.origin.y+_toutiaoview.frame.size.height+10, APPwidth, 250)];
    _xianshiview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_xianshiview];
    
    UIImage * img = [UIImage imageNamed:@"shouye_hongdi"];
    UIImageView * xsimv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, img.size.width/APPwidth*img.size.height+20)];
    xsimv.image = img;
    [_xianshiview addSubview:xsimv];
    
    
    UIImage * houziimg = [UIImage imageNamed:@"shouye_houzi"];
    UIImageView * houziimv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-130, 10, 100, houziimg.size.width/80*houziimg.size.height)];
    houziimv.image = houziimg;
    [_xianshiview addSubview:houziimv];
    
    UILabel * xslabel1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 150, 30)];
    xslabel1.text = @"限时特价求抱走";
    xslabel1.textColor = [UIColor whiteColor];
    xslabel1.font = [UIFont systemFontOfSize:20];
    [xsimv addSubview:xslabel1];
    
    UILabel * xslabel2 = [[UILabel alloc] initWithFrame:CGRectMake(50, xslabel1.frame.origin.y+xslabel1.frame.size.height, 150, 20)];
    xslabel2.text = @"金币兑换最高可兑99.9元";
    xslabel2.textColor = [UIColor whiteColor];
    xslabel2.font = [UIFont systemFontOfSize:12];
    [xsimv addSubview:xslabel2];
    
    UIImageView * xsxianimv = [[UIImageView alloc] initWithFrame:CGRectMake(0, xsimv.frame.origin.y+xsimv.frame.size.height+10, APPwidth, 2)];
    xsxianimv.image = [UIImage imageNamed:@"shouye-fengexian"];
    [_xianshiview addSubview:xsxianimv];

    for (int i = 0; i < 3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(((APPwidth-30)/3)*i+5*i+10, xsxianimv.frame.origin.y+xsxianimv.frame.size.height+20, (APPwidth-30)/3, (APPwidth-30)/3)];
        btn.backgroundColor = [UIColor colorWithRed:49/255.0 green:55/255.0 blue:62/255.0 alpha:1.0];
        btn.layer.cornerRadius = 6;
        btn.layer.masksToBounds = YES;
        [btn setImage:[UIImage imageNamed:@"shouyexiaotu1"] forState:0];
        [_xianshiview addSubview:btn];
    }
    
    CGRect fram2 = _xianshiview.frame;
    fram2.size.height = xsxianimv.frame.origin.y+xsxianimv.frame.size.height+40+(APPwidth-30)/3;
    _xianshiview.frame = fram2;
    

      //*******************签到*******************
    _qiandaosv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _xianshiview.frame.origin.y+_xianshiview.frame.size.height+10, APPwidth, 250)];
    [_zhengscrollview addSubview:_qiandaosv];
    

    for (int i = 0; i < 3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-60)*i+10*i, 0, APPwidth-60, _qiandaosv.frame.size.height-10)];
        btn.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [btn addTarget:self action:@selector(qiandaorwbtn:) forControlEvents:1<<6];
        [_qiandaosv addSubview:btn];
        
        
        UIImageView * touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 50, 50)];
        touxiang.image = [UIImage imageNamed:@"beauty2"];
        [btn addSubview:touxiang];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(touxiang.frame.origin.x+touxiang.frame.size.width+15, 10, 60, 20)];
        label1.text = @"￥200";
        label1.textColor = [UIColor whiteColor];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        label1.layer.cornerRadius = 3;
        label1.layer.masksToBounds = YES;
        label1.font = [UIFont systemFontOfSize:15];
        [btn addSubview:label1];
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+15, 10, 80, 20)];
        label2.text = @"签到任务";
        label2.textColor = [UIColor whiteColor];
        label2.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label2];
        

        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.origin.x, touxiang.frame.origin.y+touxiang.frame.size.height-20, 80, 20)];
        label3.text = @"星巴克";
        label3.textColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
        label3.font = [UIFont systemFontOfSize:14];
        [btn addSubview:label3];
        

        UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(15, touxiang.frame.origin.y+touxiang.frame.size.height+10, 200, 20)];
        label4.text = @"到店签到即可领取奖励！";
        label4.textColor = [UIColor colorWithRed:152/255.0 green:152/255.0 blue:152/255.0 alpha:1.0];
        label4.font = [UIFont systemFontOfSize:14];
        [btn addSubview:label4];
        
        for (int i = 0; i < 3; i++) {
            
            UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake((btn.frame.size.width-42)/3*i+15+6*i, label4.frame.size.height+label4.frame.origin.y+10, (btn.frame.size.width-42)/3, (btn.frame.size.width-42)/3)];
            imv.image = [UIImage imageNamed:@"shouyexiaotu1"];
            [btn addSubview:imv];
            
            
        }

        UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(30, label4.frame.size.height+label4.frame.origin.y+20+(btn.frame.size.width-42)/3, btn.frame.size.width-60, 2)];
        xian.image = [UIImage imageNamed:@"shouye-fengexian"];
        [btn addSubview:xian];
        
        
        UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(15, xian.frame.origin.y+xian.frame.size.height, 200, 20)];
        label5.text = @"广州南沙区   距离329米";
        label5.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        label5.font = [UIFont systemFontOfSize:12];
        [label5 sizeToFit];
        [btn addSubview:label5];
        
        CGRect fram = label5.frame;
        fram.origin.x = btn.frame.size.width/2-label5.frame.size.width/2;
        fram.origin.y = xian.frame.origin.y+xian.frame.size.height+5;
        label5.frame = fram;
        
        UIImageView * diziimv = [[UIImageView alloc] initWithFrame:CGRectMake(label5.frame.origin.x-label5.frame.size.height-5, label5.frame.origin.y, label5.frame.size.height, label5.frame.size.height)];
        diziimv.image = [UIImage imageNamed:@"shouye_dingwei"];
        [btn addSubview:diziimv];
        

        
    }
    
    _qiandaosv.contentSize = CGSizeMake((APPwidth-60)*3+30, 0);

    
    //*******************任务*******************
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, _qiandaosv.frame.origin.y+_qiandaosv.frame.size.height+10, APPwidth, 346*10+150)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.bounces = NO;
    [_zhengscrollview addSubview:_tableview];

    
#if 0
    //*******************疯狂抢购*******************
    UIView * fkdise = [[UIView alloc] initWithFrame:CGRectMake(0, mokuairkview.frame.origin.y+mokuairkview.frame.size.height+10, APPwidth, 250)];
    fkdise.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:fkdise];
    
    UIView * fengkuangqiangouview = [[UIView alloc] initWithFrame:CGRectMake(0, mokuairkview.frame.origin.y+mokuairkview.frame.size.height+10, APPwidth-10, 250)];
    [_zhengscrollview addSubview:fengkuangqiangouview];
   

    for (int i = 0; i < 3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(fengkuangqiangouview.frame.size.width/3*i, 0, fengkuangqiangouview.frame.size.width/3, 250)];
        [fengkuangqiangouview addSubview:btn];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, btn.frame.size.width-10, 20)];
        label.backgroundColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:63/255.0 alpha:1.0];
        label.text = @"疯抢商品";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:label];
        
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(10, label.frame.origin.y+label.frame.size.height, label.frame.size.width, label.frame.size.width)];
        imv.image = [UIImage imageNamed:@"shouyexiaotu1"];
        [btn addSubview:imv];
        
        
        UILabel * jiagelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, imv.frame.origin.y+imv.frame.size.height, 100, 20)];
        jiagelabel.text = @"￥100";
        jiagelabel.font = [UIFont systemFontOfSize:14];
        jiagelabel.textColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:67/255.0 alpha:1.0];
        jiagelabel.textAlignment = NSTextAlignmentLeft;
        [btn addSubview:jiagelabel];

        UILabel * jianlabel = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.size.width-50, imv.frame.origin.y+imv.frame.size.height, 50, 20)];
        jianlabel.text = @"减￥10";
        jianlabel.font = [UIFont systemFontOfSize:14];
        jianlabel.textColor = [UIColor colorWithRed:255/255.0 green:185/255.0 blue:65/255.0 alpha:1.0];
        jianlabel.textAlignment = NSTextAlignmentRight;
        [btn addSubview:jianlabel];
        

        //进度条
        UIImageView * jidutiaoimv = [[UIImageView alloc] initWithFrame:CGRectMake(10, jiagelabel.frame.origin.y+jiagelabel.frame.size.height+5, btn.frame.size.width-10, 15)];
        jidutiaoimv.backgroundColor = [UIColor whiteColor];
        [btn addSubview:jidutiaoimv];
        
        UILabel * sheyulabel = [[UILabel alloc] initWithFrame:CGRectMake(10, jidutiaoimv.frame.origin.y+jidutiaoimv.frame.size.height, btn.frame.size.width-10, 20)];
        sheyulabel.text = @"剩余数量:72/100";
        sheyulabel.font = [UIFont systemFontOfSize:13];
        sheyulabel.textColor = [UIColor colorWithRed:255/255.0 green:185/255.0 blue:65/255.0 alpha:1.0];
        sheyulabel.textAlignment = NSTextAlignmentLeft;
        [btn addSubview:sheyulabel];
        
        
        CGRect fram = fengkuangqiangouview.frame;
        fram.size.height = sheyulabel.frame.origin.y+sheyulabel.frame.size.height;
        fengkuangqiangouview.frame = fram;
    }
    
    
    
    //*******************即将上线*******************
    UIView * sxdise = [[UIView alloc] initWithFrame:CGRectMake(0, fengkuangqiangouview.frame.origin.y+fengkuangqiangouview.frame.size.height, APPwidth, (APPwidth-40)/3+50)];
    sxdise.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:sxdise];
    
    UIView * jijianshangxianview = [[UIView alloc] initWithFrame:CGRectMake(0, fengkuangqiangouview.frame.origin.y+fengkuangqiangouview.frame.size.height+10, APPwidth-10, (APPwidth-40)/3+50)];
    [_zhengscrollview addSubview:jijianshangxianview];
    
    
    for (int i = 0; i < 3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(jijianshangxianview.frame.size.width/3*i, 0, jijianshangxianview.frame.size.width/3, 250)];
        [jijianshangxianview addSubview:btn];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, btn.frame.size.width-10, 20)];
        label.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        label.text = @"即将上线";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:63/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:label];
        
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(10, label.frame.origin.y+label.frame.size.height, label.frame.size.width, label.frame.size.width)];
        imv.image = [UIImage imageNamed:@"shouyexiaotu1"];
        [btn addSubview:imv];
        
        
        UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(0, imv.frame.size.height-20, imv.frame.size.width, 20)];
        biaoting.text = @"军用水瓶";
        biaoting.font = [UIFont systemFontOfSize:13];
        biaoting.textColor = [UIColor colorWithRed:255/255.0 green:185/255.0 blue:65/255.0 alpha:1.0];
        biaoting.textAlignment = NSTextAlignmentCenter;
        biaoting.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
        [imv addSubview:biaoting];
        
        
    }

    
#if 1
    
    //*******************最新发布*******************

    float cvx = (APPwidth-30)/2;

    //先创建UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //修改item大小
    layout.itemSize = CGSizeMake(cvx, cvx+50);
    //上下左右偏移
    layout.sectionInset = UIEdgeInsetsMake(0, 8, 8, 8);
    //左右两个item的最小间距
    layout.minimumInteritemSpacing = 8;
    //上下两个item的最小间距
    layout.minimumLineSpacing = 10;
    //滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    //分类collectionView
    _zueixingfabucollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, jijianshangxianview.frame.origin.y+jijianshangxianview.frame.size.height, APPwidth, 220*2+70) collectionViewLayout:layout];
    _zueixingfabucollectionView.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    _zueixingfabucollectionView.delegate = self;
    _zueixingfabucollectionView.dataSource = self;
    _zueixingfabucollectionView.bounces = NO;
    _zueixingfabucollectionView.scrollEnabled = NO;
    [_zhengscrollview addSubview:_zueixingfabucollectionView];
    
    //注册collectionView
    [_zueixingfabucollectionView registerClass:[HomeCVCell class] forCellWithReuseIdentifier:@"Cell"];
    
    //注册头部视图
    [_zueixingfabucollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
#endif
    
    

    
#if 1
    //*******************最新活动*******************
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, _zueixingfabucollectionView.frame.origin.y+_zueixingfabucollectionView.frame.size.height+10, APPwidth, 346*10+200)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.bounces = NO;
    [_zhengscrollview addSubview:_tableview];
    
#endif
#endif
    
    
    _zhengscrollview.contentSize = CGSizeMake(0, _tableview.frame.origin.y+_tableview.frame.size.height);

    
}

-(void)printMessage
{
    NSLog(@"asfsfsf");
    
//    NSLog(@"%@", [[NSRunLoop mainRunLoop] currentMode]);

//    busutongji = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 400)];
//    busutongji.image = [UIImage imageNamed:@"shouye-ditu"];
//    [_zhengscrollview addSubview:busutongji];
//    busutongji.userInteractionEnabled = YES;
//    
//    float x;
//    if (APPwidth == 320) {
//        
//        x = 30;
//    }
//    else if (APPwidth == 375)
//    {
//        x = 40;
//    }
//    else
//    {
//        x = 60;
//    }
//
//    
//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"shouye_quan.gif" ofType:nil];
//    NSData* imageData = [NSData dataWithContentsOfFile:filePath];
//    gifImageView = [[SCGIFImageView alloc] initWithFrame:CGRectMake(x, 20, APPwidth-x*2,APPwidth-x*2)];
//    [gifImageView setData:imageData];
//    [busutongji addSubview:gifImageView];

}

#pragma mark - 创建菜单
-(void)zdycaidan
{
    
    _caidanview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight)];
    [self.view addSubview:_caidanview];
    _caidanview.hidden = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [_caidanview addGestureRecognizer:tap];
    
    //添加毛玻璃效果
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    toolbar.barStyle = UIBarStyleBlack;
    [_caidanview addSubview:toolbar];
    
    UIView * caidandi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPwidth)];
    caidandi.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_caidanview addSubview:caidandi];
    
    NSArray * tubiao = @[@"fenlei_jiudian",@"fenlei_xiuxian",@"fenlei_fuzhuang",@"fenlei_weixiu",@"fenlei_jiadian",@"fenlei_shouji",@"fenlei_jiaoyu",@"fenlei_meifa",@"fenlei_jianshen"];
    NSArray * wenzi = @[@"酒店",@"休闲娱乐",@"服装",@"维修",@"家电",@"手机",@"教育",@"美容美发",@"健身"];
    
    float x = 0;
    float y = 0;

    for (int i = 0; i < tubiao.count; i++) {
        
        
        if ( i % 3 == 0 && i != 0 ) {
            
            x = 0;
            y = y + APPwidth/3;
        }
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(x, y, APPwidth/3, APPwidth/3)];
        [caidandi addSubview:view];
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-15, view.frame.size.height/2-30, 30, 30)];
        imv.image = [UIImage imageNamed:tubiao[i]];
        [view addSubview:imv];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, imv.frame.origin.y+imv.frame.size.height+10, view.frame.size.width, 30)];
        label.text = wenzi[i];
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        [view addSubview:label];
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 1)];
        xian.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1.0];
        [view addSubview:xian];
        
        UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width-1, 0, 1, view.frame.size.height)];
        xian2.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1.0];
        [view addSubview:xian2];
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        [btn addTarget:self action:@selector(caidanclick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:wenzi[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [view addSubview:btn];
        
        x = x + APPwidth/3;
    }

}


#pragma mark - 自定义日历
-(void)zdyreli
{
    _reliview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _reliview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
    [self.view addSubview:_reliview];
    _reliview.hidden = YES;
   
    //添加毛玻璃效果
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    toolbar.barStyle = UIBarStyleBlack;
    [_reliview addSubview:toolbar];

    //**********获取年月*************
    //当前时间date
    NSDate *shijian = [NSDate date];
    //年
    nian = [[NSString stringWithFormat:@"%ld",(long)[self year:shijian]] intValue];
    //月
    yue = [[NSString stringWithFormat:@"%ld",(long)[self month:shijian]] intValue];
    //当月总天数
    NSString * zongtianshu = [NSString stringWithFormat:@"%ld",(long)[self totaldaysInMonth:shijian]];
    //当月1号是周几
    NSString * zhouji = [NSString stringWithFormat:@"%ld",(long)[self firstWeekdayInThisMonth:shijian]];
    
    _danqiannian = nian;
    _danqianyue = yue;
    _danqianri = [[NSString stringWithFormat:@"%ld",(long)[self day:shijian]] intValue];
    [_daohanreqibtn setTitle:[NSString stringWithFormat:@"%d月%d日",_danqianyue,_danqianri] forState:UIControlStateNormal];

    //使用单列记录当前年月
    [Single danle].danqiannianfen = [NSString stringWithFormat:@"%d",_danqiannian];
    [Single danle].danqianyuefen = [NSString stringWithFormat:@"%d",_danqianyue];


    UIView * reqi1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 115)];
    reqi1.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_reliview addSubview:reqi1];
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 63, APPwidth, 1)];
    xian.backgroundColor =[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
    [reqi1 addSubview:xian];
    
    
    _riqilabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, APPwidth-100, 44)];
    _riqilabel.text = [NSString stringWithFormat:@"%d年%d月",nian,yue];;
    _riqilabel.textAlignment = 1;
    _riqilabel.textColor = [UIColor whiteColor];
    _riqilabel.font = [UIFont systemFontOfSize:16];
    [reqi1 addSubview:_riqilabel];
    
  
    

    //上个月
    UIButton * _jianbtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 29.5, 25, 25)];
    [_jianbtn addTarget:self action:@selector(riqijian) forControlEvents:UIControlEventTouchUpInside];
    [_jianbtn setImage:[UIImage imageNamed:@"shouye_zuo"] forState:0];
    [reqi1 addSubview:_jianbtn];
    
    //下个月
    UIButton * _jiabtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-55, 29.5, 25, 25)];
    [_jiabtn addTarget:self action:@selector(riqijia) forControlEvents:UIControlEventTouchUpInside];
    [_jiabtn setImage:[UIImage imageNamed:@"shouye_you"] forState:0];
    [reqi1 addSubview:_jiabtn];
    
    //添加周期
    NSArray * xq = @[@"天",@"一",@"二",@"三",@"四",@"五",@"六"];
    for (int i = 0; i < xq.count; i++) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/7*i, 84, APPwidth/7, 20)];
        label.text = xq[i];
        label.textAlignment = 1;
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:15];
        [reqi1 addSubview:label];
        
        
    }


    [self zdyrl:zongtianshu :zhouji];


}


#pragma mark - cell
//返回多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cell";
    
    HomeCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[HomeCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
//    if (indexPath.row % 3 == 0 && indexPath.row != 0) {
//        
//        cell.haibao.backgroundColor = [UIColor orangeColor];
//        
//        cell.xian2.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
//
//    }
//    else
//    {
    cell.touxiang.backgroundColor = [UIColor orangeColor];
    cell.touxiang.layer.cornerRadius = 30;
    cell.touxiang.layer.masksToBounds = YES;
    cell.touxiang.image = [UIImage imageNamed:@"beauty2"];

    cell.jine.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    cell.jine.layer.cornerRadius = 3;
    cell.jine.layer.masksToBounds = YES;
    cell.jine.text = @"￥200";
    cell.jine.font = [UIFont systemFontOfSize:16];
    cell.jine.textColor = [UIColor whiteColor];
    cell.jine.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    cell.biaoting.text = @"丰收季求搬运";
    cell.biaoting.font = [UIFont systemFontOfSize:16];
    cell.biaoting.textColor = [UIColor whiteColor];
    
    
    cell.jiantou.image = [UIImage imageNamed:@"shouye_xiala"];
    
    cell.xinbieimv.image = [UIImage imageNamed:@"shouye_nan"];
    
    cell.name.text = @"幸运草";
    cell.name.font = [UIFont systemFontOfSize:13];
    cell.name.textColor = [UIColor whiteColor];
    [cell.name sizeToFit];
//    CGRect fram = cell.name.frame;
//    fram.origin.x = _xinbieimv.frame.origin.x+_xinbieimv.frame.size.width+3;
//    fram.origin.y = 
    
    
    cell.rztubiao1.image = [UIImage imageNamed:@"shouye_shiming"];
    CGRect fram2 = cell.rztubiao1.frame;
    fram2.origin.x = cell.name.frame.origin.x+cell.name.frame.size.width+10;
    cell.rztubiao1.frame = fram2;
    
    
    cell.rztubiao2.image = [UIImage imageNamed:@"shouye_jineng"];
    CGRect fram3 = cell.rztubiao2.frame;
    fram3.origin.x = cell.rztubiao1.frame.origin.x+cell.rztubiao1.frame.size.width+3;
    cell.rztubiao2.frame = fram3;

    
    cell.rztubiao3.image = [UIImage imageNamed:@"shouye_zhifu"];
    CGRect fram4 = cell.rztubiao3.frame;
    fram4.origin.x = cell.rztubiao2.frame.origin.x+cell.rztubiao2.frame.size.width+3;
    cell.rztubiao3.frame = fram4;

    
    cell.shijian.text = @"2天前发表";
    cell.shijian.font = [UIFont systemFontOfSize:10];
    cell.shijian.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        
        
        
    cell.tupian.backgroundColor = [UIColor clearColor];
        UIImageView * touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.tupian.frame.size.width-10, cell.tupian.frame.size.height)];
        touxiang.image = [UIImage imageNamed:@"shouyexiaotu3"];
        [cell.tupian addSubview:touxiang];
    

    
    
    
    cell.neirong.text = @"今年家里小麦大丰收 求几个健硕的大哥来帮忙收割以及搬台，价格可加,有意向的可联系我...";
    cell.neirong.font = [UIFont systemFontOfSize:13];
    cell.neirong.numberOfLines = 0;
    cell.neirong.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        
        
        
    cell.xian.image = [UIImage imageNamed:@"shouye-fengexian"];
        
        
    cell.diziimv.image = [UIImage imageNamed:@"shouye_dingwei"];
    
    
    cell.dizi.text = @"广州南沙区  945m";
    cell.dizi.font = [UIFont systemFontOfSize:11];
    cell.dizi.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    
    cell.xihuanimv.image = [UIImage imageNamed:@"renwu_pingjia"];
    cell.xihuan.text = @"123";
    cell.xihuan.font = [UIFont systemFontOfSize:11];
    cell.xihuan.textColor = WenZiQiangHueiColor;
    
    
    cell.pinluenimv.image = [UIImage imageNamed:@"renwu_pingjia"];
    cell.pinluen.text = @"12352";
    cell.pinluen.font = [UIFont systemFontOfSize:11];
    cell.pinluen.textColor = WenZiQiangHueiColor;


    cell.xian2.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    

//    }
    
    cell.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TaskXiangQingVC * taskxq = [[TaskXiangQingVC alloc] init];
    [self.navigationController pushViewController:taskxq animated:YES];
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row % 3 == 0 && indexPath.row != 0) {
//        
//        return 210;
//
//    }
//    else
//    {
        return 346;

//    }
}



//头部高度
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;

}

//尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}



//头部
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 50)];
    view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];


    NSArray * array = @[@"新鲜的",@"附近达人"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2*i, 0, APPwidth/2, 50)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        [view addSubview:btn];
    }
    
    
    _yidongview =[[UIView alloc] initWithFrame:CGRectMake(APPwidth/4-40, 40, 80, 2)];
    _yidongview.backgroundColor = [UIColor colorWithRed:255/255.0 green:187/255.0 blue:61/255.0 alpha:1.0];
    [view addSubview:_yidongview];

    return view;
    
}


//尾部
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 60)];
    view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    

    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(0, 20, APPwidth, 20)];
    label.text = @"往上滑或点击更多";
    label.textColor = WenZiQiangHueiColor;
    label.font = [UIFont systemFontOfSize:16];
    [label sizeToFit];
    [view addSubview:label];
    
    CGRect fram = label.frame;
    fram.origin.x = APPwidth/2-label.frame.size.width/2;
    label.frame = fram;
    
    
    UIImageView * imv =[[UIImageView alloc] initWithFrame:CGRectMake(label.frame.origin.x-25, label.frame.origin.y, 18, 18)];
    imv.image = [UIImage imageNamed:@"shouye-shuaxin"];
    [view addSubview:imv];
    
    return view;
    
}

#pragma mark - 新鲜的和附近之间的切换
-(void)btnclick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"新鲜的"]) {
        
        [UIView animateWithDuration:0.2 animations:^{
            CGRect fram = _yidongview.frame;
            fram.origin.x = APPwidth/4-40;
            _yidongview.frame = fram;

        }];
        
    }
    else
    {
        
        [UIView animateWithDuration:0.2 animations:^{
            CGRect fram = _yidongview.frame;
            fram.origin.x = APPwidth/2+APPwidth/4-40;
            _yidongview.frame = fram;
            
        }];

    }
}


#pragma mark - UICollectionView
//每个分区有多少个Item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 4;
    
}


//Item的显示内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCVCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.xian.image = [UIImage imageNamed:@"shouye-fengexian"];
    
    cell.datu.image = [UIImage imageNamed:@"shouyexiaoguotu7"];
    

    cell.wenzidise.backgroundColor =[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    
    cell.rwmiaoshu.text = @"任务描述：骑行3公里";
    cell.rwmiaoshu.textAlignment = NSTextAlignmentLeft;
    cell.rwmiaoshu.font = [UIFont systemFontOfSize:12];
    
    cell.rwjianli.text = @"任务奖励：现金红包10元";
    cell.rwjianli.textAlignment = NSTextAlignmentLeft;
    cell.rwjianli.font = [UIFont systemFontOfSize:12];

    cell.biaoting.text = @"御喜贡茶";
    cell.biaoting.font = [UIFont systemFontOfSize:13];
    cell.biaoting.textColor = [UIColor whiteColor];
    
    cell.xihuan.image = [UIImage imageNamed:@"shouye-guanzhu-dianji"];

    cell.dizitubiao.image = [UIImage imageNamed:@"shouye-dingwei"];

    cell.dizi.text = @"南沙区双山大道25号";
    cell.dizi.font = [UIFont systemFontOfSize:11];
    cell.dizi.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];

    cell.chakantubiao.image = [UIImage imageNamed:@"shouye-liulan"];

    cell.chakan.text = @"1098";
    cell.chakan.font = [UIFont systemFontOfSize:10];
    cell.chakan.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake((APPwidth-30)/2, 220);
    return size;
}



//段头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(APPwidth, 50);
}



//段头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    
    //先判断是头部还是尾部
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        header.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        
        
        UIView * shuxian = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 2, 30)];
        shuxian.backgroundColor = [UIColor orangeColor];
        [header addSubview:shuxian];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(18,0, 100, 50)];
        label.text = @"最新发布";
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor whiteColor];
        [header addSubview:label];
        
        
        UIButton * genduobtn =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth-60, 0, 50, 50)];
        [genduobtn addTarget:self action:@selector(genduobtn) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:genduobtn];
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 40, 50)];
        label2.text = @"更多";
        label2.font = [UIFont systemFontOfSize:16];
        label2.textColor = [UIColor whiteColor];
        [genduobtn addSubview:label2];

        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(40, 20, 10, 10)];
        imv.image = [UIImage imageNamed:@"shouye-gengduo"];
        [genduobtn addSubview:imv];
    
        
        return header;
        
        
    }
    
    
    return nil;
}



#pragma mark - 进入计步界面按钮
-(void)jibuclick
{
    
    JiBuVC * jb = [[JiBuVC alloc] init];
    [self.navigationController pushViewController:jb animated:YES];

//    [[NSNotificationCenter defaultCenter] postNotificationName:@"tiaozhuanjibu" object:nil userInfo:nil];


}


#pragma mark - 最新发布-更多按钮点击
-(void)genduobtn
{
    NSLog(@"查看更多最新发布");
    
}

#pragma mark - 进度条内问号的点击
-(void)wenhaoclick
{
     NSTimer * timr = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(ycwenhao) userInfo:nil repeats:NO];
    
    _wenhaobtn.userInteractionEnabled = NO;
    
    _wenhaoimgv.hidden = NO;

    
}

#pragma mark - 5秒自动隐藏问号提示框
-(void)ycwenhao
{
    _wenhaoimgv.hidden = YES;
    
    _wenhaobtn.userInteractionEnabled = YES;


}

#pragma mark - 加号点击事件——进入我们的金币界面
-(void)jiahaoClick
{
    WoDeJinBiVC * wdjb = [[WoDeJinBiVC alloc] init];
    [self.navigationController pushViewController:wdjb animated:YES];}


#pragma mark - 四个入口点击事件
-(void)rukoClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"金币商城"]) {
       
        SCShouYeVC * scsy = [[SCShouYeVC alloc] init];
        [self.navigationController pushViewController:scsy animated:YES];
    }
    else if ([btn.titleLabel.text isEqualToString:@"运动记录"])
    {
        JiBuVC * jb = [[JiBuVC alloc] init];
        [self.navigationController pushViewController:jb animated:YES];
        

    }
    else if ([btn.titleLabel.text isEqualToString:@"金币抽奖"])
    {
        JinBiChouJiangVC * jinbichoujian = [[JinBiChouJiangVC alloc] init];
        [self.navigationController pushViewController:jinbichoujian animated:YES];
    }
    else if ([btn.titleLabel.text isEqualToString:@"最新活动"])
    {
        NSLog(@"点击了活动");

    }
   
    
}



#pragma mark - 日历点击_显示日历
-(void)reliclick
{
    NSLog(@"点击了日历");
    if (_relibool == YES) {
        
        _reliview.hidden = NO;
        
        _relibool = NO;
        
        ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;

        nian = _danqiannian;
        yue = _danqianyue;
        
        _riqilabel.text = [NSString stringWithFormat:@"%d年%d月",_danqiannian,_danqianyue];
        
        NSString * yuestr;
        if (_danqianyue <=9) {
            
            yuestr = [NSString stringWithFormat:@"0%d",_danqianyue];
            
        }
        else
        {
            yuestr = [NSString stringWithFormat:@"%d",_danqianyue];
            
        }
        
        NSString* string = [NSString stringWithFormat:@"%d%@",_danqiannian,yuestr];
        
        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
        [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        [inputFormatter setDateFormat:@"yyyyMM"];
        NSDate* inputDate = [inputFormatter dateFromString:string];
        
        NSString * zongtianshu = [NSString stringWithFormat:@"%ld",(long)[self totaldaysInMonth:inputDate]];
        
        NSString * zhouji = [NSString stringWithFormat:@"%ld",(long)[self firstWeekdayInThisMonth:inputDate]];
        
        [_riliview removeFromSuperview];

        [self zdyrl:zongtianshu :zhouji];
        
    }
    else
    {
        _reliview.hidden = YES;
        
        _relibool = YES;
        
        ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;

    }

}

#pragma mark - 导航栏消息点击
-(void)xiaoxiclick
{

    XiaoXiZhongXinVC * xxzx = [[XiaoXiZhongXinVC alloc] init];
    xxzx.biaoting = @"首页入口";
    [self.navigationController pushViewController:xxzx animated:YES];
    
}


#pragma mark - 导航栏菜单点击_显示菜单
-(void)caidanclick
{
    if (_caidanbool == YES) {
    
        _caidanview.hidden = NO;
        
        _caidanbool = NO;

        ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;

    }
    else
    {
        _caidanview.hidden = YES;
        
        _caidanbool = YES;

        ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;

    }


}


#pragma mark - 签到任务点击事件
-(void)qiandaorwbtn:(UIButton *)btn
{
    TaskXiangQingVC * taskxq = [[TaskXiangQingVC alloc] init];
    [self.navigationController pushViewController:taskxq animated:YES];
    

    
}
#pragma mark - 菜单按钮点击
-(void)caidanclick:(UIButton *)btn
{
    _caidanview.hidden = YES;
    
    _caidanbool = YES;
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
    
    NSLog(@"%@",btn.titleLabel.text);
}



#pragma mark - 单击手势 隐藏菜单界面
-(void)dealTap
{
    _caidanview.hidden = YES;
    
    _caidanbool = YES;

    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;

}

#pragma mark - 单击手势 隐藏日历界面
-(void)yicangreli
{
    _reliview.hidden = YES;
    
    _relibool = YES;

    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;

}



/**
 *实现部分
 */
#pragma mark -- 获取日
- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.day;
}


#pragma mark -- 获取月
- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.month;
}


#pragma mark -- 获取年
- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.year;
}


#pragma mark -- 获得当前月份第一天星期几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //设置每周的第一天从周几开始,默认为1,从周日开始
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    //若设置从周日开始算起则需要减一,若从周一开始算起则不需要减
    return firstWeekday - 1;
}


#pragma mark -- 获取当前月共有多少天
- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

#pragma mark -- 下个月
-(void)riqijia
{
    if (yue == 12) {
        
        yue = 1;
        nian++;
    }
    else
    {
        yue++;
    }
    
    
    NSString * yuestr;
    if (yue <=9) {
        
        yuestr = [NSString stringWithFormat:@"0%d",yue];
        
    }
    else
    {
        yuestr = [NSString stringWithFormat:@"%d",yue];
        
    }
    
    _riqilabel.text = [NSString stringWithFormat:@"%d年%d月",nian,yue];
    
    
    NSString* string = [NSString stringWithFormat:@"%d%@",nian,yuestr];
    
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMM"];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    
    NSString * zongtianshu = [NSString stringWithFormat:@"%ld",(long)[self totaldaysInMonth:inputDate]];
    
    NSString * zhouji = [NSString stringWithFormat:@"%ld",(long)[self firstWeekdayInThisMonth:inputDate]];
    
    [_riliview removeFromSuperview];
    
    [self zdyrl:zongtianshu :zhouji];
    

}

#pragma mark -- 上个月
-(void)riqijian
{
    
    if (yue == 1) {
        
        yue = 12;
        nian--;
    }
    else
    {
        yue--;
    }
    
    
    NSString * yuestr;
    if (yue <=9) {
        
        yuestr = [NSString stringWithFormat:@"0%d",yue];
        
    }
    else
    {
        yuestr = [NSString stringWithFormat:@"%d",yue];
        
    }
    
    _riqilabel.text = [NSString stringWithFormat:@"%d年%d月",nian,yue];
    
    NSString* string = [NSString stringWithFormat:@"%d%@",nian,yuestr];
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMM"];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    
    
    NSString * zongtianshu = [NSString stringWithFormat:@"%ld",(long)[self totaldaysInMonth:inputDate]];
    
    NSString * zhouji = [NSString stringWithFormat:@"%ld",(long)[self firstWeekdayInThisMonth:inputDate]];
    
    
    [_riliview removeFromSuperview];
    [self zdyrl:zongtianshu :zhouji];
    
    
}

#if 1
#pragma mark - 创建日历
-(void)zdyrl:(NSString *)zongtianshu :(NSString *)xq
{
    
    _riliview = [[UIView alloc] initWithFrame:CGRectMake(0, 115, APPwidth, APPwidth/7*6)];
    _riliview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_reliview addSubview:_riliview];
    
    
    float x = _riliview.frame.size.width/7*[xq intValue];
    float y = 0;
    
    for (int i = [xq intValue]; i < [zongtianshu intValue]+[xq intValue]; i++) {
        
        if (i % 7 == 0 && i != 0) {
            
            x = 0;
            y = y + _riliview.frame.size.width/7;
            
        }
        
        UIButton * rilibtn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, _riliview.frame.size.width/7, _riliview.frame.size.width/7)];
        [rilibtn setTitle:[NSString stringWithFormat:@"%d",i-[xq intValue]+1] forState:0];
        [rilibtn setTitleColor:[UIColor whiteColor] forState:0];
        rilibtn.titleLabel.textAlignment = 0;
        rilibtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_riliview addSubview:rilibtn];
       
        if (nian<=_danqiannian && yue<=_danqianyue && (i-[xq intValue]+1)<=_danqianri) {

            [rilibtn addTarget:self action:@selector(rilibtnclick:) forControlEvents:1<<6];

        }
        
        
        if (nian > _danqiannian) {
            
            [rilibtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];

        }
        
        if (nian == _danqiannian) {
            
            if (yue > _danqianyue) {
                
                [rilibtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
                

            }
            
        }
        
        if (nian == _danqiannian && yue == _danqianyue) {
            
            if ((i-[xq intValue]+1) > _danqianri) {
                
                [rilibtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];

            }
            
            if((i-[xq intValue]+1) == _danqianri)
            {
                UIView * yuanview = [[UIView alloc] initWithFrame:CGRectMake(x+_riliview.frame.size.width/7/2-15, y+_riliview.frame.size.width/7/2-15, 30, 30)];
                yuanview.layer.cornerRadius = 15;
                yuanview.layer.masksToBounds = YES;
                yuanview.backgroundColor = [UIColor orangeColor];
                [_riliview addSubview:yuanview];
                
                [_riliview bringSubviewToFront:rilibtn];

            }
            
        }
        
        
        x = x + _riliview.frame.size.width/7;
        
    }
    
    CGRect fram = _riliview.frame;
    fram.size.height = y+_riliview.frame.size.width/7;
    _riliview.frame = fram;
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, _riliview.frame.origin.y+_riliview.frame.size.height, APPwidth, APPheight-_riliview.frame.origin.y-_riliview.frame.size.height)];
    [_reliview addSubview:view];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangreli)];
    [view addGestureRecognizer:tap];
    

   
    
}

#endif


#pragma mark - 日历的点击
-(void)rilibtnclick:(UIButton *)btn
{
    NSString * shouxuanshijian = [NSString stringWithFormat:@"%d年%d月%@日",nian,yue,btn.titleLabel.text];
    
    _reliview.hidden = YES;
    
    _relibool = YES;
    

    [_daohanreqibtn setTitle:[NSString stringWithFormat:@"%d月%@日",yue,btn.titleLabel.text] forState:UIControlStateNormal];

    
    
    NSLog(@"所选时间 = %@",shouxuanshijian);
}


//在视图即将出现的时候
-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
    
    
    [_daohanreqibtn setTitle:[NSString stringWithFormat:@"%d月%d日",_danqianyue,_danqianri] forState:UIControlStateNormal];

    
    
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
