//
//  WoDeDiZhiXingZengVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/24.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "WoDeDiZhiXingZengVC.h"

@interface WoDeDiZhiXingZengVC ()<UITextFieldDelegate,HZAreaPickerDelegate>
{
    BOOL _moredizhibool;
    
    UIButton * _citybtn;
    
    //城市选择器
    UIView * _cityview;
    UIView * _citytoubuview;
    HZAreaPickerView * _cityPicker;
    NSString * _citystr;
}

@end

@implementation WoDeDiZhiXingZengVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    _moredizhibool = YES;
    
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
    biaoting.text = _leixing;
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    UIButton *  baocuenbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-65, 22, 60, 40)];
    [baocuenbtn setTitle:@"保存" forState:UIControlStateNormal];
    baocuenbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [baocuenbtn addTarget:self action:@selector(baocuenclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:baocuenbtn];
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{
    NSArray * array = @[@"姓名：",@"手机：",@"地区：",@"详细地址：",@"邮编："];
    NSArray * tishi = @[@"请输入收货人姓名",@"请输入手机号",@" ",@"请输入街道地址",@"请输入邮编"];

    for (int i = 0; i < array.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 60*i+74, APPwidth, 60)];
        view.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
        [self.view addSubview:view];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 70, 60)];
        label.text = array[i];
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.textAlignment = 0;
        label.font = [UIFont systemFontOfSize:18];
        [view addSubview:label];
        [label sizeToFit];
        
        CGRect fram = label.frame;
        fram.origin.x = 10;
        fram.origin.y = 30-label.frame.size.height/2;
        label.frame = fram;
        
        if (i == 2) {
            
            
            _citybtn = [[UIButton alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, view.frame.size.width-label.frame.origin.x-label.frame.size.width-45, 60)];
            [_citybtn setTitle:@"请选择地区" forState:UIControlStateNormal];
            [_citybtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
            _citybtn.titleLabel.font = [UIFont systemFontOfSize:18];
            [_citybtn addTarget:self action:@selector(diquclick) forControlEvents:UIControlEventTouchUpInside];
            _citybtn.contentHorizontalAlignment = 1;
            [view addSubview:_citybtn];
            
 
            if (_diziarray.count > 0) {
                
                [_citybtn setTitle:_diziarray[i] forState:UIControlStateNormal];
                [_citybtn setTitleColor:[UIColor whiteColor] forState:0];

            }
            
        }
        else{
            UITextField * texf = [[UITextField alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 0, view.frame.size.width-label.frame.origin.x-label.frame.size.width-45, 60)];
            texf.placeholder = tishi[i];
            texf.textColor = [UIColor whiteColor];
            texf.autocorrectionType = UITextAutocorrectionTypeNo;
            texf.autocapitalizationType = UITextAutocapitalizationTypeNone;
            texf.tag = 5830+i;
            texf.delegate = self;
            texf.font = [UIFont systemFontOfSize:18];
            [view addSubview:texf];
            [texf setValue:[UIFont fontWithName:@"Arial" size:16]   forKeyPath:@"_placeholderLabel.font"];//修改大小
            [texf setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
            
            if (_diziarray.count > 0) {
                
                texf.text = _diziarray[i];
              
                
            }
        }
        

        UIButton * shanchubtn = [[UIButton alloc]initWithFrame:CGRectMake(view.frame.size.width-30, 20, 20, 20)];
        [shanchubtn addTarget:self action:@selector(shanchuclick:) forControlEvents:UIControlEventTouchUpInside];
        [shanchubtn setImage:[UIImage imageNamed:@"wode_dizhi_quxiao"] forState:0];
        shanchubtn.tag = 5840+i;
        [view addSubview:shanchubtn];
        shanchubtn.hidden = YES;

        
        UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(10, 59, APPwidth-20, 1)];
        xian.image = [UIImage imageNamed:@"shouye-fengexian"];
        [view addSubview:xian];
        
        
    }

    UIButton * morebtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 330+64, 210, 40)];
    [morebtn setTitle:@"设置成为默认收货地址" forState:UIControlStateNormal];
    [morebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    morebtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [morebtn addTarget:self action:@selector(moreclick:) forControlEvents:UIControlEventTouchUpInside];
    morebtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [morebtn setImage:[UIImage imageNamed:@"wode_dizhi_gouxuan1"] forState:0];
    [morebtn setImage:[UIImage imageNamed:@"wode_dizhi_gouxuan2"] forState:UIControlStateSelected];

    [self.view addSubview:morebtn];
    morebtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 80);
    morebtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);


    //城市选择
    _cityview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _cityview.backgroundColor = ColorCanShu(0, 0, 0, 0.2);
    [self.view addSubview:_cityview];
    _cityview.hidden = YES;
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangcityview)];
    [_cityview addGestureRecognizer:tap2];
    
    
    _citytoubuview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, 40)];
    _citytoubuview.backgroundColor = ColorCanShu(230, 230, 230, 1.0);
    [self.view addSubview:_citytoubuview];
    
    
    UIButton * cityqxbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [cityqxbtn setTitle:@"取消" forState:0];
    [cityqxbtn setTitleColor:WenZiHeiColor forState:0];
    cityqxbtn.contentHorizontalAlignment = 0;
    cityqxbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [cityqxbtn addTarget:self action:@selector(citycaozuo:) forControlEvents:1<<6];
    [_citytoubuview addSubview:cityqxbtn];
    
    
    UIButton * cityqdbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-100, 0, 100, 40)];
    [cityqdbtn setTitle:@"确定" forState:0];
    [cityqdbtn setTitleColor:WenZiHeiColor forState:0];
    cityqdbtn.contentHorizontalAlignment = 0;
    cityqdbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [cityqdbtn addTarget:self action:@selector(citycaozuo:) forControlEvents:1<<6];
    [_citytoubuview addSubview:cityqdbtn];
    
    
    
    [self cancelLocatePicker];
    _cityPicker = [[[HZAreaPickerView alloc] initWithStyle:HZAreaPickerWithStateAndCityAndDistrict delegate:self] init];
    [_cityPicker showInView:self.view];
    CGRect fram2 = _cityPicker.frame;
    fram2.origin.y = APPheight+40;
    _cityPicker.frame = fram2;
    
    
    
}


