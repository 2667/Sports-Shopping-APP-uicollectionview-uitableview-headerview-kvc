//
//  BiaoJiViewController.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/6.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "PaiHangBanViewController.h"

//#import "buttonView.h"
//#import "BigButtonView.h"
//#import "CompareView.h"
//#import "ComparemMiddleView.h"
//#import "CompareRightView.h"
//#import "GuanJunCell.h"
//#import "DonTaiCell.h"
//#import "friendHeaderView.h"
#import "BtItemTool.h"
//#import "biaoJiSelfTwoLabelView.h"
#import "guanZuTwoLabelView.h"
#import "GeRenGuanZuTableViewCell.h"

#import "UIImage+TNTExtension.h"
#import "UIButton+YXExtension.h"

@interface PaiHangBanViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *topView;


@property (weak, nonatomic) IBOutlet UIButton *friendBtn;

@property (weak, nonatomic) IBOutlet UIButton *nearbyBtn;

@property(nonatomic,weak)UIImageView *sanJiaoXinImageView;

@property(nonatomic,weak)UIButton *currentSelectedBtn;

@end

@implementation PaiHangBanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
  
//    [self load];
    
    
//    BTButton * btn1 = [[BTButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:btn1];
    
//    [self setupTopView];
    [self setUpTableView];
 
    [self setUpBtn];
    
//    UIImage *backGroundImage=[UIImage imageNamed:@"biaoji_paihang_beijing"];
//    self.scrollView.contentMode=UIViewContentModeScaleAspectFill;
//    self.scrollView.layer.contents=(__bridge id _Nullable)(backGroundImage.CGImage);
    
    
    /**
     *  通过nib对象，注册cell
     *
     *  @param nib nib加载后的xib
     *
     *  @param identifier 重用标识
     *
     *  @return 返回值
     */
    /**
     *  加载xib 返回nib对象
     */
    UINib *cellNib = [UINib nibWithNibName:@"GeRenGuanZuTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"GeRenGuanZuTableViewCellID"];
    
//    UINib *DonTaiCellNib = [UINib nibWithNibName:@"DonTaiCell" bundle:nil];
//    [self.tableView registerNib:DonTaiCellNib forCellReuseIdentifier:@"DonTaiCellID"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f];
    _tableView.scrollEnabled =YES;
    
    
    //设置导航栏标题
//    self.navigationItem.title = @"标记";
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"关注";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
//    NSLog(@"",self.navigationItem.title);
    
    self.navigationItem.titleView = titleLabel;
//    self.view.backgroundColor = [UIColor grayColor];

    self.navigationItem.leftBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fanhui" highImage:@"biaojishouye_fanhui" target:self action:@selector(LeftBackButtonClicked:)];
    
    
    
    self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fabiao" highImage:@"biaojishouye_fabiao" target:self action:@selector(rightCameraButtonClicked:)];

    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f]];
  
//    _topView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];
    _topView.backgroundColor = [UIColor clearColor];
    
   
    
//    去掉UINavigationBar底部的分割线
    
    //导航栏背景透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //导航栏底部线清楚
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
}


