//
//  GeRenZiLiaoVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/3.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "GeRenZiLiaoVC.h"
#import "ShanChangLingYuVC.h"
#import "GRJianJieViewController.h"


@interface GeRenZiLiaoVC ()<UIActionSheetDelegate,ZHPickViewDelegate,HZAreaPickerDelegate>
{
    UILabel * _name;
    UILabel * _xingbie;
    UILabel * _nianli;
    UILabel * _shoujihao;
    UILabel * _cheshi;
    UILabel * _shangchang;

    
    //年月日
    UIView * _srview;
    ZHPickView *_srpickview;
    NSString * _srstr;
    
    
    
    //城市选择器
    UIView * _cityview;
    UIView * _citytoubuview;
    HZAreaPickerView * _cityPicker;
    NSString * _citystr;


    
}

@end

@implementation GeRenZiLiaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    
    
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
    biaoting.text = @"个人资料";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    

}


#pragma mark - 自定义UI
-(void)zdyUI
{
    NSArray * array = @[@"头像",@"昵称",@"性别",@"出生年月",@"手机",@"常住城市",@"擅长领域",@"我的简介"];
    
    for (int i = 0; i < array.count; i++) {
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64+60*i, APPwidth, 60)];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:1<<6];
        btn.tag = 5420+i;
        [self.view addSubview:btn];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, 60)];
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = 0;
        label.font = [UIFont systemFontOfSize:16];
        [btn addSubview:label];
        
        
        if (i != 2) {
            
            
            UIImageView * imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-25, 22, 16, 16)];
            imgv1.image = [UIImage imageNamed:@"wode_dizhi_you"];
            [btn addSubview:imgv1];
            
            if (i == 5) {
                
                CGRect fram = imgv1.frame;
                fram.size.width = 20;
                fram.size.height = 20;
                fram.origin.x = APPwidth-30;
                fram.origin.y = 20;
                imgv1.frame = fram;
                
                imgv1.image = [UIImage imageNamed:@"remwu_juli"];
 
            }

        }
        
        if (i == 0) {
            
            UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-75, 10, 40, 40)];
            imgv.backgroundColor = [UIColor orangeColor];
            imgv.layer.cornerRadius = 20;
            imgv.layer.masksToBounds = YES;
            [btn addSubview:imgv];
            

        }
        if (i == 1 || i == 2 || i == 3 || i == 4 || i == 5 || i == 6) {
            
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+5, 0, APPwidth-125, 60)];
            label1.textColor = [UIColor whiteColor];
            label1.textAlignment = 2;
            label1.font = [UIFont systemFontOfSize:16];
            label1.tag = 5410+i;
            [btn addSubview:label1];

            if (i == 5) {
                
                CGRect fram = label1.frame;
                fram.origin.x = label.frame.origin.x+label.frame.size.width+5;
                fram.size.width = APPwidth-135;
                label1.frame = fram;
                
                
            }
            if (i == 4) {
                
                UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-80, 20, 50, 20)];
                label2.text = @"已认证";
                label2.textColor = [UIColor whiteColor];
                label2.textAlignment = 1;
                label2.font = [UIFont systemFontOfSize:10];
                [label2 sizeToFit];
                label2.backgroundColor = [UIColor colorWithRed:255/255.0 green:183/255.0 blue:60/255.0 alpha:1.0];
                [btn addSubview:label2];

                CGRect fram = label2.frame;
                fram.origin.x = APPwidth-label2.frame.size.width-34;
                fram.origin.y = 30-(label2.frame.size.height+4)/2;
                fram.size.height = label2.frame.size.height+4;
                fram.size.width = label2.frame.size.width+4;
                label2.frame = fram;
                label2.layer.cornerRadius = 2;
                label2.layer.masksToBounds = YES;
                
                
                CGRect fram2 = label1.frame;
                fram2.origin.x = label.frame.origin.x+label.frame.size.width+5;
                fram2.size.width = label1.frame.size.width - label2.frame.size.width-10;
                label1.frame = fram2;
                label1.textAlignment = 2;

            }
        }

        
    }

    
    _name = (UILabel *)[self.view viewWithTag:5411];
    _name.text = @"微笑_._f";
    
    _xingbie = (UILabel *)[self.view viewWithTag:5412];
    _xingbie.text = @"女";

    _nianli = (UILabel *)[self.view viewWithTag:5413];
    _nianli.text = @"1991-11-09";

    _shoujihao = (UILabel *)[self.view viewWithTag:5414];
    _shoujihao.text = @"15547896523";

    _cheshi = (UILabel *)[self.view viewWithTag:5415];
    _cheshi.text = @"广东省 广州市";

    _shangchang = (UILabel *)[self.view viewWithTag:5416];
    _shangchang.text = @"房产买卖";
    
    
    
    //出生年月选择PK
    _srview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _srview.backgroundColor = ColorCanShu(0, 0, 0, 0.2);
    [self.view addSubview:_srview];
    _srview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yicangsrview)];
    [_srview addGestureRecognizer:tap];
    
    
    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:9000000];
    _srpickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
    _srpickview.delegate=self;
    [_srpickview show];
    [_srpickview setPickViewColer:[UIColor orangeColor]];
    [_srpickview setTintColor:[UIColor clearColor]];
    [_srpickview setToolbarTintColor:[UIColor clearColor]];
    
    
    CGRect fram = _srpickview.frame;
    fram.size.width = APPwidth;
    fram.origin.y = APPheight;
    _srpickview.frame = fram;

    
    UIView * srtoubuview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 40)];
    srtoubuview.backgroundColor = ColorCanShu(230, 230, 230, 1.0);
    [_srpickview addSubview:srtoubuview];
    

    UIButton * srqxbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [srqxbtn setTitle:@"取消" forState:0];
    [srqxbtn setTitleColor:WenZiHeiColor forState:0];
    srqxbtn.contentHorizontalAlignment = 0;
    srqxbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [srqxbtn addTarget:self action:@selector(srcaozuo:) forControlEvents:1<<6];
    [srtoubuview addSubview:srqxbtn];
    
    
    UIButton * srqdbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-100, 0, 100, 40)];
    [srqdbtn setTitle:@"确定" forState:0];
    [srqdbtn setTitleColor:WenZiHeiColor forState:0];
    srqdbtn.contentHorizontalAlignment = 0;
    srqdbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [srqdbtn addTarget:self action:@selector(srcaozuo:) forControlEvents:1<<6];
    [srtoubuview addSubview:srqdbtn];

    
    
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

