//
//  TaskFaBuVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/16.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TaskFaBuVC.h"
#import "JiNengLeiXingVC.h"
#import "RWFaBuDiZhiVC.h"
#import "SJYingYeShiJianVC.h"

@interface TaskFaBuVC ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIView * _gonggaoview;
    UILabel * _gglabel1;
    UILabel * _gglabel2;
    
    
    UIScrollView * _zhengscrollview;
    UITextField * _wonengtext;
    UITextView * _miaoshutextv;
    UIButton * _wozaibtn;
    UITextField * _dizitext;
    UITextField * _jiagetext;
    UIButton * _jinengbtn;
    
    //*******我能/我要******
    UIImageView * _fuwufanshiimgv;

    UILabel * _zongjialabel;
    UILabel * _dangejielabel;
    UILabel * _zongjielabel;
    BOOL _dangejiebool;

    UIView * _fuwushijianview;
    NSArray * _fuwushijiantianarray;
    UIPickerView * _fuwushijiantianpkView;
    NSArray * _fuwushijianshiarray;
    UIPickerView * _fuwushijianshipkView;
    NSArray * _fuwushijianfenarray;
    UIPickerView * _fuwushijianfenpkView;
    
    float _diziy;
}

@end

@implementation TaskFaBuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    _dangejiebool = YES;
    
    [self zdydhl];
    
    
    [self zdyUI];
    
    [self zdyfuwushijian];
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
    biaoting.text = _shenfei;
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont fontWithName:@"Alba Matter" size:18];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义界面
-(void)zdyUI
{
    
    //********************公告*************************
    _gonggaoview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 30)];
    _gonggaoview.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gonggaoview];
    
    
    
    _gglabel1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, APPwidth-80, 30)];
    _gglabel1.text = @"禁止发布涉及黄赌毒等低俗隐晦内容,否则需求可能会被撤销";
    _gglabel1.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    _gglabel1.font = [UIFont systemFontOfSize:14];
    [_gonggaoview addSubview:_gglabel1];
    [_gglabel1 sizeToFit];
    CGRect fram = _gglabel1.frame;
    fram.origin.y = 15-_gglabel1.frame.size.height/2;
    _gglabel1.frame = fram;
    
    
    _gglabel2 = [[UILabel alloc] initWithFrame:CGRectMake(_gglabel1.frame.origin.x+_gglabel1.frame.size.width+30, _gglabel1.frame.origin.y, _gglabel1.frame.size.width, _gglabel1.frame.size.height)];
    _gglabel2.text = @"禁止发布涉及黄赌毒等低俗隐晦内容,否则需求可能会被撤销";
    _gglabel2.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    _gglabel2.font = [UIFont systemFontOfSize:14];
    [_gonggaoview addSubview:_gglabel2];
    
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    view1.backgroundColor = [UIColor blackColor];
    [_gonggaoview addSubview:view1];
    
    
    UIImageView * ggimgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7.5, 15, 15)];
    ggimgv.image = [UIImage imageNamed:@"renwu_laba"];
    [_gonggaoview addSubview:ggimgv];
    

    UIButton * ggbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-30, 0, 30, 30)];
    [ggbtn setImage:[UIImage imageNamed:@"renwu_guanbi"] forState:0];
    [ggbtn addTarget:self action:@selector(yicanggg) forControlEvents:1<<6];
    ggbtn.backgroundColor = [UIColor blackColor];
    [_gonggaoview addSubview:ggbtn];
    

    [self doAnimation];//开始跑马灯效果

    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 94, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    

    
    
    //********************我能   描述*************************
    UIView * wonengview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 160)];
    wonengview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:wonengview];
    

    NSArray * wnarray1 = [[NSArray alloc] init];
    NSArray * wnarray2 = [[NSArray alloc] init];
    if ([_shenfei isEqualToString:@"Wo能"]) {
        
        wnarray1 = @[@"我能",@"描述"];
        wnarray2 = @[@"我能干什么",@"说一说具体的服务流程、服务方式，介绍一下自己与众不同的地方"];
        
    }
    else
    {
        wnarray1 = @[@"任务",@"描述"];
        wnarray2 = @[@"#签到领奖励#",@"介绍一下任务的详细信息，清楚明确的描述更容易吸引人领取哦"];

    }
  
    
    for (int i = 0; i < wnarray1.count; i++) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 40*i, 40, 40)];
        label.text = wnarray1[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:14];
        [wonengview addSubview:label];
        
        
        if (i == 0) {
            
            _wonengtext = [[UITextField alloc] initWithFrame:CGRectMake(50, 0, APPwidth-60, 40)];
            _wonengtext.placeholder = wnarray2[i];
            [_wonengtext setValue:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
            _wonengtext.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
            _wonengtext.font = [UIFont systemFontOfSize:13];
            [wonengview addSubview:_wonengtext];
            
        }
        
        else if (i == 1) {
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, APPwidth-20, 1)];
            imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
            [wonengview addSubview:imgv];
         
            _miaoshutextv = [[UITextView alloc] initWithFrame:CGRectMake(50, 45, APPwidth-60, 100)];
            _miaoshutextv.text = wnarray2[i];
            _miaoshutextv.font = [UIFont systemFontOfSize:14];
            _miaoshutextv.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
            _miaoshutextv.font = [UIFont systemFontOfSize:13];
            [wonengview addSubview:_miaoshutextv];
            _miaoshutextv.backgroundColor = [UIColor clearColor];
            
            
        }

    }

    
    //********************照片*************************
    UIView * zhaopianview = [[UIView alloc] initWithFrame:CGRectMake(0, wonengview.frame.origin.y+wonengview.frame.size.height, APPwidth, 90)];
    zhaopianview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:zhaopianview];
    

    UIButton * zpjiabtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 70, 70)];
    [zpjiabtn setImage:[UIImage imageNamed:@"renwu_tianjiazhaopian"] forState:0];
    [zhaopianview addSubview:zpjiabtn];
    
    
