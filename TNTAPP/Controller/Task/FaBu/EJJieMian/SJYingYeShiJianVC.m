//
//  SJYingYeShiJianVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/23.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SJYingYeShiJianVC.h"

@interface SJYingYeShiJianVC ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    BOOL _quantianbool;
    
    UIView * _yingyeshijianview1;
    UIView * _yingyeshijianview2;
    
    UIButton * _tianjiabtn;
    
    UIView * _yingyereview;
    
    UIView * _yingyeshijianxuanzheview;

    NSArray * _yingyerearray;
    UIPickerView * _yingyerepkView1;
    UIPickerView * _yingyerepkView2;

    
    NSArray * _yingyeshijianarray1;
    NSArray * _yingyeshijianarray2;
    UIPickerView * _yingyeshijianpkView1;
    UIPickerView * _yingyeshijianpkView2;
    UIPickerView * _yingyeshijianpkView3;
    UIPickerView * _yingyeshijianpkView4;

}

@end

@implementation SJYingYeShiJianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    _quantianbool = YES;
    
    _yingyerearray = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
 
    _yingyeshijianarray1 = @[@"0点",@"1点",@"2点",@"3点",@"4点",@"5点",@"6点",@"7点",@"8点",@"9点",@"10点",@"11点",@"12点",@"13点",@"14点",@"15点",@"16点",@"17点",@"18点",@"19点",@"20点",@"21点",@"22点",@"23点"];
    _yingyeshijianarray2 = @[@"0分",@"1分",@"2分",@"3分",@"4分",@"5分",@"6分",@"7分",@"8分",@"9分",@"10分",@"11分",@"12分",@"13分",@"14分",@"15分",@"16分",@"17分",@"18分",@"19分",@"20分",@"21分",@"22分",@"23分",@"24分",@"25分",@"26分",@"27分",@"28分",@"29分",@"30分",@"31分",@"32分",@"33分",@"34分",@"35分",@"36分",@"37分",@"38分",@"39分",@"40分",@"41分",@"42分",@"43分",@"44分",@"45分",@"46分",@"47分",@"48分",@"49分",@"50分",@"51分",@"52分",@"53分",@"54分",@"55分",@"56分",@"57分",@"58分",@"59分"];

    
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
    biaoting.text = @"营业时间";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:18];
    [daohan addSubview:biaoting];
    
    
    UIButton * tjbtn = [[UIButton alloc]initWithFrame:CGRectMake(APPwidth-60, 26, 50, 30)];
    [tjbtn setTitle:@"提交" forState:0];
    [tjbtn setTitleColor:[UIColor whiteColor] forState:0];
    [tjbtn addTarget:self action:@selector(tj) forControlEvents:UIControlEventTouchUpInside];
    tjbtn.contentHorizontalAlignment = 0;
    tjbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [daohan addSubview:tjbtn];
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    
   
    //*******************营业时间1************************
    _yingyeshijianview1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, 150)];
    _yingyeshijianview1.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
    [self.view addSubview:_yingyeshijianview1];
    

    NSArray * array = @[@"营业日",@"全天24小时",@"营业时段"];
    for (int i = 0; i < array.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 50*i, APPwidth, 50)];
        view.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
        [_yingyeshijianview1 addSubview:view];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 50)];
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [view addSubview:label];
        
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 49, APPwidth-20, 1)];
        imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
        [view addSubview:imgv];
        

       
        if (i != 1) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, APPwidth-135, 50)];
            [btn setTitle:@"请选择" forState:0];
            [btn setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forState:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            btn.tag = 5800+i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:1<<6];
            [view addSubview:btn];
            
            
            UIImageView * imgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 17.5, 15, 15)];
            imgv2.image = [UIImage imageNamed:@"renwu_youjiantou"];
            [view addSubview:imgv2];
            

        }
        else
        {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-60, 15, 40, 20)];
            [btn setImage:[UIImage imageNamed:@"renwu_kai"] forState:0];
            [btn setImage:[UIImage imageNamed:@"renwu_guan"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(quantian:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];

        }
        
    }

    
    _tianjiabtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _yingyeshijianview1.frame.origin.y+_yingyeshijianview1.frame.size.height+10, APPwidth, 50)];
    [_tianjiabtn setTitle:@"新增营业时间" forState:0];
    [_tianjiabtn setTitleColor:[UIColor colorWithRed:238/255.0 green:167/255.0 blue:58/255.0 alpha:1.0] forState:0];
    _tianjiabtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_tianjiabtn addTarget:self action:@selector(tianjia1:) forControlEvents:UIControlEventTouchUpInside];
    _tianjiabtn.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
    [self.view addSubview:_tianjiabtn];

    
    //*******************营业时间2************************
    _yingyeshijianview2 = [[UIView alloc] initWithFrame:CGRectMake(0, _tianjiabtn.frame.origin.y+_tianjiabtn.frame.size.height+10, APPwidth, 150+60)];
    _yingyeshijianview2.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_yingyeshijianview2];
    _yingyeshijianview2.hidden = YES;

    NSArray * array1 = @[@"营业日",@"全天24小时",@"营业时段"];
    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 50*i, APPwidth, 50)];
        view.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
        [_yingyeshijianview2 addSubview:view];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 50)];
        label.text = array1[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [view addSubview:label];
        
        
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 49, APPwidth-20, 1)];
        imgv.image = [UIImage imageNamed:@"shouye-fengexian"];
        [view addSubview:imgv];
        
        
        
        if (i != 1) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, APPwidth-135, 50)];
            [btn setTitle:@"请选择" forState:0];
            [btn setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forState:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [view addSubview:btn];
            
            
            UIImageView * imgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 17.5, 15, 15)];
            imgv2.image = [UIImage imageNamed:@"renwu_youjiantou"];
            [view addSubview:imgv2];
            
            
        }
        else
        {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-60, 15, 40, 20)];
            [btn setImage:[UIImage imageNamed:@"renwu_kai"] forState:0];
            [btn setImage:[UIImage imageNamed:@"renwu_guan"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(quantian:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
            
        }
        
    }

    UIButton * shanchubtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 160, APPwidth, 50)];
    [shanchubtn setTitle:@"删除" forState:0];
    [shanchubtn setTitleColor:[UIColor colorWithRed:238/255.0 green:167/255.0 blue:58/255.0 alpha:1.0] forState:0];
    shanchubtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [shanchubtn addTarget:self action:@selector(shanchuclick) forControlEvents:UIControlEventTouchUpInside];
    shanchubtn.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
    [_yingyeshijianview2 addSubview:shanchubtn];
    
    
    
    //*******************营业日选择************************
    _yingyereview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _yingyereview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    [self.view addSubview:_yingyereview];
    _yingyereview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangyingyer)];
    [_yingyereview addGestureRecognizer:tap];
    
    
    UIView * shijianview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-300, APPwidth, 300)];
    shijianview.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
    [_yingyereview addSubview:shijianview];
    
    
    UIButton * qxbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, 50, 40)];
    [qxbtn setTitle:@"取消" forState:0];
    [qxbtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
    qxbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [qxbtn addTarget:self action:@selector(yicangyingyer) forControlEvents:1<<6];
    [shijianview addSubview:qxbtn];
    
    
    UIButton * qdbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 0, 50, 40)];
    [qdbtn setTitle:@"确定" forState:0];
    [qdbtn setTitleColor:[UIColor colorWithRed:196/255.0 green:148/255.0 blue:61/255.0 alpha:1.0] forState:0];
    qdbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [shijianview addSubview:qdbtn];
    
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, APPwidth, 1)];
    xian.image =[UIImage imageNamed:@"shouye-fengexian"];
    [shijianview addSubview:xian];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/3, 50, APPwidth/3, 250)];
    label1.text = @"至";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = 1;
    [shijianview addSubview:label1];
    
    
    _yingyerepkView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(APPwidth/3/2-40, 50, 80, 250)];
    _yingyerepkView1.showsSelectionIndicator=YES;
    _yingyerepkView1.dataSource = self;
    _yingyerepkView1.delegate = self;
    [shijianview addSubview:_yingyerepkView1];
    
    
    
    _yingyerepkView2 = [[UIPickerView alloc] initWithFrame:CGRectMake(APPwidth/3*2+APPwidth/3/2-40, 50, 80, 250)];
    _yingyerepkView2.showsSelectionIndicator=YES;
    _yingyerepkView2.dataSource = self;
    _yingyerepkView2.delegate = self;
    [shijianview addSubview:_yingyerepkView2];
    
    
    //*******************营业时间选择************************
    _yingyeshijianxuanzheview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _yingyeshijianxuanzheview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    [self.view addSubview:_yingyeshijianxuanzheview];
    _yingyeshijianxuanzheview.hidden = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yingcanyingyeshijianxuanzhe)];
    [_yingyeshijianxuanzheview addGestureRecognizer:tap1];
    
    
    UIView * yingyeshijianview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-300, APPwidth, 300)];
    yingyeshijianview.backgroundColor = [UIColor colorWithRed:39/255.0 green:44/255.0 blue:48/255.0 alpha:1.0];
    [_yingyeshijianxuanzheview addSubview:yingyeshijianview];
    
    
    UIButton * qxbtn2 = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, 50, 40)];
    [qxbtn2 setTitle:@"取消" forState:0];
    [qxbtn2 setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
    qxbtn2.titleLabel.font = [UIFont systemFontOfSize:16];
    [qxbtn2 addTarget:self action:@selector(yingcanyingyeshijianxuanzhe) forControlEvents:1<<6];
    [yingyeshijianview addSubview:qxbtn2];
    
    
    UIButton * qdbtn2 = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 0, 50, 40)];
    [qdbtn2 setTitle:@"确定" forState:0];
    [qdbtn2 setTitleColor:[UIColor colorWithRed:196/255.0 green:148/255.0 blue:61/255.0 alpha:1.0] forState:0];
    qdbtn2.titleLabel.font = [UIFont systemFontOfSize:16];
    [yingyeshijianview addSubview:qdbtn2];
    
    UIImageView * xian2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, APPwidth, 1)];
    xian2.image =[UIImage imageNamed:@"shouye-fengexian"];
    [yingyeshijianview addSubview:xian2];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/5*2, 50, APPwidth/5, 250)];
    label2.text = @"至";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = 1;
    [yingyeshijianview addSubview:label2];
    
    float x = APPwidth/5/2-30;
    for (int i = 0; i < 4; i++) {
        
        UIPickerView * pickview = [[UIPickerView alloc] initWithFrame:CGRectMake(x, 50, 60, 250)];
        pickview.showsSelectionIndicator=YES;
        pickview.dataSource = self;
        pickview.delegate = self;
        pickview.tag = 5810+i;
        [yingyeshijianview addSubview:pickview];
        

        x = x + APPwidth/5;
        if (i == 1) {
            
            x = x +APPwidth/5;
        }
    }

    
    _yingyeshijianpkView1 = (UIPickerView *)[self.view viewWithTag:5810];
    _yingyeshijianpkView2 = (UIPickerView *)[self.view viewWithTag:5811];
    _yingyeshijianpkView3 = (UIPickerView *)[self.view viewWithTag:5812];
    _yingyeshijianpkView4 = (UIPickerView *)[self.view viewWithTag:5813];
   
    
}

