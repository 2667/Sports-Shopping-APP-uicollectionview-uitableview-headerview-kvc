//
//  BiaoJiViewController.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/6.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "BiaoJiViewController.h"
//#import "UIButton+CenterImageAndTitle.h"
//#import "BTButton.h"
//#import "BTBigButton.h"
#import "buttonView.h"
#import "BigButtonView.h"
#import "CompareView.h"
#import "ComparemMiddleView.h"
#import "CompareRightView.h"
#import "GuanJunCell.h"
#import "DonTaiCell.h"
#import "friendHeaderView.h"
#import "BtItemTool.h"
#import "FFDropDownMenuView.h"
#import "guanZuViewController.h"
#import "EssenceViewController.h"
#import "GeRenZhuYeViewController.h"
#import "QuanZiViewController.h"
#import "PaiHangBanViewController.h"
#import "DiTuLieBiaoViewController.h"
#import "DiTuHomeVC.h"
#import "SiXinViewController.h"


@interface BiaoJiViewController ()<UITableViewDelegate,UITableViewDataSource,FFDropDownMenuViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//头像
@property (weak, nonatomic) IBOutlet UIImageView *guanzuIcon;
//背景view
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet buttonView *guanzuBtn;
@property (weak, nonatomic) IBOutlet buttonView *sixinBtn;

@property (weak, nonatomic) IBOutlet BigButtonView *paiHangBanBtn;

@property (weak, nonatomic) IBOutlet BigButtonView *diTuBtn;

@property (weak, nonatomic) IBOutlet BigButtonView *quanZiBtn;


@property (weak, nonatomic) IBOutlet UIView *messageBackView;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UIImageView *messageHeaderImageView;


//名次
@property (weak, nonatomic) IBOutlet CompareView *minCiView;
//次
@property (weak, nonatomic) IBOutlet ComparemMiddleView *ciShuView;

//增幅
@property (weak, nonatomic) IBOutlet CompareRightView *zenFuView;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 下拉菜单 */
@property (nonatomic, strong) FFDropDownMenuView *dropdownMenu;




@end

@implementation BiaoJiViewController{

    BOOL isPushIngControllerOrNo;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
//    [self load];
    
    
//    BTButton * btn1 = [[BTButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:btn1];
    
    [self setupTopView];
    [self setCompareView];
 
    
    
    
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
    UINib *cellNib = [UINib nibWithNibName:@"GuanJunCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"GuanJunCellID"];
    
    UINib *DonTaiCellNib = [UINib nibWithNibName:@"DonTaiCell" bundle:nil];
    [self.tableView registerNib:DonTaiCellNib forCellReuseIdentifier:@"DonTaiCellID"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f];
    _tableView.scrollEnabled =NO;

    
    [self setNavgationBar];
}

-(void)setNavgationBar{

    //设置导航栏标题
    //    self.navigationItem.title = @"标记";
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"标记";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
//  NSLog(@"",self.navigationItem.title);
    
    self.navigationItem.titleView = titleLabel;
//        self.view.backgroundColor = [UIColor redColor];
    
    
//    self.navigationItem.leftBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fanhui" highImage:@"biaojishouye_fanhui" target:self action:@selector(LeftBackButtonClicked:)];
//    self.navigationItem.leftBarButtonItem
    
    //右侧的菜单按钮
//        UIButton *menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];

//        [menuBtn addTarget:self action:@selector(showDropDownMenu) forControlEvents:UIControlEventTouchUpInside];
////        [menuBtn setImage:[UIImage imageNamed:@"biaojishouye_fabiao"] forState:UIControlStateNormal];
//    
////    self.navigationItem.rightBarButtonItem.customView.backgroundColor = [UIColor redColor];
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
   
    
    
    
    self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fabiao" highImage:@"biaojishouye_fabiao" target:self action:@selector(showDropDownMenu)];
    
    NSLog(@"self.navigationItem.leftBarButtonItem是%@",self.navigationItem.leftBarButtonItem);
    NSLog(@"self.navigationItem.rightBarButtonItem是%@",self.navigationItem.rightBarButtonItem);
    
    
    /** 初始化下拉菜单 */
    [self setupDropDownMenu:self.navigationItem.rightBarButtonItem];
    
    NSLog(@"rightBarButtonItem.customView.centerX是%f",self.navigationItem.rightBarButtonItem.customView.center.x);
    NSLog(@"leftBarButtonItem.customView.centerX%f",self.navigationItem.leftBarButtonItem.customView.center.x);
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f]];
    
    _topView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];

    //    去掉UINavigationBar底部的分割线
    
    //导航栏背景透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //导航栏底部线清楚
    //    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

}


