//
//  WoDeJinBiVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/20.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WoDeJinBiVC.h"
#import "JinBiChouJiangVC.h"
#import "JinBiMingXiVC.h"

@interface WoDeJinBiVC ()
{
    UIScrollView * _zhengscrollview;
    
    UIImageView * _hueiliimgv;
    BOOL _hueilibool;
   
    UIView * _jinbiyueview;
    UIView * _jinbidueihuanview;
    UIView * _jinbihueilview;

}

@end

@implementation WoDeJinBiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _hueilibool = YES;
    
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
    biaoting.text = @"我的金币";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    UIButton * mxbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, 26, 40, 30)];

    [mxbtn setTitle:@"明细" forState:0];
    mxbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [mxbtn addTarget:self action:@selector(jinbimx) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:mxbtn];
    

    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];

    
    //**************金币余额**************
    _jinbiyueview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth,210)];
    _jinbiyueview.backgroundColor = [UIColor colorWithRed:0/255.0 green:131/255.0 blue:202/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_jinbiyueview];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 150, 20)];
    label1.text = @"当前金币(个)";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    [_jinbiyueview addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, label1.frame.origin.y+label1.frame.size.height+10, 180, 50)];
    label2.text = @"125";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:50];
    [_jinbiyueview addSubview:label2];
    

    UIButton * wanfabtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-120, 20, 100, 20)];
    [wanfabtn setTitle:@"金币玩法" forState:0];
    [wanfabtn setTitleColor:[UIColor whiteColor] forState:0];
    wanfabtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [wanfabtn setImage:[UIImage imageNamed:@"wode_yue_wenhao"] forState:0];
    wanfabtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [wanfabtn addTarget:self action:@selector(wanfa) forControlEvents:1<<6];
    [_jinbiyueview addSubview:wanfabtn];
    
    
    NSArray * array1 = @[@"昨日夺金(个)",@"累计夺金(个)"];
    NSArray * array2 = @[@"5",@"89"];
    for (int i = 0; i < array1.count; i++) {
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i+20, label2.frame.origin.y+label2.frame.size.height+20, APPwidth/2-20, 20)];
        label3.text = array1[i];
        label3.textColor = [UIColor whiteColor];
        label3.font = [UIFont systemFontOfSize:16];
        [_jinbiyueview addSubview:label3];
        
        
        UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i+50, label3.frame.origin.y+label3.frame.size.height+30, APPwidth/2-50, 30)];
        label4.text = array2[i];
        label4.textColor = [UIColor whiteColor];
        label4.font = [UIFont systemFontOfSize:30];
        [_jinbiyueview addSubview:label4];

        if (i == 0) {
            
            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/2, label3.frame.origin.y, 1, 75)];
            xian.backgroundColor = [UIColor whiteColor];
            [_jinbiyueview addSubview:xian];
            

            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(label3.frame.origin.x, label3.frame.origin.y+label3.frame.size.height+2, 20, 20)];
            imgv.image = [UIImage imageNamed:@"jinbi_xiaozhu"];
            [_jinbiyueview addSubview:imgv];
            

            UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(imgv.frame.origin.x+imgv.frame.size.width+2, imgv.frame.origin.y, label3.frame.size.width-25, 20)];
            label5.text = @"：3345步 X 4.56%";
            label5.textColor = [UIColor whiteColor];
            label5.font = [UIFont systemFontOfSize:14];
            [_jinbiyueview addSubview:label5];
            

        }
    }

    
    
    //**************金币汇率**************
    _jinbihueilview = [[UIView alloc] initWithFrame:CGRectMake(0, _jinbiyueview.frame.origin.y+_jinbiyueview.frame.size.height, APPwidth,50)];
    _jinbihueilview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:60/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_jinbihueilview];
    
    
    _hueiliimgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-40, 15, 20, 20)];
    _hueiliimgv.image = [UIImage imageNamed:@"jinbihuilv_xiala"];
    [_jinbihueilview addSubview:_hueiliimgv];
    

    
    UIButton * hueilibtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, APPwidth-20, 50)];
    [hueilibtn setTitle:@"金币汇率(%)：3.425" forState:0];
    [hueilibtn setTitleColor:[UIColor whiteColor] forState:0];
    hueilibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [hueilibtn addTarget:self action:@selector(hueil:) forControlEvents:1<<6];
    hueilibtn.contentHorizontalAlignment = 1;
    [_jinbihueilview addSubview:hueilibtn];
    
    
   
    [self zdytubiao];
    
    [self.kEchartView loadEcharts];

    
    //**************金币兑换 抽奖**************
    _jinbidueihuanview = [[UIView alloc] initWithFrame:CGRectMake(0, _jinbihueilview.frame.origin.y+_jinbihueilview.frame.size.height+10, APPwidth,160)];
    _jinbidueihuanview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:60/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_jinbidueihuanview];
    
    NSArray * array3 = @[@"金币兑现",@"金币抽奖"];
    NSArray * array4 = @[@"今日最多",@"剩余机会"];
    NSArray * array5 = @[@"5元",@"3次"];
    NSArray * array6 = @[@"金币兑换 每日5元",@"每次消耗1K金币"];
    for (int i = 0; i < array3.count; i++) {
        
        UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i+40, 20, APPwidth/2-40, 30)];
        label4.text = array3[i];
        label4.textColor = [UIColor whiteColor];
        label4.font = [UIFont systemFontOfSize:18];
        [_jinbidueihuanview addSubview:label4];
        
        
        UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i+40, label4.frame.origin.y+label4.frame.size.height+5, APPwidth/2-40, 20)];
        label5.text = array4[i];
        label5.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label5.font = [UIFont systemFontOfSize:14];
        [_jinbidueihuanview addSubview:label5];
        
        
        UILabel * label6 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i+40, label5.frame.origin.y+label5.frame.size.height+5, 50, 30)];
        label6.text = array5[i];
        label6.textColor = [UIColor colorWithRed:255/255.0 green:179/255.0 blue:59/255.0 alpha:1.0];
        label6.font = [UIFont systemFontOfSize:22];
        [_jinbidueihuanview addSubview:label6];
        

        UILabel * label7 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i+40, label6.frame.origin.y+label6.frame.size.height+10, APPwidth/2-40, 20)];
        label7.text = array6[i];
        label7.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label7.font = [UIFont systemFontOfSize:14];
        [_jinbidueihuanview addSubview:label7];

        if (i == 0) {
            
            UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/2, 0, 1, _jinbidueihuanview.frame.size.height)];
            xian.image = [UIImage imageNamed:@"renwu_fengexianshu"];
            [_jinbidueihuanview addSubview:xian];
            
            
            UIButton * dueihuanbtn = [[UIButton alloc] initWithFrame:CGRectMake(label6.frame.origin.x+label6.frame.size.width+10, label6.frame.origin.y, 80, 30)];
            [dueihuanbtn setTitle:@"兑 换" forState:0];
            [dueihuanbtn setTitleColor:[UIColor colorWithRed:255/255.0 green:179/255.0 blue:59/255.0 alpha:1.0] forState:0];
            dueihuanbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            dueihuanbtn.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:179/255.0 blue:59/255.0 alpha:1.0] CGColor];
            dueihuanbtn.layer.borderWidth = 1;
            dueihuanbtn.layer.cornerRadius = 15;
            dueihuanbtn.layer.masksToBounds = YES;
            [dueihuanbtn addTarget:self action:@selector(dueihuan) forControlEvents:1<<6];
            [_jinbidueihuanview addSubview:dueihuanbtn];
            

        }
        else if (i == 1)
        {
            UIButton * coujianbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-50, label6.frame.origin.y+5, 20, 20)];
            [coujianbtn setImage:[UIImage imageNamed:@"jinbi_jinbichoujiang"] forState:0];
            [_jinbidueihuanview addSubview:coujianbtn];
            

            
            UIButton * coujianbtn2 = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2+10, 10, APPwidth/2-40, _jinbidueihuanview.frame.size.height-20)];
            [coujianbtn2 addTarget:self action:@selector(coujian) forControlEvents:1<<6];
            [_jinbidueihuanview addSubview:coujianbtn2];
            

        }
        
    }
    
    
    
}

