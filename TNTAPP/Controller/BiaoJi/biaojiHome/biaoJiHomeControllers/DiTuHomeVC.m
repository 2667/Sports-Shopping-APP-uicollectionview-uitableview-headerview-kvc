//
//  TaskVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/19.
//  Copyright © 2016年 TNT. All rights reserved.
//
 
#import "DiTuHomeVC.h"
#import "TaskCell.h"
#import "TaskXiangQingVC.h"
#import "BiaoJiCell.h"
#import "TaskFaBuVC.h"
#import "DITuLieBiaoViewController.h"
#import "guanZuViewController.h"
#import "DiTuTanChuanView.h"

@interface DiTuHomeVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,MAMapViewDelegate>
{
    UILabel * _biaoting;
    BOOL _shangjiaqiehuabool;
    
    UIView * _caidanview;
    BOOL _caidanbool;
    UIScrollView * _caidansv;
    UIView * _yidongtiao;
    int _lanmuxuanzhe;

    
    UIButton * _yuandibtn;
    
    UIView * _xinxikuanview;
    UIScrollView * _dikuansv;
    int _dikuanyema;
    
    UIView * _tayaoview;
    
    
    UIView * _rwliebiaoview;
    UITableView * _rwliebiaotableview;
    BOOL _rwlbbool;

    
    MAMapView *_mapView;
    int _dwcs;
    
    BOOL _zhankaibool;
    NSTimer * _xxkuantimer;
    
    double _lat;
    double _lon;

    
    
    UIView * _fabuxuanzheview;
    BOOL _fabuxuanzhebool;
    
}

@property(nonatomic,strong)DiTuTanChuanView *tanChuanView;

@end

@implementation DiTuHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
  
    
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blueColor];
    NSArray *fontFamilies = [UIFont familyNames];
    NSLog (@"%@",fontFamilies);
    _dwcs = 1;
    
    _zhankaibool = YES;
    
    _caidanbool = YES;
    
    _shangjiaqiehuabool = YES;
    
    _rwlbbool = YES;
    
    _fabuxuanzhebool = YES;
    
    _dikuanyema = 0;
    
    _lanmuxuanzhe = 0;
    
    
    [self zdydhl];
    
    [self zdyUI];
    
    [self zdycaidan];
    
    [self zdyrwliebiao];
    
    [self zdyfabuxuanzhe];
    [self yicangfabuxuanzhe];
}


-(void)removeTanChuanView:(UIImageView*)imageView{

    [self.tanChuanView removeFromSuperview];

}

//
-(DiTuTanChuanView *)tanChuanView{
    if (_tanChuanView==nil) {
        //初始化
        _tanChuanView = [DiTuTanChuanView instance];
        
        _tanChuanView.CloseImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singletouchgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeTanChuanView:)];
        
        [_tanChuanView.CloseImageView  addGestureRecognizer:singletouchgesture];
        
//        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:_tanChuanView.bottomView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
//        
//        CAShapeLayer * layer = [[CAShapeLayer alloc]init];
//        
//        layer.frame = _tanChuanView.bottomView.bounds;
//        
//        layer.path = path.CGPath;
//        
//        _tanChuanView.bottomView.layer.mask = layer;
        
        
        
        [self.view addSubview:_tanChuanView];

    }
    
    return _tanChuanView;
}



#pragma mark - 自定义导航栏
-(void)zdydhl
{
//    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 104)];
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 63, APPwidth, 1)];
   xian.image =[UIImage imageNamed:@"shouye-fengexian"];
    [daohan addSubview:xian]; 
    
    
//    UIButton * touxianbtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 24, 36, 36)];
     UIButton * touxianbtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 22, 30, 30)];
//    touxianbtn.backgroundColor = [UIColor orangeColor];
    [touxianbtn setImage:[UIImage imageNamed:@"biaojishouye_fanhui"] forState:UIControlStateNormal];
    
    touxianbtn.layer.cornerRadius = 18;
    touxianbtn.layer.masksToBounds = YES;
    touxianbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [touxianbtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
    touxianbtn.tag = 6200;
    [daohan addSubview:touxianbtn];
    
    
    
    
//    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 22, APPwidth-200, 30)];
    _biaoting.text = @"地图";
    _biaoting.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    _biaoting.textAlignment = NSTextAlignmentCenter;
    _biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:_biaoting];
    
    
    //相机按钮
    UIButton * dianpubtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 22, 30, 30)];
    [dianpubtn setImage:[UIImage imageNamed:@"biaojishouye_fabiao"] forState:UIControlStateNormal];
    [dianpubtn setImage:[UIImage imageNamed:@"biaojishouye_fabiao"] forState:UIControlStateSelected];
    [dianpubtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
    dianpubtn.tag = 6201;
    [daohan addSubview:dianpubtn];
    
    
    //地址切换按钮
//    UIButton * dizibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-45, 22, 40, 40)];
//    [dizibtn setTitle:@"附近" forState:UIControlStateNormal];
//    [dizibtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    dizibtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    [dizibtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
//    dizibtn.tag = 6230;
//    [daohan addSubview:dizibtn];
    
    
    
    
}


#pragma mark - 自定义界面UI
-(void)zdyUI
{
    //添加地图view
//    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 104, APPwidth, APPheight-104-49)];
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 60, APPwidth, APPheight-60-49)];
    
