//
//  RWYuYueVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/23.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWYuYueVC.h"
#import "RWDDFangQiXuanZheVC.h"
#import "RWDDPingJiaVC.h"
#import "DaoHangVC.h"

@interface RWYuYueVC ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
    int _dwcs;
    double _lat;
    double _lon;
    


    UIView * _dikuanview;
    UIView * _drzlview;
    UIView * _xiangqingview;
    UIView * _dizhiview;
    
    UIButton * _yuandianbtn;
    
    float _shangyigaodu;

}

@end

@implementation RWYuYueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    
    _dwcs = 1;
    
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
    biaoting.text = _biaoting;
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    if ([_biaoting isEqualToString:@"前往目的地"]) {
        
        UIButton * mxbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-70, 22, 60, 44)];
        
        [mxbtn setTitle:@"开始导航" forState:0];
        mxbtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [mxbtn addTarget:self action:@selector(daohanclick) forControlEvents:UIControlEventTouchUpInside];
        [daohan addSubview:mxbtn];
        

    }
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    //添加地图view
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    _mapView.showsCompass = NO;//隐藏罗盘
    _mapView.showsScale = NO;//隐藏比例尺
    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
    [self.view addSubview:_mapView];
    _mapView.userTrackingMode = MAUserTrackingModeFollow; // 追踪用户位置.
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    _mapView.zoomLevel = 17;//地图的缩放比例
    

    
    _yuandianbtn = [[UIButton alloc] initWithFrame:CGRectMake(10, APPheight-175, 35, 35)];
    _yuandianbtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    _yuandianbtn.layer.cornerRadius = 5;
    _yuandianbtn.layer.masksToBounds = YES;
    [_yuandianbtn setImage:[UIImage imageNamed:@"renwu_dingwei"] forState:UIControlStateNormal];
    [_yuandianbtn addTarget:self action:@selector(yuandianCilck) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_yuandianbtn];

    
    //******************信息框****************************
    _dikuanview = [[UIView alloc] initWithFrame:CGRectMake(10, APPheight-130, APPwidth-20, 120)];
    _dikuanview.backgroundColor = [UIColor whiteColor];
    _dikuanview.layer.shadowColor = [UIColor blackColor].CGColor;
    _dikuanview.layer.shadowOffset = CGSizeMake(4,4);
    _dikuanview.layer.shadowOpacity = 0.1;
    _dikuanview.layer.shadowRadius = 6;
    _dikuanview.clipsToBounds = NO;
    [self.view addSubview:_dikuanview];
    
    
    //达人资料view
    _drzlview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _dikuanview.frame.size.width, 70)];
    [_dikuanview addSubview:_drzlview];
    
    
    UIButton * zhankaibtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _drzlview.frame.size.width, _drzlview.frame.size.height)];
    [zhankaibtn setImage:[UIImage imageNamed:@"renwu_shouqi"] forState:0];
    [zhankaibtn setImage:[UIImage imageNamed:@"renwu_zhankai"] forState:UIControlStateSelected];
    [zhankaibtn addTarget:self action:@selector(zhankai:) forControlEvents:UIControlEventTouchUpInside];
    zhankaibtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, _drzlview.frame.size.height/2+20, 0);
    [_drzlview addSubview:zhankaibtn];
    
    
    
    UIButton * touxianbtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    touxianbtn.backgroundColor =  [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
    touxianbtn.layer.cornerRadius = 25;
    touxianbtn.layer.masksToBounds = YES;
    [touxianbtn addTarget:self action:@selector(touxianCilck) forControlEvents:UIControlEventTouchUpInside];
    [_drzlview addSubview:touxianbtn];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(touxianbtn.frame.size.width+touxianbtn.frame.origin.x+5, 15, 200, 20)];
    label1.text = @"英语辅导";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:16];
    [_drzlview addSubview:label1];
    [label1 sizeToFit];
    
    
    
    
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(touxianbtn.frame.size.width+touxianbtn.frame.origin.x+5, label1.frame.origin.y+label1.frame.size.height+5, 80, 20)];
    label3.text = @"幸运草";
    label3.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    label3.font = [UIFont systemFontOfSize:12];
    label3.textAlignment = NSTextAlignmentRight;
    [label3 sizeToFit];
    [_drzlview addSubview:label3];
    
    
    UIImageView * imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(label3.frame.origin.x+label3.frame.size.width+2, label3.frame.origin.y+2, 12, 12)];
    imgv1.image = [UIImage imageNamed:@"shouye_nv"];
    [_drzlview addSubview:imgv1];
    
    
    UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(imgv1.frame.size.width+imgv1.frame.origin.x+15, label3.frame.origin.y-3, 80, 20)];
    label4.text = @"赏金2000元";
    label4.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
    label4.font = [UIFont systemFontOfSize:14];
    label4.textAlignment = NSTextAlignmentRight;
    [_drzlview addSubview:label4];
    
    
    NSArray * tubiao1 = @[@"renwu_dianhuan",@"renwu_sixin1"];
    for (int i = 0; i < tubiao1.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-105+30*i+15*i, 20, 30, 30)];
        [btn setImage:[UIImage imageNamed:tubiao1[i]] forState:0];
        [_drzlview addSubview:btn];
        
    }
    
    
    
    //地址view
    _dizhiview = [[UIView alloc] initWithFrame:CGRectMake(0, 70, _dikuanview.frame.size.width, _dikuanview.frame.size.height-70)];
    [_dikuanview addSubview:_dizhiview];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(10, 0, _dizhiview.frame.size.width-20, 1)];
    xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_dizhiview addSubview:xian];
    
    
    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(_dizhiview.frame.size.width/2, 10, 1, _dizhiview.frame.size.height-20)];
    xian2.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_dizhiview addSubview:xian2];
    
    
    UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, _dizhiview.frame.size.width/2-15, 20)];
    label5.text = @"广州市 · 南沙区";
    label5.textColor = [UIColor blackColor];
    label5.font = [UIFont systemFontOfSize:12];
    [_dizhiview addSubview:label5];
    
    
    UILabel * label6 = [[UILabel alloc] initWithFrame:CGRectMake(10, label5.frame.origin.y+label5.frame.size.height, _dizhiview.frame.size.width/2-15, 20)];
    label6.text = @"中环都爹利街13号乐成行地库中层";
    label6.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label6.font = [UIFont systemFontOfSize:10];
    [_dizhiview addSubview:label6];
    
    
    
    UIButton * tazhaowobtn = [[UIButton alloc] initWithFrame:CGRectMake(_dizhiview.frame.size.width/2+3, 10, _dizhiview.frame.size.width/4-3, 30)];
    [tazhaowobtn setTitle:@"我去找Ta" forState:0];
    [tazhaowobtn setTitleColor:[UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0] forState:0];
    tazhaowobtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [tazhaowobtn setImage:[UIImage imageNamed:@"renwu_zhao"] forState:0];
    tazhaowobtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [_dizhiview addSubview:tazhaowobtn];
    
    
    UIButton * yuyuebtn = [[UIButton alloc] initWithFrame:CGRectMake(_dizhiview.frame.size.width/4*3+5, 10, _dizhiview.frame.size.width/4-10, 30)];
    yuyuebtn.backgroundColor =  [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [yuyuebtn setTitle:@"预约" forState:0];
    [yuyuebtn setTitleColor:[UIColor whiteColor] forState:0];
    yuyuebtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [yuyuebtn addTarget:self action:@selector(yuyue:) forControlEvents:UIControlEventTouchUpInside];
    [_dizhiview addSubview:yuyuebtn];
    

    if ([_biaoting isEqualToString:@"已结束"]) {
        
        [self zdyrwjieshuview];
        [yuyuebtn setTitle:_biaoting forState:0];

    }
   else  if ([_biaoting isEqualToString:@"评价"]) {
        
        [self zdyrwpinjiaview];
       [yuyuebtn setTitle:_biaoting forState:0];

    }

    else{
        
        [self zdyrwxiangqing];

        [yuyuebtn setTitle:@"放弃" forState:0];

    }
    
}


