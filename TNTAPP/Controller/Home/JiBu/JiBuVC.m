//
//  JiBuVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/4.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "JiBuVC.h"

@interface JiBuVC ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray * _pickarray;
    UIPickerView * _pickerView;
    
    
    NSArray * _tzpickarray;
    UIPickerView * _tzpickerView;

    
    UILabel * _zonghelabel;
    UILabel * _danweilabel;
    UIButton * _tizhongbtn;
    
    UIView * _tubiaoview;
    UIImageView * _xuanzhetiao;
    
    
    UIView * _xgtzview;
    
    NSString * _tizhong;
    NSString * _bushu;
    

    
}

@end

@implementation JiBuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.text = @"运动记录";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    
    
    [self zdydhl];
    
    
    [self zdyUI];

    
    [self jibu];

    
    
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
    biaotinglabel.text = @"运动记录";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}


#pragma mark - 自定义界面
-(void)zdyUI
{
   
    //********************数据统计*************************
    UIView * shujuview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 300-64)];
    shujuview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:shujuview];
    

#if 1
    
    
    
    _zonghelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, APPwidth/2-20, 50)];
    _zonghelabel.text = @"5445";
    _zonghelabel.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    _zonghelabel.textAlignment = NSTextAlignmentCenter;
    _zonghelabel.font = [UIFont fontWithName:@"DINOT" size:90];
    [_zonghelabel sizeToFit];
    [shujuview addSubview:_zonghelabel];
    CGRect fram = _zonghelabel.frame;
    fram.origin.x = 20;
    _zonghelabel.frame = fram;
    
    
    _danweilabel = [[UILabel alloc] initWithFrame:CGRectMake(_zonghelabel.frame.origin.x+_zonghelabel.frame.size.width+3, _zonghelabel.frame.origin.y+_zonghelabel.frame.size.height-40, 30, 20)];
    _danweilabel.text = @"步";
    _danweilabel.textColor = [UIColor whiteColor];
    _danweilabel.textAlignment = NSTextAlignmentLeft;
    _danweilabel.font = [UIFont systemFontOfSize:16];
    [shujuview addSubview:_danweilabel];

    
    _tizhongbtn = [[UIButton alloc] initWithFrame:CGRectMake(_danweilabel.frame.origin.x+_danweilabel.frame.size.width+5, _danweilabel.frame.origin.y-20, 60, 30)];
    _tizhongbtn.backgroundColor = [UIColor colorWithRed:76/255.0 green:88/255.0 blue:103/255.0 alpha:1.0];
    _tizhongbtn.layer.borderColor=[[UIColor colorWithRed:32/255.0 green:35/255.0 blue:40/255.0 alpha:1.0]CGColor];
    _tizhongbtn.layer.borderWidth= 1.0f;
    [_tizhongbtn setTitle:@"点击更新" forState:UIControlStateNormal];
    [_tizhongbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _tizhongbtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_tizhongbtn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [shujuview addSubview:_tizhongbtn];
    _tizhongbtn.hidden = YES;
    _tizhongbtn.userInteractionEnabled = YES;
    
    
    UILabel * shijianlabel = [[UILabel alloc] initWithFrame:CGRectMake(20, _zonghelabel.frame.origin.y+_zonghelabel.frame.size.height-15, 160, 20)];
    shijianlabel.text = @"2017.01.04  17:23更新";
    shijianlabel.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    shijianlabel.textAlignment = NSTextAlignmentLeft;
    shijianlabel.font = [UIFont systemFontOfSize:12];
    [shujuview addSubview:shijianlabel];
    
    
    //步数    热量   体重
    //    UIImageView * pickdi = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-120, 30, 100, 100)];
    //    pickdi.backgroundColor = [UIColor orangeColor];
    //    [shujuview addSubview:pickdi];
    
    UIImageView * yyimgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-110, 60, 100, 50)];
    yyimgv.image = [UIImage imageNamed:@"shuju_touying"];
    [shujuview addSubview:yyimgv];

    
    _pickarray = @[@"热量",@"步数",@"体重"];
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(APPwidth-100, 30, 80, 100)];
    _pickerView.showsSelectionIndicator=YES;
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [shujuview addSubview:_pickerView];

    
    //距离   时长   平均
    NSArray * array1 = @[@"距离",@"时长",@"平均"];
    NSArray * array2 = @[@"1.9 公里",@"2 小时",@"0.9 km/h"];

    for (int i = 0; i< array1.count; i++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/3*i, shijianlabel.frame.origin.y+shijianlabel.frame.size.height+35, APPwidth/3, 20)];
        label1.text = array1[i];
        label1.textColor = [UIColor whiteColor];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.font = [UIFont systemFontOfSize:16];
        [shujuview addSubview:label1];
        

        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/3*i, label1.frame.origin.y+label1.frame.size.height+5, APPwidth/3, 20)];
        label2.text = array2[i];
        label2.textColor = [UIColor whiteColor];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:16];
        label2.tag = 7100+i;
        [shujuview addSubview:label2];
        
    }
    