-(void)setUpBtn{
    
    /*
    _friendBtn.selected = NO;
    UIImage *imageWhiteC = [UIImage initWithColor:[UIColor whiteColor] rect:CGRectMake(1, 1, 1, 1)];
    
//     UIImage *imagedarkGrayC = [UIImage initWithColor:[UIColor darkGrayColor] rect:CGRectMake(1, 1, 1, 1)];
    
    [_friendBtn setBackgroundImage:imageWhiteC forState:UIControlStateNormal];

//    [_friendBtn setBackgroundImage:imagedarkGrayC forState:UIControlStateSelected];

    
    _friendBtn.titleLabel.textAlignment=NSTextAlignmentCenter;

    [_friendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_friendBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
*/
    
    
//    ---------
//    _friendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _friendBtn.selected = NO;
    UIButton * friendBtn = _friendBtn;
//    friendBtn.frame = CGRectMake(20, 50, self.view.frame.size.width - 40, 40);
    
//    friendBtn.layer.cornerRadius = 15;
//    friendBtn.clipsToBounds = YES;
    
    [friendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_friendBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    
    [friendBtn  setBackgroundColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [friendBtn setTitle:@"这是normal状态下的背景色" forState:UIControlStateNormal];
    
    [friendBtn setTitle:@"这是higlglight状态下的背景色" forState:UIControlStateHighlighted];
    
    friendBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [friendBtn addTarget:self action:@selector(friendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
//    [friendBtn setBackgroundColor:[[UIColor orangeColor] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    
//    [self.view addSubview:friendBtn];


}







-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
self.extendedLayoutIncludesOpaqueBars=YES;
    self.navigationController.navigationBar.translucent=NO;

}


-(void)viewWillDisappear:(BOOL)animated{

    self.navigationController.navigationBar.translucent=YES;

}

-(void)viewDidAppear:(BOOL)animated{


}


- (IBAction)friendBtnClicked:(UIButton*)friendBtn{
    
    _currentSelectedBtn =friendBtn;
//    _friendBtn.selected = !_friendBtn.selected;
//    UIImage *imagedarkGrayC = [UIImage initWithColor:[UIColor darkGrayColor] rect:CGRectMake(1, 1, 1, 1)];
//    
//    [_friendBtn setBackgroundImage:imagedarkGrayC forState:UIControlStateNormal];

    if (friendBtn.selected==NO) {
        
        UIImage *imagedarkGrayC = [UIImage initWithColor:[UIColor darkGrayColor] rect:CGRectMake(1, 1, 1, 1)];
        
        [_friendBtn setBackgroundImage:imagedarkGrayC forState:UIControlStateNormal];
        
        _friendBtn.selected=!_friendBtn.selected;
        
    }else{
        
        UIImage *imagewhiteColor = [UIImage initWithColor:[UIColor whiteColor] rect:CGRectMake(1, 1, 1, 1)];
        
        [_friendBtn setBackgroundImage:imagewhiteColor forState:UIControlStateNormal];
        
        _friendBtn.selected=!_friendBtn.selected;
        
    }
    
    
}


- (IBAction)nearByBtnClicked:(id)sender {
}



-(void)setupTopView{
//    _topView
    _nearbyBtn.backgroundColor = [UIColor clearColor];
//    _nearbyBtn.topLabel.text= @"我关注的";
//    _nearbyBtn.topLabel.textAlignment = NSTextAlignmentCenter;
//    _nearbyBtn.topLabel.font = [UIFont systemFontOfSize:14];
//    _nearbyBtn.topLabel.textColor = [UIColor whiteColor];
//    
//    _nearbyBtn.DownLabel.text= @"340";
//    _nearbyBtn.DownLabel.textAlignment = NSTextAlignmentCenter;
//    _nearbyBtn.DownLabel.font = [UIFont systemFontOfSize:17];
//    _nearbyBtn.DownLabel.textColor = [UIColor colorWithRed:0 green:255.0/255.0 blue:254.0/255.0 alpha:1];
    
    _nearbyBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(woGuanZuDeViewClicked:)];
    [_nearbyBtn addGestureRecognizer:singleTap1];
    
    
    _friendBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanZuWoDeViewClicked:)];
    [_friendBtn addGestureRecognizer:singleTap2];
    
    _friendBtn.backgroundColor = [UIColor clearColor];
    
//    _friendBtn.topLabel.text= @"关注我的";
//    _friendBtn.topLabel.font = [UIFont systemFontOfSize:14];
    
//    _friendBtn.topLabel.textColor = [UIColor whiteColor];
//    _friendBtn.DownLabel.text= @"346";
//    _friendBtn.DownLabel.font = [UIFont systemFontOfSize:17];
//    _friendBtn.DownLabel.textColor = [UIColor colorWithRed:0 green:255.0/255.0 blue:254.0/255.0 alpha:1];
    
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(_friendBtn.frame.origin.x+_friendBtn.frame.size.width/2-10, _friendBtn.frame.size.height-10, 20, 10)];
//    imageView.image = [UIImage imageNamed:@"biaoji_guanzhu_xuanzhongzhuangtai"];
//    _sanJiaoXinImageView = imageView;
//    [_topView addSubview:imageView];
    
}

