//
//  SCFanKueiVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/15.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCFanKueiVC.h"

@interface SCFanKueiVC ()<UITextViewDelegate>
{
    UILabel * _textvtishilabel;
    
    UITextView * _yijiantextview;
}

@end

@implementation SCFanKueiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    
    [self zdydhl];
    
    [self zdyUI];
    
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
    biaotinglabel.text = @"客官反馈";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{

    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(25, 75, APPwidth-45, 30)];
    label.text = @"尽情挥发";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:label];
    
    
    UIView * shurkuanview = [[UIView alloc] initWithFrame:CGRectMake(20, 110, APPwidth-40, 220)];
    shurkuanview.backgroundColor = [UIColor whiteColor];
    shurkuanview.layer.cornerRadius = 8;
    shurkuanview.layer.shadowOffset = CGSizeMake(0, 0.3);
    shurkuanview.layer.shadowOpacity = 0.10;
    [self.view addSubview:shurkuanview];
    
    
    
    _textvtishilabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, shurkuanview.frame.size.width-10, 50)];
    _textvtishilabel.numberOfLines = 2;
    _textvtishilabel.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    _textvtishilabel.font = [UIFont systemFontOfSize:15];
    NSString *labelText = @"亲、您遇到什么系统问题了？还是什么功能建议？欢迎发表~";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:7.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    _textvtishilabel.attributedText = attributedString;
    [shurkuanview addSubview:_textvtishilabel];
    
    
   
    
    _yijiantextview = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, shurkuanview.frame.size.width-20, 200)];
    _yijiantextview.delegate = self;
    _yijiantextview.returnKeyType = UIReturnKeyDone;
    _yijiantextview.autocorrectionType = UITextAutocorrectionTypeNo;
    _yijiantextview.backgroundColor = [UIColor clearColor];
    _yijiantextview.font = [UIFont systemFontOfSize:16];
    [shurkuanview addSubview:_yijiantextview];
    
    
    //添加点击手势、来回收键盘
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [self.view addGestureRecognizer:tap];
    
    
    UIButton * tjbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/2-80, shurkuanview.frame.size.height+shurkuanview.frame.origin.y+30, 160, 50)];
    tjbtn.layer.cornerRadius = 25;
    tjbtn.layer.masksToBounds = YES;
    tjbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
    [tjbtn setTitle:@"提交" forState:0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    tjbtn.contentHorizontalAlignment = 0;
    [self.view addSubview:tjbtn];
    
}



#pragma mark - 开始编辑
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
    _textvtishilabel.hidden = YES;
    
}

#pragma mark - 结束编辑
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length <= 0) {
        
        _textvtishilabel.hidden = NO;
    }
}





#pragma mark - 点击屏幕隐藏键盘
-(void)dealTap
{
    [_yijiantextview resignFirstResponder];
    
}


#pragma mark - 点击Done回收键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range  replacementText:(NSString *)text
{
    
    if (range.length==0) {
        if ([text isEqualToString:@"\n"]) {
            [_yijiantextview resignFirstResponder];
            return NO;
        }
    }
    
    return YES;
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