#if 1
    
    //Wo能/Wo要 的界面
    if ([_shenfei isEqualToString:@"Wo能"] || [_shenfei isEqualToString:@"Wo要"]) {
        
        //********************服务方式*************************
        UIView * fuwufanshiview = [[UIView alloc] initWithFrame:CGRectMake(0, zhaopianview.frame.origin.y+zhaopianview.frame.size.height+10, APPwidth, 130)];
        fuwufanshiview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [_zhengscrollview addSubview:fuwufanshiview];
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, APPwidth-20, 20)];
        label1.text = @"服务方式";
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:14];
        [fuwufanshiview addSubview:label1];
        
        NSArray * fwfsarray = @[@"Ta来找我",@"我去找Ta"];
        for (int i = 0; i< 2; i++) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2*i+APPwidth/4-7.5, 60, 15, 15)];
            btn.layer.cornerRadius = 7.5;
            btn.layer.masksToBounds = YES;
            btn.backgroundColor = [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1.0];
            [btn addTarget:self action:@selector(fuwufsxuanzhe:) forControlEvents:1<<6];
            [fuwufanshiview addSubview:btn];
            
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x-40, 100, btn.frame.size.width+80, 20)];
            label.text = fwfsarray[i];
            label.textColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = 1;
            [fuwufanshiview addSubview:label];
            

            if (i == 1) {
                
                UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/4-7.5+14, 65, APPwidth/2-14, 5)];
                xian.backgroundColor = [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1.0];
                [fuwufanshiview addSubview:xian];
                
                
                _fuwufanshiimgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth/4-12.5, btn.frame.origin.y-12.5, 40, 40)];
                _fuwufanshiimgv.image = [UIImage imageNamed:@"renwu_zhaowo"];
                [fuwufanshiview addSubview:_fuwufanshiimgv];
                

            }
            
            
            
        }
        

        
        
        //********************价格  技能*************************
        UIView * jiageview = [[UIView alloc] initWithFrame:CGRectMake(0, fuwufanshiview.frame.origin.y+fuwufanshiview.frame.size.height+10, APPwidth, 120)];
        jiageview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [_zhengscrollview addSubview:jiageview];
        
        NSArray * array1;
        NSArray * array2;
        
        if ([_shenfei isEqualToString:@"Wo能"]) {
            
            array1 = @[@"价格",@"技能类型",@"服务时间"];
            array2 = @[@"对方需要支付的价格(元)",@"请选择",@"12月31日 13:00"];
            
        }
        else{
            
            array1 = @[@"赏金",@"求助类型",@"服务时间"];
            array2 = @[@"我愿意支付多少报酬给帮助者(元)",@"请选择",@"12月31日 13:00"];

        }
        
        for (int i = 0; i < array1.count; i++) {
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 40*i, APPwidth-20, 40)];
            label.text = array1[i];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:14];
            [jiageview addSubview:label];
            
            
            
            if (i == 0) {
                
                UITextField * _woyaoshangjintext = [[UITextField alloc] initWithFrame:CGRectMake(80, 40*i, APPwidth-120, 40)];
                _woyaoshangjintext.placeholder = array2[i];
                [_woyaoshangjintext setValue:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
                _woyaoshangjintext.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
                _woyaoshangjintext.font = [UIFont systemFontOfSize:13];
                [jiageview addSubview:_woyaoshangjintext];
                
            }
            else
            {
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(80, 40*i, APPwidth-120, 40)];
                [btn setTitle:array2[i] forState:0];
                [btn setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forState:0];
                btn.titleLabel.font = [UIFont systemFontOfSize:13];
                btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
                btn.tag = 5600+i;
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:1<<6];
                [jiageview addSubview:btn];
                
 
                UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 40*i+12.5, 15, 15)];
                imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
                [jiageview addSubview:imgv];
                

            }
            
            
            UIImageView * imgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40*i+40, APPwidth-20, 1)];
            imgv2.image = [UIImage imageNamed:@"shouye-fengexian"];
            [jiageview addSubview:imgv2];
            
            
        }

        _diziy = jiageview.frame.origin.y+jiageview.frame.size.height+10;
        
    }
    
    else//商家专属 界面
    {
        //********************任务金额*************************
        UIView * rwjineview = [[UIView alloc] initWithFrame:CGRectMake(0, zhaopianview.frame.origin.y+zhaopianview.frame.size.height+10, APPwidth, 200)];
        rwjineview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [_zhengscrollview addSubview:rwjineview];
        
        NSArray * rwjearray1 = @[@"总金额",@"参与人数"];
        NSArray * rwjearray2 = @[@" ",@"填写人数"];
        NSArray * rwjearray3 = @[@"元",@"人"];
        NSArray * rwjearray4 = @[@"签到奖励",@"进店奖励"];

        for (int i = 0; i < rwjearray1.count; i++) {
            
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/2*i+APPwidth/4-50, 20, 100, 50)];
            view.layer.borderColor= [[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0] CGColor];
            view.layer.borderWidth = 1;
            [rwjineview addSubview:view];
            
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 15, 40)];
            label1.text = @"￥";
            label1.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            label1.font = [UIFont systemFontOfSize:16];
            label1.textAlignment = 1;
            [view addSubview:label1];
            
            UITextField * jinetext = [[UITextField alloc] initWithFrame:CGRectMake(20, 5, 70, 40)];
            jinetext.placeholder = @"0.00";
            [jinetext setValue:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
            jinetext.textColor = [UIColor whiteColor];
            jinetext.font = [UIFont systemFontOfSize:30];
            jinetext.textAlignment = 1;
            [view addSubview:jinetext];
            

            
        
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i, view.frame.size.height+view.frame.origin.y+10, APPwidth/2, 20)];
            label2.text = rwjearray4[i];
            label2.textColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0];
            label2.font = [UIFont systemFontOfSize:14];
            label2.textAlignment = 1;
            [rwjineview addSubview:label2];
            
            

            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 40*i+120, 60, 40)];
            label.text = rwjearray1[i];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:14];
            [rwjineview addSubview:label];
            
            
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(70, 40*i+120, APPwidth-100, 40)];
            text.placeholder = rwjearray2[i];
            [text setValue:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
            text.font = [UIFont systemFontOfSize:14];
            text.textColor = [UIColor whiteColor];
            text.font = [UIFont systemFontOfSize:13];
            text.textAlignment = 2;
            [rwjineview addSubview:text];
            
            
            UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-30, 40*i+120, 20, 40)];
            label3.text = rwjearray3[i];
            label3.textColor = [UIColor whiteColor];
            label3.font = [UIFont systemFontOfSize:13];
            label3.textAlignment = 1;
            [rwjineview addSubview:label3];
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40*i+120, APPwidth-20, 1)];
            imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
            [rwjineview addSubview:imgv];
            