#pragma mark - 创建图表
-(void)zdytubiao
{
#if 1
    
    _jinbihueilview.layer.masksToBounds = YES;
    
    
    NSArray * array = @[@"12.29", @"12.30", @"12.31", @"01.01", @"01.02", @"01.03", @"01.04"];
    
    float x = 10;
    float w = (_jinbihueilview.frame.size.width-20)/array.count;
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(x, 220, w, 20)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置文字靠左
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_jinbihueilview addSubview:btn];
        
        UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(x+w/2, 50, 1, 160)];
        xian1.backgroundColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:0.1];
        [_jinbihueilview addSubview:xian1];
        
        if (i < 6) {
            
            UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(10+((_jinbihueilview.frame.size.width-20)/array.count)/2, 50+32*i, APPwidth-(10+((_jinbihueilview.frame.size.width-20)/array.count)/2)*2, 1)];
            xian2.backgroundColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:0.1];
            [_jinbihueilview addSubview:xian2];
            

        }
        
        x = x + w;
    }
    
    

    
    /** 图表选项 */
    PYOption *option = [[PYOption alloc] init];
    //是否启用拖拽重计算特性，默认关闭
    option.calculable = NO;
    //数值系列的颜色列表(折线颜色)
    option.color = @[@"#fbba3a"];
    // 图标背景色
    option.backgroundColor = [[PYColor alloc] initWithColor:[UIColor clearColor]];

    
    /** 提示框 **********************************************/
    PYTooltip *tooltip = [[PYTooltip alloc] init];
    // 触发类型 默认数据触发
    tooltip.trigger = @"axis";
    // 竖线宽度
    tooltip.axisPointer.lineStyle.width = @0;
    // 提示框 文字样式设置
    tooltip.textStyle = [[PYTextStyle alloc] init];
    tooltip.textStyle.fontSize = @10;
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
    grid.y = @(0);
    // 右下角位置
    grid.x2 = @(0);
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
    xAxis.axisTick.show = YES;
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
    yAxis.splitLine.show = NO;
    
    //'solid' | 'dotted' | 'dashed' 虚线类型
    
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
    series1.symbolSize = @(1);
    // 坐标点样式, 设置连线的宽度
    series1.itemStyle = [[PYItemStyle alloc] init];
    series1.itemStyle.normal = [[PYItemStyleProp alloc] init];
    series1.itemStyle.normal.lineStyle = [[PYLineStyle alloc] init];
    series1.itemStyle.normal.lineStyle.width = @(1.5);//线的粗细
    series1.symbol = @"emptyCircle";
    
    
    
    // 添加坐标点 y 轴数据
    series1.data = @[@"2000", @"7619", @"3271", @"7670", @"1228", @"6640", @"7472"];

    [seriesArr addObject:series1];
    [option setSeries:seriesArr];
    

    /** 初始化图表 */
    self.kEchartView = [[PYZoomEchartsView alloc] initWithFrame:CGRectMake(2, 50, self.view.frame.size.width-20, 200)];
    // 添加到 scrollView 上
    [_jinbihueilview addSubview:self.kEchartView];
    // 图表选项添加到图表上
    [self.kEchartView setOption:option];
    
    
    