//    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 104, APPwidth, APPheight)];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    _mapView.showsCompass = NO;//隐藏罗盘
    _mapView.showsScale = NO;//隐藏比例尺
    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
    [self.view addSubview:_mapView];
    _mapView.userTrackingMode = MAUserTrackingModeFollow; // 追踪用户位置.
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    _mapView.zoomLevel = 13.5;//地图的缩放比例
    
    
//标记
    NSMutableArray * biaojiarray = [[NSMutableArray alloc] init];

    NSArray * bjarray1 = @[@"22.794815",@"22.784405",@"22.744005",@"22.793805",@"22.794905",@"22.794205",@"22.794895",@"22.794505"];
    NSArray * bjarray2 = @[@"113.538144",@"113.538544",@"113.588944",@"113.538344",@"113.538244",@"113.538444",@"113.538644",@"113.538744"];
    for (int i = 0; i < bjarray1.count; i++) {
        
        double lat = [[NSString stringWithFormat:@"%@",bjarray1[i]] doubleValue];
        double lon = [[NSString stringWithFormat:@"%@",bjarray2[i]] doubleValue];
        CLLocationDegrees * latitude = &lat;
        CLLocationDegrees * longitude = &lon;
        
        CLLocationCoordinate2D coordinates = {*latitude, *longitude};
        
        MAPointAnnotation *a1 = [[MAPointAnnotation alloc] init];
        a1.coordinate = coordinates;
        [biaojiarray addObject:a1];
    }
   
    
    [_mapView addAnnotations:biaojiarray];

    
    //4个竖立按钮
    NSArray * array = @[@"renwu_liebiaozhaunhuan",@"biaoji_ditushouye_tubiao_wodehaoyou",@"biaoji_ditushouye_tubiao_haoyouyaoqing",@"biaoji_ditushouye_tubiao_tanchuang"];
 
    for (int i = 0; i < array.count; i++) {
        
//        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-45, 120+35*i+15*i, 35, 35)];
         UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 80+30*i+7.5*i, 30, 30)];
        btn.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        btn.tag = 6213+i;
        [btn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        
    }
    
    
    //放大和缩小按钮
    NSArray * arrayFanDa = @[@"DituHomebig",@"DituHomesmall"];
    
    for (int i = 0; i < arrayFanDa.count; i++) {
        
        //        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-45, 120+35*i+15*i, 35, 35)];
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 320+30*i, 30, 30)];
        btn.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
        
        
        UIBezierPath * path;
        if (i==0) {
            path = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
        
        }else{
        path = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
        
        }
        
        
        CAShapeLayer * layer = [[CAShapeLayer alloc]init];
        
        layer.frame = btn.bounds;
        
        layer.path = path.CGPath;
        
        btn.layer.mask = layer;
        
        
        
//        btn.layer.cornerRadius = 5;
//        btn.layer.masksToBounds = YES;
        [btn setImage:[UIImage imageNamed:arrayFanDa[i]] forState:UIControlStateNormal];
        btn.tag = 7000+i;
        [btn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        
    }
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(APPwidth-40+5, 320+30, 30-10, 3)];
    imageV.image = [UIImage imageNamed:@"DituHomefengexian"];
    [self.view addSubview:imageV];
//    _yuandibtn = [[UIButton alloc] initWithFrame:CGRectMake(10, APPheight-49-180-50, 35, 35)];
    //定位按钮
     _yuandibtn = [[UIButton alloc] initWithFrame:CGRectMake(10, APPheight-150, 30, 30)];
    
    _yuandibtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    _yuandibtn.layer.cornerRadius = 5;
    _yuandibtn.layer.masksToBounds = YES;
    [_yuandibtn setImage:[UIImage imageNamed:@"renwu_dingwei"] forState:UIControlStateNormal];
    _yuandibtn.tag = 7100;
    [_yuandibtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_yuandibtn];
    

    
    //******************信息框****************************
    _xinxikuanview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-49-190, APPwidth, 160)];