//+(UIImage *)initWithColor:(UIColor*)color rect:(CGRect)rect{
//    CGRect imgRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
//    UIGraphicsBeginImageContextWithOptions(imgRect.size, NO, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, color.CGColor);
//    CGContextFillRect(context, imgRect);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return img;
//}




//UIColor 转UIImage
- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
self.extendedLayoutIncludesOpaqueBars=YES;
    self.navigationController.navigationBar.translucent=NO;

    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    isPushIngControllerOrNo = NO;
    
    //两个都不能少,否则出现tabbar不能显示却能点击的情况
    self.tabBarController.tabBar.hidden = YES;
//self.hidesBottomBarWhenPushed =YES;
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    //这里是为了解决一个奇怪的bug
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    

}


-(void)viewWillDisappear:(BOOL)animated{

    self.navigationController.navigationBar.translucent=YES;

    if (isPushIngControllerOrNo==NO) {
         self.tabBarController.tabBar.hidden = YES;
        
        ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
       
       
    }
    
    
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];

}

-(void)viewDidAppear:(BOOL)animated{

//     ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;

}


-(void)setupTopView{
    
    _guanzuIcon.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTapGuanzuIcon = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuIconClicked)];
    [_guanzuIcon addGestureRecognizer:singleTapGuanzuIcon];
    
    
    _guanzuBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_guanzhu"];
    
    _guanzuBtn.titleLabel.text = @"关注";
    _guanzuBtn.titleLabel.tintColor = [UIColor blackColor];
    _guanzuBtn.redView.hidden =YES;
    
    _guanzuBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuBtnClicked:)];
    [_guanzuBtn addGestureRecognizer:singleTap1];
    
    _sixinBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_sixing"];
    
    _sixinBtn.titleLabel.text = @"私信";
    _sixinBtn.titleLabel.tintColor = [UIColor blackColor];
    _sixinBtn.redView.backgroundColor = [UIColor redColor];