//            if (i == 1) {
//              
//                _zongjielabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40*i, 60, 40)];
//                _zongjielabel.text = rwjearray1[i];
//                _zongjielabel.textColor = [UIColor whiteColor];
//                _zongjielabel.font = [UIFont systemFontOfSize:14];
//                [rwjineview addSubview:_zongjielabel];
//                [_zongjielabel sizeToFit];
//                CGRect fram = _zongjielabel.frame;
//                fram.origin.y = 60-_zongjielabel.frame.size.height/2;
//                fram.origin.x = 10;
//                fram.size.width = _zongjielabel.frame.size.width+15;
//                _zongjielabel.frame = fram;
//                
//                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(_zongjielabel.frame.origin.x+_zongjielabel.frame.size.width+3, 45, 30, 30)];
//                [btn setImage:[UIImage imageNamed:@"renwiu_zhaunhuan"] forState:0];
//                [btn addTarget:self action:@selector(dangezongqiehuan) forControlEvents:UIControlEventTouchUpInside];
//                [rwjineview addSubview:btn];
//                
//                _dangejielabel = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x+btn.frame.size.width+13, 40, 60, 40)];
//                _dangejielabel.text = @"单个金额";
//                _dangejielabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];                _dangejielabel.font = [UIFont systemFontOfSize:13];
//                _dangejielabel.textAlignment = NSTextAlignmentLeft;
//                [rwjineview addSubview:_dangejielabel];
//                
//            }
//            if (i == 2) {
//               
//                _zongjialabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, APPwidth, 60)];
//                _zongjialabel.text = @"￥100.00";
//                _zongjialabel.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
//                _zongjialabel.font = [UIFont systemFontOfSize:25];
//                _zongjialabel.textAlignment = 1;
//               _zongjialabel.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
//                [rwjineview addSubview:_zongjialabel];
//                
//            }

            
        }

        
        
        //********************任务类型 时间 签到*************************
        UIView * rwleixinview = [[UIView alloc] initWithFrame:CGRectMake(0, rwjineview.frame.origin.y+rwjineview.frame.size.height+10, APPwidth, 120)];
        rwleixinview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [_zhengscrollview addSubview:rwleixinview];
        
        NSArray * rwlxarray1 = @[@"商家类型",@"有效期至",@"营业时间"];
        NSArray * rwlxarray2 = @[@"请选择",@"2016-12-31",@"营业时间"];
        
        for (int i = 0; i < rwlxarray1.count; i++) {
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 40*i, APPwidth-20, 40)];
            label.text = rwlxarray1[i];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:14];
            [rwleixinview addSubview:label];
            
           
           UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(80, 40*i, APPwidth-120, 40)];
            [btn setTitle:rwlxarray2[i] forState:0];
            [btn setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forState:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            btn.tag = 5700+i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:1<<6];
            [rwleixinview addSubview:btn];
            

            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 40*i+12.5, 15, 15)];
            imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
            [rwleixinview addSubview:imgv];
            
            
            UIImageView * imgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40*i+40, APPwidth-20, 1)];
            imgv2.image = [UIImage imageNamed:@"shouye-fengexian"];
            [rwleixinview addSubview:imgv2];
            
            
        }
        
        
        _diziy = rwleixinview.frame.origin.y+rwleixinview.frame.size.height+10;

        
    }
