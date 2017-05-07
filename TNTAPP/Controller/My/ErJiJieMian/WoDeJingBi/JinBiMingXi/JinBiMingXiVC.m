//
//  JinBiMingXiVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/20.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "JinBiMingXiVC.h"
#import "JinBiMingXiCell.h"

@interface JinBiMingXiVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UILabel * _yuflabel;
    
    UITableView * _tableview;
    
    UIImageView * _jiantouimgv;
    
    BOOL _yuefbool;
    
    UIView * _yuefenview;
    UIScrollView * _yuefenscv;
}

@end

@implementation JinBiMingXiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];

    _yuefbool = YES;
    
    
    [self zdyUI];
    
    [self zdyyuefen];
    
    [self zdydhl];
    

    
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
    
    
    //************日历************
    UIView * yuefenview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 50)];
    yuefenview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:yuefenview];
    
    
    UIButton * yuefenbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-50, 0, 130, 50)];
    [yuefenbtn addTarget:self action:@selector(yuefxuanzhe) forControlEvents:1<<6];
    [yuefenview addSubview:yuefenbtn];
    
    NSString * yuf = [NSString stringWithFormat:@"%@年%@月",[Single danle].danqiannianfen,[Single danle].danqianyuefen];
    _yuflabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, yuefenbtn.frame.size.width-30, 50)];
    _yuflabel.textColor = [UIColor colorWithRed:255/255.0 green:189/255.0 blue:61/255.0 alpha:1.0];
    _yuflabel.font = [UIFont systemFontOfSize:18];
    [yuefenbtn addSubview:_yuflabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:yuf];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(4,1)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(str.length-1,1)];
    _yuflabel.attributedText = str;
    _yuflabel.textAlignment = 1;
    
    
    _jiantouimgv = [[UIImageView alloc] initWithFrame:CGRectMake(yuefenbtn.frame.size.width-25, 25-7.5, 15, 15)];
    _jiantouimgv.image = [UIImage imageNamed:@"wode_xia"];
    [yuefenbtn addSubview:_jiantouimgv];
    
    
    
    
    UIImageView * yuefimgv = [[UIImageView alloc] initWithFrame:CGRectMake(yuefenbtn.frame.origin.x-25, 15, 20, 20)];
    yuefimgv.image = [UIImage imageNamed:@"wode_jinbi_rili"];
    [yuefenview addSubview:yuefimgv];
    
    

}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    //************表头************
    UIView * toujiview = [[UIView alloc] initWithFrame:CGRectMake(0, 104, APPwidth, 60)];
    toujiview.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:60/255.0 alpha:1.0];
    [self.view addSubview:toujiview];
    
    
    UIView * xian2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, APPwidth, 10)];
    xian2.backgroundColor =[UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [toujiview addSubview:xian2];
    
    NSArray * array1 = @[@"本月支出：-1452金币",@"本月收入：+3425金币"];
    for (int i = 0; i < array1.count; i++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2*i, 0, APPwidth/2-20, 50)];
        label1.textColor = [UIColor colorWithRed:255/255.0 green:189/255.0 blue:61/255.0 alpha:1.0];
        label1.font = [UIFont systemFontOfSize:18];
        [toujiview addSubview:label1];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:array1[i]];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 5)];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(str.length-2, 2)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,5)];
         [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(str.length-2,2)];
        label1.attributedText = str;
        label1.textAlignment = 1;
        
        
    }
    
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, toujiview.frame.origin.y+toujiview.frame.size.height, APPwidth, APPheight-toujiview.frame.origin.y-toujiview.frame.size.height)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    _tableview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    

}

#pragma mark - 自定义月份
-(void)zdyyuefen
{
    _yuefenview = [[UIView alloc] initWithFrame:CGRectMake(APPwidth/2-75, 114-200, 150, 200)];
    _yuefenview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    _yuefenview.layer.shadowColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0].CGColor;
    _yuefenview.layer.shadowOffset = CGSizeMake(2,2);
    _yuefenview.layer.shadowOpacity = 0.8;
    _yuefenview.layer.shadowRadius = 3;
    [self.view addSubview:_yuefenview];
    
//    for (int i = 0; i < 2; i++) {
//        
//        UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40*i, _yuefenview.frame.size.width, 1)];
//        xian.image =[UIImage imageNamed:@"shouye-fengexian"];
//        [_yuefenview addSubview:xian];
//        
//        
//        if (i == 1) {
//            
//            UIImageView * xian1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, _yuefenview.frame.size.height-40, _yuefenview.frame.size.width, 1)];
//            xian1.image =[UIImage imageNamed:@"shouye-fengexian"];
//            [_yuefenview addSubview:xian1];
//        }
//
//    }
    
    
    
