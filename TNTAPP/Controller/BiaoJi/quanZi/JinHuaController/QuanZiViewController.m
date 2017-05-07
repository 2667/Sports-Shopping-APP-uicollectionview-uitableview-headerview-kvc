//
//  JQScrollViewController.m
//  JQScrollViewDemo
//
//  Created by jianquan on 2016/11/8.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "QuanZiViewController.h"
#import "UIView+Extension.h"
#import "JQHeaderView.h"
#import "SDCycleScrollView.h"
#import "MJRefresh.h"
#import "JQRefreshHeaader.h"
#import "JSDTableViewController.h"
#import "UIButton+Size.h"
#import "geRenHeaderView.h"
#import "buttonView.h"
#import "BtItemTool.h"
#import "BiaoJiGeRenTablewViewController.h"


#import "BTRecommendTagViewController.h"
#import "BTTitleButton.h"
#import "BTAllViewController.h"
#import "BTVideoViewController.h"
#import "BTVoiceViewController.h"
#import "BTPictureViewController.h"
#import "BTWordViewController.h"

#import "FriendViewController.h"
#import "NearbyViewController.h"
//#import "BtItemTool.h"

//#define CATEGORY  @[@"推荐",@"原创",@"热门",@"美食",@"生活",@"设计感",@"家居",@"礼物",@"阅读",@"运动健身",@"旅行户外"]
#define CATEGORY  @[@"附近",@"全部",@"好友"]

#define NAVBARHEIGHT 64.0f

#define FONTMAX 15.0
//#define FONTMIN 14.0
#define FONTMIN 16.0
#define PADDING 15.0


@interface QuanZiViewController ()<UIScrollViewDelegate,JQHeaderViewDelegate>

//@property (nonatomic, strong) UITableView *currentTableView;
//
//@property (nonatomic, strong) JQHeaderView *jqHeaderView;
//@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
//@property (nonatomic, strong)geRenHeaderView* headerView;
@property (nonatomic, weak) UITableView *currentTableView;

@property (nonatomic, strong) JQHeaderView *jqHeaderView;
@property (nonatomic, weak) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong)geRenHeaderView* headerView;

///
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

CGFloat titleBtnBottomImageViewWidth = 0.8;

@implementation QuanZiViewController



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
    
//        [self.view addSubview:self.cycleScrollView];
        
//        [self.cycleScrollView addSubview:self.headerView];
//        [_cycleScrollView addSubview:self.headerView];
        
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
    

    self.view.backgroundColor = [UIColor clearColor];
//    [self setupNav];
//    [self addBtn];
    // Do any additional setup after loading the view.
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
     self.view.backgroundColor = [UIColor redColor];
    //    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(maintagClicked)];
    //    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"quanZiHeader1" highImage:@"quanZiHeader1" target:self action:@selector(maintagClicked)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"biaojishouye_fanhui"]
                      forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftButtonClicked:)
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
    
    self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fabiao" highImage:@"biaojishouye_fabiao" target:self action:@selector(rightButtonClicked:)];
    
    
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    self.navigationController.navigationBar.hidden = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
   
    UITableView *tableView = (UITableView *)object;
    
    
    if (!(self.currentTableView == tableView)) {
        return;
    }
    
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    
    CGFloat tableViewoffsetY = tableView.contentOffset.y;
    
    self.lastTableViewOffsetY = tableViewoffsetY;