#endif
    
    
    
    
    //********************位置*************************
    UIView * weiziview = [[UIView alloc] initWithFrame:CGRectMake(0, _diziy, APPwidth, 80)];
    weiziview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [_zhengscrollview addSubview:weiziview];
    
    for (int i = 0; i < 2; i++) {
        
        if (i == 0) {
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
            label.text = @"位置";
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:14];
            [weiziview addSubview:label];
            
            _wozaibtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, APPwidth-60, 40)];
            [_wozaibtn setTitle:@"广州市 南沙区" forState:0];
            [_wozaibtn setTitleColor:[UIColor whiteColor] forState:0];
            _wozaibtn.titleLabel.font = [UIFont systemFontOfSize:13];
            _wozaibtn.contentHorizontalAlignment = 1;
            [_wozaibtn addTarget:self action:@selector(wodedizi) forControlEvents:1<<6];
            [weiziview addSubview:_wozaibtn];
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 12.5, 15, 15)];
            imgv.image = [UIImage imageNamed:@"renwu_youjiantou"];
            [weiziview addSubview:imgv];
            
            UIImageView * imgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, APPwidth-20, 1)];
            imgv2.image = [UIImage imageNamed:@"shouye-fengexian"];
            [weiziview addSubview:imgv2];
        }
        
        else if (i == 1) {
            
            
            _dizitext = [[UITextField alloc] initWithFrame:CGRectMake(50, 40, APPwidth-60, 40)];
            _dizitext.placeholder = @"请填写详细地址";
            [_dizitext setValue:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
            _dizitext.font = [UIFont systemFontOfSize:14];
            _dizitext.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
            _dizitext.font = [UIFont systemFontOfSize:13];
            [weiziview addSubview:_dizitext];
            _dizitext.backgroundColor = [UIColor clearColor];
        }
        
    }
    
    UILabel * tslabel = [[UILabel alloc] initWithFrame:CGRectMake(0, weiziview.frame.origin.y+weiziview.frame.size.height, APPwidth, 40)];
    tslabel.text = @"任务结束后，未领取的金额将退回您的账户";
    tslabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    tslabel.font = [UIFont systemFontOfSize:12];
    tslabel.textAlignment = 1;
    [_zhengscrollview addSubview:tslabel];
    
    
    _zhengscrollview.contentSize = CGSizeMake(0, tslabel.frame.origin.y+tslabel.frame.size.height+30);
    
    


}

