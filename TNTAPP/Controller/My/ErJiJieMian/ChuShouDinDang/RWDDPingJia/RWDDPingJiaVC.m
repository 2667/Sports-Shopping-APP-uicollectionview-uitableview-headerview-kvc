//
//  RWDDPingJiaVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/14.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "RWDDPingJiaVC.h"

@interface RWDDPingJiaVC ()<UITextViewDelegate>
{
    UIScrollView * _zhengscrollview;

    UILabel * _xinjipjlabel;
    UITextView * _pinjiatextv;
    UILabel * _tslabel;
    UILabel * _zishulabel;
    UIView * _tskuanview;
    
    UIView * _biaoqianview;
    float _biaoqiany;
    
    NSArray * _biaoqianarray;
    NSMutableArray * _yixuanbiaoqianarray;
    
}

@end

@implementation RWDDPingJiaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _yixuanbiaoqianarray = [[NSMutableArray alloc] init];
    
    _biaoqianarray = @[@"非常有礼貌 22",@"聊得很开心 18",@"职场精英 28",@"颜值爆表 30",@"艺术家气质 10",@"才华横溢 8",@"亲和力十足 38",@"下次还约 19",@"后悔有期 12"];

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
    biaoting.text = @"评价";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    [self.view addSubview:_zhengscrollview];

    
    //************点星***************
    UIImageView * touxianimv = [[UIImageView alloc] initWithFrame:CGRectMake(40, 20, 80, 80)];
    touxianimv.backgroundColor = [UIColor orangeColor];
    touxianimv.layer.cornerRadius = 40;
    touxianimv.layer.masksToBounds = YES;
    [_zhengscrollview addSubview:touxianimv];
    
    for (int i = 0; i < 5; i++) {
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(touxianimv.frame.origin.x+touxianimv.frame.size.width+20+50*i, 40, 30, 30)];
        [btn setImage:[UIImage imageNamed:@"pingjia_xing"] forState:0];
        [btn setImage:[UIImage imageNamed:@"pingjia_xing1"] forState:UIControlStateSelected];
        btn.tag = 5400+i;
        [btn addTarget:self action:@selector(xinji:) forControlEvents:UIControlEventTouchUpInside];
        [_zhengscrollview addSubview:btn];
        
//        if (btn.tag == 5300) {
//            
//            btn.selected = YES;
//        }

    }
    
    
    _xinjipjlabel = [[UILabel alloc] initWithFrame:CGRectMake(touxianimv.frame.origin.x+touxianimv.frame.size.width+20, touxianimv.frame.origin.y+60, APPwidth-90, 20)];
    _xinjipjlabel.text = @"非常满意,无可挑剔";
    _xinjipjlabel.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:30/255.0 alpha:1.0];
    _xinjipjlabel.font = [UIFont systemFontOfSize:14];
    [_zhengscrollview addSubview:_xinjipjlabel];
    

    
    //************选择印象标签***************
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-60, touxianimv.frame.origin.y+touxianimv.frame.size.height+40, 120, 20)];
    label2.text = @"对Ta的印象";
    label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:16];
    [_zhengscrollview addSubview:label2];
    
    UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(40, label2.frame.origin.y+10, label2.frame.origin.x-40, 1)];
    xian1.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
    [_zhengscrollview addSubview:xian1];
    
    UIView * xian2 = [[UIView alloc] initWithFrame:CGRectMake(label2.frame.origin.x+120, label2.frame.origin.y+10, label2.frame.origin.x-40, 1)];
    xian2.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
    [_zhengscrollview addSubview:xian2];
    

    _biaoqiany = label2.frame.origin.y+label2.frame.size.height+30;
    
    [self zdybiaoqian:_biaoqianarray];
   
    
    //************输入框***************
    _pinjiatextv = [[UITextView alloc] initWithFrame:CGRectMake(40, _biaoqianview.frame.size.height+_biaoqianview.frame.origin.y, APPwidth-80, 120)];
    _pinjiatextv.delegate = self;
    _pinjiatextv.font = [UIFont systemFontOfSize:18];
    _pinjiatextv.layer.borderWidth = 1;
    _pinjiatextv.layer.borderColor = [[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:0.5] CGColor];
    _pinjiatextv.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0];
    [_zhengscrollview addSubview:_pinjiatextv];
    
    
    _tslabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, APPwidth, 15)];
    _tslabel.text = @"其他想说的";
    _tslabel.textColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
    _tslabel.font = [UIFont systemFontOfSize:15];
    [_pinjiatextv addSubview:_tslabel];
    
    
    
    _zishulabel = [[UILabel alloc] initWithFrame:CGRectMake(_pinjiatextv.frame.size.width-70, _pinjiatextv.frame.size.height-25, 50, 15)];
    _zishulabel.text = @"0/20";
    _zishulabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    _zishulabel.font = [UIFont systemFontOfSize:15];
    _zishulabel.textAlignment = 2;
    [_pinjiatextv addSubview:_zishulabel];
    
    _zhengscrollview.contentSize = CGSizeMake(0, _pinjiatextv.frame.origin.y+_pinjiatextv.frame.size.height+80);

    
    //************提交按钮***************
    UIView * diseview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 60)];
    diseview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:diseview];
    
    
    UIButton * tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-80, 10,160, 40)];
    [tjbtn setTitle:@"提交" forState:0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    [tjbtn addTarget:self action:@selector(tjClick) forControlEvents:UIControlEventTouchUpInside];
    tjbtn.layer.cornerRadius = 5;
    tjbtn.layer.masksToBounds = YES;
    tjbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [diseview addSubview:tjbtn];

    
    //******************弹出提示框****************
    _tskuanview = [[UIView alloc] initWithFrame:CGRectMake(50, APPheight/2-45, APPwidth-100, 70)];
    _tskuanview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6];
    _tskuanview.layer.cornerRadius = 8;
    _tskuanview.layer.masksToBounds = YES;
    [self.view addSubview:_tskuanview];
    _tskuanview.hidden = YES;
    
    UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 30, 30)];
    imv.image = [UIImage imageNamed:@"pingjia_tisji"];
    [_tskuanview addSubview:imv];
    
    
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, _tskuanview.frame.size.width-80, 70)];
    label3.text = @"最多只能选择3个标签";
    label3.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    label3.font = [UIFont systemFontOfSize:18];
    [_tskuanview addSubview:label3];
    
    

    
}


