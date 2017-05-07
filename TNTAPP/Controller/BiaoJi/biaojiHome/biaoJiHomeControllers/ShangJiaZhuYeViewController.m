//
//  JQScrollViewController.m
//  JQScrollViewDemo
//
//  Created by jianquan on 2016/11/8.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "ShangJiaZhuYeViewController.h"
#import "UIView+Extension.h"
#import "JQHeaderView.h"
#import "SDCycleScrollView.h"
#import "MJRefresh.h"
#import "JQRefreshHeaader.h"
#import "JSDTableViewController.h"
#import "UIButton+Size.h"
#import "geRenHeaderView.h"
#import "ShangJiaHeaderView.h"

#import "buttonView.h"
#import "BtItemTool.h"
#import "BiaoJiGeRenTablewViewController.h"

//#import "QuanziTableViewController.h"
//#import "BiaoJiZaiGeRenTVC.h"
//#import "RenWuZaiBiaoJiVC.h"
//#import "yunDongViewController.h"
//#import "XiangCeViewController.h"
//#import "XiangCeViewController.h"
//#import "guanZuViewController.h"
//#import "xiangCeLieBiaoBieRenVC.h"

#import "DianPuTableViewController.h"
#import "PinJiaTableViewController.h"
#import "ShangJiaRenWuTableViewController.h"

//#define CATEGORY  @[@"推荐",@"原创",@"热门",@"美食",@"生活",@"设计感",@"家居",@"礼物",@"阅读",@"运动健身",@"旅行户外"]
#define CATEGORY  @[@"任务",@"评价",@"店铺"]

#define NAVBARHEIGHT 64.0f

#define FONTMAX 15.0
//#define FONTMIN 14.0
#define FONTMIN 16.0
#define PADDING 15.0


@interface ShangJiaZhuYeViewController ()<UIScrollViewDelegate,JQHeaderViewDelegate,geRenHeaderViewDelegate>

//@property (nonatomic, strong) UITableView *currentTableView;
//
//@property (nonatomic, strong) JQHeaderView *jqHeaderView;
//@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
//@property (nonatomic, strong)geRenHeaderView* headerView;
@property (nonatomic, weak) UITableView *currentTableView;

@property (nonatomic, weak) UICollectionView *CurrentCollectionView;
@property (nonatomic, strong) JQHeaderView *jqHeaderView;
@property (nonatomic, strong) UIView *cycleScrollView;
@property (nonatomic, strong)ShangJiaHeaderView* headerView;

//滑动事件相关
///
//@property (nonatomic, strong) UIScrollView *segmentScrollView;
@property (nonatomic, strong) UIScrollView *segmentScrollView;
//@property (nonatomic, strong) UIImageView *currentSelectedItemImageView;
@property (nonatomic, strong) UIImageView *currentSelectedItemImageView;
//@property (nonatomic, strong) UIScrollView *bottomScrollView;
@property (nonatomic, strong) UIScrollView *bottomScrollView;

//存放button
//@property(nonatomic,strong)NSMutableArray *titleButtons;
@property(nonatomic,strong)NSMutableArray *titleButtons;

//存放控制器
//@property(nonatomic,strong)NSMutableArray *controlleres;
@property(nonatomic,strong)NSMutableArray *controlleres;


//存放TableView
@property(nonatomic,strong)NSMutableArray *tableViews;

//存放TableView
@property(nonatomic,strong)NSMutableArray *jqRefreshHeaders;

//记录上一个偏移量
@property (nonatomic, assign) CGFloat lastTableViewOffsetY;

//下拉刷新动画
@property(nonatomic,strong)JQRefreshHeaader *jqRefreshHeader;



@end


@implementation ShangJiaZhuYeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.automaticallyAdjustsScrollViewInsets = NO;

        self.titleButtons = [[NSMutableArray alloc] initWithCapacity:CATEGORY.count];
        self.controlleres = [[NSMutableArray alloc] initWithCapacity:CATEGORY.count];
        self.tableViews = [[NSMutableArray alloc] initWithCapacity:CATEGORY.count];
        
        [self.view addSubview:self.bottomScrollView];
        
        //顶部搜索栏
