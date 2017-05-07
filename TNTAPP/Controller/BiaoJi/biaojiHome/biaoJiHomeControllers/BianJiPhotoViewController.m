//
//  BianJiPhotoViewController.m
//  TNTAPP
//
//  Created by mac on 17/3/31.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "BianJiPhotoViewController.h"

@interface BianJiPhotoViewController ()

@property(nonatomic,strong)UIView *topView;

@end

@implementation BianJiPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationBar];
    
    // Do any additional setup after loading the view from its nib.
}


//设置导航栏
-(void)setNavgationBar{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:_topView];
    _topView.backgroundColor = [UIColor clearColor];
    
    CGFloat margin = 10;
    //导航栏高度
    CGFloat topMargin = 24;
    //设置导航栏标题
    
    //    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin, 24, 40, 40)];
    //    titleLabel.backgroundColor = [UIColor clearColor];
    //    titleLabel.textColor = [UIColor whiteColor];
    //    titleLabel.text = @"标记";
    //    titleLabel.textAlignment = NSTextAlignmentCenter;
    //    titleLabel.font = [UIFont systemFontOfSize:20];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(margin, topMargin,40, 40)];
    [button setImage:[UIImage imageNamed:@"biaojishouye_fanhui"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(LeftBackButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:button];
    
    CGFloat labelW = 120;
    CGFloat labelH = 40;
    //初始化
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH- labelW)/2, topMargin,labelW, labelH)];
//    
//    
//    label.backgroundColor = [UIColor clearColor];
//    [_topView addSubview:label];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text =@"商家实景";
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont systemFontOfSize:20];
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-margin-40-45, 24,40, 40)];
    [rightButton setImage:[UIImage imageNamed:@"gerenzhuye_xinjian"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(rightAddButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [_topView addSubview:rightButton];
    
    
    UIButton *rightTextButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-margin-40, 24,40, 40)];
    //   [rightTextButton setImage:[UIImage imageNamed:@"biaojishouye_fabiao"] forState:UIControlStateNormal];
    [rightTextButton setTitle:@"编辑" forState:UIControlStateNormal];
    [rightTextButton setTitle:@"取消" forState:UIControlStateSelected];
    //    [rightTextButton setTintColor:[UIColor orangeColor]];
    [rightTextButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [rightTextButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [rightTextButton addTarget:self action:@selector(rightTextButtonClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    
    [_topView addSubview:rightTextButton];
    
    
    
    /** 初始化下拉菜单 */
    //    [self setupDropDownMenu:self.navigationItem.rightBarButtonItem];
    
    //    NSLog(@"rightBarButtonItem.customView.centerX是%f",self.navigationItem.rightBarButtonItem.customView.center.x);
    //    NSLog(@"leftBarButtonItem.customView.centerX%f",self.navigationItem.leftBarButtonItem.customView.center.x);
    //
    //    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f]];
    
    //    _topView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];
    
    //    去掉UINavigationBar底部的分割线
    
    //导航栏背景透明
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    
    
}


#pragma mark 点击导航栏按钮
-(void)LeftBackButtonClicked:(UIButton*)btn{
    
    //    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


-(void)rightTextButtonClicked:(UIButton*)btn{
    if (btn.selected==NO) {
        btn.selected=YES;
//        _IfBianJiBtnClicked = YES;
//        [_collectionView reloadData];
        
    }else{
        btn.selected=NO;
//        _IfBianJiBtnClicked = NO;
//        [_collectionView reloadData];
        
    }
    
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
