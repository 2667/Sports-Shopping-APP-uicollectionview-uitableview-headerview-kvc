//
//  MyTabBar.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/19.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "MyTabBar.h"

@interface MyTabBar ()
{
    SCGIFImageView * _yudonggifimv;
    UIImageView * _yudongimv;
    UIView * _yudongdise;
}

@end

@implementation MyTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tabBar.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tiaozhuanjibu) name:@"tiaozhuanjibu" object:nil];

    
    [self zdyTabBar];
}




#pragma mark - 自定义tabbar
-(void)zdyTabBar
{
    NSArray * wenziArr = @[@"首页",@"任务",@"标记",@"我的"];
    
    NSArray * imageArr1 = @[@"shouye_biaoqian_shouye",@"shouye_biaoqian_renwu",@"shouye_biaoqian_biaoji",@"shouye_biaoqian_wode"];
    
    NSArray * imageArr2 = @[@"shouye_biaoqian_shouye_dianji",@"shouye_biaoqian_renwu_dianji",@"shouye_biaoqian_biaoji-dianji",@"shouye_biaoqian_wode_dianji"];
    
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 49, self.view.frame.size.width, 49)];
    _tabBarView.backgroundColor = [UIColor colorWithRed:45/255.0 green:49/255.0 blue:54/255.0 alpha:1.0];
    [self.view addSubview:_tabBarView];
    

    
    
    for (int i = 0; i < wenziArr.count; i++)
    {
        
        //按钮
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/4*i+APPwidth/4/2-10, 5, 20, 20)];
        [btn setBackgroundImage:[UIImage imageNamed:imageArr1[i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:imageArr2[i]] forState:UIControlStateSelected];
        btn.tag = 200+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:btn];
        
        if (btn.tag == 200) {
            btn.selected = YES;
            
        }
        

        //标题
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/4*i, btn.frame.origin.y+btn.frame.size.height+5, APPwidth/4, 15)];
        label.text = wenziArr[i];
        label.tag = 300+i;
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        [_tabBarView addSubview:label];
        if (label.tag == 300) {
            label.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            
        }
        
        
        
        UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth/4*i, 0, APPwidth/4, 49)];
        btn2.tag = 100+i;
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:btn2];
        

        
    }
    
    
    
}



#pragma mark - tabbar上按钮点击事件
-(void)btnClick:(UIButton *)btn
{
    
    //点击按钮、进入相应的模块
    self.selectedIndex = btn.tag - 100;
    
    //for循环 来控制按钮和文字的颜色状态
    for(int i = 0;i<4;i++)
    {

        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:200+i];
        btn1.selected = NO;
        if (btn1.tag == btn.tag+100) {
            btn1.selected = YES;

        }
        
        UILabel * label = (UILabel *)[self.view viewWithTag:300+i];
        label.textColor = [UIColor whiteColor];
        if (label.tag == btn.tag+200) {
            label.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
            
        }
    }
    
    
//    self.tabBar.hidden = YES;
    
    
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