//        self.jqHeaderView.tableViews = [NSMutableArray arrayWithArray:self.tableViews];
    
        //滚动图片
        [self.view addSubview:self.cycleScrollView];
        
        
//        [self.view addSubview:self.headerView];


            [_cycleScrollView addSubview:self.headerView];
        
        //向右滑动
//        UISwipeGestureRecognizer *swipeGestureRecognizer=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
//        [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
//        
//        [self.headerView  addGestureRecognizer:swipeGestureRecognizer];
        
        [self.view addSubview:self.segmentScrollView];
        //顶部搜索栏
        [self.view addSubview:self.jqHeaderView];
        
//        [self setupNav];
//        [self addBtn];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    
    //  状态栏设置成不透明
    self.navigationController.navigationBar.translucent = NO;
    
//    [self setupNav];
//    [self addBtn];
    // Do any additional setup after loading the view.
    [self.view bringSubviewToFront:_cycleScrollView];
}


-(void)addBtn{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 300, 80, 80)];
    [btn setTitle:@"yyyyy" forState:UIControlStateNormal];
    [btn setTitle:@"yyyyy" forState:UIControlStateHighlighted];
    
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    //    btn.titleLabel.text = @"yyyyy";
    //    btn.titleLabel.textColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    //    btn ad
}

-(void)btnclicked{
    [self dismissViewControllerAnimated:YES completion:nil];
    //    BViewController *BViewC = [[BViewController alloc]init];
    //    [self presentViewController:BViewC animated:YES completion:nil];
}

/**
 *  设置导航栏
 */

-(void)setupNav{
//    self.view.backgroundColor = TNTCommonBgColor;
     self.view.backgroundColor = [UIColor blackColor];
    //    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(maintagClicked)];
    //    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"quanZiHeader1" highImage:@"quanZiHeader1" target:self action:@selector(maintagClicked)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"]
                      forState:UIControlStateNormal];
    [button addTarget:self action:@selector(maintagClicked)
     forControlEvents:UIControlEventTouchUpInside];
    CGFloat width = 30;
    button.frame = CGRectMake(10, 22, width, width);
    
    //        设置uiview圆角,
    //设置它的圆角大小,半径.(四个角的圆角其实都是四分之一的圆,这个圆的半径就是 cornerRadius,矩形宽度的一半)
    button.layer.cornerRadius = width/2;
    //设置为yes，就可以使用圆角
    button.layer.masksToBounds = YES;
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = menuButton;
    
    //     self.navigationItem.rightBarButtonItem = menuButton;
    
    //    self.navigationItem.title = @"关注";
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"圈子";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
    
    self.navigationItem.titleView = titleLabel;
    
    self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaoji_gerenzhuye_gengdou" highImage:@"biaoji_gerenzhuye_gengdou" target:self action:@selector(showDropDownMenu)];
    
    
}




-(void)viewWillAppear:(BOOL)animated{
    //两个都不能少,否则出现tabbar不能显示却能点击的情况
    self.tabBarController.tabBar.hidden = YES;
    //self.hidesBottomBarWhenPushed =YES;
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
    //这里是为了解决一个奇怪的bug
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

//待push的控制器中只有自己这个控制器时
-(void)viewWillDisappear:(BOOL)animated{
    
    
    self.tabBarController.tabBar.hidden =YES;
    //    NSLog(@"self.tabBarController.tabBar内容是%@",self.tabBarController.tabBar);
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
    //监听collectionview注释掉
//    UITableView *tableView = (UITableView *)object;
//    if (!(self.currentTableView == tableView)) {
//        return;
//    }
    
//        UICollectionView *tableView = (UICollectionView *)object;
//    
//        if (!(self.CurrentCollectionView == tableView)) {
//            return;
//        }
    
    NSInteger index = [self.tableViews indexOfObject:object];
    
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    //1-4个都是加载的tableview
    if (index>=0&& index<4) {
        UITableView *tableView = (UITableView *)object;
        
        CGFloat tableViewoffsetY = tableView.contentOffset.y;
        
        self.lastTableViewOffsetY = tableViewoffsetY;
        
//        if ( tableViewoffsetY>=0 && tableViewoffsetY<=200) {
        if ( tableViewoffsetY>=0 && tableViewoffsetY<=180) {

            
            self.segmentScrollView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, 40);
//            self.segmentScrollView.frame = CGRectMake(0, 264-tableViewoffsetY, SCREEN_WIDTH, 40);
            
            self.cycleScrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 264);
            self.cycleScrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 264);
            
            
        }else if( tableViewoffsetY < 0){
            
            self.segmentScrollView.frame = CGRectMake(0, 244, SCREEN_WIDTH, 40);
            
            self.cycleScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 264);
            
