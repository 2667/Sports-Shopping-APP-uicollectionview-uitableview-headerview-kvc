//
//  YouHueiQuanVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/1.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "YouHueiQuanVC.h"
#import "YouHueiQuanCell.h"

@interface YouHueiQuanVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView * _yidongxian;

    UIScrollView * _zhengscrollview;

    UITableView * _weishiyongtableview;
    UITableView * _yishiyongtableview;
    UITableView * _guoqitableview;
    

}

@end

@implementation YouHueiQuanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    biaoting.text = @"优惠券";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
    //*****************表头**********************
    UIView * biaotouview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 60)];
    biaotouview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:biaotouview];
    
    
    NSArray * array = @[@"未使用(3)",@"使用记录(2)",@"已过期(2)"];
    for (int i = 0; i < array.count; i++) {
        
        UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(APPwidth/3*i, 0, APPwidth/3, 60)];
        [btn setTitle:array[i] forState:0];
        [btn setTitleColor:[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0] forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        btn.contentHorizontalAlignment = 0;
        btn.backgroundColor = [UIColor colorWithRed:41/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 5550+i;
        [biaotouview addSubview:btn];
        
       
    }
    

    _yidongxian = [[UIView alloc] initWithFrame:CGRectMake(0, 58, APPwidth/3, 2)];
    _yidongxian.backgroundColor = [UIColor colorWithRed:255/255.0 green:186/255.0 blue:61/255.0 alpha:1.0];
    [biaotouview addSubview:_yidongxian];
    
    
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, biaotouview.frame.origin.y+biaotouview.frame.size.height, APPwidth, APPheight-biaotouview.frame.origin.y-biaotouview.frame.size.height)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    _zhengscrollview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_zhengscrollview];
    _zhengscrollview.contentSize = CGSizeMake(APPwidth*3, 0);

    for (int i = 0; i < 3; i++) {
        
        UITableView * tableview = [[UITableView alloc] initWithFrame:CGRectMake(APPwidth*i, 0, APPwidth, _zhengscrollview.frame.size.height)];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        tableview.tag = 5555+i;
        [_zhengscrollview addSubview:tableview];
        

    }
    
    _weishiyongtableview = (UITableView *)[self.view viewWithTag:5555];
    _yishiyongtableview = (UITableView *)[self.view viewWithTag:5556];
    _guoqitableview = (UITableView *)[self.view viewWithTag:5557];

    
    
}




#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _weishiyongtableview) {
        
        return 3;
    }
    else if (tableView == _yishiyongtableview)
    {
        return 2;
    }
    else{
        
        return 2;

    }
    
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    YouHueiQuanCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[YouHueiQuanCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.diseone.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    
    cell.disetwo.backgroundColor = [UIColor colorWithRed:42/255.0 green:47/255.0 blue:53/255.0 alpha:1.0];

    
    cell.yuanone.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    cell.yuanone.layer.cornerRadius = 5;
    cell.yuanone.layer.masksToBounds = YES;

    
    cell.yuantwo.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    cell.yuantwo.layer.cornerRadius = 5;
    cell.yuantwo.layer.masksToBounds = YES;
    
    
    cell.xuxian.image = [self drawLineByImageView:cell.xuxian];
    cell.xuxian.transform = CGAffineTransformMakeRotation(270 *M_PI / 180.0);
    
    
    cell.jine.font = [UIFont systemFontOfSize:20];
    cell.jine.textColor = [UIColor colorWithRed:255/255.0 green:187/255.0 blue:61/255.0 alpha:1.0];
    cell.jine.textAlignment = 1;
    NSMutableAttributedString *jinestr = [[NSMutableAttributedString alloc] initWithString:@"￥20"];
    [jinestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 1)];//设置不同字号
    [jinestr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,1)];//设置不同颜色
    cell.jine.attributedText = jinestr;
    

    
    cell.yhq.text = @"抵用券";
    cell.yhq.font = [UIFont systemFontOfSize:10];
    cell.yhq.textColor = [UIColor whiteColor];
    cell.yhq.textAlignment = 1;


    cell.biaoti.text = @"优惠20元抵用券";
    cell.biaoti.font = [UIFont systemFontOfSize:16];
    cell.biaoti.textColor = [UIColor whiteColor];
    cell.biaoti.textAlignment = 0;
    
    cell.fubiaoti.text = @"满100元可用、限最新版客户端使用";
    cell.fubiaoti.font = [UIFont systemFontOfSize:11];
    cell.fubiaoti.textColor = [UIColor whiteColor];
    cell.fubiaoti.textAlignment = 0;
    
    cell.shijian.text = @"有效期：2017-02-09至2017-02-20";
    cell.shijian.font = [UIFont systemFontOfSize:11];
    cell.shijian.textColor = [UIColor whiteColor];
    cell.shijian.textAlignment = 0;
    
    
    if (tableView == _yishiyongtableview) {
        
        cell.yishiyong.image = [UIImage imageNamed:@"wode_youhuijuan_yishiyong"];
        
        cell.jine.textColor = [UIColor whiteColor];
        
        
    }
    if (tableView == _guoqitableview) {
        
        cell.diseone.backgroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        
        cell.disetwo.backgroundColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
        
        cell.yiguoqi.text = @"已过期";
        cell.yiguoqi.font = [UIFont systemFontOfSize:11];
        cell.yiguoqi.textColor = [UIColor whiteColor];
        cell.yiguoqi.textAlignment = 0;
        
        cell.jine.textColor = [UIColor whiteColor];

    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];

    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
    
}

#pragma mark - 选择条按钮点击
-(void)btnClick:(UIButton *)btn
{
    
    UITableView * table = (UITableView *)[self.view viewWithTag:btn.tag+5];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect fram = _yidongxian.frame;
        fram.origin.x = btn.frame.origin.x;
        _yidongxian.frame = fram;
      

        CGPoint point =  _zhengscrollview.contentOffset;
        point.x = table.frame.origin.x;
        _zhengscrollview.contentOffset = point;
        
    }];
    
}



#pragma mark -  返回虚线image的方法
- (UIImage *)drawLineByImageView:(UIImageView *)imageView{
   
    UIGraphicsBeginImageContext(imageView.frame.size); //开始画线 划线的frame
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    //设置线条终点形状
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapButt);
    
    // 5是每个虚线的长度 4是分割距离
    CGFloat lengths[] = {5,4};
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(line, [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0].CGColor);//线条的颜色

    // 开始绘制虚线
    CGContextSetLineDash(line, 5, lengths, 2);
    CGContextMoveToPoint(line, 0.0, 2.0);
    CGContextAddLineToPoint(line, APPwidth-10, 10.0);
    
    CGContextStrokePath(line);
    CGContextClosePath(line);

    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
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