//    if ( tableViewoffsetY>=0 && tableViewoffsetY<=200) {
    
    /*
    if ( tableViewoffsetY>=0 && tableViewoffsetY<=0) {
 
//         self.segmentScrollView.frame = CGRectMake(0, 264-tableViewoffsetY, SCREEN_WIDTH, 40);
//        
//
//         self.cycleScrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 264);
        
        self.segmentScrollView.frame = CGRectMake(0, 64-tableViewoffsetY, SCREEN_WIDTH, 40);
        
        
//        self.cycleScrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 64);
        
    }else
      */
        if( tableViewoffsetY < 0){
        

        
//        self.segmentScrollView.frame = CGRectMake(0, 264, SCREEN_WIDTH, 40);
        
        self.segmentScrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
        
//         self.cycleScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 264);
//        self.segmentScrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
        
//        self.cycleScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 264);
            
        self.bottomScrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
            
//            _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];

//        }else if (tableViewoffsetY > 200){
        }else if (tableViewoffsetY > 0){
        
            //让segmentScrollView在当前view的顶部停留.
//        self.segmentScrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
            //让segmentScrollView跟着tableview一起上滑.
//             self.segmentScrollView.frame = CGRectMake(0, 264-tableViewoffsetY, SCREEN_WIDTH, 40);
            
            self.segmentScrollView.frame = CGRectMake(0, 64-tableViewoffsetY, SCREEN_WIDTH, 40);
//            self.currentTableView.tableHeaderView.frame =  CGRectMake(0, 64-tableViewoffsetY, SCREEN_WIDTH, 0);
            
//            for (UIView *view in self.bottomScrollView.subviews) {
//                view.frame = CGRectMake(0, -tableViewoffsetY, SCREEN_WIDTH, SCREEN_HEIGHT);
//            }
            
//             self.bottomScrollView.subviews[0].frame = CGRectMake(0, 64-tableViewoffsetY, SCREEN_WIDTH, 0);
            
//            self.bottomScrollView.frame = CGRectMake(0, 64-tableViewoffsetY, SCREEN_WIDTH, self.bottomScrollView.frame.size.height);
            
//        self.cycleScrollView.frame = CGRectMake(0, -200, SCREEN_WIDTH, 264);

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
    
    
    self.currentTableView  = self.tableViews[index];
    
    
    for (UITableView *tableView in self.tableViews) {
        
//        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=200){
        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=64){
            
            tableView.contentOffset = CGPointMake(0,  self.lastTableViewOffsetY);
            
        }else if(  self.lastTableViewOffsetY < 0){
            
            tableView.contentOffset = CGPointMake(0, 0);

//            }else if ( self.lastTableViewOffsetY > 200){
        }else if ( self.lastTableViewOffsetY > 64){

            


//            tableView.contentOffset = CGPointMake(0, 200 );
            tableView.contentOffset = CGPointMake(0, 64 );
            }
        
    }
    
    
    /*
    [UIView animateWithDuration:0.3 animations:^{
        if (index == 0) {
            

//             self.currentSelectedItemImageView.frame = CGRectMake(0, self.segmentScrollView.frame.size.height - 2,currentButton.frame.size.width*titleBtnBottomImageViewWidth, 7);

//            currentButton.centerX-titleBtnBottomImageViewWidth/2
              self.currentSelectedItemImageView.frame = CGRectMake(20, self.segmentScrollView.frame.size.height - 10,currentButton.frame.size.width*titleBtnBottomImageViewWidth, 10);
            
            
        }else{
            
            
            UIButton *preButton = self.titleButtons[index - 1];
            
            float offsetX = CGRectGetMinX(preButton.frame)-PADDING*2;
            
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            

            //标题按钮底部下划线的frame
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height-2, currentButton.frame.size.width*titleBtnBottomImageViewWidth, 7);
            
// 标题按钮底部下划线的frame
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*titleBtnBottomImageViewWidth, 10);
     
    self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*titleBtnBottomImageViewWidth, 10);
     
            
        }
        
    }];
    */
    
}


#pragma  mark - 选项卡点击事件

-(void)changeSelectedItem:(UIButton *)currentButton{
    
    for (UIButton *button in self.titleButtons) {
        button.selected = NO;
    }
    currentButton.selected = YES;
    
    NSInteger index = [self.titleButtons indexOfObject:currentButton];
    
    self.currentTableView  = self.tableViews[index];
    for (UITableView *tableView in self.tableViews) {
        
        // if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=136) {
        
//        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=200) {
        
        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=0){
            
            tableView.contentOffset = CGPointMake(0,  self.lastTableViewOffsetY);
            
        }else if(self.lastTableViewOffsetY < 0){
            
            tableView.contentOffset = CGPointMake(0, 0);
            
            //        }else if ( self.lastTableViewOffsetY > 136){
        }else if ( self.lastTableViewOffsetY > 0){
            
            //  tableView.contentOffset = CGPointMake(0, 136);
            tableView.contentOffset = CGPointMake(0, 0);
            
        }
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        
        if (index == 0) {
            
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height - 10,currentButton.frame.size.width*titleBtnBottomImageViewWidth, 10);
            
            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height - 3,currentButton.frame.size.width*titleBtnBottomImageViewWidth, 3);
            
        }else{
            
            
            UIButton *preButton = self.titleButtons[index - 1];
            
            float offsetX = CGRectGetMinX(preButton.frame)-PADDING*2;
            
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*titleBtnBottomImageViewWidth, 10);
            