//    UIButton * yfjia = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
//    [yfjia setImage:[UIImage imageNamed:@"wode_shang"] forState:0];
//    [yfjia addTarget:self action:@selector(yuejia) forControlEvents:1<<6];
//    [_yuefenview addSubview:yfjia];
//    
//    
//    UIButton * yfjian = [[UIButton alloc] initWithFrame:CGRectMake(0, _yuefenview.frame.size.height-40, 150, 40)];
//    [yfjian setImage:[UIImage imageNamed:@"wode_xia"] forState:0];
//    [yfjian addTarget:self action:@selector(yuejian) forControlEvents:1<<6];
//    [_yuefenview addSubview:yfjian];
    
    
    
//    _yuefenscv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, _yuefenview.frame.size.width, _yuefenview.frame.size.height-80)];
//    _yuefenscv.showsHorizontalScrollIndicator = NO;
//    _yuefenscv.showsVerticalScrollIndicator = NO;
//    _yuefenscv.bounces = NO;
//    _yuefenscv.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
//    [_yuefenview addSubview:_yuefenscv];
//    _yuefenscv.contentSize = CGSizeMake(0, 12*40);
    
    int yuf = [[Single danle].danqianyuefen intValue];
    int nian = [[Single danle].danqiannianfen intValue];

    
    for (int i = 0; i < 5; i++) {
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40*i, 150, 40)];
        [btn addTarget:self action:@selector(yuefenxuanzhe:) forControlEvents:1<<6];
        btn.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [btn setTitle:[NSString stringWithFormat:@"%d年%d月",nian,yuf] forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [_yuefenview addSubview:btn];
        

        
        
        UILabel * yuflabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width, 40)];
        yuflabel.textColor = [UIColor colorWithRed:255/255.0 green:189/255.0 blue:61/255.0 alpha:1.0];
        yuflabel.font = [UIFont systemFontOfSize:18];
        [btn addSubview:yuflabel];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d年%d月",nian,yuf]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(4,1)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(str.length-1,1)];
        yuflabel.attributedText = str;
        yuflabel.textAlignment = 1;

    
        UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width, 1)];
        xian.image =[UIImage imageNamed:@"shouye-fengexian"];
        [btn addSubview:xian];

        
        yuf--;
        
        if (yuf == 0) {
            
            yuf = 12;
            nian--;
        }
    
    }

}




#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
}

//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    JinBiMingXiCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[JinBiMingXiCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.icon.layer.cornerRadius = 25;
    cell.icon.layer.masksToBounds = YES;
    cell.icon.backgroundColor = [UIColor orangeColor];
    
    cell.biaoting.text = @"在线支付";
    cell.biaoting.textColor = [UIColor whiteColor];
    cell.biaoting.font = [UIFont systemFontOfSize:17];
    
    
    cell.shijian.text = @"02-20";
    cell.shijian.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    cell.shijian.font = [UIFont systemFontOfSize:14];
    

    
    cell.jingbi.text = @"+450";
    cell.jingbi.textColor = [UIColor colorWithRed:255/255.0 green:186/255.0 blue:60/255.0 alpha:1.0];
    cell.jingbi.font = [UIFont systemFontOfSize:17];
    cell.jingbi.textAlignment = 2;
    

    if(indexPath.row % 2 == 0)
    {

        cell.backgroundColor = [UIColor colorWithRed:55/255.0 green:61/255.0 blue:67/255.0 alpha:1.0];

    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];

    }
  
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
   
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
    
}

#pragma mark - 显示月份选择
-(void)yuefxuanzhe
{
    if (_yuefbool == YES) {
        
        _jiantouimgv.image = [UIImage imageNamed:@"wode_shang"];
        _yuefbool = NO;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram = _yuefenview.frame;
            fram.origin.y = 114;
            _yuefenview.frame = fram;
            
        }];
    }
    else{
        
        _jiantouimgv.image = [UIImage imageNamed:@"wode_xia"];

        _yuefbool = YES;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect fram = _yuefenview.frame;
            fram.origin.y = 114-200;
            _yuefenview.frame = fram;
            
        }];


    }
}

#pragma mark - 月份加
-(void)yuejia
{
    NSLog(@"月份加");
}


#pragma mark - 月份减
-(void)yuejian
{
    NSLog(@"月份减");

}



#pragma mark - 月份选择
-(void)yuefenxuanzhe:(UIButton *)btn
{
    NSLog(@"%@",btn.titleLabel.text);
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:btn.titleLabel.text];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(4,1)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(str.length-1,1)];
    _yuflabel.attributedText = str;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect fram = _yuefenview.frame;
        fram.origin.y = 114-200;
        _yuefenview.frame = fram;
        
        _jiantouimgv.image = [UIImage imageNamed:@"wode_xia"];
        
        _yuefbool = YES;
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