//    _sixinBtn.redView.layer.co
    //设置它的圆角大小,半径.(四个角的圆角其实都是四分之一的圆,这个圆的半径就是 cornerRadius,矩形宽度的一半)
    _sixinBtn.redView.layer.cornerRadius = _sixinBtn.redView.frame.size.width/2;
    //设置为yes，就可以使用圆角
    _sixinBtn.redView.layer.masksToBounds = YES;
    
    _sixinBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTapSiXin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sixinBtnClicked:)];
    [_sixinBtn addGestureRecognizer:singleTapSiXin];
    
    _paiHangBanBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_paihangbang"];
    
    _paiHangBanBtn.titleLabel.text = @"排行榜";
    _paiHangBanBtn.titleLabel.tintColor = [UIColor blackColor];
    _paiHangBanBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTapPaihangban = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(paiHangBanBtnClicked:)];
    [_paiHangBanBtn addGestureRecognizer:singleTapPaihangban];
    
    _diTuBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_ditu"];
    
    _diTuBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTapDiTu = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DiTuLieBiaoBtnClicked:)];
    [_diTuBtn addGestureRecognizer:singleTapDiTu];
    
    _diTuBtn.titleLabel.text = @"标记";
    _diTuBtn.titleLabel.tintColor = [UIColor blackColor];
    
    _quanZiBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_quanzi"];
    
    _quanZiBtn.titleLabel.text = @"圈子";
    _quanZiBtn.titleLabel.tintColor = [UIColor blackColor];
    _quanZiBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTapq = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quanZiBtnClicked:)];
    [_quanZiBtn addGestureRecognizer:singleTapq];
    
    
    
    self.tabBarController.tabBarItem.title = @"标记";
    
    _guanzuIcon.layer.cornerRadius = _guanzuIcon.frame.size.height/2;
    //设置为yes，就可以使用圆角
    _guanzuIcon.layer.masksToBounds = YES;
    
    //设置它的圆角大小,半径.(四个角的圆角其实都是四分之一的圆,这个圆的半径就是 cornerRadius)
    _messageBackView.layer.cornerRadius = _messageBackView.frame.size.height/2;
    //设置为yes，就可以使用圆角
    _messageBackView.layer.masksToBounds = YES;
    
    
    _messageHeaderImageView.layer.cornerRadius = _messageHeaderImageView.frame.size.height/2;
    //设置为yes，就可以使用圆角
    _messageHeaderImageView.layer.masksToBounds = YES;
}