//            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height-10, currentButton.frame.size.width*titleBtnBottomImageViewWidth, 10);
            
            self.currentSelectedItemImageView.frame = CGRectMake(currentButton.centerX-currentButton.frame.size.width*titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height-3, currentButton.frame.size.width*titleBtnBottomImageViewWidth, 3);
            
        }
        self.bottomScrollView.contentOffset = CGPointMake(SCREEN_WIDTH *index, 0);
        
    }];
}


#pragma -mark Lazy Load

- (UIScrollView *)bottomScrollView {
//     return _bottomScrollView;
    
    if (!_bottomScrollView) {
//        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
//        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 106, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
        //背景色
        _bottomScrollView.backgroundColor = [UIColor clearColor];
        
        _bottomScrollView.delegate = self;
        _bottomScrollView.pagingEnabled = YES;
       
        
        NSArray *colors = @[[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor],[UIColor purpleColor],[UIColor orangeColor],[UIColor whiteColor],[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor]];
        
        
        for (int i = 0; i<CATEGORY.count; i++) {
//        for (int i = 0; i<1; i++) {
            
            NearbyViewController *jsdTableViewController = [[NearbyViewController alloc] init];
//            jsdTableViewController.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            jsdTableViewController.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            
//  jsdTableViewController.view.backgroundColor = colors[i];
            jsdTableViewController.view.backgroundColor = [UIColor clearColor];
            
            [self.bottomScrollView addSubview:jsdTableViewController.view];
            
            [self.controlleres addObject:jsdTableViewController];
            //背景色
//            jsdTableViewController.tableView.backgroundColor = [UIColor grayColor];
            
            jsdTableViewController.tableView.backgroundColor = [UIColor colorWithRed:228/255.0f green:228/255.0f blue:228/255.0f alpha:1.0];
            
            [self.tableViews addObject:jsdTableViewController.tableView];
            
            
//            NearbyViewController* nearbyVC= [[NearbyViewController alloc]init];
//            nearbyVC.title =@"附近";
//            [self addChildViewController:nearbyVC];
            
            
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
//        {
//        BiaoJiGeRenTablewViewController *BiaoJiGeRenTablewVC = [[BiaoJiGeRenTablewViewController alloc] init];
//        BiaoJiGeRenTablewVC.view.frame = CGRectMake(SCREEN_WIDTH * 4, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        [self.bottomScrollView addSubview:BiaoJiGeRenTablewVC.view];
//
//        [self.controlleres addObject:BiaoJiGeRenTablewVC];
//
//        [self.tableViews addObject:BiaoJiGeRenTablewVC.tableView];
//
//
//        //下拉刷新动画
//        JQRefreshHeaader *jqRefreshHeader  = [[JQRefreshHeaader alloc] initWithFrame:CGRectMake(0, 212, SCREEN_WIDTH, 30)];
//        jqRefreshHeader.backgroundColor = [UIColor whiteColor];
//        jqRefreshHeader.tableView = BiaoJiGeRenTablewVC.tableView;
//        [BiaoJiGeRenTablewVC.tableView.tableHeaderView addSubview:jqRefreshHeader];
//
//
//        NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
//        [BiaoJiGeRenTablewVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//    }
        
        
        self.currentTableView = self.tableViews[0];
        self.bottomScrollView.contentSize = CGSizeMake(self.controlleres.count * SCREEN_WIDTH, 0);
      
    }
    return _bottomScrollView;
}

- (UIScrollView *)segmentScrollView {
    
    if (!_segmentScrollView) {
        
//        _segmentScrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 40)];
//        _segmentScrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 264, SCREEN_WIDTH, 40)];
        
        _segmentScrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        
        [_segmentScrollView addSubview:self.currentSelectedItemImageView];
        _segmentScrollView.showsHorizontalScrollIndicator = NO;
        _segmentScrollView.showsVerticalScrollIndicator = NO;
//        _segmentScrollView.backgroundColor = [UIColor whiteColor];
        
// _segmentScrollView.backgroundColor = [UIColor colorWithRed:61/255.0f green:64/255.0f blue:68/255.0f alpha:1.0];
        _segmentScrollView.backgroundColor= [UIColor whiteColor];
        
        NSInteger btnoffset = 0;
        
        for (int i = 0; i<CATEGORY.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:CATEGORY[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            
            UIColor *textColor = [UIColor colorWithRed:252/255.0f green:185/255.0f blue:44/255.0f alpha:1.0];
            
            [btn setTitleColor:textColor forState:UIControlStateSelected];
//            btn.titleLabel.font = [UIFont systemFontOfSize:FONTMIN];
            
            btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:FONTMIN];//加粗
            
//            CGSize size = [UIButton sizeOfLabelWithCustomMaxWidth:SCREEN_WIDTH systemFontSize:FONTMIN andFilledTextString:CATEGORY[i]];
            
//            CGSize size = CGSizeMake((SCREEN_WIDTH-10*PADDING) /CATEGORY.count, 30);
            
             CGSize size = CGSizeMake((SCREEN_WIDTH-6*PADDING) /CATEGORY.count, 30);
            
            
            float originX =  i? PADDING*2+btnoffset:PADDING;
            
//            btn.frame = CGRectMake(originX, 14, size.width, size.height);
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
//                _currentSelectedItemImageView.frame = CGRectMake(PADDING, self.segmentScrollView.frame.size.height - 2, btn.frame.size.width, 2);
//  加长

//                _currentSelectedItemImageView.frame = CGRectMake(btn.centerX-btn.frame.size.width*titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height - 10, btn.frame.size.width*titleBtnBottomImageViewWidth, 10);
                
                _currentSelectedItemImageView.frame = CGRectMake(btn.centerX-btn.frame.size.width*titleBtnBottomImageViewWidth/2, self.segmentScrollView.frame.size.height - 3, btn.frame.size.width*titleBtnBottomImageViewWidth, 3);

            }
        }
        
        _segmentScrollView.contentSize = CGSizeMake(btnoffset+PADDING, 25);
    }
    
    return _segmentScrollView;
}

