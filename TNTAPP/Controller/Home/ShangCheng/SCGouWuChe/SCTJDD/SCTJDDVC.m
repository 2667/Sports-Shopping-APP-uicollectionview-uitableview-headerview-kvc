//
//  SCTJDDVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCTJDDVC.h"
#import "SCDingDanCell.h"
#import "SCTJDDDiZiXuanZheVC.h"

@interface SCTJDDVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView * _zhengscrollview;

    UITableView * _sptableview;
    
    //*******优惠券******
    UIView * _youhueiquanview;
    UIView * _yhqview;

    //*******付款******
    UIView * _fukuanview;
    UIView * _fkview;
    

}

@end

@implementation SCTJDDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    
    [self zdydhl];
    
    [self zdyUI];
    
    [self zdyyouhueiquanui];
    
    [self zdyfukuanui];
    
    
    
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
    biaotinglabel.text = @"确认订单";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    

    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64-60)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    [self.view addSubview:_zhengscrollview];
    
    
    //*************地址********************
    UIButton * dizibtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 80)];
    dizibtn.backgroundColor = [UIColor whiteColor];
    [dizibtn addTarget:self action:@selector(diziclick) forControlEvents:1<<6];
    [_zhengscrollview addSubview:dizibtn];
    
    
    UIButton * diziimgv= [[UIButton alloc] initWithFrame:CGRectMake(10, 25, 30, 30)];
    [diziimgv setImage:[UIImage imageNamed:@"mall_dingdanxiangqing_dingwei"] forState:0];
    [dizibtn addSubview:diziimgv];
    
    
    UILabel * _shouhuorelabel = [[UILabel alloc] initWithFrame:CGRectMake(diziimgv.frame.origin.x+40, 15, 150, 20)];
    _shouhuorelabel.text = @"收货人：某某某";
    _shouhuorelabel.textColor = [UIColor blackColor];
    _shouhuorelabel.textAlignment = 0;
    _shouhuorelabel.font = [UIFont systemFontOfSize:15];
    [dizibtn addSubview:_shouhuorelabel];
    
    UILabel * _shoujihaolabel = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-120, 15, 100, 20)];
    _shoujihaolabel.text = @"15578965425";
    _shoujihaolabel.textColor = [UIColor blackColor];
    _shoujihaolabel.textAlignment = 0;
    _shoujihaolabel.font = [UIFont systemFontOfSize:15];
    [dizibtn addSubview:_shoujihaolabel];
    
    
    UILabel * _dizilabel = [[UILabel alloc] initWithFrame:CGRectMake(diziimgv.frame.origin.x+40, 45, APPwidth-100, 20)];
    _dizilabel.text = @"广东省广州市南沙区双山大道中大城4栋";
    _dizilabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    _dizilabel.textAlignment = 0;
    _dizilabel.font = [UIFont systemFontOfSize:13];
    [dizibtn addSubview:_dizilabel];
    
    
    UIImageView * dizijiantouimgv  =[[UIImageView alloc] initWithFrame:CGRectMake(dizibtn.frame.size.width-25, _dizilabel.frame.origin.y+2.5, 15, 15)];
    dizijiantouimgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
    [dizibtn addSubview:dizijiantouimgv];

    
    //*************店招********************
    UIView * dianzhaoview = [[UIView alloc] initWithFrame:CGRectMake(0, dizibtn.frame.origin.y+dizibtn.frame.size.height+10, APPwidth, 50)];
    dianzhaoview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:dianzhaoview];
    
    UIImageView * dianlogoimgv  =[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    dianlogoimgv.backgroundColor = [UIColor orangeColor];
    [dianzhaoview addSubview:dianlogoimgv];
    
    UILabel * _dianminglabel = [[UILabel alloc] initWithFrame:CGRectMake(dianlogoimgv.frame.origin.x+40, 0, 150, 50)];
    _dianminglabel.text = @"呼来商城";
    _dianminglabel.textColor = [UIColor blackColor];
    _dianminglabel.textAlignment = 0;
    _dianminglabel.font = [UIFont systemFontOfSize:15];
    [dianzhaoview addSubview:_dianminglabel];


    UIButton * kefubtn = [[UIButton alloc] initWithFrame:CGRectMake(dianzhaoview.frame.size.width-100, 0, 90, 50)];
    [kefubtn setTitle:@"客服" forState:0];
    [kefubtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0  blue:153/255.0  alpha:1.0] forState:0];
    kefubtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [kefubtn setImage:[UIImage imageNamed:@"mall_dingdanxiangqing_kefu"] forState:0];
    kefubtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [dianzhaoview addSubview:kefubtn];
    
   
    
    //************商品信息**********************
    _sptableview = [[UITableView alloc] initWithFrame:CGRectMake(0, dianzhaoview.frame.origin.y+dianzhaoview.frame.size.height+10, APPwidth, 120*2)];
    _sptableview.delegate = self;
    _sptableview.dataSource = self;
    _sptableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_zhengscrollview addSubview:_sptableview];

    
    //*************配送方式********************
    UIView * peisongview = [[UIView alloc] initWithFrame:CGRectMake(0, _sptableview.frame.origin.y+_sptableview.frame.size.height+10, APPwidth, 150)];
    peisongview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:peisongview];
    

    UILabel * yunfelabel1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 150, 50)];
    yunfelabel1.text = @"配送方式";
    yunfelabel1.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    yunfelabel1.textAlignment = 0;
    yunfelabel1.font = [UIFont systemFontOfSize:15];
    [peisongview addSubview:yunfelabel1];
    
    UILabel * _yunfelabel = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-105, 0, 90, 50)];
    _yunfelabel.text = @"快递：¥9.00";
    _yunfelabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    _yunfelabel.textAlignment = 2;
    _yunfelabel.font = [UIFont systemFontOfSize:15];
    [peisongview addSubview:_yunfelabel];
    
    UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(15, 50, APPwidth-30, 1)];
    xian1.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    [peisongview addSubview:xian1];
    
    
    UIView * liuyanview = [[UIView alloc] initWithFrame:CGRectMake(15, xian1.frame.origin.y+xian1.frame.size.height+10, APPwidth-30, 50)];
    liuyanview.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    liuyanview.layer.cornerRadius = 8;
    liuyanview.layer.masksToBounds = YES;
    [peisongview addSubview:liuyanview];

    
    UILabel * _zongjialabel = [[UILabel alloc] initWithFrame:CGRectMake(0, liuyanview.frame.origin.y+liuyanview.frame.size.height, APPwidth-10, 50)];
    _zongjialabel.text = @"共2件商品     小计：189.00";
    _zongjialabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    _zongjialabel.textAlignment = 2;
    _zongjialabel.font = [UIFont systemFontOfSize:15];
    [peisongview addSubview:_zongjialabel];

    CGRect fram = peisongview.frame;
    fram.size.height = _zongjialabel.frame.origin.y+_zongjialabel.frame.size.height;
    peisongview.frame = fram;
    
    //*************优惠********************
    UIView * youhueiview = [[UIView alloc] initWithFrame:CGRectMake(0, peisongview.frame.origin.y+peisongview.frame.size.height, APPwidth, 100)];
    youhueiview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:youhueiview];
    
    NSArray * array = @[@"优惠券",@"优行币"];
    for (int i = 0; i < 2; i++) {
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 50*i, APPwidth-30, 1)];
        xian.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        [youhueiview addSubview:xian];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 50*i, 60, 50)];
        label1.text = array[i];
        label1.textColor = [UIColor blackColor];
        label1.textAlignment = 0;
        label1.font = [UIFont systemFontOfSize:15];
        [youhueiview addSubview:label1];
        

        if (i == 0) {
            
            UIButton * imgvbtn  =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth-35, 15, 20, 20)];
            [imgvbtn setImage:[UIImage imageNamed:@"mall_fanhuijian"] forState:0];
            [youhueiview addSubview:imgvbtn];

            
            UIButton * youhueiquanbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, youhueiview.frame.size.width, 50)];
            [youhueiquanbtn addTarget:self action:@selector(youhueiquanclick) forControlEvents:1<<6];
            [youhueiview addSubview:youhueiquanbtn];
            
        }
        else{
            
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width, 50, APPwidth-label1.frame.origin.x-label1.frame.size.width-80, 50)];
            label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
            label2.textAlignment = 0;
            label2.font = [UIFont systemFontOfSize:15];
            [youhueiview addSubview:label2];
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"余额：156币   可用：10币"];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] range:NSMakeRange(3,4)];
             [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] range:NSMakeRange(str.length-3,3)];
            label2.attributedText = str;

        }
    }

    
    //*************提示文字********************
    UIView * tsview = [[UIView alloc] initWithFrame:CGRectMake(0, youhueiview.frame.origin.y+youhueiview.frame.size.height+10, APPwidth, 50)];
    tsview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:tsview];
    

    UIButton * ts = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, APPwidth-30, 50)];
    [ts setTitle:@"不要相信任何人通过短信、QQ等发送的所谓的“退款链接”" forState:0];
    [ts setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0  blue:153/255.0  alpha:1.0] forState:0];
    ts.titleLabel.font = [UIFont systemFontOfSize:13];
    [ts setImage:[UIImage imageNamed:@"pingjia_tisji"] forState:0];
    ts.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    ts.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [tsview addSubview:ts];
    
    //*************付款********************
    UIView * fukuanview = [[UIView alloc] initWithFrame:CGRectMake(0, tsview.frame.origin.y+tsview.frame.size.height+10, APPwidth, 50)];
    fukuanview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:fukuanview];
    

    
    //*************底部结算********************
    UIView * dibuview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 60)];
    dibuview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:dibuview];
    

    UIButton * tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-120, 0, 120, 60)];
    tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:79/255.0 alpha:1.0];
    [tjbtn setTitle:@"提交订单" forState:0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    tjbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [tjbtn addTarget:self action:@selector(tjdingdan) forControlEvents:1<<6];
    [dibuview addSubview:tjbtn];
    

    UILabel * hejilabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth-130, 60)];
    hejilabel.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    hejilabel.textAlignment = 2;
    hejilabel.font = [UIFont systemFontOfSize:18];
    [dibuview addSubview:hejilabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"合计：¥105.00"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,3)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(3, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(str.length-3, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(4, str.length-7)];
    hejilabel.attributedText = str;

    
    _zhengscrollview.contentSize = CGSizeMake(0, tsview.frame.origin.y+tsview.frame.size.height);

    
}