#pragma mark - 创建结束view
-(void)zdyrwjieshuview
{
    
    //任务结束view
    _xiangqingview = [[UIView alloc] initWithFrame:CGRectMake(0, 70, _dikuanview.frame.size.width, 0)];
    [_dikuanview addSubview:_xiangqingview];
    _xiangqingview.layer.masksToBounds = YES;
    

    UIButton * kefubtn = [[UIButton alloc] initWithFrame:CGRectMake(_xiangqingview.frame.size.width/2-60, 0, 120, 50)];
    [kefubtn setTitle:@"联系客服" forState:0];
    [kefubtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0  blue:153/255.0  alpha:1.0] forState:0];
    kefubtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [kefubtn setImage:[UIImage imageNamed:@"renwu_lianxikefu"] forState:0];
    kefubtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [_xiangqingview addSubview:kefubtn];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(10, 49, _dizhiview.frame.size.width-20, 1)];
    xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_xiangqingview addSubview:xian];
    
    
    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, _dizhiview.frame.size.width-20, 1)];
    xian2.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_xiangqingview addSubview:xian2];
    

    
    UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-25, xian.frame.origin.y+26, 50, 50)];
    imgv.image = [UIImage imageNamed:@"renwu_quxiao"];
    [_xiangqingview addSubview:imgv];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, imgv.frame.origin.y+imgv.frame.size.height+20, APPwidth-20, 30)];
    label.text = @"取消原因：临时有事无法执行任务";
    label.textColor = WenZiQiangHueiColor;
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = 1;
    [_xiangqingview addSubview:label];

    
    _shangyigaodu = label.frame.origin.y+label.frame.size.height+30;

    
}