#endif
  
    
#if 1
    //********************图表统计*************************
    _tubiaoview = [[UIView alloc] initWithFrame:CGRectMake(0, shujuview.frame.size.height+shujuview.frame.origin.y+10, APPwidth, APPheight-310)];
    _tubiaoview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:_tubiaoview];
    


    NSArray * array3 = @[@"日",@"月",@"年"];
    for (int i = 0; i < array3.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-40)/3*i+20, 0, (APPwidth-40)/3, 40)];
        [btn setTitle:array3[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.tag = 6100+i;
        [btn addTarget:self action:@selector(xuanzhetiao:) forControlEvents:UIControlEventTouchUpInside];
        [_tubiaoview addSubview:btn];
        
        if (btn.tag == 6100) {
            
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:UIControlStateNormal];

        }
        
    }
    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(20, 40, APPwidth-40, 2)];
    xian.backgroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    [_tubiaoview addSubview:xian];

    
    _xuanzhetiao = [[UIImageView alloc] initWithFrame:CGRectMake(20, 38, (APPwidth-40)/3, 4)];
    _xuanzhetiao.image = [UIImage imageNamed:@"shuju"];
    [_tubiaoview addSubview:_xuanzhetiao];
    
    //图表
    [self showLineDemo];
    
    [self.kEchartView loadEcharts];
    
#endif
    
    
    //********************修改体重view*************************
    
    _xgtzview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _xgtzview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3];
    [self.view addSubview:_xgtzview];
    _xgtzview.hidden = YES;