#pragma mark - 创建付款选择界面
-(void)zdyfukuanui
{
    _fukuanview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _fukuanview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:_fukuanview];
    _fukuanview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ycfukuanui)];
    [_fukuanview addGestureRecognizer:tap];
    

    
    _fkview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, 380)];
    _fkview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_fkview];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 60)];
    label1.text = @"付款方式";
    label1.textColor = [UIColor blackColor];
    label1.textAlignment = 1;
    label1.font = [UIFont systemFontOfSize:20];
    [_fkview addSubview:label1];
    
    
    UIButton * guanbibtn  =[[UIButton alloc] initWithFrame:CGRectMake(15, 0, 30, 60)];
    [guanbibtn setImage:[UIImage imageNamed:@"car-return"] forState:0];
    [guanbibtn addTarget:self action:@selector(ycfukuanui) forControlEvents:1<<6];
    [_fkview addSubview:guanbibtn];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 59, APPwidth, 1)];
    xian.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    [_fkview addSubview:xian];

    
    NSArray * array1 = @[@"微信",@"支付宝",@"银行卡"];
    NSArray * array2 = @[@"car-weChat",@"car-pay",@"car-bank-card"];
    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 60+70*i, APPwidth, 70)];
        [_fkview addSubview:view];
        
        
        
        UIButton * img = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 30, 30)];
        [img setImage:[UIImage imageNamed:array2[i]] forState:0];
        [view addSubview:img];

        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 100, 70)];
        label.text = array1[i];
        label.textColor = [UIColor blackColor];
        label.textAlignment = 0;
        label.font = [UIFont systemFontOfSize:18];
        [view addSubview:label];
        
        
        
        UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-70, 0, 70, 70)];
        [btn2 setImage:[UIImage imageNamed:@"mall_weixuanzhong"] forState:0];
        [btn2 setImage:[UIImage imageNamed:@"mall_xuanzhong"] forState:1 << 2];
        btn2.tag = 47700+i;
        [btn2 addTarget:self action:@selector(fukuanxuanzhe:) forControlEvents:1<<6];
        [view addSubview:btn2];
        

        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 69, APPwidth-30, 1)];
        xian.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        [view addSubview:xian];
        
    }


}