//    [self.view addSubview:_xinxikuanview];
    
    
    _tayaoview = [[UIView alloc] initWithFrame:CGRectMake(10, 0, _xinxikuanview.frame.size.width-20, 40)];
    [_xinxikuanview addSubview:_tayaoview];
    
    NSArray * array2 = @[@"Ta要",@"Ta行"];
    for (int i= 0; i < 3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(60*i+5*i, 0, 60, 30)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 15;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor=[[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]CGColor];
        btn.layer.borderWidth= 1.0f;
        btn.tag = 6217+i;
        btn.contentHorizontalAlignment = 0;
        [btn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        [_tayaoview addSubview:btn];
        
        
        
        if (btn.tag == 6219) {
            
            CGRect fram = btn.frame;
            fram.size.width = 40;
            btn.frame = fram;
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
            imgv.image = [UIImage imageNamed:@"renwu_fabu"];
            [btn addSubview:imgv];

        }
        else
        {
            [btn setTitle:array2[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:@"Alba Matter" size:16];

        }
        
        if (btn.tag == 6217) {
            
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            [btn setTitleColor:[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0] forState:UIControlStateNormal];
            
        }

    }
    
    
    _dikuansv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, _xinxikuanview.frame.size.width, 120)];
    _dikuansv.pagingEnabled = YES;
    _dikuansv.clipsToBounds = NO;
    _dikuansv.delegate = self;
    _dikuansv.showsHorizontalScrollIndicator = NO;
    _dikuansv.showsVerticalScrollIndicator = NO;
    [_xinxikuanview addSubview:_dikuansv];
    
    
    _xxkuantimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(lunbotimer) userInfo:nil repeats:YES];

    
    for (int i = 0; i < 4; i++) {
        
        UIButton * dikuanview = [[UIButton alloc] initWithFrame:CGRectMake(_dikuansv.frame.size.width*i+10, 0, _dikuansv.frame.size.width-20, 120)];
        dikuanview.backgroundColor = [UIColor whiteColor];
        dikuanview.layer.shadowColor = [UIColor blackColor].CGColor;
        dikuanview.layer.shadowOffset = CGSizeMake(4,4);
        dikuanview.layer.shadowOpacity = 0.1;
        dikuanview.layer.shadowRadius = 6;
        dikuanview.clipsToBounds = NO;
        [dikuanview addTarget:self action:@selector(xiangqingtiaozhuan) forControlEvents:UIControlEventTouchUpInside];
        dikuanview.tag = 7200+i;
        [_dikuansv addSubview:dikuanview];
        
        
        //达人资料view
        UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dikuanview.frame.size.width, 70)];
        [dikuanview addSubview:view1];
        
        
        UIButton * zhankaibtn = [[UIButton alloc] initWithFrame:CGRectMake(view1.frame.size.width/2-15, 0, 30, 15)];
        [zhankaibtn setImage:[UIImage imageNamed:@"renwu_zhankai"] forState:0];
        [zhankaibtn setImage:[UIImage imageNamed:@"renwu_shouqi"] forState:UIControlStateSelected];
        [zhankaibtn addTarget:self action:@selector(zhankai:) forControlEvents:UIControlEventTouchUpInside];
        zhankaibtn.tag = 7300+i;
        [view1 addSubview:zhankaibtn];
        

        
        UIButton * touxianbtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        touxianbtn.backgroundColor =  [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
        touxianbtn.layer.cornerRadius = 25;
        touxianbtn.layer.masksToBounds = YES;
        [touxianbtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        touxianbtn.tag = 6221;
        [view1 addSubview:touxianbtn];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(touxianbtn.frame.size.width+touxianbtn.frame.origin.x+5, 15, 200, 20)];
        label1.text = @"英语辅导";
        label1.textColor = [UIColor blackColor];
        label1.font = [UIFont systemFontOfSize:16];
        [view1 addSubview:label1];
        [label1 sizeToFit];
      
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.size.width+label1.frame.origin.x+5, label1.frame.origin.y, 30, 12)];
        label2.text = @"线下";
        label2.textColor = [UIColor whiteColor];
        label2.backgroundColor = [UIColor colorWithRed:156/255.0 green:100/255.0 blue:31/255.0 alpha:1.0];
        label2.layer.cornerRadius = 3;
        label2.layer.masksToBounds = YES;
        label2.font = [UIFont systemFontOfSize:10];
        label2.textAlignment = NSTextAlignmentCenter;
        [view1 addSubview:label2];
        

    
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(touxianbtn.frame.size.width+touxianbtn.frame.origin.x+5, label1.frame.origin.y+label1.frame.size.height+5, 80, 20)];
        label3.text = @"幸运草";
        label3.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
        label3.font = [UIFont systemFontOfSize:12];
        label3.textAlignment = NSTextAlignmentRight;
        [label3 sizeToFit];
        [view1 addSubview:label3];
        
        UIImageView * imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(label3.frame.origin.x+label3.frame.size.width+2, label3.frame.origin.y+2, 12, 12)];
        imgv1.image = [UIImage imageNamed:@"shouye_nv"];
        [view1 addSubview:imgv1];
        
        
        UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(imgv1.frame.size.width+imgv1.frame.origin.x+15, label3.frame.origin.y-3, 80, 20)];
        label4.text = @"赏金2000元";
        label4.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
        label4.font = [UIFont systemFontOfSize:14];
        label4.textAlignment = NSTextAlignmentRight;
        [view1 addSubview:label4];
        

        NSArray * tubiao1 = @[@"renwu_dianhuan",@"renwu_sixin1"];
        for (int i = 0; i < tubiao1.count; i++) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-105+30*i+15*i, 20, 30, 30)];
            [btn setImage:[UIImage imageNamed:tubiao1[i]] forState:0];
            [view1 addSubview:btn];
            
        }
        
        //任务详情view
        UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 70, dikuanview.frame.size.width, 0)];
        view3.tag = 7400+i;
        [dikuanview addSubview:view3];
        view3.layer.masksToBounds = YES;
        
        
        UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, view3.frame.size.width-20, 1)];
        xian1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        [view3 addSubview:xian1];
        
        
        UILabel * xiangqing1 = [[UILabel alloc] initWithFrame:CGRectMake(0,10,  view3.frame.size.width, 20)];
        xiangqing1.text = @"任 务 详 情";
        xiangqing1.textColor = [UIColor blackColor];
        xiangqing1.textAlignment = 1;
        xiangqing1.font = [UIFont systemFontOfSize:14];
        [view3 addSubview:xiangqing1];
        
        
        UILabel * xiangqing2 = [[UILabel alloc] initWithFrame:CGRectMake(10,xiangqing1.frame.origin.y+xiangqing1.frame.size.height+10,  view3.frame.size.width-20, 50)];
        NSString *labelText = @"小街风情意大利餐厅供应地道的意式风情美食。餐厅创办10余年，秉承一贯品质至上的原则，意大利厨师团队为您打造别具风格的地道意式美食，餐厅的装修淳朴亲切，尽现浪漫的地中海风情，让许多身在异国的意大利人有归家般的温暖感觉。口感淳厚地道的海鲜汤、风味诱人的意粉、鲜嫩美妙的安格斯肉扒、";
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5.0f];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        xiangqing2.attributedText = attributedString;
        xiangqing2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        xiangqing2.textAlignment = 0;
        xiangqing2.font = [UIFont systemFontOfSize:11];
        xiangqing2.numberOfLines = 0;
        [xiangqing2 sizeToFit];
        [view3 addSubview:xiangqing2];
        

        for (int i = 0; i < 3; i++) {
            
            UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(10+(view3.frame.size.width-30)/3*i+5*i, xiangqing2.frame.origin.y+xiangqing2.frame.size.height+5, (view3.frame.size.width-30)/3, (view3.frame.size.width-30)/3)];
            imv.backgroundColor = [UIColor orangeColor];
            [view3 addSubview:imv];
            
        }
        
        
        
        //地址view
        UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 70, dikuanview.frame.size.width, dikuanview.frame.size.height-70)];
        view2.tag = 7500+i;
        [dikuanview addSubview:view2];
        

        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(10, 0, view2.frame.size.width-20, 1)];
        xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        [view2 addSubview:xian];
        
        

        UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 20)];
        label5.text = @"广州市 · 南沙区";
        label5.textColor = [UIColor blackColor];
        label5.font = [UIFont systemFontOfSize:12];
        [view2 addSubview:label5];
        
        
        UILabel * label6 = [[UILabel alloc] initWithFrame:CGRectMake(10, label5.frame.origin.y+label5.frame.size.height, 200, 20)];
        label6.text = @"中环都爹利街13号乐成行地库中层";
        label6.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label6.font = [UIFont systemFontOfSize:10];
        [view2 addSubview:label6];
        
        UIButton * yuyuebtn = [[UIButton alloc] initWithFrame:CGRectMake(view2.frame.size.width-110, 10, 100, 30)];
        yuyuebtn.backgroundColor =  [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        [yuyuebtn setTitle:@"预约" forState:0];
        [yuyuebtn setTitleColor:[UIColor whiteColor] forState:0];
        yuyuebtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [yuyuebtn addTarget:self action:@selector(yuyue) forControlEvents:UIControlEventTouchUpInside];
        [view2 addSubview:yuyuebtn];
        
        
#if 0
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(dikuanview.frame.size.width-90, label2.frame.origin.y, 80, 20)];
        label3.text = @"赏金2000元";
        label3.textColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
        label3.font = [UIFont systemFontOfSize:14];
        label3.textAlignment = NSTextAlignmentRight;
        [dikuanview addSubview:label3];
        
        
        UIButton * yuyuebtn = [[UIButton alloc] initWithFrame:CGRectMake(dikuanview.frame.size.width-70, -30, 60, 60)];
        yuyuebtn.backgroundColor =  [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
        yuyuebtn.layer.cornerRadius = 30;
        yuyuebtn.layer.masksToBounds = YES;
        [yuyuebtn setTitle:@"预约" forState:UIControlStateNormal];
        [yuyuebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [yuyuebtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        yuyuebtn.tag = 6220;
        [dikuanview addSubview:yuyuebtn];
        

        UIButton * touxianbtn = [[UIButton alloc] initWithFrame:CGRectMake(10, label2.frame.origin.y+label2.frame.size.height+5, 50, 50)];
        touxianbtn.backgroundColor =  [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
        touxianbtn.layer.cornerRadius = 25;
        touxianbtn.layer.masksToBounds = YES;
        [touxianbtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        touxianbtn.tag = 6221;
        [dikuanview addSubview:touxianbtn];
        
        
        UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(touxianbtn.frame.size.width+touxianbtn.frame.origin.x+5, touxianbtn.frame.origin.y+5, 80, 20)];
        label4.text = @"幸运草";
        label4.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
        label4.font = [UIFont systemFontOfSize:14];
        label4.textAlignment = NSTextAlignmentRight;
        [label4 sizeToFit];
        [dikuanview addSubview:label4];
        
        UIImageView * imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(label4.frame.origin.x+label4.frame.size.width+2, label4.frame.origin.y+2, 12, 12)];
        imgv1.image = [UIImage imageNamed:@"shouye_nv"];
        [dikuanview addSubview:imgv1];
       
        
        NSArray * tubiao2 = @[@"renwu_juli",@"renwu_pingjia"];
        NSArray * wenzi = @[@"390m",@"190"];

        for (int i = 0; i < 2; i++) {
            
            
            
            UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(dikuanview.frame.size.width-55, label4.frame.origin.y+15*i+5*i, 50, 15)];
            label5.text = wenzi[i];
            label5.textColor = [UIColor colorWithRed:92/255.0 green:92/255.0 blue:92/255.0 alpha:1.0];
            label5.font = [UIFont systemFontOfSize:12];
            label5.textAlignment = NSTextAlignmentLeft;
            [dikuanview addSubview:label5];

            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(label5.frame.origin.x-15, label5.frame.origin.y+2.5, 10, 10)];
            imgv.image = [UIImage imageNamed:tubiao2[i]];
            [dikuanview addSubview:imgv];
        
        }

#endif
    }
    
    _dikuansv.contentSize = CGSizeMake(_dikuansv.frame.size.width*4, 0);
    
   
}