//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
//    [_xgtzview addGestureRecognizer:tap];

    
    UIView * kuanview = [[UIView alloc] initWithFrame:CGRectMake(20, _xgtzview.frame.size.height/2-130, APPwidth-40, 260)];
    kuanview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    kuanview.layer.borderColor=[[UIColor colorWithRed:32/255.0 green:35/255.0 blue:40/255.0 alpha:1.0]CGColor];
    kuanview.layer.borderWidth= 1.0f;
    [_xgtzview addSubview:kuanview];
    
    
    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(0, kuanview.frame.size.height-40, kuanview.frame.size.width, 1.4)];
    xian2.backgroundColor = [UIColor colorWithRed:32/255.0 green:35/255.0 blue:40/255.0 alpha:1.0];
    [kuanview addSubview:xian2];
    
    NSArray * array = @[@"取消",@"确定"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(kuanview.frame.size.width/2*i, kuanview.frame.size.height-40, kuanview.frame.size.width/2, 40)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [kuanview addSubview:btn];
        
        if (i == 0) {
            
            UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(0, kuanview.frame.size.height-40, kuanview.frame.size.width, 1.4)];
            xian1.backgroundColor = [UIColor colorWithRed:32/255.0 green:35/255.0 blue:40/255.0 alpha:1.0];
            [kuanview addSubview:xian1];
            
            
            UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(kuanview.frame.size.width/2-0.7, kuanview.frame.size.height-40, 1.4, 40)];
            xian2.backgroundColor = [UIColor colorWithRed:32/255.0 green:35/255.0 blue:40/255.0 alpha:1.0];
            [kuanview addSubview:xian2];
            
        }
    }
    
    
    UIView * pkdikuan = [[UIView alloc] initWithFrame:CGRectMake(kuanview.frame.size.width/2-40, 10+(kuanview.frame.size.height-60)/2-16.5, 80,33)];
    pkdikuan.backgroundColor = [UIColor colorWithRed:76/255.0 green:88/255.0 blue:103/255.0 alpha:1.0];
    pkdikuan.layer.borderColor=[[UIColor colorWithRed:32/255.0 green:35/255.0 blue:40/255.0 alpha:1.0]CGColor];
    pkdikuan.layer.borderWidth= 1.0f;
    [kuanview addSubview:pkdikuan];

    
    _tzpickarray = @[@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"80",@"81",@"82",@"83",@"84",@"85",@"86"];
    
    _tzpickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(kuanview.frame.size.width/2-50, 10, 100,kuanview.frame.size.height-60)];
    _tzpickerView.showsSelectionIndicator=YES;
    _tzpickerView.dataSource = self;
    _tzpickerView.delegate = self;
    [kuanview addSubview:_tzpickerView];

    UILabel * kglabel = [[UILabel alloc] initWithFrame:CGRectMake(_tzpickerView.frame.size.width+_tzpickerView.frame.origin.x, _tzpickerView.frame.origin.y+_tzpickerView.frame.size.height/2-16.5, 50, 33)];
    kglabel.text = @"kg";
    kglabel.textColor = [UIColor whiteColor];
    kglabel.font = [UIFont systemFontOfSize:20];
    kglabel.textAlignment = NSTextAlignmentLeft;
    [kuanview addSubview:kglabel];
}