//        }else if (tableViewoffsetY > 200){
                    }else if (tableViewoffsetY > 180){
            
            //让segmentScrollView在当前view的顶部停留.
        self.segmentScrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
            
            //让segmentScrollView跟着tableview一起上滑.
            
//            self.segmentScrollView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, 40);
            
            self.cycleScrollView.frame = CGRectMake(0, -300, SCREEN_WIDTH, 264);
            
            
        }

        
        
    }else if (index==4){
     //第4个加载的是collectionview
//        for (UIView* view in self.view.subviews) {
//            [self.view bringSubviewToFront:view];
//        }
        
        
//        [self.view bringSubviewToFront:_bottomScrollView];
//        [self.view bringSubviewToFront:_cycleScrollView];
//        [self.view bringSubviewToFront:_segmentScrollView];
//        [self.view bringSubviewToFront:_jqHeaderView];
//         [self.view bringSubviewToFront:_currentTableView];
        
        //uicollectionview时不让顶部随着底部一起滚动.
        return;
        
        UICollectionView *tableView = (UICollectionView *)object;
    CGFloat tableViewoffsetY = tableView.contentOffset.y;
    
    self.lastTableViewOffsetY = tableViewoffsetY;

    if ( tableViewoffsetY>=0 && tableViewoffsetY<=200) {

        
        
//         self.cycleScrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 264);
        self.cycleScrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 264);
self.segmentScrollView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, 40);
        
    tableView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    }else if( tableViewoffsetY < 0){

        
        
         self.cycleScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 264);

        self.segmentScrollView.frame = CGRectMake(0, 244, SCREEN_WIDTH, 40);
        
        tableView.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        }else if (tableViewoffsetY > 200){
        
            
            
            self.cycleScrollView.frame = CGRectMake(0, -300, SCREEN_WIDTH, 264);

            //让segmentScrollView跟着tableview一起上滑.
            
            self.segmentScrollView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, 40);

//        tableView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, SCREEN_HEIGHT+136+12.5);
            
//            tableView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, SCREEN_HEIGHT+125);
            tableView.frame = CGRectMake(0, 244-tableViewoffsetY, SCREEN_WIDTH, SCREEN_HEIGHT+126.5);
            
    }
    }
}



#pragma mark -UIScrollViewDelegate
//- (void)scrollViewDidScrolChange:(UIScrollView *)scrollView {

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    scrollView.scrollEnabled = NO;
    if (scrollView !=self.bottomScrollView) {
        return ;
    }
    
    int index =  scrollView.contentOffset.x/scrollView.frame.size.width;
    
    UIButton *currentButton = self.titleButtons[index];
    for (UIButton *button in self.titleButtons) {
        button.selected = NO;
    }
    
    currentButton.selected = YES;
    