#pragma mark - 创建菜单
-(void)zdycaidan
{
    _caidanview = [[UIView alloc] initWithFrame:CGRectMake(0, 104, APPwidth, APPheight)];
    _caidanview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    [self.view addSubview:_caidanview];
    _caidanview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [_caidanview addGestureRecognizer:tap];
    
    
    UIView * caidandi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPwidth)];
    caidandi.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_caidanview addSubview:caidandi];
    
    NSArray * tubiao = @[@"fenlei_jiudian",@"fenlei_xiuxian",@"fenlei_fuzhuang",@"fenlei_weixiu",@"fenlei_jiadian",@"fenlei_shouji",@"fenlei_jiaoyu",@"fenlei_meifa",@"fenlei_jianshen"];
    NSArray * wenzi = @[@"酒店",@"休闲娱乐",@"服装",@"维修",@"家电",@"手机",@"教育",@"美容美发",@"健身"];
    
    float x = 0;
    float y = 0;
    float w = APPwidth/3;
    
    for (int i = 0; i < tubiao.count; i++) {
        
        
        if ( i % 3 == 0 && i != 0) {
            
            x = 0;
            y = y + w;
        }
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, w)];
        [caidandi addSubview:view];
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-15, view.frame.size.height/2-30, 30, 30)];
        imv.image = [UIImage imageNamed:tubiao[i]];
        [view addSubview:imv];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, imv.frame.origin.y+imv.frame.size.height+10, view.frame.size.width, 30)];
        label.text = wenzi[i];
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
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
        btn.tag = 6503+i;
        [view addSubview:btn];
        x = x + w;
    }
    
}

