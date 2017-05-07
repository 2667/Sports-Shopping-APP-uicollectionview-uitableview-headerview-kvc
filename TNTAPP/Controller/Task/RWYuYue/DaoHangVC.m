//
//  DaoHangVC.m
//  DiTuDemo
//
//  Created by tnt_mdf on 2016/12/30.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "DaoHangVC.h"
#import <AMapNaviKit/AMapNaviKit.h>
//#import "SpeechSynthesizer.h"


@interface DaoHangVC ()<MAMapViewDelegate,AMapNaviDriveManagerDelegate,AMapNaviDriveViewDelegate>
{
    UILabel * _biaoting;
}

@property (nonatomic, strong) AMapNaviPoint *startPoint;
@property (nonatomic, strong) AMapNaviPoint *endPoint;
@property (nonatomic, strong) MAMapView * mapView;
@property (nonatomic, strong) AMapNaviDriveManager * driveManager;
@property (nonatomic, strong) AMapNaviDriveView *driveView;


@end

@implementation DaoHangVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initProperties];

    [self initDriveView];

    [self initDriveManager];

    [self calculateRoute];

    [self zdydaohan];
    
    

}


-(void)zdydaohan
{
    //***********头部**********
    UIView * daohangview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    daohangview.backgroundColor = [UIColor colorWithRed:67/255.0 green:152/255.0 blue:224/255.0 alpha:1.0];
    [self.view addSubview:daohangview];
    
    
    //设置导航栏的标题
    _biaoting = [[UILabel alloc] initWithFrame:CGRectMake(40, 28, self.view.frame.size.width-80, 25)];
    _biaoting.textAlignment = NSTextAlignmentCenter;
    _biaoting.font =  [UIFont systemFontOfSize:14];
    _biaoting.textColor = [UIColor whiteColor];
    [daohangview addSubview:_biaoting];

    
    //***********底部**********
    UIView * dibuview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-50, self.view.frame.size.width, 50)];
    dibuview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8];
    [self.view addSubview:dibuview];
    

    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    xian.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];;
    [dibuview addSubview:xian];
    
    
    
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(14, 14, 22, 22)];
    imgv.image =[UIImage imageNamed:@"denglu_guanbi"];
    [dibuview addSubview:imgv];
    UIButton * fanhueibtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:1<<6];
    [dibuview addSubview:fanhueibtn];

    
}


#pragma mark - 设置起点和终点的经纬度
- (void)initProperties
{
    
    double qdweidu = [[Single danle].dqweidu doubleValue];
    double qdjindu = [[Single danle].dqjingdu doubleValue];
    
    double zdweidu = [@"22.793503" doubleValue];
    double zdjindu = [@"113.529602" doubleValue];
    

    //为了方便展示,选择了固定的起终点
    self.startPoint = [AMapNaviPoint locationWithLatitude:qdweidu longitude:qdjindu];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:zdweidu longitude:zdjindu];
}


#pragma mark - 初始化 MAMapView。
- (void)initMapView
{
    if (self.mapView == nil)
    {
        self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height)];
        self.mapView.showsUserLocation = YES;
        [self.view addSubview:self.mapView];
        
        
        [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
        
        _mapView.zoomLevel = 17;
        
    }
}


#pragma mark - 初始化 AMapNaviDriveManager。
- (void)initDriveManager
{
    if (self.driveManager == nil)
    {
        
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
        
        //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
        [self.driveManager addDataRepresentative:self.driveView];
        
//        self.driveManager = [[AMapNaviDriveManager alloc] init];
//        [self.driveManager setDelegate:self];
//        
//        [self.driveManager setAllowsBackgroundLocationUpdates:YES];
//        [self.driveManager setPausesLocationUpdatesAutomatically:NO];
//        
//        //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
//        [self.driveManager addDataRepresentative:self.driveView];

    }
}


#pragma mark - 创建 AMapNaviDriveView
- (void)initDriveView
{
    if (self.driveView == nil)
    {
        self.driveView = [[AMapNaviDriveView alloc] initWithFrame:self.view.bounds];
        self.driveView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.driveView setDelegate:self];
        
        
        //将导航界面的界面元素进行隐藏，然后通过自定义的控件展示导航信息
        [self.driveView setShowUIElements:NO];
        
        
//        [self.driveView setNormalTexture:[UIImage imageNamed:@"denglu_beijing"]];
        
        
        //设置自定义的Car图标和CarCompass图标
//        [self.driveView setCarImage:[UIImage imageNamed:@"customCar"]];
//        [self.driveView setCarCompassImage:[UIImage imageNamed:@"customCompass"]];
        

        
        [self.view addSubview:self.driveView];
    }
}



#pragma mark - 计算驾车规划路线
- (void)calculateRoute
{
    //进行路径规划
    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
                                                endPoints:@[self.endPoint]
                                                wayPoints:nil
                                          drivingStrategy:AMapNaviDrivingStrategySingleDefault];
}


#pragma mark - 算路成功后开始GPS导航
- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"onCalculateRouteSuccess");
    
    
    //算路成功后开始GPS导航
    [self.driveManager startGPSNavi];
}


#pragma mark - 导航播报信息回调函数
- (void)driveManager:(AMapNaviDriveManager *)driveManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType
{
    NSLog(@"导航文字信息 = %@",soundString);
    _biaoting.text = soundString;

    //获取到导航消息 调起语音播报功能
#if 0
    
    //调用高德的SpeechSynthesizer 来实现语音功能
    if (soundStringType == AMapNaviSoundTypePassedReminder)
    {
        //用系统自带的声音做简单例子，播放其他提示音需要另外配置
        AudioServicesPlaySystemSound(1009);
    }
    else
    {
        [[SpeechSynthesizer sharedSpeechSynthesizer] speakString:soundString];
    }

    
#endif
    
}


- (AMapNaviRoutePolylineOption *)driveView:(AMapNaviDriveView *)driveView needUpdatePolylineOptionForRoute:(AMapNaviRoute *)naviRoute
{
    //自定义普通路线Polyline的样式
    AMapNaviRoutePolylineOption *polylineOption = [[AMapNaviRoutePolylineOption alloc] init];
    polylineOption.lineWidth = 8;
    polylineOption.drawStyleIndexes = [NSArray arrayWithArray:naviRoute.wayPointCoordIndexes];
    polylineOption.replaceTrafficPolyline = NO;
    
    //可以使用颜色填充,也可以使用纹理图片(当同时设置时,strokeColors设置将被忽略)
    polylineOption.strokeColors = @[[UIColor purpleColor], [UIColor brownColor], [UIColor orangeColor]];
    //polylineOption.textureImages = @[[UIImage imageNamed:@"arrowTexture2"], [UIImage imageNamed:@"arrowTexture3"], [UIImage imageNamed:@"arrowTexture4"]];
    
    return polylineOption;
}


#pragma mark - 返回
-(void)fanhuei
{
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];

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