//    self.currentTableView  = self.tableViews[index];
    
    if (index!=4) {
        self.currentTableView  = self.tableViews[index];
    }else{
        
        self.CurrentCollectionView = self.tableViews[index];
        
    }
    
    
    
    /*
    for (UITableView *tableView in self.tableViews) {
//        tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44);
        
        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=200){
            
            tableView.contentOffset = CGPointMake(0,  self.lastTableViewOffsetY);
  
        }else if(  self.lastTableViewOffsetY < 0){
            
            tableView.contentOffset = CGPointMake(0, 0);

            }else if ( self.lastTableViewOffsetY > 200){

            tableView.contentOffset = CGPointMake(0, 200 );
                
            }
        
    }
    */
    
    [UIView animateWithDuration:0.3 animations:^{
        if (index == 0) {
            

//             self.currentSelectedItemImageView.frame = CGRectMake(0, self.segmentScrollView.frame.size.height - 2,currentButton.frame.size.width*0.6, 7);

              self.currentSelectedItemImageView.frame = CGRectMake(0, self.segmentScrollView.frame.size.height - 10,currentButton.frame.size.width*0.6, 10);
            
            
        }else{
            
            
            UIButton *preButton = self.titleButtons[index - 1];
            
            float offsetX = CGRectGetMinX(preButton.frame)-PADDING*2;
            
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            

            //标题按钮底部下划线的frame
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*0.6/2, self.segmentScrollView.frame.size.height-2, currentButton.frame.size.width*0.6, 7);
            
            //标题按钮底部下划线的frame
            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*0.6/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*0.6, 10);
            
            
        }
        
    }];
    
    
}


#pragma  mark - 选项卡点击事件

-(void)changeSelectedItem:(UIButton *)currentButton{
    
    for (UIButton *button in self.titleButtons) {
        button.selected = NO;
    }
    currentButton.selected = YES;
    
    NSInteger index = [self.titleButtons indexOfObject:currentButton];
    if (index!=4) {
        self.currentTableView  = self.tableViews[index];
    }else{
    
    self.CurrentCollectionView = self.tableViews[index];
    
    }
    
    /*
    for (UITableView *tableView in self.tableViews) {
    
        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=200) {
            tableView.contentOffset = CGPointMake(0,  self.lastTableViewOffsetY);
            
            
        }else if(self.lastTableViewOffsetY < 0){
            
            tableView.contentOffset = CGPointMake(0, 0);
            
            }else if ( self.lastTableViewOffsetY > 200){
            
    tableView.contentOffset = CGPointMake(0, 200);
                
        }
    }
    */

    for (UICollectionView *tableView in self.tableViews) {
        
//    [self.view bringSubviewToFront:_currentTableView];
//        [self.view sendSubviewToBack:self.view];
        
        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=200) {
            tableView.contentOffset = CGPointMake(0,  self.lastTableViewOffsetY);
            
        }else if(self.lastTableViewOffsetY < 0){
            
            tableView.contentOffset = CGPointMake(0, 0);

        }else if ( self.lastTableViewOffsetY > 200){
            
      tableView.contentOffset = CGPointMake(0, 200);
            
        }
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        //这句代码放前面可以避免与下划线view动画的冲突
        self.bottomScrollView.contentOffset = CGPointMake(SCREEN_WIDTH *index, 0);
        
        if (index == 0) {
            
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*0.6/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*0.6, 10);
//            NSLog(@"currentButton.centerX-currentButton.frame.size.width*0.6/2内容是%f",currentButton.centerX-currentButton.frame.size.width*0.6/2);
            
            {

                NSLog(@"currentButton.centerX内容是%f",currentButton.centerX);
              self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*0.6/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*0.6, 10);
                

                
            }
            
        }else{
            
            
            UIButton *preButton = self.titleButtons[index - 1];
            
            float offsetX = CGRectGetMinX(preButton.frame)-PADDING*2;
            
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            
//            self.currentSelectedItemImageView.frame = CGRectMake(CGRectGetMinX(currentButton.frame), self.segmentScrollView.frame.size.height-2, currentButton.frame.size.width*0.6, 2);
            
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*0.6/2, self.segmentScrollView.frame.size.height-2, currentButton.frame.size.width*0.6, 7);

            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*0.6/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*0.6, 10);
            
        }
//        self.bottomScrollView.contentOffset = CGPointMake(SCREEN_WIDTH *index, 0);
        
    }];
    
}