#pragma mark - 创建服务时间选择界面
-(void)zdyfuwushijian
{
    
    _fuwushijianview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _fuwushijianview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    [self.view addSubview:_fuwushijianview];
    _fuwushijianview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangfuwushijianxuanzhe)];
    [_fuwushijianview addGestureRecognizer:tap];
    
    
    UIView * shijianview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-300, APPwidth, 300)];
    shijianview.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
    [_fuwushijianview addSubview:shijianview];
    
    
    UIButton * qxbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, 50, 40)];
    [qxbtn setTitle:@"取消" forState:0];
    [qxbtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
    qxbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [qxbtn addTarget:self action:@selector(yicangfuwushijianxuanzhe) forControlEvents:1<<6];
    [shijianview addSubview:qxbtn];
    
    
    UIButton * qdbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 0, 50, 40)];
    [qdbtn setTitle:@"确定" forState:0];
    [qdbtn setTitleColor:[UIColor colorWithRed:196/255.0 green:148/255.0 blue:61/255.0 alpha:1.0] forState:0];
    qdbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [shijianview addSubview:qdbtn];
    
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, APPwidth, 1)];
    xian.image =[UIImage imageNamed:@"shouye-fengexian"];
    [shijianview addSubview:xian];
    
    
    _fuwushijiantianarray = @[@"今天",@"明天",@"后天"];
    _fuwushijiantianpkView = [[UIPickerView alloc] initWithFrame:CGRectMake(APPwidth/3/2-40, 100, 80, 150)];
    _fuwushijiantianpkView.showsSelectionIndicator=YES;
    _fuwushijiantianpkView.dataSource = self;
    _fuwushijiantianpkView.delegate = self;
    [shijianview addSubview:_fuwushijiantianpkView];
    
    
    
    _fuwushijianshiarray = @[@"1点",@"2点",@"3点",@"4点",@"5点",@"6点",@"7点",@"8点",@"9点",@"10点",@"11点",@"12点",@"13点",@"14点",@"15点",@"16点",@"17点",@"18点",@"19点",@"20点",@"21点",@"22点",@"23点",@"0点"];
    _fuwushijianshipkView = [[UIPickerView alloc] initWithFrame:CGRectMake(APPwidth/3+APPwidth/3/2-40, 50, 80, 250)];
    _fuwushijianshipkView.showsSelectionIndicator=YES;
    _fuwushijianshipkView.dataSource = self;
    _fuwushijianshipkView.delegate = self;
    [shijianview addSubview:_fuwushijianshipkView];
    

    
    
    _fuwushijianfenarray = @[@"00分",@"05分",@"10分",@"15分",@"20分",@"25分",@"30分",@"35分",@"40分",@"45分",@"50分",@"55分",@"60分"];
    _fuwushijianfenpkView = [[UIPickerView alloc] initWithFrame:CGRectMake(APPwidth/3*2+APPwidth/3/2-40, 50, 80, 250)];
    _fuwushijianfenpkView.showsSelectionIndicator=YES;
    _fuwushijianfenpkView.dataSource = self;
    _fuwushijianfenpkView.delegate = self;
    [shijianview addSubview:_fuwushijianfenpkView];
   
}