#endif

    
#if 0
    PYOption * option = [[PYOption alloc] init];
    option = [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis);
        }])
       
        .calculableEqual(YES)
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .boundaryGapEqual(@NO).addDataArr(@[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"]);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"总量")
            .nameEqual(@"邮件营销")
            .typeEqual(PYSeriesTypeLine)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.areaStyleEqual([PYAreaStyle initPYAreaStyleWithBlock:^(PYAreaStyle *areaStyle) {
                        areaStyle.typeEqual(PYAreaStyleTypeDefault);
                    }]);
                }]);
            }])
            .dataEqual(@[@(120),@(132),@(101),@(134),@(90),@(230),@(210)]);
        }]);
        
    }];
    
    
    /** 初始化图表 */
    self.kEchartView = [[PYZoomEchartsView alloc] initWithFrame:CGRectMake(10, 50, APPwidth-20, 200)];
    // 添加到 scrollView 上
    [_jinbihueilview addSubview:self.kEchartView];
    // 图表选项添加到图表上
    [self.kEchartView setOption:option];
    
#endif
    
}


#pragma mark - 金币玩法
-(void)wanfa
{

    NSLog(@"金币玩法");
}

#pragma mark - 金币汇率
-(void)hueil:(UIButton *)btn
{
    
    if (_hueilibool == YES) {
        

        _hueiliimgv.image = [UIImage imageNamed:@"jinbihuilv_shangla"];
        _hueilibool = NO;
        
        [UIView animateWithDuration:0.3 animations:^{

            CGRect fram1 = _jinbiyueview.frame;
            fram1.origin.y = -110;
            _jinbiyueview.frame = fram1;
            

            CGRect fram = _jinbihueilview.frame;
            fram.size.height = 250;
            fram.origin.y = _jinbiyueview.frame.origin.y+_jinbiyueview.frame.size.height;
            _jinbihueilview.frame = fram;
            
            
            CGRect fram2 = _jinbidueihuanview.frame;
            fram2.origin.y = _jinbihueilview.frame.origin.y+_jinbihueilview.frame.size.height+10;
            _jinbidueihuanview.frame = fram2;
            
        }];
        
        
    }
    else{
        
        _hueiliimgv.image = [UIImage imageNamed:@"jinbihuilv_xiala"];
        _hueilibool = YES;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram1 = _jinbiyueview.frame;
            fram1.origin.y = 0;
            _jinbiyueview.frame = fram1;
            

            CGRect fram = _jinbihueilview.frame;
            fram.size.height = 50;
            fram.origin.y = _jinbiyueview.frame.origin.y+_jinbiyueview.frame.size.height;
            _jinbihueilview.frame = fram;
            
            
            CGRect fram2 = _jinbidueihuanview.frame;
            fram2.origin.y = _jinbihueilview.frame.origin.y+_jinbihueilview.frame.size.height+10;
            _jinbidueihuanview.frame = fram2;

        }];
        
        
    }

    
}

#pragma mark - 金币明细
-(void)jinbimx
{
    NSLog(@"金币明细");
    
    JinBiMingXiVC * mx = [[JinBiMingXiVC alloc] init];
    mx.biaoting = @"金币明细";
    [self.navigationController pushViewController:mx animated:YES];
    


}



#pragma mark - 金币兑换
-(void)dueihuan
{
    NSLog(@"金币兑换");
}


#pragma mark - 金币抽奖
-(void)coujian
{
    NSLog(@"金币抽奖");
    
    JinBiChouJiangVC * coujian = [[JinBiChouJiangVC alloc] init];
    [self.navigationController pushViewController:coujian animated:YES];

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