#pragma mark - 计步
-(void)jibu
{
    
    //判断设备是否支持计步
    if ([CMPedometer isStepCountingAvailable]) {
        
        NSLog(@"该设备能计步");
        
        _pedometer = [[CMPedometer alloc]init];
        
        NSDate *toDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *fromDate =
        [dateFormatter dateFromString:[dateFormatter stringFromDate:toDate]];
        
        //        NSString *dateString = [dateFormatter stringFromDate:fromDate];
        //
        //        NSLog(@"当前时间 = %@",dateString);
        
        //获取某个时间到现在的步数
        [_pedometer startPedometerUpdatesFromDate:fromDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
            
#if 0
                        NSLog(@"步数 = %@",pedometerData.numberOfSteps);
                        NSLog(@"距离 = %@",pedometerData.distance);
           
            NSLog(@" = %@",pedometerData.startDate);
            
            NSLog(@" = %@",pedometerData.endDate);

            NSLog(@" = %@",pedometerData.currentPace);

            
            NSLog(@" = %@",pedometerData.currentCadence);

            NSLog(@" = %@",pedometerData.averageActivePace);

            NSLog(@" = %@",pedometerData);


                        NSLog(@"上楼 = %@",pedometerData.floorsAscended);
                        NSLog(@"下楼 = %@",pedometerData.floorsDescended);
            
#endif
            _bushu = [NSString stringWithFormat:@"%@",pedometerData.numberOfSteps];
            
            _zonghelabel.text = _bushu;
            
            NSDateFormatter *ksdateFormatter = [[NSDateFormatter alloc] init];
            [ksdateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate *ksfromDate =
            [ksdateFormatter dateFromString:[ksdateFormatter stringFromDate:pedometerData.startDate]];
            NSString *kaishishijianstr = [ksdateFormatter stringFromDate:ksfromDate];
            
            
            
            
            NSDateFormatter *jsdateFormatter = [[NSDateFormatter alloc] init];
            [jsdateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate *jsfromDate =
            [jsdateFormatter dateFromString:[jsdateFormatter stringFromDate:pedometerData.endDate]];
            NSString *jieshushijianstr = [ksdateFormatter stringFromDate:jsfromDate];
            
     
            
            
            NSString * juli = [NSString stringWithFormat:@"%@",pedometerData.distance];
            
            NSRange ran = {0,juli.length-13};
            NSString * julistr1 = [juli substringWithRange:ran];
            NSString * hou =[julistr1 substringFromIndex:julistr1.length-3];
            NSRange range = {0,julistr1.length-3};
            NSString * qian = [julistr1 substringWithRange:range];
            NSString * gonglistr = [NSString stringWithFormat:@"%@.%@",qian,hou];
            float s = [gonglistr floatValue];
            NSString *sv = [self notRounding:s afterPoint:1];
            
            UILabel * label = (UILabel *)[self.view viewWithTag:7100];
            label.text = [NSString stringWithFormat:@"%@ 公里",sv];
            
//
//
//            
//            
//            
//            _bushulabel.text = [NSString stringWithFormat:@"今日行走步数：%@",pedometerData.numberOfSteps];
//            
//            _julilabel.text = [NSString stringWithFormat:@"距离：%@公里",sv];
//            
//            _endshijian.text = [[NSString alloc] initWithFormat:@"最后更新时间：%@",pedometerData.endDate];
//            
//            NSLog(@"%@",_bushulabel.text);
//            NSLog(@"%@",_julilabel.text);
//            NSLog(@"%@",_endshijian.text);
            
            
            
            
        }];
        
        
#if 1
        
        
        //当前时间
        NSDate * dqsjDate = [NSDate date];
        NSDateFormatter * dqsjdateFormatter = [[NSDateFormatter alloc] init];
        [dqsjdateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate * dqsjfromDate =
        [dqsjdateFormatter dateFromString:[dqsjdateFormatter stringFromDate:dqsjDate]];
        NSString *dqsjstr1 = [dqsjdateFormatter stringFromDate:dqsjfromDate];
        
        NSString *kaishishijian = [NSString stringWithFormat:@"%@ 00:00:00",dqsjstr1];
      
        NSString *jieshushijian = [NSString stringWithFormat:@"%@ 17:03:12",dqsjstr1];

    
   

#if 1
        //循环查询7天的运动步数
        for (int i = 0; i < 6; i++) {
            
            //开始时间
            NSDateFormatter* kaishiformatter=[[NSDateFormatter alloc]init];
            [kaishiformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate* ksdate=[kaishiformatter dateFromString:kaishishijian];
            

            //结束时间
            NSDateFormatter* jieshuformatter=[[NSDateFormatter alloc]init];
            [jieshuformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate* jsdate=[jieshuformatter dateFromString:jieshushijian];
            
//            NSLog(@"开始时间 = %@",kaishishijian);
//            NSLog(@"结束时间 = %@",jieshushijian);

            
            //获取步数   传入开始时间和结束时间
            [_pedometer queryPedometerDataFromDate:ksdate toDate:jsdate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
                
//                NSLog(@"10号-20号步数总和 = %@",pedometerData.numberOfSteps);
                
                
            }];
            
            
#if 1
            NSDate * Daydate = [NSDate dateWithTimeInterval:-1*24*i*60*60 sinceDate:toDate];//前一天
            NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSDate * fromDate =
            [dateFormatter dateFromString:[dateFormatter stringFromDate:Daydate]];
            NSString *str = [dqsjdateFormatter stringFromDate:fromDate];
            
            NSLog(@"%@",str);
//            kaishishijian = [NSString stringWithFormat:@"%@ 00:00:00",str];
//            
//            jieshushijian = [NSString stringWithFormat:@"%@ 59:59:59",str];
            
#endif
            
        }
       
#endif
#endif
        
        
    }
    else
    {
        NSLog(@"该设备不能计步");
        
        
        
    }
    
    
    
}
#if 1

#pragma mark - 创建图表
//创建图表
-(void)showLineDemo {
    
    /** 图表选项 */
    PYOption *option = [[PYOption alloc] init];
    //是否启用拖拽重计算特性，默认关闭
    option.calculable = NO;
    //数值系列的颜色列表(折线颜色)
    option.color = @[@"#fbba3a"];
    // 图标背景色
    option.backgroundColor = [[PYColor alloc] initWithColor:[UIColor colorWithRed:50/255.0 green:54/255.0 blue:61/255.0 alpha:1.0]];
    
    
    /** 提示框 **********************************************/
    PYTooltip *tooltip = [[PYTooltip alloc] init];
    // 触发类型 默认数据触发
    tooltip.trigger = @"axis";
    // 竖线宽度
    tooltip.axisPointer.lineStyle.width = @1;
    // 提示框 文字样式设置
    tooltip.textStyle = [[PYTextStyle alloc] init];
    tooltip.textStyle.fontSize = @12;
    // 添加到图标选择中
    option.tooltip = tooltip;
    
    
    /** 图例 *************************************/
    PYLegend *legend = [[PYLegend alloc] init];
    // 设置数据
    //    legend.data = @[@"挂牌价",@"成交价"];
    // 添加到图标选择中
    option.legend = legend;
    
    
    /****************** 直角坐标系内绘图网格, 说明见下图 */
    PYGrid *grid = [[PYGrid alloc] init];
    // 左上角位置
    grid.x = @(0);//Y轴文字显示高度
    grid.y = @(10);
    // 右下角位置
    grid.x2 = @(20);
    grid.y2 = @(0);//X轴文字显示高度
    grid.borderWidth = @(0);
    // 添加到图标选择中
    option.grid = grid;
    
    
    /** X轴设置 */
    PYAxis *xAxis = [[PYAxis  alloc] init];
    //横轴默认为类目型(就是坐标自己设置)
    xAxis.type = @"category";
    // 起始和结束两端空白
    xAxis.boundaryGap = @(YES);
    // 分隔线
    xAxis.splitLine.show = NO;
    // 坐标轴线
    xAxis.axisLine.show = YES;
    // X轴坐标数据
    xAxis.data = @[@"12.29", @"12.30", @"12.31", @"01.01", @"01.02", @"01.03", @"01.04" ];
    // 坐标轴小标记
    xAxis.axisTick = [[PYAxisTick alloc] init];
    xAxis.axisTick.show = NO;
    
    // 添加到图标选择中
    option.xAxis = [[NSMutableArray alloc] initWithObjects:xAxis, nil];
    
    
    /** Y轴设置 */
    PYAxis *yAxis = [[PYAxis alloc] init];
    yAxis.axisLine.show = NO;
    // 纵轴默认为数值型(就是坐标系统生成), 改为 @"category" 会有问题, 读者可以自行尝试
    yAxis.type = @"value";
    // 分割段数，默认为5
    yAxis.splitNumber = @4;
    // 隐藏分割线
    yAxis.splitLine.show = NO;   //'solid' | 'dotted' | 'dashed' 虚线类型
    
    //单位设置,  设置最大值, 最小值
    //     yAxis.axisLabel.formatter = @"{value} k";
    //     yAxis.max = @9000;
    //     yAxis.min = @5000;
    // 添加到图标选择中  ( y轴更多设置, 自行查看官方文档)
    option.yAxis = [[NSMutableArray alloc] initWithObjects:yAxis, nil];
    
    
    
    /** 定义坐标点数组 */
    NSMutableArray *seriesArr = [NSMutableArray array];
    
    /** 第一条折线设置 */
    PYCartesianSeries *series1 = [[PYCartesianSeries alloc] init];
    // 类型为折线
    series1.type = @"line";
    // 每个坐标圆点大小
    series1.symbolSize = @(2);
    // 坐标点样式, 设置连线的宽度
    series1.itemStyle = [[PYItemStyle alloc] init];
    series1.itemStyle.normal = [[PYItemStyleProp alloc] init];
    series1.itemStyle.normal.lineStyle = [[PYLineStyle alloc] init];
    series1.itemStyle.normal.lineStyle.width = @(1.5);//线的粗细
    
    series1.symbol = @"emptyCircle";
    
    
    
    //    series1.symbol = @"circle";
    
    
    // 添加坐标点 y 轴数据
    series1.data = @[@"2000", @"7619", @"3271", @"7670", @"1228", @"6640", @"7472"];
    
    
    [seriesArr addObject:series1];
  
    
    [option setSeries:seriesArr];
    
    
    
    /** 初始化图表 */
    self.kEchartView = [[PYZoomEchartsView alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-20, _tubiaoview.frame.size.height-100)];
    // 添加到 scrollView 上
    [_tubiaoview addSubview:self.kEchartView];
    // 图表选项添加到图表上
    [self.kEchartView setOption:option];
    
    
    
    //    self.kEchartView.backgroundColor = [UIColor redColor];
    
    UIView * dibuview =[[UIView alloc] initWithFrame:CGRectMake(10, self.kEchartView.frame.size.height+40, self.kEchartView.frame.size.width, 23)];
    [_tubiaoview addSubview:dibuview];
    UIView * xian =[[UIView alloc] initWithFrame:CGRectMake(0, 0, dibuview.frame.size.width, 2)];
    xian.backgroundColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    xian.layer.cornerRadius = 2;
    xian.layer.masksToBounds = YES;
    [dibuview addSubview:xian];
    
    NSArray * array = @[@"12.29", @"12.30", @"12.31", @"01.01", @"01.02", @"01.03", @"01.04"];
    
    float x = 5;
    float w = (dibuview.frame.size.width-15)/array.count;
    for (int i = 0; i < array.count; i++) {
        
        
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(x, 3, w, 20)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置文字靠左
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [dibuview addSubview:btn];
        
        
        x = x + w;
    }
    
    
}
#endif




#pragma mark - 日 月 年 选择条
-(void)xuanzhetiao:(UIButton *)btn
{
    for (int i = 0; i < 3; i++) {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:6100+i];
        [btn1 setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:UIControlStateNormal];
        
    }
    
    [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:UIControlStateNormal];

    [UIView animateWithDuration:0.1 animations:^{
      
        CGRect fram = _xuanzhetiao.frame;
        fram.origin.x = (APPwidth-40)/3*(btn.tag-6100)+20;
        _xuanzhetiao.frame = fram;

    }];
    
}

#pragma mark -- PickerView的代理方法的实现
//列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// 每列多少个
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == _pickerView) {
     
        return 3;

    }
    else
    {
        return _tzpickarray.count;
 
    }
}

