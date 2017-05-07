//
//  BiaoJiViewController.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/6.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "DITuLieBiaoViewController.h"
#import "BtItemTool.h"

#import "guanZuTwoLabelView.h"
//#import "GeRenGuanZuTableViewCell.h"
#import "DiTuLieBiaoTableViewCell.h"
#import "DiTuTanChuanViewController.h"


@interface DITuLieBiaoViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *topView;


@property (weak, nonatomic) IBOutlet guanZuTwoLabelView *guanZuWoDeView;

@property (weak, nonatomic) IBOutlet guanZuTwoLabelView *woGuanZuDeView;

@property(nonatomic,weak)UIImageView *sanJiaoXinImageView;

@end

@implementation DITuLieBiaoViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
//    [self load];
    
    
//    BTButton * btn1 = [[BTButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:btn1];
    
//    [self setupTopView];
    [self setUpTableView];
 
    self.navigationController.navigationBarHidden=NO;   
    
    
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
    UINib *cellNib = [UINib nibWithNibName:@"DiTuLieBiaoTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"DiTuLieBiaoCellID"];
    
//    UINib *DonTaiCellNib = [UINib nibWithNibName:@"DonTaiCell" bundle:nil];
//    [self.tableView registerNib:DonTaiCellNib forCellReuseIdentifier:@"DonTaiCellID"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f];
    _tableView.scrollEnabled =YES;
    
    
    //设置导航栏标题
//    self.navigationItem.title = @"标记";
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"列表";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
//    NSLog(@"",self.navigationItem.title);
    
    self.navigationItem.titleView = titleLabel;
//    self.view.backgroundColor = [UIColor grayColor];

    self.navigationItem.leftBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fanhui" highImage:@"biaojishouye_fanhui" target:self action:@selector(LeftBackButtonClicked:)];
    
    
    
    self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fabiao" highImage:@"biaojishouye_fabiao" target:self action:@selector(rightCameraButtonClicked:)];

//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f]];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor grayColor];
//  状态栏设置成不透明
  self.navigationController.navigationBar.translucent = NO;
    
//    _topView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];
    
   
    
//    去掉UINavigationBar底部的分割线
    
    //导航栏背景透明
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    
//    //导航栏底部线清楚
//
//    self.navigationController.navigationBar.translucent = YES;
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
}









-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//self.extendedLayoutIncludesOpaqueBars=YES;
//    self.navigationController.navigationBar.translucent=NO;

}


-(void)viewWillDisappear:(BOOL)animated{

    self.tabBarController.tabBar.hidden =YES;
//    NSLog(@"self.tabBarController.tabBar内容是%@",self.tabBarController.tabBar);
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
    
}

-(void)viewDidAppear:(BOOL)animated{


}


-(void)setupTopView{
//    _topView
    _woGuanZuDeView.backgroundColor = [UIColor clearColor];
    _woGuanZuDeView.topLabel.text= @"我关注的";
    _woGuanZuDeView.topLabel.textAlignment = NSTextAlignmentCenter;
    _woGuanZuDeView.topLabel.font = [UIFont systemFontOfSize:14];
    _woGuanZuDeView.topLabel.textColor = [UIColor whiteColor];
    
    _woGuanZuDeView.DownLabel.text= @"340";
    _woGuanZuDeView.DownLabel.textAlignment = NSTextAlignmentCenter;
    _woGuanZuDeView.DownLabel.font = [UIFont systemFontOfSize:17];
    _woGuanZuDeView.DownLabel.textColor = [UIColor colorWithRed:0 green:255.0/255.0 blue:254.0/255.0 alpha:1];
    
    _woGuanZuDeView.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(woGuanZuDeViewClicked:)];
    [_woGuanZuDeView addGestureRecognizer:singleTap1];
    
    
    _guanZuWoDeView.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanZuWoDeViewClicked:)];
    [_guanZuWoDeView addGestureRecognizer:singleTap2];
    
    _guanZuWoDeView.backgroundColor = [UIColor clearColor];
    _guanZuWoDeView.topLabel.text= @"关注我的";
    _guanZuWoDeView.topLabel.font = [UIFont systemFontOfSize:14];
    _guanZuWoDeView.topLabel.textColor = [UIColor whiteColor];
    _guanZuWoDeView.DownLabel.text= @"346";
    _guanZuWoDeView.DownLabel.font = [UIFont systemFontOfSize:17];
    _guanZuWoDeView.DownLabel.textColor = [UIColor colorWithRed:0 green:255.0/255.0 blue:254.0/255.0 alpha:1];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(_guanZuWoDeView.frame.origin.x+_guanZuWoDeView.frame.size.width/2-10, _guanZuWoDeView.frame.size.height-10, 20, 10)];
    imageView.image = [UIImage imageNamed:@"biaoji_guanzhu_xuanzhongzhuangtai"];
    _sanJiaoXinImageView = imageView;
    [_topView addSubview:imageView];
    
}

