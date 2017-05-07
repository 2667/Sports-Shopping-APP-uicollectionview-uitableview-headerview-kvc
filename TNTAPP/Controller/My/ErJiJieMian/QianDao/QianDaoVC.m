//
//  QianDaoVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/16.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "QianDaoVC.h"

@interface QianDaoVC ()
{
    UIScrollView * _zhengscrollview;

    UIView * _zongriliview;
    UILabel * _riqilabel;
    UIView * _riliview;
    int nian;
    int yue;
    UIButton * _jianbtn;
    UIButton * _jiabtn;
    int _yufeizhi;

    BOOL _qiandaotxbool;
    
    UIView * _gueizheview;

}

@end

@implementation QianDaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _yufeizhi = 0;
    
    _qiandaotxbool = YES;
    
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
    biaoting.text = @"签到";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
    //下拉框
    UIButton * xialabtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 26, 30, 30)];
    [xialabtn setImage:[UIImage imageNamed:@"renwu_gengduo1"] forState:UIControlStateNormal];
    [xialabtn addTarget:self action:@selector(xiala) forControlEvents:UIControlEventTouchUpInside];
    xialabtn.tag = 6201;
    [daohan addSubview:xialabtn];
    
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
    

    //******************用户金币和头像********************
    UIView * yhtxview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 260)];
    yhtxview.backgroundColor = [UIColor colorWithRed:40/255.0 green:48/255.0 blue:57/255.0 alpha:1.0];
    [_zhengscrollview addSubview:yhtxview];
    
    //金币
    UIView * jinbiview = [[UIView alloc] initWithFrame:CGRectMake(10, 10, APPwidth-20, 60)];
    jinbiview.layer.cornerRadius = 8;
    jinbiview.layer.masksToBounds = YES;
    jinbiview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [yhtxview addSubview:jinbiview];
   
    UILabel * jinbilabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 150, 20)];
    jinbilabel1.text = @"金币数量";
    jinbilabel1.textAlignment = 0;
    jinbilabel1.textColor = [UIColor whiteColor];
    jinbilabel1.font = [UIFont systemFontOfSize:16];
    [jinbiview addSubview:jinbilabel1];
   
    UIImageView * jinbiimv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 35, 20, 20)];
    jinbiimv.image = [UIImage imageNamed:@"qiandao_jinbi"];
    [jinbiview addSubview:jinbiimv];
    
    UILabel * jinbilabel2 = [[UILabel alloc] initWithFrame:CGRectMake(jinbiimv.frame.origin.x+25, 35, 150, 20)];
    jinbilabel2.text = @"253154";
    jinbilabel2.textAlignment = 0;
    jinbilabel2.textColor = [UIColor colorWithRed:255/255.0 green:185/255.0 blue:60/255.0 alpha:1.0];
    jinbilabel2.font = [UIFont systemFontOfSize:16];
    [jinbiview addSubview:jinbilabel2];
    
    //签到提醒btn
    UIButton * qiandaotxbtn = [[UIButton alloc] initWithFrame:CGRectMake(jinbiview.frame.size.width-50, 10, 40, 20)];
    [qiandaotxbtn setImage:[UIImage imageNamed:@"renwu_kai"] forState:0];
    [qiandaotxbtn setImage:[UIImage imageNamed:@"renwu_guan"] forState:UIControlStateSelected];
    [qiandaotxbtn addTarget:self action:@selector(qiandaotx:) forControlEvents:UIControlEventTouchUpInside];
    [jinbiview addSubview:qiandaotxbtn];
    
    UILabel * qiandaotxlabel = [[UILabel alloc] initWithFrame:CGRectMake(qiandaotxbtn.frame.origin.x-100, 10, 100, 20)];
    qiandaotxlabel.text = @"签到提醒";
    qiandaotxlabel.textAlignment = 2;
    qiandaotxlabel.textColor = [UIColor whiteColor];
    qiandaotxlabel.font = [UIFont systemFontOfSize:16];
    [jinbiview addSubview:qiandaotxlabel];

    

    //头像
    UIButton * touxianbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-40, 90, 80, 80)];
    touxianbtn.layer.masksToBounds = YES;
    touxianbtn.layer.cornerRadius = 40;
    touxianbtn.backgroundColor = [UIColor whiteColor];
    [yhtxview addSubview:touxianbtn];
    
    //用户名
    UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, touxianbtn.frame.origin.y+touxianbtn.frame.size.height+10, APPwidth, 20)];
    namelabel.text = @"用户名字";
    namelabel.textAlignment = 1;
    namelabel.textColor = [UIColor whiteColor];
    namelabel.font = [UIFont systemFontOfSize:16];
    [yhtxview addSubview:namelabel];
    
    //签到
    UIButton * qiandaobtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-50, namelabel.frame.origin.y+namelabel.frame.size.height+10, 100, 30)];
    qiandaobtn.layer.masksToBounds = YES;
    qiandaobtn.layer.cornerRadius = 15;
    qiandaobtn.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [qiandaobtn setTitle:@"点击签到" forState:0];
    [qiandaobtn setTitleColor:[UIColor colorWithRed:255/255.0 green:185/255.0 blue:60/255.0 alpha:1.0] forState:0];
    qiandaobtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [yhtxview addSubview:qiandaobtn];
    


    
    //******************日历********************
    _zongriliview = [[UIView alloc] initWithFrame:CGRectMake(0, yhtxview.frame.origin.y+yhtxview.frame.size.height+10, APPwidth, 500)];
    _zongriliview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_zongriliview];
   
    //签到次数
    UILabel * qiandaocishu = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 40)];
    qiandaocishu.text = @"累积签到7天    连续签到4天";
    qiandaocishu.textAlignment = 1;
    qiandaocishu.textColor = [UIColor whiteColor];
    [_zongriliview addSubview:qiandaocishu];
    UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, APPwidth, 1)];
    imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
    [_zongriliview addSubview:imgv];
    

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
    
    //日期
    _riqilabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 60, APPwidth-100, 20)];
    _riqilabel.text = [NSString stringWithFormat:@"%d年%d月",nian,yue];
    _riqilabel.textAlignment = 1;
    [_zongriliview addSubview:_riqilabel];
    _riqilabel.textColor = [UIColor whiteColor];
    [_riqilabel sizeToFit];
    CGRect fram = _riqilabel.frame;
    fram.origin.x = APPwidth/2-_riqilabel.frame.size.width/2;
    fram.size.width = _riqilabel.frame.size.width+20;
    _riqilabel.frame = fram;
    _riqilabel.textAlignment = 1;

    
    
    //上个月
    _jianbtn = [[UIButton alloc] initWithFrame:CGRectMake(_riqilabel.frame.origin.x-30, 60, 20, 20)];
    [_jianbtn addTarget:self action:@selector(riqijian) forControlEvents:UIControlEventTouchUpInside];
    [_jianbtn setImage:[UIImage imageNamed:@"qiandao_zuo"] forState:0];
    [_jianbtn setImage:[UIImage imageNamed:@"qiandao_zuo1"] forState:UIControlStateSelected];
    [_zongriliview addSubview:_jianbtn];
    
    //下个月
    _jiabtn = [[UIButton alloc] initWithFrame:CGRectMake(_riqilabel.frame.origin.x+_riqilabel.frame.size.width+10, 60, 20, 20)];
    [_jiabtn addTarget:self action:@selector(riqijia) forControlEvents:UIControlEventTouchUpInside];
    [_jiabtn setImage:[UIImage imageNamed:@"qiandao_you"] forState:0];
    [_jiabtn setImage:[UIImage imageNamed:@"qiandao_you1"] forState:UIControlStateSelected];
    [_zongriliview addSubview:_jiabtn];
    

    //添加周期
    NSArray * xq = @[@"天",@"一",@"二",@"三",@"四",@"五",@"六"];
    for (int i = 0; i < xq.count; i++) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/7*i, _riqilabel.frame.origin.y+_riqilabel.frame.size.height+20, self.view.frame.size.width/7, 20)];
        label.text = xq[i];
        label.textAlignment = 1;
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:15];
        [_zongriliview addSubview:label];
        
        
    }
 
    //创建日历
    [self zdyrl:zongtianshu :zhouji];

    
    //*****************规则***********************
    _gueizheview = [[UIView alloc] initWithFrame:CGRectMake(0, _zongriliview.frame.origin.y+_zongriliview.frame.size.height+10, APPwidth, 300)];
    _gueizheview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_gueizheview];
    
    UILabel * gzlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 20)];
    gzlabel.text = @"签到规则";
    gzlabel.textColor = [UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1.0];
    gzlabel.font = [UIFont systemFontOfSize:15];
    [_gueizheview addSubview:gzlabel];
    [gzlabel sizeToFit];
    CGRect fram1 = gzlabel.frame;
    fram1.origin.x = 10;
    fram1.origin.y = 10;
    gzlabel.frame = fram1;
  
    NSArray * gzarray = @[@"每天签到得到金币奖励",@"累计签到可领现金红包，签到越多红包现金越大，200万红包与你分享",@"节假日领取神秘礼物",@"一个月一周期，一周期结束签到重新开始"];
    float y = 12;
    
    for (int i = 0; i < gzarray.count; i++) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(gzlabel.frame.origin.x+gzlabel.frame.size.width+25, y, APPwidth-gzlabel.frame.origin.x-gzlabel.frame.size.width-35, 20)];
        label.text = gzarray[i];
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:12];
        [_gueizheview addSubview:label];
        label.numberOfLines = 0;
        [label sizeToFit];
       
        UIView * yuandianview = [[UIView alloc] initWithFrame:CGRectMake(gzlabel.frame.origin.x+gzlabel.frame.size.width+10, y+5, 5, 5)];
        yuandianview.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        yuandianview.layer.masksToBounds = YES;
        yuandianview.layer.cornerRadius = 2.5;
        [_gueizheview addSubview:yuandianview];
        
        
        y = y +label.frame.size.height+3;
        
    }
    CGRect fram2 = _gueizheview.frame;
    fram2.size.height= y+20;
    _gueizheview.frame = fram2;
    
    
    //****************************************
    _zhengscrollview.contentSize = CGSizeMake(0, _gueizheview.frame.origin.y+_gueizheview.frame.size.height);
    

}