// 每列显示的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (pickerView == _pickerView) {
        
        return _pickarray[row];
        
    }
    else
    {
        return _tzpickarray[row];
        
    }
    
}


// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    

    return 80;
}
// 每列高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{

    return 33;
 
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{

    

    if (pickerView == _pickerView) {
        
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 2, 80, 30)];
        view.backgroundColor = [UIColor colorWithRed:76/255.0 green:88/255.0 blue:103/255.0 alpha:1.0];
        
        
        //设置分割线的颜色
        for(UIView *singleLine in pickerView.subviews)
        {
            if (singleLine.frame.size.height < 1)
            {
                singleLine.backgroundColor = [UIColor clearColor];
            }
        }

        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        label.text = _pickarray[row];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        
    }
    else
    {
        
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 33)];
        
        
        //设置分割线的颜色
        for(UIView *singleLine in pickerView.subviews)
        {
            if (singleLine.frame.size.height < 1)
            {
                singleLine.backgroundColor = [UIColor clearColor];
            }
        }

        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 33)];
        label.text = _tzpickarray[row];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20];
        label.tag = 7000+row;
        [view addSubview:label];

    }
   
//    [_pickerView selectRow:0  inComponent:1 animated:YES];

    return view;
}


// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == _pickerView) {
        
        switch (row) {
                
            case 0:
            {
                _zonghelabel.text = @"9525";
                
                _danweilabel.text = @"Cal";
                
                _tizhongbtn.hidden = YES;
                
                
            }
                break;
                
            case 1:
            {
                _zonghelabel.text = _bushu;
                
                _danweilabel.text = @"步";
                
                _tizhongbtn.hidden = YES;
                
            }
                break;
                
                
            case 2:
            {
                if (_tizhong.length <= 0) {
                    
                    _zonghelabel.text = @"47";

                }
                else
                {
                    _zonghelabel.text = _tizhong;

                }
                
                _danweilabel.text = @"kg";
                
                _tizhongbtn.hidden = NO;
                
                _tizhongbtn.userInteractionEnabled = YES;
                
            }
                break;
                
                
            default:
                break;
        }
        
       
        [_zonghelabel sizeToFit];
        CGRect fram = _zonghelabel.frame;
        fram.origin.x = 20;
        _zonghelabel.frame = fram;
        
        CGRect fram2 = _danweilabel.frame;
        fram2.origin.x = _zonghelabel.frame.origin.x+_zonghelabel.frame.size.width+3;
        _danweilabel.frame = fram2;
        
        
        CGRect fram3 = _tizhongbtn.frame;
        fram3.origin.x = _danweilabel.frame.origin.x+_danweilabel.frame.size.width+10;
        _tizhongbtn.frame = fram3;

    }
    else
    {
        NSLog(@"选择体重%@kg",_tzpickarray[row]);
        NSLog(@"第几个  %ld",(long)row);

        
        _tizhong = _tzpickarray[row];
        

        
//        for(int i = 7000; i < _tzpickarray.count; i++)
//        {
//            
//            UILabel * label = (UILabel *)[self.view viewWithTag:i];
//            label.font = [UIFont systemFontOfSize:18];
//           
//        }
//        
//        UILabel * label = (UILabel *)[self.view viewWithTag:7000+row];
//        label.font = [UIFont systemFontOfSize:30];
        
    }

    
   
}