#pragma mark - 创建任务列表
-(void)zdyrwliebiao
{
    _rwliebiaoview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, APPheight-160-49)];
    _rwliebiaoview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_rwliebiaoview];

    
    //*******************任务列表*******************
    _rwliebiaotableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, _rwliebiaoview.frame.size.height)];
    _rwliebiaotableview.delegate = self;
    _rwliebiaotableview.dataSource = self;
    _rwliebiaotableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _rwliebiaotableview.bounces = NO;
    [_rwliebiaoview addSubview:_rwliebiaotableview];
    
    
    NSArray * array2 = @[@"Ta要",@"Ta行"];
    for (int i= 0; i < 3; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(60*i+5*i+10, _rwliebiaoview.frame.size.height-45, 60, 30)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 15;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor=[[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]CGColor];
        btn.layer.borderWidth= 1.0f;
        btn.tag = 6240+i;
        btn.contentHorizontalAlignment = 0;
        [btn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        [_rwliebiaoview addSubview:btn];
        
        
        
        if (btn.tag == 6242) {
            
            CGRect fram = btn.frame;
            fram.size.width = 40;
            btn.frame = fram;
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
            imgv.image = [UIImage imageNamed:@"renwu_fabu"];
            [btn addSubview:imgv];
            
        }
        else
        {
            [btn setTitle:array2[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:@"Alba Matter" size:16];
            
        }
        
        if (btn.tag == 6240) {
            
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            [btn setTitleColor:[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0] forState:UIControlStateNormal];
            
        }
        
    }
    
    //回到顶部
    UIButton * dianpubtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, _rwliebiaoview.frame.size.height-45, 35, 35)];
    [dianpubtn setImage:[UIImage imageNamed:@"remwu_zhiding"] forState:UIControlStateNormal];
    [dianpubtn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
    dianpubtn.tag = 6243;
    [_rwliebiaoview addSubview:dianpubtn];
    

    
    
}

#pragma mark - 创建发布选择界面
-(void)zdyfabuxuanzhe
{

    _fabuxuanzheview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    [self.view addSubview:_fabuxuanzheview];
    _fabuxuanzheview.hidden = YES;
    
    //添加毛玻璃效果
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    toolbar.barStyle = UIBarStyleBlack;
    [_fabuxuanzheview addSubview:toolbar];
    
    
    NSArray * wenzi1 = @[@"Wo能",@"Wo要",@"商家专属"];
    NSArray * wenzi2 = @[@"搬家跑腿,应有尽有",@"技能服务,各展所长",@"签到领奖,惊喜不断"];
    NSArray * tubiao = @[@"renwu_woyao",@"renwu_woneng",@"renwu_shangjia1"];


    for (int i = 0; i < wenzi1.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(25, 120+90*i+15*i, APPwidth-50, 90)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        [btn setTitle:wenzi1[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(fabu:) forControlEvents:UIControlEventTouchUpInside];
        [_fabuxuanzheview addSubview:btn];
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 60, 60)];
        img.image = [UIImage imageNamed:tubiao[i]];
        [btn addSubview:img];
        
        
        UILabel * label1 =[[UILabel alloc] initWithFrame:CGRectMake(80, 15, btn.frame.size.width-90, 30)];
        label1.text = wenzi1[i];
        label1.textColor = [UIColor colorWithRed:255/255.0 green:180/255.0 blue:48/255.0 alpha:1.0];
        label1.font = [UIFont fontWithName:@"Alba Matter" size:22];
        [btn addSubview:label1];
        
        
        
        UILabel * label2 =[[UILabel alloc] initWithFrame:CGRectMake(80, 45, btn.frame.size.width-90, 30)];
        label2.text = wenzi2[i];
        label2.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        label2.font = [UIFont systemFontOfSize:15];
        [btn addSubview:label2];
        

    }
    
    UIButton * yicangfabu = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-25, APPheight-80, 50, 40)];
    yicangfabu.backgroundColor = [UIColor whiteColor];
    yicangfabu.layer.cornerRadius = 20;
    yicangfabu.layer.masksToBounds = YES;
    yicangfabu.layer.borderColor=[[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]CGColor];
    yicangfabu.layer.borderWidth= 1.0f;
    [yicangfabu addTarget:self action:@selector(yicangfabuxuanzhe) forControlEvents:UIControlEventTouchUpInside];
    [_fabuxuanzheview addSubview:yicangfabu];
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
    imgv.image = [UIImage imageNamed:@"renwu_guanbi1"];
    [yicangfabu addSubview:imgv];
    
}



#pragma mark - 下拉菜单点击
-(void)caidanCilck:(UIButton *)btn
{

    switch (btn.tag) {
       
            //全部
        case 6202:
        {
            
            
        }
            break;
            
            //酒店
        case 6203:
        {
            
            
        }
            break;
            
            //休闲娱乐
        case 6204:
        {
            
            
        }
            break;
            
            //服装
        case 6205:
        {
            
            
        }
            break;
            
            //维修
        case 6206:
        {
            
        }
            break;

            //家电
        case 6207:
        {
            
        }
            break;
            

            //手机
        case 6208:
        {
            
        }
            break;
            
            //教育
        case 6209:
        {
            
        }
            break;
            
            //美容美发
        case 62010:
        {
            
        }
            break;
            
            //健身
        case 6211:
        {
            
        }
            break;
            
        
            
        default:
            break;
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect fram = _yidongtiao.frame;
        fram.origin.x = btn.frame.origin.x+btn.frame.size.width/2-30;
        _yidongtiao.frame = fram;
    }];
    
    for(int i = 6202;i < 6212;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }

    [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:UIControlStateNormal];
}

