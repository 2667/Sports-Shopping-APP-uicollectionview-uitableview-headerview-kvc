//
//  SCDDPinJiaVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/8.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDDPinJiaVC.h"

@interface SCDDPinJiaVC ()<UITextViewDelegate>
{
    UIScrollView * _zhengscrollview;

    UITextView * _pinjiatextv;
    UILabel * _tishilabel;
    
}

@end

@implementation SCDDPinJiaVC

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
    biaoting.text = @"发表评价";
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

#pragma mark - 自定义UI
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    [self.view addSubview:_zhengscrollview];
    

    //**************商品主图****************************
    UIImageView * _zutuimv = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, APPwidth/5, APPwidth/5)];
    _zutuimv.image = [UIImage imageNamed:@"QQ20170206-135925"];
    [_zhengscrollview addSubview:_zutuimv];
    
    //**************评价内容****************************

    _pinjiatextv = [[UITextView alloc] initWithFrame:CGRectMake(_zutuimv.frame.origin.x+_zutuimv.frame.size.width+10, _zutuimv.frame.origin.y, APPwidth-_zutuimv.frame.origin.x-_zutuimv.frame.size.width-15, _zutuimv.frame.size.height+30)];
    _pinjiatextv.delegate = self;
    _pinjiatextv.font = [UIFont systemFontOfSize:18];
    [_zhengscrollview addSubview:_pinjiatextv];
    

    _tishilabel =[[UILabel alloc] initWithFrame:CGRectMake(0, 5, _pinjiatextv.frame.size.width, 20)];
    _tishilabel.text = @"叮咚！展示文采的时间到啦~";
    _tishilabel.font = [UIFont systemFontOfSize:14];
    _tishilabel.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    [_pinjiatextv addSubview:_tishilabel];
    

    
    //**************添加图片按钮****************************
    UIButton * tjtupianbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, _zutuimv.frame.origin.y+_zutuimv.frame.size.height+50, APPwidth/5+10, APPwidth/5+10)];
    [tjtupianbtn setImage:[UIImage imageNamed:@"mall_evaluation_dianjiqian"] forState:0];
    [tjtupianbtn setImage:[UIImage imageNamed:@"mall_evaluation_dianjihou"] forState:UIControlStateHighlighted];
    [tjtupianbtn addTarget:self action:@selector(tjtup:) forControlEvents:UIControlEventTouchUpInside];
    [_zhengscrollview addSubview:tjtupianbtn];
    
    
    
    UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(0, tjtupianbtn.frame.origin.y+tjtupianbtn.frame.size.height+20, APPwidth, 1)];
    xian1.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    [_zhengscrollview addSubview:xian1];
    

    
    NSArray * array = @[@"描述相符",@"商城评分",@"物流服务",@"服务态度"];
    float y = xian1.frame.origin.y+1;
    for (int i = 0; i< array.count; i++) {
        
        UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(10, y, 100, 50)];
        label.text = array[i];
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        [_zhengscrollview addSubview:label];
        
        if (i != 1)
        {
            for (int j = 0; j< 5; j++) {
                
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-170+30*j, label.frame.origin.y+10, 30, 30)];
                [_zhengscrollview addSubview:btn];
                
                UIImageView * xinimv = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
                xinimv.image = [UIImage imageNamed:@"mall_xiangqing_star1"];
                [btn addSubview:xinimv];
                
                
            }

        }
        else
        {
            label.font = [UIFont systemFontOfSize:18];
 
        }
        
        if (i == 0) {
            
            y = y + 80;
            
            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, label.frame.origin.y+label.frame.size.height, APPwidth, 20)];
            xian.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
            [_zhengscrollview addSubview:xian];
            
        }
        else
        {
            y = y + 50;
 
        }
    }
    
    
    UIButton * fabubtn = [[UIButton alloc] initWithFrame:CGRectMake(0, APPheight-50, APPwidth, 50)];
    [fabubtn setTitle:@"发表评价" forState:0];
    [fabubtn setTitleColor:[UIColor whiteColor] forState:0];
    fabubtn.contentHorizontalAlignment = 0;
    fabubtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [self.view addSubview:fabubtn];
}


#pragma mark - 添加图片
-(void)tjtup:(UIButton *)btn
{
    
    NSLog(@"添加图片");
}


#pragma mark - 开始编辑
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
    _tishilabel.hidden = YES;
    
}

#pragma mark - 结束编辑
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length <= 0) {
        
        _tishilabel.hidden = NO;
    }
}




#pragma mark - 点击Done回收键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range  replacementText:(NSString *)text
{
    
    if (range.length==0) {
        if ([text isEqualToString:@"\n"]) {
            [_pinjiatextv resignFirstResponder];
            return NO;
        }
    }
    
    return YES;
}



#pragma mark - 下拉
-(void)xiala
{
    
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