#pragma mark - 创建评价view
-(void)zdyrwpinjiaview
{
    
    //任务评价view
    _xiangqingview = [[UIView alloc] initWithFrame:CGRectMake(0, 70, _dikuanview.frame.size.width, 0)];
    [_dikuanview addSubview:_xiangqingview];
    _xiangqingview.layer.masksToBounds = YES;
    
    
    UIButton * kefubtn = [[UIButton alloc] initWithFrame:CGRectMake(_xiangqingview.frame.size.width/2-60, 0, 120, 50)];
    [kefubtn setTitle:@"联系客服" forState:0];
    [kefubtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0  blue:153/255.0  alpha:1.0] forState:0];
    kefubtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [kefubtn setImage:[UIImage imageNamed:@"renwu_lianxikefu"] forState:0];
    kefubtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [_xiangqingview addSubview:kefubtn];
    
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(10, 49, _dizhiview.frame.size.width-20, 1)];
    xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_xiangqingview addSubview:xian];
    
    
    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, _dizhiview.frame.size.width-20, 1)];
    xian2.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_xiangqingview addSubview:xian2];
    
    
    
    UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2-25, xian.frame.origin.y+26, 50, 50)];
    imgv.image = [UIImage imageNamed:@"renwu_yizhifu"];
    [_xiangqingview addSubview:imgv];
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, imgv.frame.origin.y+imgv.frame.size.height+20, APPwidth-20, 30)];
    label1.textColor = WenZiQiangHueiColor;
    label1.font = [UIFont systemFontOfSize:14];
    label1.textAlignment = 1;
    [_xiangqingview addSubview:label1];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"共99.5元"];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(1, 4)];//设置不同字号
    [str addAttribute:NSForegroundColorAttributeName value:WenZiHeiColor range:NSMakeRange(1,4)];//设置不同颜色
    label1.attributedText = str;
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, label1.frame.origin.y+label1.frame.size.height, APPwidth-20, 30)];
    label2.text = @"已支付";
    label2.textColor = WenZiQiangHueiColor;
    label2.font = [UIFont systemFontOfSize:14];
    label2.textAlignment = 1;
    [_xiangqingview addSubview:label2];
    
    
    _shangyigaodu = label2.frame.origin.y+label2.frame.size.height+30;
    
    
}