#pragma mark - 按钮点击
-(void)btnCilck:(UIButton *)btn
{
    NSLog(@"%ld",(long)btn.tag);
    switch (btn.tag) {
            //头像
        case 6200:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
            
            /*
            //店铺
        case 6201:
        {
            if (_shangjiaqiehuabool == YES) {
                
                btn.selected = YES;
                _shangjiaqiehuabool = NO;
                _biaoting.text = @"商家";

            }
            else
            {
                btn.selected = NO;
                _shangjiaqiehuabool = YES;
                _biaoting.text = @"达人";

            }
        }
           */
            break;
            
            //地址切换
        case 6230:
        {

        }
            break;
            

            
            //菜单
        case 6212:
        {
            if (_caidanbool == YES) {
                
                _caidanview.hidden = NO;
                
                _caidanbool = NO;

            }
            else
            {
                _caidanview.hidden = YES;
                
                _caidanbool = YES;
            
            }
            
        }
            break;
            
           
            
            //信息框——预约
        case 6220:
        {
            
        }
            break;
            

            
            //信息框——头像
        case 6221:
        {
            
        }
            break;
            

            
            //地图——他要
        case 6217:
        {
            
            UIButton * btn1 = (UIButton *)[self.view viewWithTag:6218];
            btn1.backgroundColor = [UIColor whiteColor];
            
            
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            
            
        }
            break;
            

            //地图——他行
        case 6218:
        {

            UIButton * btn1 = (UIButton *)[self.view viewWithTag:6217];
            btn1.backgroundColor = [UIColor whiteColor];
       
            
            
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            


        }
            break;
            

            //地图——发布
        case 6219:
        {
            _fabuxuanzheview.hidden = NO;
           
            ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;

        }
            break;
            
            //任务列表
        case 6213:
        {
            
            ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
 
//            guanZuViewController
            
            DITuLieBiaoViewController * guanZuViewC = [[DITuLieBiaoViewController alloc]init];
            
//            guanZuViewController * guanZuViewC = [[guanZuViewController alloc]init];
         
            [self.navigationController pushViewController:guanZuViewC animated:YES];
            
            break;
            
            if (_rwlbbool == YES) {
                
                UIButton * btn1 = (UIButton *)[self.view viewWithTag:6213];

                UIButton * btn2 = (UIButton *)[self.view viewWithTag:6215];

                [UIView animateWithDuration:0.3 animations:^{
                    
                    CGRect fram = _rwliebiaoview.frame;
                    fram.origin.y = 160;
                    _rwliebiaoview.frame = fram;
                    
                    
                    CGRect fram1 = btn2.frame;
                    fram1.origin.y = btn1.frame.origin.y;
                    fram1.origin.x = btn1.frame.origin.x-btn1.frame.size.width-15;
                    btn2.frame = fram1;
                
                }];

                _rwlbbool = NO;
            }
            else
            {
                
                UIButton * btn1 = (UIButton *)[self.view viewWithTag:6213];
                
                UIButton * btn2 = (UIButton *)[self.view viewWithTag:6215];
                

                [UIView animateWithDuration:0.3 animations:^{
                    
                    CGRect fram = _rwliebiaoview.frame;
                    fram.origin.y = APPheight;
                    _rwliebiaoview.frame = fram;
                    
                    
                    CGRect fram1 = btn2.frame;
//                    fram1.origin.y = btn1.frame.origin.y+100;
                       fram1.origin.y = btn1.frame.origin.y+75;
                    fram1.origin.x = btn1.frame.origin.x;
                    btn2.frame = fram1;
                    

                }];
                
                _rwlbbool = YES;
            }
        }
            break;
            
            //地图——屏蔽
        case 6214:
        {
            
        }
            break;
            
            //地图——消息
        case 6215:
        {
            
        }
            break;
            
            //地图——弹窗
        case 6216:
        {
//            CLLocationDegrees * latitude = &_lat;
//            CLLocationDegrees * longitude = &_lon;
//            CLLocationCoordinate2D _yuandianzuobiao = {*latitude, *longitude};
//            
//            //将定位到的经纬度 设为地图的中心点
//            _mapView.centerCoordinate = _yuandianzuobiao;
            
            if (_tanChuanView!=nil) {
                [self.view addSubview:_tanChuanView];
            }else{
            [self tanChuanView];
            
            }
            
            
            
            
//            _tanChuanView.frame = CGRectMake(0, 0, 0, 0);
            
            
            [UIView animateWithDuration:3 animations:^{
                

             _tanChuanView.frame = self.view.bounds;
                
            }];
            
         
            
            
        }

            break;
        case 7100:
        {
            
        CLLocationDegrees * latitude = &_lat;
        CLLocationDegrees * longitude = &_lon;
        CLLocationCoordinate2D _yuandianzuobiao = {*latitude, *longitude};

        //将定位到的经纬度 设为地图的中心点
        _mapView.centerCoordinate = _yuandianzuobiao;
            
        }
            break;


            
            //列表——回到顶部
        case 6243:
        {
            
            [UIView animateWithDuration:0.2 animations:^{
            
                CGPoint point =  _rwliebiaotableview.contentOffset;
                point.y = 0;
                _rwliebiaotableview.contentOffset = point;
                
            }];
            
           

        }
            break;

            
            //列表——他要
        case 6240:
        {
            UIButton * btn1 = (UIButton *)[self.view viewWithTag:6241];
            btn1.backgroundColor = [UIColor whiteColor];
            
            
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        }
            break;
            

            
            //列表——他行
        case 6241:
        {
            UIButton * btn1 = (UIButton *)[self.view viewWithTag:6240];
            btn1.backgroundColor = [UIColor whiteColor];
            
            
            
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            

        }
            break;
            

            
            //列表——发布
        case 6242:
        {
            _fabuxuanzheview.hidden = NO;

            ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;

            
        }
            break;
            //列表——他行
        case 7000:
        {
            _mapView.zoomLevel =_mapView.zoomLevel +0.5;
//            [_mapView setZoomLevel:16 animated:YES];
            
            
        }
            break;
            //列表——他行
        case 7001:
        {
           
             _mapView.zoomLevel =_mapView.zoomLevel -0.5;
            
        }
            break;


        default:
            break;
    }
}