#pragma mark - 创建优惠券界面
-(void)zdyyouhueiquanui
{
    
    
    _youhueiquanview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _youhueiquanview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:_youhueiquanview];
    _youhueiquanview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ycyouhueiquanui)];
    [_youhueiquanview addGestureRecognizer:tap];
    
    
    
    _yhqview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, 380)];
    _yhqview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_yhqview];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 60)];
    label.text = @"   领取优惠券";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18];
    label.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [_yhqview addSubview:label];
    
    
    
    NSArray * array1 = @[@"20元",@"10元"];
    NSArray * array2 = @[@"订单满100元使用(不含邮费)",@"订单满50元使用(不含邮费)"];
    NSArray * array3 = @[@"使用期限2017.03.21-2017.03.30",@"使用期限2017.03.21-2017.04.10"];
    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 60+115*i, APPwidth, 115)];
        [_yhqview addSubview:view];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, APPwidth-100, 20)];
        label1.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        label1.font = [UIFont systemFontOfSize:26];
        [view addSubview:label1];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:array1[i]];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(str.length-1, 1)];
        label1.attributedText = str;
        
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 50, APPwidth-100, 20)];
        label2.text = array2[i];
        label2.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        label2.font = [UIFont systemFontOfSize:15];
        [view addSubview:label2];
        
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 75, APPwidth-100, 20)];
        label3.text = array3[i];
        label3.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        label3.font = [UIFont systemFontOfSize:13];
        [view addSubview:label3];
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-85, view.frame.size.height/2-17.5, 70, 35)];
        btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        [btn setTitle:@"领取" forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        [view addSubview:btn];
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 114, APPwidth-30, 1)];
        xian.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        [view addSubview:xian];
        
    }
    
    
    UIButton * _guanbibtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _yhqview.frame.size.height-50, APPwidth, 50)];
    _guanbibtn.backgroundColor = [UIColor colorWithRed:254/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [_guanbibtn setTitle:@"关闭" forState:0];
    _guanbibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_guanbibtn addTarget:self action:@selector(ycyouhueiquanui) forControlEvents:1<<6];
    _guanbibtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_yhqview addSubview:_guanbibtn];
    
}