#pragma mark - 创建日历
-(void)zdyrl:(NSString *)zongtianshu :(NSString *)xq
{
    
    _riliview = [[UIView alloc] initWithFrame:CGRectMake(10, _riqilabel.frame.origin.y+_riqilabel.frame.size.height+50, self.view.frame.size.width-20, self.view.frame.size.width/7*6)];
    _riliview.layer.borderColor=[[UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1.0]CGColor];
    _riliview.layer.borderWidth= 1.0f;
    [_zongriliview addSubview:_riliview];
    
    
    float x = _riliview.frame.size.width/7*[xq intValue];
    float y = 0;
    
    for (int i = [xq intValue]; i < [zongtianshu intValue]+[xq intValue]; i++) {
        
        if (i % 7 == 0 && i != 0) {
            
            x = 0;
            y = y + _riliview.frame.size.width/7;
            
        }
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, _riliview.frame.size.width/7, _riliview.frame.size.width/7)];
        label.text = [NSString stringWithFormat:@"%d",i-[xq intValue]+1];
        label.textAlignment = 1;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        [_riliview addSubview:label];
        
        if (i == 10) {

            UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(label.frame.size.width/2-15, label.frame.size.height/2-15, 30, 30)];
            imgv.image = [UIImage imageNamed:@"qiandao_jiaoyin"];
            imgv.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
            [label addSubview:imgv];
        }
        if (i == 13) {
            
            UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(label.frame.size.width/2-15, label.frame.size.height/2-15, 30, 30)];
            imgv.image = [UIImage imageNamed:@"qiandao_hongbao1"];
            imgv.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
            [label addSubview:imgv];
        }
        if (i == 23) {
            
            UIImageView * imgv =[[UIImageView alloc] initWithFrame:CGRectMake(label.frame.size.width/2-15, label.frame.size.height/2-15, 30, 30)];
            imgv.image = [UIImage imageNamed:@"qiandao_liwu1"];
            imgv.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
            [label addSubview:imgv];
        }

        x = x + _riliview.frame.size.width/7;
        
    }
    
    CGRect fram = _riliview.frame;
    fram.size.height = y+_riliview.frame.size.width/7;
    _riliview.frame = fram;
    
    
    CGRect fram2 = _zongriliview.frame;
    fram2.size.height = _riliview.frame.size.height+_riliview.frame.origin.y+20;
    _zongriliview.frame = fram2;
    
    CGRect fram3 = _gueizheview.frame;
    fram3.origin.y= _zongriliview.frame.size.height+_zongriliview.frame.origin.y+10;
    _gueizheview.frame = fram3;
    

    
    _zhengscrollview.contentSize = CGSizeMake(0, _gueizheview.frame.origin.y+_gueizheview.frame.size.height);

}