#pragma mark - 按钮点击事件
-(void)btnclick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"点击更新"]) {
        
        _xgtzview.hidden = NO;

    }
    else if([btn.titleLabel.text isEqualToString:@"确定"])
    {
        _zonghelabel.text = _tizhong;

        [_zonghelabel sizeToFit];
        CGRect fram = _zonghelabel.frame;
        fram.origin.x = 20;
        _zonghelabel.frame = fram;
        
        CGRect fram2 = _danweilabel.frame;
        fram2.origin.x = _zonghelabel.frame.origin.x+_zonghelabel.frame.size.width+3;
        _danweilabel.frame = fram2;
        
        
        CGRect fram3 = _tizhongbtn.frame;
        fram3.origin.x = _danweilabel.frame.origin.x+_danweilabel.frame.size.width+10;
        _tizhongbtn.frame = fram3;
        
        
        _xgtzview.hidden = YES;

    }
    else if([btn.titleLabel.text isEqualToString:@"取消"])
    {
        _xgtzview.hidden = YES;

    }
}


#pragma mark - 单击手势  隐藏修改体重view
-(void)dealTap
{
    _xgtzview.hidden = YES;
}


#pragma mark - 四舍五入
-(NSString *)notRounding:(float)price afterPoint:(int)position{
    
    //NSRoundPlain表示 四舍五入
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *ouncesDecimal;
    
    NSDecimalNumber *roundedOunces;
    
    
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    
    return [NSString stringWithFormat:@"%@",roundedOunces];
    
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