/*
- (UIScrollView *)bottomScrollView {
    //     return _bottomScrollView;
    
    if (!_bottomScrollView) {
        //        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bottomScrollView.delegate = self;
        _bottomScrollView.pagingEnabled = YES;
        
        
        NSArray *colors = @[[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor],[UIColor purpleColor],[UIColor orangeColor],[UIColor whiteColor],[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor]];
        
        //        for (int i = 0; i<CATEGORY.count; i++) {
        for (int i = 0; i<CATEGORY.count-1; i++) {
            //        for (int i = 0; i<1; i++) {
            
            JSDTableViewController *jsdTableViewController = [[JSDTableViewController alloc] init];
            jsdTableViewController.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            
            jsdTableViewController.view.backgroundColor = colors[i];
            
            [self.bottomScrollView addSubview:jsdTableViewController.view];
            
            [self.controlleres addObject:jsdTableViewController];
            
            [self.tableViews addObject:jsdTableViewController.tableView];
            
            //下拉刷新动画
            //           _jqRefreshHeader  = [[JQRefreshHeaader alloc] initWithFrame:CGRectMake(0, 212, SCREEN_WIDTH, 30)];
            //            _jqRefreshHeader.backgroundColor = [UIColor whiteColor];
            //            _jqRefreshHeader.tableView = jsdTableViewController.tableView;
            //            [jsdTableViewController.tableView.tableHeaderView addSubview:_jqRefreshHeader];
            
            //            jsdTableViewController.tableView.tableHeaderView = _jqRefreshHeader;
            //            [self.jqRefreshHeaders addObject:_jqRefreshHeader];
            
            NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
            [jsdTableViewController.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
            
        }
        
        //试加载自定义的控制器view为第五个view
        {
            BiaoJiGeRenTablewViewController *BiaoJiGeRenTablewVC = [[BiaoJiGeRenTablewViewController alloc] init];
            BiaoJiGeRenTablewVC.view.frame = CGRectMake(SCREEN_WIDTH * 4, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [self.bottomScrollView addSubview:BiaoJiGeRenTablewVC.view];
            
            [self.controlleres addObject:BiaoJiGeRenTablewVC];
            
            [self.tableViews addObject:BiaoJiGeRenTablewVC.tableView];
            
            //
            //        //下拉刷新动画
            //        JQRefreshHeaader *jqRefreshHeader  = [[JQRefreshHeaader alloc] initWithFrame:CGRectMake(0, 212, SCREEN_WIDTH, 30)];
            //        jqRefreshHeader.backgroundColor = [UIColor whiteColor];
            //        jqRefreshHeader.tableView = BiaoJiGeRenTablewVC.tableView;
            //        [BiaoJiGeRenTablewVC.tableView.tableHeaderView addSubview:jqRefreshHeader];
            //
            //
            NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
            [BiaoJiGeRenTablewVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
        }
        
        
        self.currentTableView = self.tableViews[0];
        self.bottomScrollView.contentSize = CGSizeMake(self.controlleres.count * SCREEN_WIDTH, 0);
        
    }
    return _bottomScrollView;
}
*/


#pragma -mark Lazy Load 添加各个tableview