#pragma mark - 创建详情
-(void)zdyrwxiangqing
{
    
    //任务详情view
    _xiangqingview = [[UIView alloc] initWithFrame:CGRectMake(0, 70, _dikuanview.frame.size.width, 0)];
    [_dikuanview addSubview:_xiangqingview];
    _xiangqingview.layer.masksToBounds = YES;
    
    
    UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, _xiangqingview.frame.size.width-20, 1)];
    xian1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [_xiangqingview addSubview:xian1];
    
    
    UILabel * xiangqing1 = [[UILabel alloc] initWithFrame:CGRectMake(0,10,  _xiangqingview.frame.size.width, 20)];
    xiangqing1.text = @"任 务 详 情";
    xiangqing1.textColor = [UIColor blackColor];
    xiangqing1.textAlignment = 1;
    xiangqing1.font = [UIFont systemFontOfSize:14];
    [_xiangqingview addSubview:xiangqing1];
    
    
    UILabel * xiangqing2 = [[UILabel alloc] initWithFrame:CGRectMake(10,xiangqing1.frame.origin.y+xiangqing1.frame.size.height+10,  _xiangqingview.frame.size.width-20, 50)];
    NSString *labelText = @"小街风情意大利餐厅供应地道的意式风情美食。餐厅创办10余年，秉承一贯品质至上的原则，意大利厨师团队为您打造别具风格的地道意式美食。";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    xiangqing2.attributedText = attributedString;
    xiangqing2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    xiangqing2.textAlignment = 0;
    xiangqing2.font = [UIFont systemFontOfSize:12];
    xiangqing2.numberOfLines = 0;
    [xiangqing2 sizeToFit];
    [_xiangqingview addSubview:xiangqing2];
    
    
    for (int i = 0; i < 3; i++) {
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(10+(_xiangqingview.frame.size.width-30)/3*i+5*i, xiangqing2.frame.origin.y+xiangqing2.frame.size.height+5, (_xiangqingview.frame.size.width-30)/3, (_xiangqingview.frame.size.width-30)/3-20)];
        imv.backgroundColor = [UIColor orangeColor];
        [_xiangqingview addSubview:imv];
        
        if (i == 0) {
            
            UILabel * djslabel = [[UILabel alloc] initWithFrame:CGRectMake(0,imv.frame.origin.y+imv.frame.size.height+10,APPwidth, 20)];
            djslabel.text = @"73时59分 后过期";
            djslabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
            djslabel.textAlignment = 1;
            djslabel.font = [UIFont systemFontOfSize:12];
            [djslabel sizeToFit];
            [_xiangqingview addSubview:djslabel];
            
            
            CGRect fram = djslabel.frame;
            fram.origin.x = APPwidth/2-djslabel.frame.size.width/2;
            fram.origin.y = imv.frame.origin.y+imv.frame.size.height+10;
            djslabel.frame = fram;
            
            
            UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(djslabel.frame.origin.x-20, djslabel.frame.origin.y, 15, 15)];
            imv.image = [UIImage imageNamed:@"renwu_shijian"];
            [_xiangqingview addSubview:imv];
            
        }
    }
    
    
    
    _shangyigaodu = xiangqing2.frame.origin.y+xiangqing2.frame.size.height+5+(_xiangqingview.frame.size.width-30)/3+15;
    

}