-(void)woGuanZuDeViewClicked:(guanZuTwoLabelView*)guanZuTwoLabelView{

    NSLog(@"woGuanZuDeViewClicked");
    
    [UIView animateWithDuration:0.3 animations:^{
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/5, 2);
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/3, 2);
        _sanJiaoXinImageView.frame = CGRectMake(_woGuanZuDeView.frame.origin.x+_guanZuWoDeView.frame.size.width/2-10, _woGuanZuDeView.frame.size.height-10, 20, 10);
        
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 5, 0);
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 3, 0);
        
    }];

    
}

-(void)guanZuWoDeViewClicked:(guanZuTwoLabelView*)guanZuTwoLabelView{

    NSLog(@"guanZuWoDeViewClicked");
    
    
    [UIView animateWithDuration:0.3 animations:^{
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/5, 2);
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/3, 2);
        _sanJiaoXinImageView.frame = CGRectMake(_guanZuWoDeView.frame.origin.x+_guanZuWoDeView.frame.size.width/2-10, _guanZuWoDeView.frame.size.height-10, 20, 10);
        
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 5, 0);
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 3, 0);
        
    }];

}


-(void)setUpTableView{
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    tableView.scrollEnabled
    return 30;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.section==0) {
        
        DiTuLieBiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiTuLieBiaoCellID" forIndexPath:indexPath];
        
        // 2.如果缓存池中没有cell就用BorrowCell创建
        if (!cell) {
            cell = [DiTuLieBiaoTableViewCell returnCell];
        }
        

        //        if (indexPath.row==0) {
        //圆角
//        cell.guanzuIcon.layer.cornerRadius = cell.guanzuIcon.frame.size.width/2;
//        cell.guanzuIcon.layer.masksToBounds = YES;
//        
//        [cell.guanzuIcon setImage:[[UIImage imageNamed:@"beauty4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
//        cell.nameLabel.text = @"yyy";
//        cell.genXinQianMInLabel.text = @"你在干嘛呢";
        //            cell.imageView.image = [UIImage imageNamed:@"biaojishouye_ditu"];
        //            cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //            cell.biaoShiShortLabel.hidden =NO;
        //            cell.biaoShiShortLabel.text =@"AFAIFISVS";
        //            cell.titleMiddleLabel.text =@"获得今日冠军";
        //            cell.zanRightLabel.text =@"去赞TA";
        
        //这样设置才会放大按钮图片
//        [cell.guanzuBtn setBackgroundImage:[[UIImage imageNamed:@"biaoji_guanzhu_guanzhu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
        //        }else if (indexPath.row==1) {
        //
        //
        //        }
        return cell;
        
    }
    
    UITableViewCell * cell;
    return cell;

    
}


/*
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
//        _tableView.sectionFooterHeight = 10;
        _tableView.sectionFooterHeight = 0;
        return 0.0001;
    }else if (section==1) {
        return 40;
    }
    return 0.0001;
}

*/

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    _tableView.sectionFooterHeight = 0.0001;
//    _tableView.sectionFooterHeight = 100;
//    260
    return 260;
//    if (indexPath.section==0) {
////        _tableView.sectionFooterHeight = 0.0001;
////        return 38;
//        return 80;
//    }else if (indexPath.section==1) {
//        return 118;
//    }
//    return 0.0001;

}


/*
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
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DiTuTanChuanViewController *DiTuTanChuanVC= [[DiTuTanChuanViewController alloc]init];
    [self.navigationController pushViewController:DiTuTanChuanVC animated:YES];
    
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