- (UIImageView *)currentSelectedItemImageView {
    if (!_currentSelectedItemImageView) {
        
        _currentSelectedItemImageView = [[UIImageView alloc] init];
        _currentSelectedItemImageView.backgroundColor = [UIColor colorWithRed:252/255.0f green:185/255.0f blue:44/255.0f alpha:1.0];
//        _currentSelectedItemImageView.image = [UIImage imageNamed:@"nar_bgbg"];
//        _currentSelectedItemImageView.image = [UIImage imageNamed:@"buttonTitleIcon"];
    }
    return _currentSelectedItemImageView;
}


- (SDCycleScrollView *)cycleScrollView {
    
    if (!_cycleScrollView) {
        
        NSMutableArray *imageMutableArray = [NSMutableArray array];
//        for (int i = 1; i<9; i++) {
//            NSString *imageName = [NSString stringWithFormat:@"cycle_%02d.jpg",i];
//            [imageMutableArray addObject:imageName];
//        }
        
//        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) imageNamesGroup:imageMutableArray];
        
//        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 264) imageNamesGroup:imageMutableArray];
        
    
    }
    return _cycleScrollView;
}


-(geRenHeaderView*)headerView{

    _headerView = [[geRenHeaderView instance]initWithFrame:CGRectMake
                   (0, 0, SCREEN_WIDTH, 264)];
    _headerView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];
    
    //        _guanzuBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_guanzhu"];
   
    // _guanzuBtn.titleLabel.text = @"关注";
    
    
//    _headerView.guanzuBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_guanzhu"];
////    _guanzuBtn = _headerView.guanzuBtn;
//    _headerView.guanzuBtn.userInteractionEnabled = YES;
//    UITapGestureRecognizer* singleTap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuBtnClicked)];
//    [_headerView.guanzuBtn addGestureRecognizer:singleTap4];
//    
//    
//    _headerView.sixinBtn.titleLabel.text = @"私信";
//    _headerView.sixinBtn.redView.hidden =YES;
//    _headerView.sixinBtn.imageView.image = [UIImage imageNamed:@"biaojishouye_sixing"];
////    _sixinBtn = _headerView.sixinBtn;
//    _headerView.guanzuBtn.titleLabel.text = @"关注";
//    _headerView.guanzuBtn.redView.hidden =YES;
//    
//    UITapGestureRecognizer* singleTap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuBtnClicked)];
//    [_headerView.sixinBtn addGestureRecognizer:singleTap5];
    
//    _headerView.biaoJiCiShuBtn.topLabel.text = @"标记次数";
    //        _headerView.biaoJiCiShuBtn.topLabel.textAlignment = NSTextAlignmentRight;
//    _headerView.biaoJiCiShuBtn.DownLabel.text = @"12346";
//    _biaoJiCiShuBtn = _headerView.biaoJiCiShuBtn;
//    _headerView.biaoJiCiShuBtn.userInteractionEnabled = YES;
//    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuBtnClicked)];
//    [_headerView.biaoJiCiShuBtn addGestureRecognizer:singleTap1];
//    
//    _headerView.GuanZuRenShuBtn.topLabel.text = @"关注人数";
//    _headerView.GuanZuRenShuBtn.DownLabel.text = @"236";