#pragma mark - 按钮点击
-(void)btnClick:(UIButton *)btn
{
    switch (btn.tag) {
       
        case 5800:
        {
            _yingyereview.hidden = NO;
        }
            break;
            
        case 5802:
        {
            _yingyeshijianxuanzheview.hidden = NO;
        }
            break;
            

            
        default:
            break;
    }
}
#pragma mark - 添加营业时间
-(void)tianjia1:(UIButton *)btn
{

    NSLog(@"dgdgd");
    NSLog(@"%@",btn.titleLabel.text);

    if ([btn.titleLabel.text isEqualToString:@"新增营业时间"]) {
        
        _yingyeshijianview2.hidden = NO;
        
        [btn setTitle:@"删除" forState:0];

    }
   else if ([btn.titleLabel.text isEqualToString:@"删除"]) {
        
        _yingyeshijianview2.hidden = YES;
     
        [btn setTitle:@"新增营业时间" forState:0];

    }
}

#pragma mark - 删除营业时间
-(void)shanchuclick
{
    _yingyeshijianview2.hidden = YES;
    
    [_tianjiabtn setTitle:@"新增营业时间" forState:0];


}

#pragma mark - 全天营业
-(void)quantian:(UIButton *)btn
{
    if (_quantianbool == YES) {
        
        [UIView animateWithDuration:0.3 animations:^{
          
            btn.selected = YES;

        }];
        
        _quantianbool = NO;
    }
    else{
        
        [UIView animateWithDuration:0.3 animations:^{
         
            btn.selected = NO;
            
        }];
        _quantianbool = YES;
    }
}