//减月份
-(void)riqijian
{
    
    if (_jianbtn.selected == NO) {
        
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
        
        _yufeizhi--;

    }
    
    
    if (_yufeizhi == 1) {
        
        _jiabtn.selected = YES;
        _jianbtn.selected = NO;
        
    }
    else if(_yufeizhi == 0)
    {
        _jianbtn.selected = NO;
        _jiabtn.selected = NO;
        
    }
    else if (_yufeizhi == -1) {
        
        _jiabtn.selected = NO;
        _jianbtn.selected = YES;
    }
    
   

}


//加月份
-(void)riqijia
{
   
    
    if (_jiabtn.selected == NO) {
        
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
        
        _yufeizhi++;

    }
    
    
    if(_yufeizhi == 0)
    {
        _jianbtn.selected = NO;
        _jiabtn.selected = NO;

    }
    

    if (_yufeizhi == -1)
    {
        _jiabtn.selected = NO;
        _jianbtn.selected = YES;
    }
   else if (_yufeizhi == 1) {
        
        _jiabtn.selected = YES;
        _jianbtn.selected = NO;
        
    }
    else if(_yufeizhi == 0)
    {
        _jianbtn.selected = NO;
        _jiabtn.selected = NO;
        
    }
}

#pragma mark - 签到提醒
-(void)qiandaotx:(UIButton *)btn
{
    if (_qiandaotxbool == YES) {
        
        btn.selected = YES;
        _qiandaotxbool = NO;
    }
    else{
        
        btn.selected = NO;
        _qiandaotxbool = YES;
    }
}



#pragma mark - 下拉
-(void)xiala
{
    
    
    
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