#pragma mark - 菜单按钮点击
-(void)caidanclick:(UIButton *)btn
{

    

    if (btn.tag-6503 > 3) {
        
        CGPoint point =  _caidansv.contentOffset;
        point.x = _caidansv.frame.size.width;
        _caidansv.contentOffset = point;
        

    }
    else if(btn.tag-6503 <= 3)
    {
        CGPoint point = _caidansv.contentOffset;
        point.x = 0;
        _caidansv.contentOffset = point;
        
    }

    for(int i = 6202;i < 6212;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        if (btn1.tag + 300 ==btn.tag) {
          
            
            [btn1 setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:UIControlStateNormal];
           
            [UIView animateWithDuration:0.3 animations:^{
                
                CGRect fram = _yidongtiao.frame;
                fram.origin.x = btn1.frame.origin.x+btn1.frame.size.width/2-30;
                _yidongtiao.frame = fram;
            }];

        }
    }
    
    _caidanview.hidden = YES;
    
    _caidanbool = YES;
}


#pragma mark - 发布
-(void)fabu:(UIButton *)btn
{
    
    TaskFaBuVC * fabu = [[TaskFaBuVC alloc] init];
    fabu.shenfei = btn.titleLabel.text;
    [self.navigationController pushViewController:fabu animated:YES];

}

#pragma mark - 展开
-(void)zhankai:(UIButton *)btn
{
    
    if (_zhankaibool == YES) {
        
        btn.selected = YES;
 
        _zhankaibool = NO;
        
        [_xxkuantimer invalidate];

        UIButton * btn1 = (UIButton *)[self.view viewWithTag:6215];
       
        UIButton * btn2 = (UIButton *)[self.view viewWithTag:btn.tag-100];
     
        UIView * view = (UIView *)[self.view viewWithTag:btn.tag+100];

        UIView * view2 = (UIView *)[self.view viewWithTag:btn.tag+200];

        
        [UIView animateWithDuration:0.3 animations:^{
          
            CGRect fram1 = _xinxikuanview.frame;
            fram1.origin.y = btn1.frame.origin.y+10;
            fram1.size.height = APPheight-btn1.frame.size.height-btn1.frame.origin.y-49-10;
            _xinxikuanview.frame = fram1;

            
            CGRect fram2 = _yuandibtn.frame;
            fram2.origin.y = _xinxikuanview.frame.origin.y-40;
            _yuandibtn.frame = fram2;
            
            
            CGRect fram3 = btn2.frame;
            fram3.size.height = _xinxikuanview.frame.size.height-40;
            btn2.frame = fram3;
            
            
            
            CGRect fram5 = view2.frame;
            fram5.origin.y = btn2.frame.size.height-50;
            view2.frame = fram5;
            
            
            CGRect fram4 = view.frame;
            fram4.origin.y = 70;
            fram4.size.height = view2.frame.origin.y-70;
            view.frame = fram4;
            
            
        }];
        
        
        
    }
    else
    {
        btn.selected = NO;
        
        _zhankaibool = YES;
        
    
        _xxkuantimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(lunbotimer) userInfo:nil repeats:YES];
        
        UIButton * btn2 = (UIButton *)[self.view viewWithTag:btn.tag-100];
        
        UIView * view = (UIView *)[self.view viewWithTag:btn.tag+100];
        
        UIView * view2 = (UIView *)[self.view viewWithTag:btn.tag+200];
        
    
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram1 = _xinxikuanview.frame;
            fram1.origin.y = APPheight-49-190;
            fram1.size.height = 160;
            _xinxikuanview.frame = fram1;
            
            
            CGRect fram2 = _yuandibtn.frame;
            fram2.origin.y = APPheight-49-230;
            _yuandibtn.frame = fram2;
            
            
            CGRect fram3 = btn2.frame;
            fram3.size.height = 120;
            btn2.frame = fram3;
            
            
            
            CGRect fram5 = view2.frame;
            fram5.origin.y = btn2.frame.size.height-50;
            view2.frame = fram5;
            
            
            CGRect fram4 = view.frame;
            fram4.origin.y = 70;
            fram4.size.height = 0;
            view.frame = fram4;
            
        }];
        

        
    }

    
}


#pragma mark - 预约
-(void)yuyue
{
    NSLog(@"预约");
}