#pragma mark - 提交
-(void)tj
{
    NSLog(@"点击了提交");
}


#pragma mark - 隐藏营业日选择
-(void)yicangyingyer
{
    _yingyereview.hidden = YES;
}

#pragma mark - 隐藏营业时间选择
-(void)yingcanyingyeshijianxuanzhe
{
    _yingyeshijianxuanzheview.hidden = YES;

}

#pragma mark -- PickerView的代理方法的实现
//列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// 每列多少个
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == _yingyerepkView1 || pickerView == _yingyerepkView2) {
        
        return _yingyerearray.count;
        
    }
    
    else if(pickerView == _yingyeshijianpkView1 || pickerView == _yingyeshijianpkView3)
    {
        return _yingyeshijianarray1.count;
        
    }
    
    else
    {
        return _yingyeshijianarray2.count;
        
    }

}


// 每列显示的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (pickerView == _yingyerepkView1 || pickerView == _yingyerepkView2) {
        
        return _yingyerearray[row];
        
    }
    
    else if(pickerView == _yingyeshijianpkView1 || pickerView == _yingyeshijianpkView3)
    {
        return _yingyeshijianarray1[row];
        
    }
    else
    {
        return _yingyeshijianarray2[row];
        
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
    label.font = [UIFont systemFontOfSize:16];

    if (pickerView == _yingyerepkView1 || pickerView == _yingyerepkView2) {
        
        label.text =  _yingyerearray[row];
        
    }
    
    else if(pickerView == _yingyeshijianpkView1 || pickerView == _yingyeshijianpkView3)
    {
        label.text =  _yingyeshijianarray1[row];
        
    }
    
    else 
    {
        label.text =  _yingyeshijianarray2[row];
        
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