#pragma mark - 地区
-(void)diquclick
{
    
    _cityview.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect fram = _cityPicker.frame;
        fram.origin.y = APPheight-_cityPicker.frame.size.height;
        _cityPicker.frame = fram;
        
        CGRect fram2 = _citytoubuview.frame;
        fram2.origin.y = APPheight-_cityPicker.frame.size.height-40;
        _citytoubuview.frame = fram2;
        
    }];

}

#pragma mark - 隐藏城市选择view
-(void)yicangcityview
{
    
    _cityview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _cityPicker.frame;
        fram.origin.y = APPheight+40;
        _cityPicker.frame = fram;
        
        CGRect fram2 = _citytoubuview.frame;
        fram2.origin.y = APPheight;
        _citytoubuview.frame = fram2;
        
    }];
    
}


#pragma mark - 城市选择——取消/确定
-(void)citycaozuo:(UIButton *)btn
{
    _cityview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _cityPicker.frame;
        fram.origin.y = APPheight+40;
        _cityPicker.frame = fram;
        
        CGRect fram2 = _citytoubuview.frame;
        fram2.origin.y = APPheight;
        _citytoubuview.frame = fram2;
        
    }];
    
    if ([btn.titleLabel.text isEqualToString:@"取消"]) {
        
        
    }
    else{
        
        if (_citystr.length > 0) {
            
            [_citybtn setTitle:_citystr forState:UIControlStateNormal];
            [_citybtn setTitleColor:[UIColor whiteColor] forState:0];
            
            

        }
    
        
    }
    
}


#pragma mark - 城市选择器里的方法
-(void)cancelLocatePicker
{
    [_cityPicker cancelPicker];
    _cityPicker.delegate = nil;
    _cityPicker = nil;
}


#pragma mark - HZAreaPicker delegate 城市选择器代理方法
-(void)pickerDidChaneStatus:(HZAreaPickerView *)picker
{
   
    
    _citystr = [NSString stringWithFormat:@"%@-%@-%@",picker.locate.state,picker.locate.city,picker.locate.district];
    
}


#pragma mark - 保存
-(void)baocuenclick
{
    
}

#pragma mark - 设置默认
-(void)moreclick:(UIButton *)btn
{
    
    if (_moredizhibool == YES) {
        
        btn.selected = YES;
        _moredizhibool = NO;
        
    }
    else{
       
        btn.selected = NO;
        _moredizhibool = YES;
        

    }
}

#pragma mark - 删除填入项目
-(void)shanchuclick:(UIButton *)btn
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