#pragma mark - 隐藏发布选择
-(void)yicangfabuxuanzhe
{
    
    _fabuxuanzheview.hidden = YES;
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;

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
    TaskCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[TaskCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.touxiang.backgroundColor = [UIColor orangeColor];
    cell.touxiang.layer.cornerRadius = 35;
    cell.touxiang.layer.masksToBounds = YES;
    
    cell.biaoting.text = @"丰收季求搬运";
    cell.biaoting.font = [UIFont systemFontOfSize:16];
    cell.biaoting.textColor = [UIColor whiteColor];
    cell.biaoting.textAlignment = NSTextAlignmentLeft;
    [cell.biaoting sizeToFit];
    
    
    cell.jiage.text = @"200元";
    cell.jiage.font = [UIFont systemFontOfSize:16];
    cell.jiage.textColor = [UIColor colorWithRed:252/255.0 green:180/255.0 blue:59/255.0 alpha:1.0];
    cell.jiage.textAlignment = NSTextAlignmentLeft;
    CGRect fram1 = cell.jiage.frame;
    fram1.origin.x = cell.biaoting.frame.origin.x+cell.biaoting.frame.size.width+10;
    cell.jiage.frame = fram1;

    
    cell.neirong.text = @"今年家里小麦大丰收 求几位高大的帮忙搬运";
    cell.neirong.font = [UIFont systemFontOfSize:14];
    cell.neirong.textColor = [UIColor colorWithRed:115/255.0 green:115/255.0 blue:115/255.0 alpha:1.0];
    cell.neirong.textAlignment = NSTextAlignmentLeft;
    

    cell.name.text = @"幸运草";
    cell.name.font = [UIFont systemFontOfSize:12];
    cell.name.textColor = [UIColor whiteColor];
    cell.name.textAlignment = NSTextAlignmentLeft;
    [cell.name sizeToFit];
    
    
    cell.xingbie.image = [UIImage imageNamed:@"shouye_nan"];
    CGRect fram2 = cell.xingbie.frame;
    fram2.origin.x = cell.name.frame.origin.x+cell.name.frame.size.width+2;
    fram2.origin.y = cell.name.frame.origin.y+1;
    cell.xingbie.frame = fram2;
    

    cell.renzheng1.image = [UIImage imageNamed:@"shouye_shiming"];
    CGRect fram3 = cell.renzheng1.frame;
    fram3.origin.x = cell.xingbie.frame.origin.x+cell.xingbie.frame.size.width+8;
    fram3.origin.y = cell.xingbie.frame.origin.y;
    cell.renzheng1.frame = fram3;
    

    cell.renzheng2.image = [UIImage imageNamed:@"shouye_zhifu"];
    CGRect fram4 = cell.renzheng2.frame;
    fram4.origin.x = cell.renzheng1.frame.origin.x+cell.renzheng1.frame.size.width+4;
    fram4.origin.y = cell.renzheng1.frame.origin.y;
    cell.renzheng2.frame = fram4;
    
    
    cell.renzheng3.image = [UIImage imageNamed:@"shouye_jineng"];
    CGRect fram5 = cell.renzheng3.frame;
    fram5.origin.x = cell.renzheng2.frame.origin.x+cell.renzheng2.frame.size.width+4;
    fram5.origin.y = cell.renzheng2.frame.origin.y;
    cell.renzheng3.frame = fram5;
    

    
    cell.yuyue.backgroundColor = [UIColor colorWithRed:252/255.0 green:180/255.0 blue:59/255.0 alpha:1.0];
    cell.yuyue.layer.cornerRadius = 25;
    cell.yuyue.layer.masksToBounds = YES;
    [cell.yuyue setTitle:@"预 约" forState:UIControlStateNormal];
    [cell.yuyue setTitleColor:[UIColor whiteColor] forState:0];
    cell.yuyue.titleLabel.font = [UIFont systemFontOfSize:14];
    

    cell.juliimg.image = [UIImage imageNamed:@"renwu_juli"];

    cell.julilabel.text = @"390m";
    cell.julilabel.font = [UIFont systemFontOfSize:12];
    cell.julilabel.textColor = [UIColor colorWithRed:98/255.0 green:98/255.0 blue:98/255.0 alpha:1.0];
    cell.julilabel.textAlignment = NSTextAlignmentLeft;
    

    cell.xian.image = [UIImage imageNamed:@"shouye-fengexian"];
    
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
    return 100;
    
}


//尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


//尾部
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 50)];
    view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    
    
   
    return view;
    
}
#pragma mark - 信息框的点击——跳转到详情
-(void)xiangqingtiaozhuan
{
    TaskXiangQingVC * taskxq = [[TaskXiangQingVC alloc] init];
    [self.navigationController pushViewController:taskxq animated:YES];
    

}

#pragma mark - 单击手势 隐藏菜单界面
-(void)dealTap
{
    _caidanview.hidden = YES;
    
    _caidanbool = YES;
    
}

#pragma mark - 信息框的信息轮播
-(void)lunbotimer
{
    if (_dikuanyema == 4) {
        _dikuanyema = 0;
    }
    
    
    [UIView animateWithDuration:0.4 animations:^{
        
        CGPoint point =  _dikuansv.contentOffset;
        point.x = APPwidth*_dikuanyema;
        _dikuansv.contentOffset = point;
    
        _dikuanyema++;
        
    }];
    

    
}

#pragma mark - 信息框的移动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    //图片的偏移位置
    CGPoint point =  scrollView.contentOffset;
    
    
    _dikuanyema = point.x/APPwidth;
    
    
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
            
            
            //将定位到的经纬度 设为地图的中心点
            _mapView.centerCoordinate = _yuandianzuobiao;
            
        }
        
        _dwcs++;
        
    }
}

#pragma mark - 自定义标记,气泡
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
#if 1
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
//        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
        
        //地图上显示￥200的信息
        CGFloat HeadeimgW = 30;
        UIImageView * Headeimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, HeadeimgW, HeadeimgW)];
        Headeimg.image = [UIImage imageNamed:@"beauty1"];
       

        Headeimg.layer.cornerRadius = HeadeimgW/2;
        
        Headeimg.layer.masksToBounds = YES;
        CGFloat labelH = 25;
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(HeadeimgW-25, (HeadeimgW-labelH)/2, 250, labelH)];
        label.text = @"今天天气好晴朗,处处好风光";
        label.textColor = [UIColor colorWithRed:255/255.0 green:183/255.0 blue:60/255.0 alpha:1.0];
        label.backgroundColor = [UIColor grayColor];
        label.font = [UIFont fontWithName:@"FZDaHei-B02S" size:16];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = labelH/2;
        
        label.layer.masksToBounds = YES;
        
        [annotationView addSubview:label];
        
         [annotationView addSubview:Headeimg];
        
        // 设置文字属性 要和label的一致
        NSDictionary *attrs = @{NSFontAttributeName : label.font};
        CGSize maxSize = CGSizeMake(MAXFLOAT, 25);
        
        // 计算文字占据的宽度
        CGSize size = [label.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(size.width+10+22, 5, 15, 15)];
        img.image = [UIImage imageNamed:@"biaoji_ditutanmui_zan"];
        [label addSubview:img];
        
//        label.center = img.center;
//        label.backgroundColor = [UIColor redColor];
//        annotationView.backgroundColor = [UIColor blueColor];
        return annotationView;
#endif
        
        
    }
    return nil;
}

#if 0
#pragma mark - 当前位置的标记
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MAAnnotationView *view = views[0];
    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
        
        view.calloutOffset = CGPointMake(0, 0);
        
//        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        img.image = [UIImage imageNamed:@"renwu_qianbi"];
//        [view addSubview:img];
    }
    
}
#endif

//在视图即将出现的时候
-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    _fabuxuanzheview.hidden = YES;

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