#pragma mark - 按钮点击
-(void)btnClick:(UIButton *)btn
{
    NSLog(@"%ld",(long)btn.tag);
    switch (btn.tag) {
       
        
        case 5600:
        {
            
        }
            break;
            
        case 5601:
        {
            JiNengLeiXingVC * nx = [[JiNengLeiXingVC alloc] init];
            if ([_shenfei isEqualToString:@"Wo能"]) {
                
                nx.biaoting = @"技能类型";

            }
            else
            {
                nx.biaoting = @"求助类型";
 
            }
            [self.navigationController pushViewController:nx animated:YES];
            

        }
            break;
            
        case 5602:
        {
            _fuwushijianview.hidden = NO;

        }
            break;
            
        case 5603:
        {
            
        }
            break;

            
        case 5700:
        {
            
            JiNengLeiXingVC * nx = [[JiNengLeiXingVC alloc] init];
            nx.biaoting = @"商家类型";
            [self.navigationController pushViewController:nx animated:YES];
            

        }
            break;
            

            
        case 5701:
        {
            _fuwushijianview.hidden = NO;

        }
            break;
            

            
        case 5702:
        {
            SJYingYeShiJianVC * sjyysj = [[SJYingYeShiJianVC alloc] init];
            [self.navigationController pushViewController:sjyysj animated:YES];
            
        }
            break;
            

            
        default:
            break;
    }
}

#pragma mark - 我的地址点击
-(void)wodedizi
{
    
    RWFaBuDiZhiVC * dizi = [[RWFaBuDiZhiVC alloc] init];
    [self.navigationController pushViewController:dizi animated:YES];

}


#pragma mark - *****************我能 点击事件***************************

#pragma mark - 服务方式选择
-(void)fuwufsxuanzhe:(UIButton *)btn
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
//        CGRect fram = _fuwufanshiimgv.frame;
        
        
        _fuwufanshiimgv.center = btn.center;

    }];
    

    
}



#pragma mark - 时间选择
-(void)shijianxuanzhe:(UIButton *)btn
{
    
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
}


#pragma mark - 方式选择
-(void)fanshixuanzhe:(UIButton *)btn
{
    for (int i = 7700; i < 7702; i++) {
        
        UIButton * btn1 = [self.view viewWithTag:i];
        btn1.selected = NO;
    }
    
    btn.selected = YES;
}


#pragma mark - *****************商家专属 点击事件***************************
#pragma mark - 商家专属- 总金额和单个金额之间的切换
-(void)dangezongqiehuan
{
    if (_dangejiebool == YES) {
        
        _dangejielabel.text = @"总金额";
        _zongjielabel.text = @"单个金额";

        _dangejiebool = NO;
    }
    else
    {
        _zongjielabel.text = @"总金额";
        _dangejielabel.text = @"单个金额";
        
        _dangejiebool = YES;

    }
    
}