#pragma mark - 优惠券点击——弹出优惠券框
-(void)youhueiquanclick
{
    _youhueiquanview.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _yhqview.frame;
        fram.origin.y = APPheight-380;
        _yhqview.frame = fram;
        
    }];
    
    
}

#pragma mark - 隐藏优惠券框
-(void)ycyouhueiquanui
{
    _youhueiquanview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _yhqview.frame;
        fram.origin.y = APPheight;
        _yhqview.frame = fram;
        
    }];
    
    
}


#pragma mark - 提交订单——显示付款方式
-(void)tjdingdan
{
    _fukuanview.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _fkview.frame;
        fram.origin.y = APPheight-380;
        _fkview.frame = fram;
        
    }];
    
}



#pragma mark - 隐藏付款方式
-(void)ycfukuanui
{
    _fukuanview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _fkview.frame;
        fram.origin.y = APPheight;
        _fkview.frame = fram;
        
    }];
    
    for(int i = 47700;i < 47703;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        btn1.selected = NO;
        
    }
    
}


#pragma mark - 付款选择
-(void)fukuanxuanzhe:(UIButton *)btn
{
    for(int i = 47700;i < 47703;i++)
    {
    
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        btn1.selected = NO;

    }
    
    btn.selected = YES;
    
    switch (btn.tag) {
       
            //微信
        case 47700:
        {
            NSLog(@"微信");
        }
            break;
            
            //支付宝
        case 47701:
        {
            NSLog(@"支付宝");
        }
            break;

            
            //银行卡
        case 47702:
        {
            NSLog(@"银行卡");
        }
            break;

            
        default:
            break;
    }
    
    
    
}

#pragma mark - 选择地址
-(void)diziclick
{

    SCTJDDDiZiXuanZheVC * dizhi = [[SCTJDDDiZiXuanZheVC alloc] init];
    [self.navigationController pushViewController:dizhi animated:YES];
    

}


#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
    
}


//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    SCDingDanCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCDingDanCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.datu.image = [UIImage imageNamed:@"shouyexiaotu1"];
    

    cell.biaoting.text = @"自然堂 美白补水3件套";
    cell.biaoting.textAlignment = 0;
    cell.biaoting.font = [UIFont systemFontOfSize:15];
    cell.biaoting.textColor = [UIColor blackColor];
    
    cell.gueige.text = @"颜色分类：补水6件套";
    cell.gueige.textAlignment = 0;
    cell.gueige.font = [UIFont systemFontOfSize:14];
    cell.gueige.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    
    cell.biaoqian.text = @"七天包换";
    cell.biaoqian.textAlignment = 1;
    cell.biaoqian.font = [UIFont systemFontOfSize:13];
    cell.biaoqian.textColor = [UIColor whiteColor];
    cell.biaoqian.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    
    
    cell.jiage.text = @"¥99.00";
    cell.jiage.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    cell.jiage.font = [UIFont systemFontOfSize:16];
    cell.jiage.textAlignment = 2;
    
    
    cell.yuanjia.text = @"¥199.00";
    cell.yuanjia.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    cell.yuanjia.font = [UIFont systemFontOfSize:11];
    cell.yuanjia.textAlignment = 2;
    
    cell.shuliang.text = @"x2";
    cell.shuliang.font = [UIFont systemFontOfSize:15];
    cell.shuliang.textColor = [UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0];
    cell.shuliang.textAlignment = 2;
    
    
    cell.xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
    
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