#pragma mark - 按钮点击
-(void)btnclick:(UIButton *)btn
{
    switch (btn.tag) {
      
            //头像
        case 5420:
        {
            UIActionSheet * acs = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
            [acs showInView:self.view];
            
        }
            break;
            
            
            //昵称
        case 5421:
        {
            GRJianJieViewController * grjj = [[GRJianJieViewController alloc] init];
            grjj.biaoting = @"昵称";
            [self.navigationController pushViewController:grjj animated:YES];
            

        }
            break;

            
            
            //性别
        case 5422:
        {
            if ([_xingbie.text isEqualToString:@"女"]) {
                _xingbie.text = @"男";
            }
            else{
                _xingbie.text = @"女";

            }
        }
            break;

            
            
            //出生年月
        case 5423:
        {
          
            _srview.hidden = NO;
            
            [UIView animateWithDuration:0.3 animations:^{
                CGRect fram = _srpickview.frame;
                fram.origin.y = APPheight-_srpickview.frame.size.height;
                _srpickview.frame = fram;
                
            }];
 
            
        }
            break;

            
            
            //手机号
        case 5424:
        {
            
        }
            break;

            
            
            //城市
        case 5425:
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
            
            
//                [UIView animateWithDuration:0.3 animations:^{
//                    CGRect fram = _cityPicker.frame;
//                    fram.origin.y = APPheight;
//                    _cityPicker.frame = fram;
//                    
//                }];
//           
//            
            
        }
            break;

            
            
            //擅长
        case 5426:
        {
            ShanChangLingYuVC * scly = [[ShanChangLingYuVC alloc] init];
            [self.navigationController pushViewController:scly animated:YES];

        }
            break;

            
            
            //简介
        case 5427:
        {
            
            GRJianJieViewController * grjj = [[GRJianJieViewController alloc] init];
            grjj.biaoting = @"我的简介";
            [self.navigationController pushViewController:grjj animated:YES];
            

        }
            break;

            
            
        default:
            break;
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



#pragma mark ZhpickVIewDelegate  PK代理方法
-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    
    
   NSString * _shenre = [resultString substringToIndex:10];
    
  
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _srpickview.frame;
        fram.origin.y = APPheight;
        _srpickview.frame = fram;
        
    }];
    
    
}


#pragma mark - 生日选择——取消/确定
-(void)srcaozuo:(UIButton *)btn
{
    _srview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _srpickview.frame;
        fram.origin.y = APPheight;
        _srpickview.frame = fram;
        
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
        
        _cheshi.text = _citystr;

    }
    
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


#pragma mark - 隐藏生日view
-(void)yicangsrview
{
    _srview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _srpickview.frame;
        fram.origin.y = APPheight;
        _srpickview.frame = fram;
        
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