- (UIScrollView *)bottomScrollView {

    
    if (!_bottomScrollView) {
//        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
    _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44)];
        
    _bottomScrollView.delegate = self;
    _bottomScrollView.pagingEnabled = YES;
        
        NSArray *colors = @[[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor]];
        

        for (int i = 0; i<CATEGORY.count; i++) {

//            JSDTableViewController *jsdTableViewController;
//            JSDTableViewController *jsdTableViewController = [[JSDTableViewController alloc] init];
            switch (i) {
                case 0:
                {
                    
    ShangJiaRenWuTableViewController *jsdTableViewController = [[ShangJiaRenWuTableViewController alloc]init];
                    
                    
                    jsdTableViewController.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                    
                    jsdTableViewController.view.backgroundColor = colors[i];
                    
                    [self.bottomScrollView addSubview:jsdTableViewController.view];
                    
                    [self.controlleres addObject:jsdTableViewController];

//                    [self addChildViewController:jsdTableViewController];
                    [self.tableViews addObject:jsdTableViewController.tableView];
                    
                    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
                    [jsdTableViewController.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
                    
                    break;
                }
                case 1:
                {
        PinJiaTableViewController *BiaoJiZaiGeRenvc = [[PinJiaTableViewController alloc]init];
                    
                    BiaoJiZaiGeRenvc.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
                    BiaoJiZaiGeRenvc.view.backgroundColor = colors[i];
        
                    [self.bottomScrollView addSubview:BiaoJiZaiGeRenvc.view];
        
                    [self.controlleres addObject:BiaoJiZaiGeRenvc];
        
                    [self.tableViews addObject:BiaoJiZaiGeRenvc.tableView];
        
                    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
                    [BiaoJiZaiGeRenvc.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
                    
                    break;
                }
                case 2:
                {
                   DianPuTableViewController * jsdTableViewController = [[DianPuTableViewController alloc]init];
                    
//                    jsdTableViewController = [[BiaoJiZaiGeRenTVC alloc]init];
                    
                    jsdTableViewController.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                    
                    jsdTableViewController.view.backgroundColor = colors[i];
                    
                    [self.bottomScrollView addSubview:jsdTableViewController.view];
                    
                    [self.controlleres addObject:jsdTableViewController];
                    
                    [self.tableViews addObject:jsdTableViewController.tableView];
                    
                    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
                    [jsdTableViewController.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
                    
//                     [jsdTableViewController.tableHeaderView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
                    
                    break;
                }
                
                default:
                    break;
            }
            
//            
//            jsdTableViewController.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//            
//            jsdTableViewController.view.backgroundColor = colors[i];
//            
//            [self.bottomScrollView addSubview:jsdTableViewController.view];
//            
//            [self.controlleres addObject:jsdTableViewController];
//            
//            [self.tableViews addObject:jsdTableViewController.tableView];
//            
//            NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
//            [jsdTableViewController.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
            
            
        }
        
       // 试加载自定义的控制器view为第1个view

        
        
        self.currentTableView = self.tableViews[0];
        self.bottomScrollView.contentSize = CGSizeMake(self.controlleres.count * SCREEN_WIDTH, 0);
      
    }
    return _bottomScrollView;
}





- (UIScrollView *)segmentScrollView {
    
    if (!_segmentScrollView) {
        
//        _segmentScrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 40)];
        _segmentScrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 244, SCREEN_WIDTH, 40)];
        
        [_segmentScrollView addSubview:self.currentSelectedItemImageView];
        _segmentScrollView.showsHorizontalScrollIndicator = NO;
        _segmentScrollView.showsVerticalScrollIndicator = NO;
//        _segmentScrollView.backgroundColor = [UIColor whiteColor];
        
 _segmentScrollView.backgroundColor = [UIColor colorWithRed:61/255.0f green:64/255.0f blue:68/255.0f alpha:1.0];
        
        NSInteger btnoffset = 0;
        
        for (int i = 0; i<CATEGORY.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:CATEGORY[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//            btn.titleLabel.font = [UIFont systemFontOfSize:FONTMIN];
            
            btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:FONTMIN];//加粗
            
//            CGSize size = [UIButton sizeOfLabelWithCustomMaxWidth:SCREEN_WIDTH systemFontSize:FONTMIN andFilledTextString:CATEGORY[i]];
//            CATEGORY.count*2 间距的个数
            CGSize size = CGSizeMake((SCREEN_WIDTH-CATEGORY.count*2*PADDING) /CATEGORY.count, 30);
            
            
            float originX =  i? PADDING*2+btnoffset:PADDING;
            
//          btn.frame = CGRectMake(originX, 14, size.width, size.height);
            btn.frame = CGRectMake(originX, 5, size.width, size.height);
            btnoffset = CGRectGetMaxX(btn.frame);
            
            
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            [btn addTarget:self action:@selector(changeSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
            [_segmentScrollView addSubview:btn];
            
            [self.titleButtons addObject:btn];
            
            //contentSize 等于按钮长度叠加
            //默认选中第一个按钮
            if (i == 0) {
                
                btn.selected = YES;

//                _currentSelectedItemImageView.frame = CGRectMake(0, self.segmentScrollView.frame.size.height - 10, btn.frame.size.width*0.6, 10);
                
                self.currentSelectedItemImageView.frame = CGRectMake(btn.centerX-btn.frame.size.width*0.6/2, self.segmentScrollView.frame.size.height-10, btn.frame.size.width*0.6, 10);
//                _currentSelectedItemImageView.frame = CGRectMake(0, self.segmentScrollView.frame.size.height - 2, btn.frame.size.width*0.6, 2);
            }
        }
        
        _segmentScrollView.contentSize = CGSizeMake(btnoffset+PADDING, 25);
    }
    
    return _segmentScrollView;
}

- (UIImageView *)currentSelectedItemImageView {
    if (!_currentSelectedItemImageView) {
        
        _currentSelectedItemImageView = [[UIImageView alloc] init];
//        _currentSelectedItemImageView.backgroundColor = [UIColor colorWithRed:252/255.0f green:185/255.0f blue:44/255.0f alpha:1.0];

//        _currentSelectedItemImageView.image = [UIImage imageNamed:@"buttonTitleIcon"];
        _currentSelectedItemImageView.image = [UIImage imageNamed:@"ybiaoji_gerenzhuye_uanzhonghuangtai"];
        
//        _currentSelectedItemImageView.backgroundColor = [UIColor clearColor];
    }
    return _currentSelectedItemImageView;
}

#pragma mark 作为添加headerview为子控件的父控件
- (UIView *)cycleScrollView {
    
    if (!_cycleScrollView) {
        
        NSMutableArray *imageMutableArray = [NSMutableArray array];
//        for (int i = 1; i<9; i++) {
//            NSString *imageName = [NSString stringWithFormat:@"cycle_%02d.jpg",i];
//            [imageMutableArray addObject:imageName];
//        }
        
//        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) imageNamesGroup:imageMutableArray];
//        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 264) imageNamesGroup:imageMutableArray];
        
//         _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 244) imageNamesGroup:imageMutableArray];
        _cycleScrollView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 244)];
        
//                              cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 244) imageNamesGroup:imageMutableArray];
        
        _cycleScrollView.backgroundColor = [UIColor blackColor];
        
//        _cycleScrollView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];
    
    }
    _cycleScrollView.userInteractionEnabled = YES;
    return _cycleScrollView;
}