//    _GuanZuRenShuBtn = _headerView.GuanZuRenShuBtn;

//    _headerView.GuanZuRenShuBtn.userInteractionEnabled = YES;
//    UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuBtnClicked)];
//    [_headerView.GuanZuRenShuBtn addGestureRecognizer:singleTap2];
//
//    _headerView.dianZanCiShuBtn.topLabel.text = @"点赞次数";
//    _headerView.dianZanCiShuBtn.DownLabel.text = @"340";
//    _dianZanCiShuBtn = _headerView.dianZanCiShuBtn;
//    
//    _headerView.dianZanCiShuBtn.userInteractionEnabled = YES;
//    UITapGestureRecognizer* singleTap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(guanzuBtnClicked)];
//    [_headerView.dianZanCiShuBtn addGestureRecognizer:singleTap3];
//    
//    _headerView.dianZanCiShuBtn.DownLabel.textColor = [UIColor colorWithRed:0/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
//    _headerView.GuanZuRenShuBtn.DownLabel.textColor = [UIColor colorWithRed:0/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
//    _headerView.biaoJiCiShuBtn.DownLabel.textColor = [UIColor colorWithRed:0/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    
    _headerView.guanzuIcon.layer.cornerRadius = _headerView.guanzuIcon.frame.size.width/2;
    _headerView.guanzuIcon.layer.masksToBounds = YES;
    
    //view的阴影
    //        self.headerView.layer.shadowOpacity = 1;// 阴影透明度
    //        self.headerView.layer.shadowColor = [UIColor redColor].CGColor;// 阴影的颜色
    //        self.headerView.layer.shadowRadius = 1;// 阴影扩散的范围控制
    //        self.headerView.layer.shadowOffset  = CGSizeMake(0.1, 20);// 阴影的范围
//    _dianZanCiShuTableView.tableHeaderView = _headerView;
//    _guanZuTableView.tableHeaderView = _headerView;
    return _headerView;
    

}

-(void)guanzuBtnClicked{}

- (JQHeaderView *)jqHeaderView {
    
    if (!_jqHeaderView) {
        
        _jqHeaderView = [[JQHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//        _jqHeaderView.backgroundColor = [UIColor clearColor];
        //导航栏背景色
//        _jqHeaderView.backgroundColor = [UIColor blackColor];
        _jqHeaderView.backgroundColor = [UIColor colorWithRed:41/255.0f green:44/255.0f blue:49/255.0f alpha:1.0];
        _jqHeaderView.delegate=self;
        
        [_jqHeaderView.searchButton setImage:[[UIImage imageNamed:@"biaojishouye_fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
        
        _jqHeaderView.titleLabel.text = @"圈子";
        
//        [_jqHeaderView.searchButton setImage:[UIImage imageNamed:@"biaojishouye_fanhui"] forState:UIControlStateNormal];
//        [_jqHeaderView.emailButton setImage:[UIImage imageNamed:@"biaojishouye_fabiao"] forState:UIControlStateSelected];
        
        [_jqHeaderView.emailButton setImage:[[UIImage imageNamed:@"biaojishouye_fabiao"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
        
        //        [_jqHeaderView.searchButton setBackgroundImage:[UIImage imageNamed:@"quanZiHeader1"] forState:UIControlStateNormal];
//        [_jqHeaderView.emailButton setBackgroundImage:[UIImage imageNamed:@"biaojishouye_fabiao"] forState:UIControlStateNormal];
        
//        [_jqHeaderView.emailButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _jqHeaderView;
}


-(void)leftButtonClicked:(UIButton *)leftBtn{
//    [_jqHeaderView removeFromSuperview];
    self.cycleScrollView.delegate = nil;
//    _jqHeaderView.delegate=nil;
    [self.navigationController popViewControllerAnimated:NO];
//    [self dismissViewControllerAnimated:YES completion:nil];
    return;
   
//    [self dismissViewControllerAnimated:YES completion:nil];
//    NSLog(@"leftButtonClicked");
    

}


-(void)rightButtonClicked:(UIButton *)rightBtn{

    NSLog(@"rightButtonClicked");
    
}


-(void)dealloc{
//    self relea
    
    
//    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
//    [BiaoJiGeRenTablewVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//    self.controlleres = nil;
    for (JSDTableViewController *viewC in self.controlleres) {

//        [viewC.tableView.tableHeaderView removeObserver:self forKeyPath:@"contentOffset" context:nil];
        
          [viewC.tableView removeObserver:self forKeyPath:@"contentOffset" context:nil];
  
    }
    
    
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