#pragma mark - 隐藏服务时间选择
-(void)yicangfuwushijianxuanzhe
{
    _fuwushijianview.hidden = YES;
}

#pragma mark - 隐藏公告
-(void)yicanggg
{
    _gonggaoview.hidden = YES;
    
    [UIView animateWithDuration:0.1 animations:^{
        
        CGRect fram = _zhengscrollview.frame;
        fram.origin.y = 64;
        _zhengscrollview.frame = fram;
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
    if (pickerView == _fuwushijiantianpkView) {
        
        return _fuwushijiantianarray.count;
        
    }
    else if (pickerView == _fuwushijianshipkView)
    {
        return _fuwushijianshiarray.count;

    }
    else{
        return _fuwushijianfenarray.count;

    }
}

// 每列显示的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == _fuwushijiantianpkView) {
        
        return _fuwushijiantianarray[row];
        
    }
    else if (pickerView == _fuwushijianshipkView)
    {
        return _fuwushijianshiarray[row];
        
    }
    else{
        return _fuwushijianfenarray[row];
        
    }

    
 
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 2, 80, 30)];
    
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = [UIColor clearColor];
        }
    }
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
        
  
    if (pickerView == _fuwushijiantianpkView) {
        
        label.text = _fuwushijiantianarray[row];
        
    }
    else if (pickerView == _fuwushijianshipkView)
    {
        label.text =  _fuwushijianshiarray[row];
        
    }
    else{
        
        label.text =  _fuwushijianfenarray[row];
        
    }
    
    return view;
}


// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    
    return 80;
}

// 每列高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    
    return 50;
    
}

#pragma mark - 公告跑马灯效果
-(void)doAnimation
{
#if 0
   [UIView animateWithDuration:3.0 animations:^{
       
       CGRect fram1 = _gglabel1.frame;
       fram1.origin.x = 0-_gglabel1.frame.size.width;
       _gglabel1.frame = fram1;
       
       
       CGRect fram2 = _gglabel2.frame;
       fram2.origin.x = _gglabel1.frame.size.width+_gglabel1.frame.origin.x+30;
       _gglabel2.frame = fram2;

   }];
#endif
    
    //计算文本的宽度
    CGFloat calcuWidth = _gglabel1.frame.size.width;
    CGFloat labelHeight = _gglabel1.frame.size.height;
    
    //这两个frame很重要 分别记录的是左右两个label的frame 而且后面也会需要到这两个frame
    CGRect currentFrame = CGRectMake(0, 15-labelHeight/2, calcuWidth, labelHeight);
    CGRect behindFrame = CGRectMake(currentFrame.origin.x+currentFrame.size.width+30, 15-labelHeight/2, calcuWidth, labelHeight);
    
    


//    NSString * time = _gglabel1.text.length/4;

    [UIView animateWithDuration:_gglabel1.text.length/2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
      
                 //取到两个label
                UILabel *lableOne = _gglabel1;
                UILabel *lableTwo = _gglabel2;
      
               //让两个label向左平移
                lableOne.transform = CGAffineTransformMakeTranslation(-lableOne.frame.size.width, 0);
                lableTwo.transform = CGAffineTransformMakeTranslation(-lableTwo.frame.size.width, 0);
       
           } completion:^(BOOL finished) {
                   //两个label水平相邻摆放 内容一样 label1为初始时展示的 label2位于界面的右侧，未显示出来
                    //当完成动画时，即第一个label在界面中消失，第二个label位于第一个label的起始位置时，把第一个label放置到第二个label的初始位置
                   UILabel *lableOne = _gglabel1;
                     lableOne.transform = CGAffineTransformIdentity;
                    lableOne.frame = behindFrame;
          
                   UILabel *lableTwo = _gglabel2;
                   lableTwo.transform = CGAffineTransformIdentity;
                    lableTwo.frame = currentFrame;
            
                    //在数组中将第一个label放置到右侧，第二个label放置到左侧（因为此时展示的就是labelTwo）
//                     [labelArray replaceObjectAtIndex:1 withObject:lableOne];
//                     [labelArray replaceObjectAtIndex:0 withObject:lableTwo];
               
                     //递归调用
                     [self doAnimation];
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