#pragma mark - 展开
-(void)zhankai:(UIButton *)btn
{
    
    if (btn.selected == NO) {
        
      
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram1 = _dikuanview.frame;
            fram1.origin.y = _dikuanview.frame.origin.y-_shangyigaodu;
            fram1.size.height = _dikuanview.frame.size.height+_shangyigaodu;
            _dikuanview.frame = fram1;
            
            
            CGRect fram2 = _dizhiview.frame;
            fram2.origin.y = _dikuanview.frame.size.height-50;
            _dizhiview.frame = fram2;
            

            
            CGRect fram3 = _xiangqingview.frame;
            fram3.size.height = _xiangqingview.frame.size.height+_shangyigaodu;
            _xiangqingview.frame = fram3;
            

            CGRect fram4 = _yuandianbtn.frame;
            fram4.origin.y = _dikuanview.frame.origin.y-45;
            _yuandianbtn.frame = fram4;
            
        }];
        
        _xiangqingview.hidden = NO;

        btn.selected = YES;
        
    }
    else
    {
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram1 = _dikuanview.frame;
            fram1.origin.y = _dikuanview.frame.origin.y+_shangyigaodu;
            fram1.size.height = _dikuanview.frame.size.height-_shangyigaodu;
            _dikuanview.frame = fram1;
            
            CGRect fram2 = _dizhiview.frame;
            fram2.origin.y = _dikuanview.frame.size.height-50;
            _dizhiview.frame = fram2;
            

            CGRect fram3 = _xiangqingview.frame;
            fram3.size.height = 0;
            _xiangqingview.frame = fram3;
            
            CGRect fram4 = _yuandianbtn.frame;
            fram4.origin.y = _dikuanview.frame.origin.y-45;
            _yuandianbtn.frame = fram4;
            
        }];
        
        _xiangqingview.hidden = YES;

        btn.selected = NO;

        
    }
    

    
}

#pragma mark - 任务状态点击
-(void)yuyue:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"评价"]) {
        
        RWDDPingJiaVC * rwddpj = [[RWDDPingJiaVC alloc] init];
        [self.navigationController pushViewController:rwddpj animated:YES];
        
    }
    else if ([btn.titleLabel.text isEqualToString:@"放弃"]) {
        
        RWDDFangQiXuanZheVC * rwddqx = [[RWDDFangQiXuanZheVC alloc] init];
        [self.navigationController pushViewController:rwddqx animated:YES];
    }

    
}

#pragma mark - 头像点击
-(void)touxianCilck
{
    NSLog(@"头像");

}



#pragma mark - 获取到定位信息
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        
        
        if (_dwcs == 1) {
            
            _lat = [[NSString stringWithFormat:@"%.12f",userLocation.coordinate.latitude] doubleValue];
            _lon = [[NSString stringWithFormat:@"%.12f",userLocation.coordinate.longitude] doubleValue];
            
            
            CLLocationDegrees * latitude = &_lat;
            CLLocationDegrees * longitude = &_lon;
            CLLocationCoordinate2D _yuandianzuobiao = {*latitude, *longitude};
            
            
            [Single danle].dqweidu = [NSString stringWithFormat:@"%.12f",userLocation.coordinate.latitude];
            [Single danle].dqjingdu = [NSString stringWithFormat:@"%.12f",userLocation.coordinate.longitude];
            
            
            //将定位到的经纬度 设为地图的中心点
            _mapView.centerCoordinate = _yuandianzuobiao;
            
        }
        
        _dwcs++;
        
    }
}


#pragma mark - 回到定位点
-(void)yuandianCilck
{
    NSLog(@"回到定位点");

    CLLocationDegrees * latitude = &_lat;
    CLLocationDegrees * longitude = &_lon;
    CLLocationCoordinate2D _yuandianzuobiao = {*latitude, *longitude};
    
    //将定位到的经纬度 设为地图的中心点
    _mapView.centerCoordinate = _yuandianzuobiao;
}


#pragma mark - 开始导航
-(void)daohanclick
{
    DaoHangVC * daohang = [[DaoHangVC alloc] init];
//    [self.navigationController pushViewController:daohang animated:YES];
    [self presentViewController:daohang animated:YES completion:nil];

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