-(ShangJiaHeaderView*)headerView{

//    _headerView = [[geRenHeaderView instance]initWithFrame:CGRectMake
//                   (0, 0, SCREEN_WIDTH, 264)];
    
//    _headerView = [[geRenHeaderView instance]initWithFrame:CGRectMake
//                   (0, 0, SCREEN_WIDTH, 264)];
    
    _headerView = [[ShangJiaHeaderView instance]initWithFrame:CGRectMake
                   (0, 0, SCREEN_WIDTH, 244)];
//    _headerView.delegate =self;
//    [_headerView.guanZhuBtn.button setBackgroundImage:[UIImage imageNamed:@"biaoji_gerenzhuye_guanzhu"] forState:UIControlStateNormal];
    NSLog(@"_headerView宽度11是%f",_headerView.frame.size.width);
    _headerView.frame =CGRectMake
    (0, 0, SCREEN_WIDTH, 244);
    
    NSLog(@"SCREEN_WIDTH内容是%f",SCREEN_WIDTH);
_headerView.JinDianKanKanView.textlabel.text=@"个人主页";
    _headerView.backgroundColor = [UIColor blackColor];
    _headerView.userInteractionEnabled = YES;
    
    
    
   _headerView.foodTextLabel.layer.cornerRadius = 3;
    
    //设置为yes，就可以使用圆角
    _headerView.foodTextLabel.layer.masksToBounds = YES;
    
    
    _headerView.siXinBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SiXinBtnClicked:)];
    [_headerView.siXinBtn.view  addGestureRecognizer:singleTap1];
    
    _headerView.guanZhuBtn.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuBtnClicked)];
    [_headerView.guanZhuBtn.view addGestureRecognizer:singleTap2];
    
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 120, 44)];
//    [btn setTitle:@"rightrightright" forState:UIControlStateNormal];
    