-(void)woGuanZuDeViewClicked:(guanZuTwoLabelView*)guanZuTwoLabelView{

    NSLog(@"woGuanZuDeViewClicked");
 
    /*
    [UIView animateWithDuration:0.3 animations:^{
       
        _sanJiaoXinImageView.frame = CGRectMake(_nearbyBtn.frame.origin.x+_friendBtn.frame.size.width/2-10, _nearbyBtn.frame.size.height-10, 20, 10);
        
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 5, 0);
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 3, 0);
        
    }];
*/
    
}

-(void)guanZuWoDeViewClicked:(guanZuTwoLabelView*)guanZuTwoLabelView{

    NSLog(@"guanZuWoDeViewClicked");
    
    /*
    [UIView animateWithDuration:0.3 animations:^{
      
        _sanJiaoXinImageView.frame = CGRectMake(_friendBtn.frame.origin.x+_friendBtn.frame.size.width/2-10, _friendBtn.frame.size.height-10, 20, 10);
        
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 5, 0);
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 3, 0);
        
    }];
*/
     
}


-(void)setUpTableView{
    _tableView.backgroundColor = [UIColor redColor];
    _tableView.delegate =self;
    _tableView.dataSource = self;
   
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.section==0) {
        
        GeRenGuanZuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GeRenGuanZuTableViewCellID" forIndexPath:indexPath];
        
        // 2.如果缓存池中没有cell就用BorrowCell创建
        if (!cell) {
            cell = [GeRenGuanZuTableViewCell returnCell];
        }
        
//        cell.backgroundColor = [UIColor blueColor];
        //        if (indexPath.row==0) {
        //圆角
        cell.guanzuIcon.layer.cornerRadius = cell.guanzuIcon.frame.size.width/2;
        cell.guanzuIcon.layer.masksToBounds = YES;
        
        [cell.guanzuIcon setImage:[[UIImage imageNamed:@"beauty5"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
        
        
        //            cell.imageView.image = [UIImage imageNamed:@"biaojishouye_ditu"];
        //            cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //            cell.biaoShiShortLabel.hidden =NO;
        //            cell.biaoShiShortLabel.text =@"AFAIFISVS";
        //            cell.titleMiddleLabel.text =@"获得今日冠军";
        //            cell.zanRightLabel.text =@"去赞TA";
        
        //这样设置才会放大按钮图片
        [cell.guanzuBtn setBackgroundImage:[[UIImage imageNamed:@"biaoji_guanzhu_guanzhu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
        //        }else if (indexPath.row==1) {
        //
        //
        //        }
        return cell;
        
    }
    
    UITableViewCell * cell;
    return cell;
    
    
    

}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        _tableView.sectionFooterHeight = 10;
        return 0.0001;
    }else if (section==1) {
        return 40;
    }
    return 0.0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        _tableView.sectionFooterHeight = 0.0001;
//        return 38;
        return 80;
    }else if (indexPath.section==1) {
        return 118;
    }
    return 0.0001;

}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* view;
    
    
    if (section==0) {
        return view;
    }else if (section==1) {
//        friendHeaderView * headerView = [[friendHeaderView instance]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
//        return headerView;
    }
    return view;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}




-(void)LeftBackButtonClicked:(UIButton*)btn{
    
[self.navigationController popViewControllerAnimated:YES];

}

-(void)rightCameraButtonClicked:(UIButton*)btn{
    
    
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