#pragma mark - 创建标签
-(void)zdybiaoqian:(NSArray *)array
{
    
    [_biaoqianview removeFromSuperview];
    
    _biaoqianview = [[UIView alloc] initWithFrame:CGRectMake(40, _biaoqiany, APPwidth-80, 200)];
    [_zhengscrollview addSubview:_biaoqianview];
    
    
    float x = 0;
    float y = 0;
    for (int i = 0; i< array.count; i++) {
        
        if (i%2== 0 && i!=0) {
            
            x = 0;
            y = y + 60;
        }
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(x, y, (_biaoqianview.frame.size.width-20)/2, 40)];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] CGColor];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:0];
        btn.contentHorizontalAlignment = 0;
        [btn addTarget:self action:@selector(biaoqianxuanzhe:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_biaoqianview addSubview:btn];
        
        
        x = x + (_biaoqianview.frame.size.width-20)/2+20;
    }

    
    CGRect fram = _biaoqianview.frame;
    fram.size.height = y+60;
    _biaoqianview.frame = fram;
    
    
}

#pragma mark - 星级选择
-(void)xinji:(UIButton *)btn
{
    switch (btn.tag-5400) {
       
        case 0:
        {
            _xinjipjlabel.text = @"不满意,比较差";
            _biaoqianarray = @[@"一般般 22",@"有点严肃 18",@"时间太久 30",@"才华横溢 8",@"亲和力十足 38",@"下次还约 19",@"后悔有期 12"];
            [_yixuanbiaoqianarray removeAllObjects];

            [self zdybiaoqian:_biaoqianarray];
            
            CGRect fram = _pinjiatextv.frame;
            fram.origin.y = _biaoqianview.frame.origin.y+_biaoqianview.frame.size.height;
            _pinjiatextv.frame = fram;

            _zhengscrollview.contentSize = CGSizeMake(0, _pinjiatextv.frame.origin.y+_pinjiatextv.frame.size.height+80);

        }
            break;
            
            
        case 1:
        {
            _xinjipjlabel.text = @"不满意,比较差";

            _biaoqianarray = @[@"一般般 22",@"有点严肃 18",@"时间太久 30",@"才华横溢 8",@"亲和力十足 38",@"下次还约 19",@"后悔有期 12"];
            [_yixuanbiaoqianarray removeAllObjects];

            [self zdybiaoqian:_biaoqianarray];

            CGRect fram = _pinjiatextv.frame;
            fram.origin.y = _biaoqianview.frame.origin.y+_biaoqianview.frame.size.height;
            _pinjiatextv.frame = fram;
            
            _zhengscrollview.contentSize = CGSizeMake(0, _pinjiatextv.frame.origin.y+_pinjiatextv.frame.size.height+80);

        }
            break;

            
            
        case 2:
        {
            _xinjipjlabel.text = @"一般,还需改善";

            _biaoqianarray = @[@"一般般 22",@"有点严肃 18",@"时间太久 30",@"才华横溢 8",@"亲和力十足 38",@"下次还约 19",@"后悔有期 12"];
            [_yixuanbiaoqianarray removeAllObjects];

            [self zdybiaoqian:_biaoqianarray];

            CGRect fram = _pinjiatextv.frame;
            fram.origin.y = _biaoqianview.frame.origin.y+_biaoqianview.frame.size.height;
            _pinjiatextv.frame = fram;
            
            _zhengscrollview.contentSize = CGSizeMake(0, _pinjiatextv.frame.origin.y+_pinjiatextv.frame.size.height+80);

        }
            break;

            
            
        case 3:
        {
            _xinjipjlabel.text = @"比较满意,仍可改善";

            _biaoqianarray = @[@"一般般 22",@"有点严肃 18",@"时间太久 30",@"才华横溢 8",@"亲和力十足 38",@"下次还约 19",@"后悔有期 12"];
            [_yixuanbiaoqianarray removeAllObjects];

            [self zdybiaoqian:_biaoqianarray];

            CGRect fram = _pinjiatextv.frame;
            fram.origin.y = _biaoqianview.frame.origin.y+_biaoqianview.frame.size.height;
            _pinjiatextv.frame = fram;
            
            _zhengscrollview.contentSize = CGSizeMake(0, _pinjiatextv.frame.origin.y+_pinjiatextv.frame.size.height+80);

        }
            break;

            
            
        case 4:
        {
            _xinjipjlabel.text = @"非常满意,无可挑剔";

            _biaoqianarray = @[@"非常有礼貌 22",@"聊得很开心 18",@"职场精英 28",@"颜值爆表 30",@"艺术家气质 10",@"才华横溢 8",@"亲和力十足 38",@"下次还约 19",@"后悔有期 12"];

            [_yixuanbiaoqianarray removeAllObjects];
            
            [self zdybiaoqian:_biaoqianarray];

            CGRect fram = _pinjiatextv.frame;
            fram.origin.y = _biaoqianview.frame.origin.y+_biaoqianview.frame.size.height;
            _pinjiatextv.frame = fram;
            
            _zhengscrollview.contentSize = CGSizeMake(0, _pinjiatextv.frame.origin.y+_pinjiatextv.frame.size.height+80);

        }
            break;

            
        default:
            break;
    }
    
    
    for (int i = 5400; i< 5405; i++) {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];

        if (i > btn.tag) {
            
            btn1.selected = YES;
            
        }
        else
        {
            btn1.selected = NO;

        }
    }
    
}

#pragma mark - 标签选择
-(void)biaoqianxuanzhe:(UIButton *)btn
{

    int j=0;
    for (int i = 0; i < _yixuanbiaoqianarray.count; i++) {
        
        if ([btn.titleLabel.text isEqualToString:_yixuanbiaoqianarray[i]]) {
            
            j = 1;
            
            [_yixuanbiaoqianarray removeObjectAtIndex:i];
        }
        
    }
    
    if (j == 0) {
        
        if (_yixuanbiaoqianarray.count < 3) {
            
            [_yixuanbiaoqianarray addObject:btn.titleLabel.text];
            
            btn.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] CGColor];
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:0.2];
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] forState:0];
            
        }
        else
        {
            NSLog(@"已超过3条");
            
            _tskuanview.hidden = NO;
            
            NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(yincangts) userInfo:nil repeats:YES];
            
        }
        

    }
    else
    {
        btn.layer.borderColor = [[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] CGColor];
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:0];
        
        
    }
    

}


#pragma mark - 提交
-(void)tjClick
{
    NSLog(@"提交");
}

#pragma mark - 隐藏提示框
-(void)yincangts
{
    _tskuanview.hidden = YES;

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