//    [btn setTitle:@"yyyyyyyyy" forState:UIControlStateHighlighted];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [_headerView addSubview:btn];
    
    return _headerView;
    

}

////相册控制器代理方法
//-(void)ZhuYePushController:(UIViewController *)ViewC{
//    
//    xiangCeLieBiaoBieRenVC *guanZuVC = [[xiangCeLieBiaoBieRenVC alloc]init];
//    
//    [self presentViewController:guanZuVC animated:YES completion:^{
//       
//            }];
//}




#pragma mark headerviewDelegate


-(void)guanzuBtnClicked{
    
    
}
-(void)SiXinBtnClicked:(UIButton *)btn{

//    guanZuViewController *guanZuVC = [[guanZuViewController alloc]init];

//    
//    [self presentViewController:guanZuVC animated:YES completion:^{
//        
//    }];
    

}




- (JQHeaderView *)jqHeaderView {
    
    if (!_jqHeaderView) {
        
        _jqHeaderView = [[JQHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _jqHeaderView.backgroundColor = [UIColor clearColor];
        _jqHeaderView.delegate=self;
        
        [_jqHeaderView.searchButton setImage:[[UIImage imageNamed:@"biaojishouye_fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
        
        _jqHeaderView.titleLabel.text = @"Silvia";
        
        [_jqHeaderView.emailButton setImage:[[UIImage imageNamed:@"biaoji_guanzhu_gengduo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
        //设置背景色,否则会只有一半高度是黑色
        _jqHeaderView.backgroundColor = [UIColor blackColor];
        
    }
    return _jqHeaderView;
}

//headview的push控制器代理方法
-(void)pushController{

//    guanZuViewController *guanZuVC = [[guanZuViewController alloc]init];
    
//        [self presentViewController:guanZuVC animated:YES completion:^{
//    
//        }];

}

-(void)leftButtonClicked:(UIButton *)leftBtn{
//    [_jqHeaderView removeFromSuperview];
//    self.cycleScrollView.delegate = nil;
//    _jqHeaderView.delegate=nil;
//    [self.navigationController popViewControllerAnimated:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
    return;
   
//    [self dismissViewControllerAnimated:YES completion:nil];
//    NSLog(@"leftButtonClicked");
    

}


-(void)rightButtonClicked:(UIButton *)rightBtn{

    NSLog(@"rightButtonClicked");
    
}


-(void)dealloc{
    
//    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
//    [BiaoJiGeRenTablewVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//    self.controlleres = nil;
    for (JSDTableViewController *viewC in self.controlleres) {
//    for (JSDTableViewController *viewC in self.childViewControllers){
    
        NSLog(@"string内容是%@", NSStringFromClass([viewC class]));
        if (![NSStringFromClass([viewC class]) isEqualToString:@"XiangCeViewController"]) {
           
            [viewC.tableView removeObserver:self forKeyPath:@"contentOffset" context:nil];
            
        }
        
    }
    
    
//    for (XiangCeViewController *viewC in self.controlleres) {
////       for (tbCollectionViewController *viewC in self.childViewControllers) {
//    
//        if ([NSStringFromClass([viewC class]) isEqualToString:@"XiangCeViewController"]) {
//            
//            [viewC.collectionView removeObserver:self forKeyPath:@"contentOffset" context:nil];
//            
//        }
//        
//    }
    
    
//    for (JQRefreshHeaader * refreshH in self.jqRefreshHeaders) {
// 
//        
//        [refreshH removeObserver:self forKeyPath:@"contentOffset" context:nil];
//
//    }
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
//    for (BiaoJiGeRenTablewViewController *viewC in self.controlleres) {
//        [viewC.tableView removeObserver:self forKeyPath:@"contentOffset"];
//    }
    
//    self removeObserver:<#(nonnull NSObject *)#> forKeyPath:<#(nonnull NSString *)#>
//[BiaoJiGeRenTablewVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];

}

@end