-(void)setCompareView{

//    _minCiView.imageView.image = [UIImage imageNamed:@""];
    _minCiView.topLabel.text =@"5";
    _minCiView.DownLabel.text =@"名次";
    
    _ciShuView.topLabel.text = @"200";
    _ciShuView.DownLabel.text =@"次";
    
    
    _zenFuView.topLabel.text = @"97%";
    _zenFuView.DownLabel.text =@"增幅";
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

//    id  cell;
    
    if (indexPath.section==0) {
        
        GuanJunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GuanJunCellID" forIndexPath:indexPath];
        
        // 2.如果缓存池中没有cell就用BorrowCell创建
        if (!cell) {
            cell = [GuanJunCell GuanJunCell];
        }
        
        if (indexPath.row==0) {
            //圆角
            cell.LeftBtn.layer.cornerRadius = cell.LeftBtn.frame.size.width/2;
            cell.LeftBtn.layer.masksToBounds = YES;
            
              [cell.LeftBtn setImage:[[UIImage imageNamed:@"beuty1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            cell.biaoJiLabel.hidden =YES;

//            cell.imageView.image = [UIImage imageNamed:@"biaojishouye_ditu"];
//            cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
            cell.biaoShiShortLabel.hidden =NO;
            cell.biaoShiShortLabel.text =@"AFAIFISVS";
            cell.titleMiddleLabel.text =@"获得今日冠军";
            cell.zanRightLabel.text =@"去赞TA";

//            cell.RightImageView.image = [UIImage imageNamed:@"biaojishouye_xiala"];
//          [cell.RightBtn setImage:[[UIImage imageNamed:@"biaojishouye_xiala"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
//            [cell.RightBtn setImage:[[UIImage imageNamed:@"biaojishouye_xiala"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            //这样设置才会放大按钮图片
            [cell.RightBtn setBackgroundImage:[[UIImage imageNamed:@"biaojishouye_xiala"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//            [cell.RightBtn.imageView setContentMode:UIViewContentModeScaleAspectFill];
            
        }else if (indexPath.row==1) {
            cell.biaoShiShortLabel.hidden =YES;
            cell.zanRightLabel.hidden = YES;
            [cell.LeftBtn setImage:[[UIImage imageNamed:@"biaojishouye_fabiaotubiao"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            cell.biaoJiLabel.hidden =NO;
//            cell.imageView.image = [UIImage imageNamed:@"biaojishouye_ditu"];
            cell.biaoJiLabel.text =@"立即创建我的标记";
//            cell.titleMiddleLabel.text =@"获得今日冠军";
            cell.titleMiddleLabel.hidden=YES;
//          [cell.RightBtn setImage:[[UIImage imageNamed:@"biaojishouye_xiala"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
           
//            [cell.RightBtn setBackgroundImage:[[UIImage imageNamed:@"biaojishouye_xiala"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            
//            [cell.RightBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
            [cell.RightBtn setBackgroundImage:[UIImage imageNamed:@"biaojishouye_xiala"] forState:UIControlStateNormal];
        }
        return cell;
        
    }else if (indexPath.section==1) {
        
        DonTaiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DonTaiCellID" forIndexPath:indexPath];
        
        // 2.如果缓存池中没有cell就用BorrowCell创建
        if (!cell) {
            cell = [DonTaiCell DonTaiCell];
        }
        
        
        if (indexPath.row==0) {
            
            [cell.imageButton1 setImage:[[UIImage imageNamed:@"beauty1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            [cell.imageButton2 setImage:[[UIImage imageNamed:@"beauty2"] imageWithRenderingMode:UIImageRenderingModeAutomatic ] forState:UIControlStateNormal];
            [cell.imageButton3 setBackgroundImage:[[UIImage imageNamed:@"beauty3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
//            [cell.imageButton3 setImage:[[UIImage imageNamed:@"beuty1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
//            [cell.imageButton4 setImage:[[UIImage imageNamed:@"biaozu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            [cell.imageButton4 setBackgroundImage:[[UIImage imageNamed:@"beauty4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            
//            當給定一個固定大小的UIButton時，如果圖的大小跟UIButton不同，一種解法是
            
//            UIImage *image = [[UIImage imageNamed:@"biaozu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            UIEdgeInsets edgeInsets = UIEdgeInsetsMake(30.0f, 25.0f, 29.0f, 9.0f);
//            UIImage *resizeableImage = [image resizableImageWithCapInsets:edgeInsets];
//            [cell.imageButton4 setBackgroundImage:resizeableImage forState:UIControlStateNormal];
            
//            [cell.imageButton4 setImage:[[UIImage imageNamed:@"biaozu"] imageWithRenderingMode:UIImageRenderingModeAutomatic ] forState:UIControlStateNormal];
//            [cell.imageButton5 setImage:[[UIImage imageNamed:@"beuty1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            [cell.imageButton5 setBackgroundImage:[[UIImage imageNamed:@"beauty5"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            
        
//            [cell.RightBtn setImage:[[UIImage imageNamed:@"biaojishouye_xiala"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            cell.genXinleBiaoJiLabel.adjustsFontSizeToFitWidth = YES;
            
            //圆角
            cell.imageButton1.layer.cornerRadius = cell.imageButton1.frame.size.width/2;
            cell.imageButton1.layer.masksToBounds = YES;
            
            cell.imageButton2.layer.cornerRadius = cell.imageButton1.frame.size.width/2;
            cell.imageButton2.layer.masksToBounds = YES;
            cell.imageButton3.layer.cornerRadius = cell.imageButton1.frame.size.width/2;
            cell.imageButton3.layer.masksToBounds = YES;
            cell.imageButton4.layer.cornerRadius = cell.imageButton1.frame.size.width/2;
            cell.imageButton4.layer.masksToBounds = YES;
            cell.imageButton5.layer.cornerRadius = cell.imageButton1.frame.size.width/2;
            cell.imageButton5.layer.masksToBounds = YES;
            
            
            
        }else if (indexPath.row==1) {
            
            CGRect frame1= cell.imageButton1.frame;
//            NSLog(@"width是%f",frame1.size.width);
            CGRect frame2= cell.genXinleBiaoJiLabel.frame;
            cell.genXinleBiaoJiLabel.translatesAutoresizingMaskIntoConstraints = YES;
            float x =frame1.origin.x+frame1.size.width+10;
            
            frame2=CGRectMake(x, frame2.origin.y, frame2.size.width, frame2.size.height);
             cell.genXinleBiaoJiLabel.frame = frame2;
           
            cell.imageButton1.translatesAutoresizingMaskIntoConstraints = YES;
            cell.imageButton1.frame=CGRectMake(frame1.origin.x, frame1.origin.y, frame1.size.width, frame1.size.height);

            
            cell.biaoJiDonTaiLabel.text = @"圈子动态";
            cell.genXinleBiaoJiLabel.text = @"好友更新了圈子";
            [cell.imageButton1 setImage:[[UIImage imageNamed:@"beuty1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
           cell.imageButton2.hidden =YES ;
            cell.imageButton3.hidden =YES ;
           cell.imageButton4.hidden =YES ;
            cell.imageButton5.hidden =YES ;
            
//            [cell.RightBtn setImage:[[UIImage imageNamed:@"biaojishouye_xiala"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            
            cell.imageButton1.layer.cornerRadius = cell.imageButton1.frame.size.width/2;
            cell.imageButton1.layer.masksToBounds = YES;
            
        }
        return cell;
        
    }
//    CellModel *model = self.dataArray[indexPath.row];
    
//    cell.model = model;
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
        _tableView.sectionFooterHeight = 38;
//        return 38;
        return 50;
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
        friendHeaderView * headerView = [[friendHeaderView instance]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        return headerView;
    }
    return view;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark 点击按钮响应
-(void)guanzuBtnClicked:(UIButton*)btn{
    guanZuViewController * guanZuViewC = [[guanZuViewController alloc]init];
    [self.navigationController pushViewController:guanZuViewC animated:YES];
    NSLog(@"HOMEPAGEguanzuBtnClicked");
}



-(void)sixinBtnClicked:(UIButton*)btn{
    //隐藏tabbar
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
    SiXinViewController * guanZuViewC = [[SiXinViewController alloc]init];
    [self.navigationController pushViewController:guanZuViewC animated:YES];
    NSLog(@"sixinBtnClicked");
}


#pragma mark 点击头像
-(void)guanzuIconClicked{
//隐藏tabbar
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
    GeRenZhuYeViewController * guanZuViewC = [[GeRenZhuYeViewController alloc]init];
//      UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:guanZuViewC];
    
    [self.navigationController pushViewController:guanZuViewC animated:YES];
//    [self presentViewController:nav animated:YES completion:^{
//        
//    }];
    
//    NSLog(@"HOMEPAGEguanzuBtnClicked");
    
//    EssenceViewController * guanZuViewC = [[EssenceViewController alloc]init];
//    [self.navigationController pushViewController:guanZuViewC animated:YES];
}


-(void)paiHangBanBtnClicked:(BigButtonView *)paiHangBanBtn{
    //    EssenceViewController * guanZuViewC = [[EssenceViewController alloc]init];
    
    PaiHangBanViewController * guanZuViewC = [[PaiHangBanViewController alloc]init];
    
    [self.navigationController pushViewController:guanZuViewC animated:YES];
    NSLog(@"HOMEPAGEquanZiBtnClicked");
    
}


-(void)DiTuLieBiaoBtnClicked:(BigButtonView *)DiTuLieBiaoBtn{
    isPushIngControllerOrNo = YES;
    
//    UIWindow * window = [UIApplication sharedApplication].keyWindow;
//    MyTabBar * ct =(MyTabBar *) window.rootViewController;
//    ct.tabBarView.hidden = YES;
//    [ct.tabBarView removeFromSuperview];
//    self.tabBarController.tabBar.hidden = YES;
//    
//    ct.hidesBottomBarWhenPushed = YES;
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
//    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
    
    DiTuHomeVC * guanZuViewC = [[DiTuHomeVC alloc]init];
    
//    DITuLieBiaoViewController * guanZuViewC = [[DITuLieBiaoViewController alloc]init];
//    self.tabBarController.tabBar.hidden=YES;
//    guanZuViewC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:guanZuViewC animated:YES];
    
    NSLog(@"DiTuLieBiaoBtnClicked");
    
    
}



-(void)quanZiBtnClicked:(BigButtonView *)quanZiBtn{
//    EssenceViewController * guanZuViewC = [[EssenceViewController alloc]init];
    
    QuanZiViewController * guanZuViewC = [[QuanZiViewController alloc]init];
    
    [self.navigationController pushViewController:guanZuViewC animated:YES];
    NSLog(@"HOMEPAGEquanZiBtnClicked");


}

-(void)LeftBackButtonClicked:(UIButton*)btn{
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)rightCameraButtonClicked:(UIButton*)btn{
    
    
}


#pragma mark 下拉菜单
/** 初始化下拉菜单 */
- (void)setupDropDownMenu:(UIBarButtonItem*)btnItem {
    NSArray *modelsArray = [self getMenuModelsArray];
    
//    self.dropdownMenu = [FFDropDownMenuView ff_DefaultStyleDropDownMenuWithMenuModelsArray:modelsArray menuWidth:FFDefaultFloat eachItemHeight:FFDefaultFloat menuRightMargin:FFDefaultFloat triangleRightMargin:FFDefaultFloat];
//    CGRect frame = btnItem.customView.center;
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    view.backgroundColor = [UIColor redColor];
//    btnItem.customView =view;
//    NSLog(@"x坐标是%f",btnItem.customView.center.x);
//    btnItem.customView.center.x:将按钮的中心点坐标作为参数传过去计算,三角形的位置
//    self.dropdownMenu = [FFDropDownMenuView ff_DefaultStyleDropDownMenuWithMenuModelsArray:modelsArray menuWidth:FFDefaultFloat eachItemHeight:FFDefaultFloat menuRightMargin:FFDefaultFloat triangleRightMargin:btnItem.customView.center.x];
    
    //将点击的按钮btnItem传过去,但实际上没有用到.因为frame直接获取不到
    self.dropdownMenu = [FFDropDownMenuView ff_DefaultStyleDropDownMenuWithMenuModelsArray:modelsArray menuWidth:FFDefaultFloat eachItemHeight:FFDefaultFloat menuRightMargin:FFDefaultFloat triangleRightMargin:FFDefaultFloat clickedButtonItem:btnItem];
    self.dropdownMenu.iconLeftMargin = 10;
    self.dropdownMenu.iconRightMargin = 10;
    self.dropdownMenu.triangleY = 55;
    self.dropdownMenu.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    //如果有需要，可以设置代理（非必须）
    self.dropdownMenu.delegate = self;
    
    self.dropdownMenu.ifShouldScroll = NO;
    
    
    [self.dropdownMenu setup];
}



/** 获取菜单模型数组 */
- (NSArray *)getMenuModelsArray {
    __weak typeof(self) weakSelf = self;
    
    //菜单模型0
    FFDropDownMenuModel *menuModel0 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"发表:" menuItemIconName:@"menu2"  menuBlock:^{
    
//        FFMenuViewController *vc = [FFMenuViewController new];
//        vc.backgroundImageName = @"menuBackground";
//        vc.navigationItem.title = @"QQ";
//        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
    //菜单模型1
    FFDropDownMenuModel *menuModel1 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"标记" menuItemIconName:@"biaojishouye_dianji_biaoji" menuBlock:^{
//        FFMenuViewController *vc = [FFMenuViewController new];
//        vc.backgroundImageName = @"menuBackground";
//        vc.navigationItem.title = @"Line";
//        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
    //菜单模型2
    FFDropDownMenuModel *menuModel2 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"圈子" menuItemIconName:@"biaojishouye_dianji_quanz" menuBlock:^{
//        FFMenuViewController *vc = [FFMenuViewController new];
//        vc.backgroundImageName = @"menuBackground";
//        vc.navigationItem.title = @"Twitter";
//        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
    NSArray *menuModelArr = @[menuModel0, menuModel1, menuModel2];
    return menuModelArr;
}

/** 显示下拉菜单 */
- (void)showDropDownMenu {
    [self.dropdownMenu showMenu];
}


//=================================================================
//                      FFDropDownMenuViewDelegate
//=================================================================
#pragma mark - FFDropDownMenuViewDelegate

/** 可以在这个代理方法中稍微小修改cell的样式，比如是否需要下划线之类的 */
/** you can modify menu cell style, Such as if should show underline */
- (void)ffDropDownMenuView:(FFDropDownMenuView *)menuView WillAppearMenuCell:(FFDropDownMenuBasedCell *)menuCell index:(NSInteger)index {
    
    //若果自定义cell的样式，则在这里将  menuCell 转换成你自定义的cell
    FFDropDownMenuCell *cell = (FFDropDownMenuCell *)menuCell;
    
    //如果自定义cell,你可以在这里进行一些小修改，比如是否需要下划线之类的
    //最后一个菜单选项去掉下划线（FFDropDownMenuCell 内部已经做好处理，最后一个是没有下划线的，以下代码只是举个例子）
    if (menuView.menuModelsArray.count - 1 == index) {
        cell.separaterView.hidden = YES;
        cell.customImageView.hidden = NO;
    }else if (0 == index) {

        cell.customTitleLabel.hidden = YES;
        cell.faBiaoLabel.text = @"发表:";
//        cell.faBiaoLabel.textColor  = [UIColor blackColor];
    }
    
    else {
        cell.separaterView.hidden = NO;
           cell.customImageView.hidden = NO;
    }
    
}


















//==================================================================
//   进行基本的设置、搭建出手机QQ首页效果、读者可忽略setupBasedView 中的代码
//   you can ignore below code
//==================================================================


//- (void)setupBasedView {
//    //右侧的菜单按钮
//    UIButton *menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//
//    [menuBtn addTarget:self action:@selector(showDropDownMenu) forControlEvents:UIControlEventTouchUpInside];
//    [menuBtn setImage:[UIImage imageNamed:@"nemuItem"] forState:UIControlStateNormal];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
//    
//    
//    //导航栏的设置
//    
//    //导航栏背景图
//    UIImage *bgImage = [self imageWithColor:[UIColor colorWithRed:25 / 255.0 green:168 / 255.0 blue:243 / 255.0 alpha:1] size:CGSizeMake(1000, 100)];
//    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    
//    //titleView
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"消息", @"电话"]];
//    segmentedControl.frame = CGRectMake(0, 0, 130, 30);
//    segmentedControl.selectedSegmentIndex = 0;
//    segmentedControl.tintColor = [UIColor whiteColor]; //设置选中状态的背景颜色
//    self.navigationItem.titleView = segmentedControl;
//    
//    //左侧的头像
//    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
//    headerImageView.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeaderIcon)];
//    [headerImageView addGestureRecognizer:tapGes];
//    headerImageView.image = [UIImage imageNamed:@"QQIcon"];
//    headerImageView.layer.cornerRadius = headerImageView.frame.size.height * 0.5;//设置圆角--》圆形头像
//    headerImageView.clipsToBounds = YES;//超出控件外的部分进行裁剪
//    UIBarButtonItem *headerIconItem = [[UIBarButtonItem alloc] initWithCustomView:headerImageView];
//    self.navigationItem.leftBarButtonItem = headerIconItem;
//
//}

/** 点击导航栏左边的头像*/
- (void)clickHeaderIcon {
//    NSURL *url = [NSURL URLWithString:@"http://www.jianshu.com/users/80fadb71940d/latest_articles"];
//    [[UIApplication sharedApplication] openURL:url];
}


/**根据颜色返回一张纯色的图片*/
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
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
