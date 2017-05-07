//
//  EssenceViewController.m
//  
//
//  Created by Inspirr Mac on 16/11/14.
//
//

#import "EssenceViewController.h"
#import "BTRecommendTagViewController.h"
#import "BTTitleButton.h"
#import "BTAllViewController.h"
#import "BTVideoViewController.h"
#import "BTVoiceViewController.h"
#import "BTPictureViewController.h"
#import "BTWordViewController.h"

#import "FriendViewController.h"
#import "NearbyViewController.h"
#import "BtItemTool.h"
#import "JSDTableViewController.h"

@interface EssenceViewController ()<UIScrollViewDelegate>

/** 当前被选中的标题按钮 */
@property(nonatomic,weak)BTTitleButton* selectedTitleButton;

/** 标题指示器 */
@property(nonatomic,weak)UIView* titleIndicatorView;
/** 存放所有子控制器的scrollView */
//@property(nonatomic,weak)UIScrollView* scrollView;

@property(nonatomic,strong)UIScrollView *bottomScrollView;
/** 存放所有的标题按钮 */
@property(nonatomic,strong)NSMutableArray* titleButtons;


//存放按钮的view
@property(nonatomic,strong)UIView* titlesView;

@property(nonatomic,strong)NSMutableArray *controlleres;


//存放TableView
@property(nonatomic,strong)NSMutableArray *tableViews;

@property (nonatomic, weak) UITableView *currentTableView;

//存放几个tableview的父view
//@property(nonatomic,strong)UIScrollView * scrollview;

@end

@implementation EssenceViewController

#pragma mark -懒加载
-(NSMutableArray *)titleButtons{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
    
    // 添加子控制器
    [self setChildViewC];
    
    // 设置导航栏
    [self setupNav];
    
    // 添加scrollView
    [self setupScrollView];
    
    // 添加标题栏
    [self setupTitlesView];
    
    // 根据scrollView的偏移量的添加子控制器的view
    [self addchildVcView];
}

/**
 *  添加子控制器
 */

-(void)setChildViewC{
    
    NearbyViewController* nearbyVC= [[NearbyViewController alloc]init];
    nearbyVC.title =@"附近";
    [self addChildViewController:nearbyVC];
    
    BTAllViewController* videoVC= [[BTAllViewController alloc]init];
    videoVC.title =@"全部";
    [self addChildViewController:videoVC];
    
    FriendViewController* friendVC= [[FriendViewController alloc]init];
    friendVC.title =@"好友";
    [self addChildViewController:friendVC];

    
//        JSDTableViewController* nearbyVC= [[JSDTableViewController alloc]init];
//        nearbyVC.title =@"附近";
//        [self addChildViewController:nearbyVC];
//    
//        JSDTableViewController* videoVC= [[JSDTableViewController alloc]init];
//        videoVC.title =@"全部";
//        [self addChildViewController:videoVC];
//    
//        JSDTableViewController* friendVC= [[JSDTableViewController alloc]init];
//        friendVC.title =@"好友";
//        [self addChildViewController:friendVC];
    
    
//    for (int i = 0; i<3; i++) {
//            JSDTableViewController * tableVC = [[JSDTableViewController alloc]init];
//        
//        tableVC.title =@"好友";
//        [self addChildViewController:tableVC];
//        
//    }


    //在加载的5个控制器view中,都用kvo监听frame的变化
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
   
//    NSLog(@"nearbyVC tableView内容是%@",nearbyVC.tableView);
    
//    [nearbyVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];

//    [videoVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    
//    [tableVC.tableView   addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    
}


/**
 *  添加标题栏
 */
-(void)setupTitlesView{

//    UIView* titlesView = [[UIView alloc]init];
     _titlesView = [[UIView alloc]init];
    _titlesView.frame = CGRectMake(0, XMGNavBarBottom, self.view.width, XMGTitlesViewH);
    //放按钮的view
    _titlesView.backgroundColor= [UIColor colorWithWhite:1.0 alpha:0.5];
//    titlesView.backgroundColor= [UIColor blueColor];
    [self.view addSubview:_titlesView];
    // 添加标题
    NSUInteger  count = self.childViewControllers.count;
    CGFloat titleButtonW = self.view.width/count;
     CGFloat titleButtonH = _titlesView.height;
    for (int i = 0; i<self.childViewControllers.count; i++) {
        BTTitleButton* titleButton = [[BTTitleButton alloc]init];
        titleButton.tag = i;
        [_titlesView addSubview:titleButton];
        [titleButton addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleButtons addObject:titleButton];
       
        // frame
        titleButton.frame = CGRectMake(i*titleButtonW, 0, titleButtonW, titleButtonH);
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        UIColor *textColor = [UIColor colorWithRed:252/255.0f green:185/255.0f blue:44/255.0f alpha:1.0];
        
//         [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
         [titleButton setTitleColor:textColor forState:UIControlStateSelected];
    
//        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:20];
        // 设置
        [titleButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        
    }
    
    
    // 添加底部的指示器
    UIView *titleIndicatorView = [[UIView alloc]init];
    [_titlesView addSubview:titleIndicatorView];
    BTTitleButton* firstbtn = _titlesView.subviews.firstObject;
    titleIndicatorView.backgroundColor = [firstbtn titleColorForState:UIControlStateSelected];
    // 设置指示器的背景色为按钮的选中文字颜色
    titleIndicatorView.height = 3;
    titleIndicatorView.bottom = _titlesView.height;
    self.titleIndicatorView = titleIndicatorView;
    // 默认行为 -> 选中firstTitleButton
    // 让被点击的标题按钮变成选中状态
    firstbtn.selected = YES;
    // 被点击的标题按钮 -> 当前被选中的标题按钮
    self.selectedTitleButton = firstbtn;
    // 自动根据当前内容计算尺寸
    [firstbtn.titleLabel sizeToFit];
    // 让指示器移动
//    titleIndicatorView.width = firstbtn.titleLabel.width;
    titleIndicatorView.width = firstbtn.titleLabel.width*1.5;

    titleIndicatorView.centerX = firstbtn.centerX;
    
    
}


-(void)titleButtonClicked:(BTTitleButton*)titleButton{
    // 重复点击同一个按钮
    if (self.selectedTitleButton==titleButton) {
        [[NSNotificationCenter defaultCenter] postNotificationName:XMGTitleButtonDidRepeatClickNotification object:nil];
    }
    // 处理点击事件
    [self dealingTitleButtonClick:titleButton];
    
}


-(void)dealingTitleButtonClick:(BTTitleButton*)titleButton{
    // 让当前被选中的标题按钮恢复以前的状态(取消选中)
    self.selectedTitleButton.selected = NO;
    // 让被点击的标题按钮变成选中状态
    titleButton.selected = YES;
    
    // 被点击的标题按钮 -> 当前被选中的标题按钮
    self.selectedTitleButton = titleButton;
     // 让指示器移动
    [UIView animateWithDuration:0.2 animations:^{
        _titleIndicatorView.width = titleButton.titleLabel.width*1.5;
        _titleIndicatorView.centerX = titleButton.centerX;
    }];
    
    // 滚动scrollView
//    CGPoint offset = self.scrollView.contentOffset;
//    offset.x = titleButton.tag*self.scrollView.width;
//    [self.scrollView setContentOffset:offset animated:YES];
    
    CGPoint offset = self.bottomScrollView.contentOffset;
    offset.x = titleButton.tag*self.bottomScrollView.width;
    [self.bottomScrollView setContentOffset:offset animated:YES];
    
}

/**
 *  设置导航栏
 */
-(void)setupNav{
    self.view.backgroundColor = TNTCommonBgColor;
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(maintagClicked)];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"quanZiHeader1" highImage:@"quanZiHeader1" target:self action:@selector(maintagClicked)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"quanZiHeader1"]
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
    
self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fabiao" highImage:@"biaojishouye_fabiao" target:self action:@selector(showDropDownMenu)];
    

}


/**
 *  添加scrollView
 */
-(void)setupScrollView{

    UIScrollView* scrollview = [[UIScrollView alloc]init];
//    self.scrollView = scrollview;
    self.bottomScrollView = scrollview;
    
//    scrollview.frame = self.view.bounds;
//    tableview上移的距离
    scrollview.frame = CGRectMake(0, -8.5, self.view.bounds.size.width,  self.view.bounds.size.height);
    
//     scrollview.frame = CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height);
    
    //下移图片有时候会超出到按钮栏中.
//    scrollview.frame = CGRectMake(0, 8.5, self.view.bounds.size.width,  self.view.bounds.size.height);
    
    scrollview.pagingEnabled = YES;
    scrollview.delegate =self;
    [self.view addSubview:scrollview];
    // 禁止掉[自动设置scrollView的内边距]
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置内容大小
    scrollview.contentSize = CGSizeMake(scrollview.width*self.childViewControllers.count, 0);
    
}

//-(UIScrollView *)scrollView{
//}


-(void)maintagClicked{

    [self.navigationController popViewControllerAnimated:YES];

//    BTRecommendTagViewController* recommendTagVC = [[BTRecommendTagViewController alloc]init];
//    [self.navigationController pushViewController:recommendTagVC animated:YES];

}


-(void)showDropDownMenu{

}

-(void)leftButtonClicked:(UIButton*)btn{
    NSLog(@"左边按钮已经点击");
    
}

-(void)rightButtonClicked:(UIButton*)btn{
    NSLog(@"右边按钮已经点击");
   
    
}


#pragma mark - <UIScrollViewDelegate>
/**
 * 如果通过setContentOffset:animated:让scrollView[进行了滚动动画], 那么最后会在停止滚动时调用这个方法
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    // 根据scrollView的偏移量的添加子控制器的view
    [self addchildVcView];

    
}


/**
 *  scrollView停止滚动的时候会调用1次(人为拖拽导致的停止滚动才会触发这个方法)
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 计算按钮索引
    int index = scrollView.contentOffset.x / scrollView.width;
    BTTitleButton* titleButton = self.titleButtons[index];
    
    // 点击按钮
    [self dealingTitleButtonClick:titleButton];
     // 根据scrollView的偏移量的添加子控制器的view
    [self addchildVcView];
    
}


-(void)addchildVcView{
//    UIScrollView * scrollview = self.scrollView;
    UIScrollView * scrollview = self.bottomScrollView;
    
//     _scrollview = self.scrollView;
    
// 计算按钮索引
    int index = scrollview.contentOffset.x / scrollview.width;
    //添加对应的子控制器view
    UIViewController* willShowVC = self.childViewControllers[index];
    if ([willShowVC isViewLoaded]) {
        return;
    }
    [scrollview addSubview:willShowVC.view];
    //设置子控制器view的frame
    willShowVC.view.frame = scrollview.bounds;
    
}

#pragma -mark Lazy Load

- (UIScrollView *)bottomScrollView {
    //     return _bottomScrollView;
    
    if (!_bottomScrollView) {
        //        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bottomScrollView.delegate = self;
        _bottomScrollView.pagingEnabled = YES;
        
        
        NSArray *colors = @[[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor],[UIColor purpleColor],[UIColor orangeColor],[UIColor whiteColor],[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor]];
        
        for (int i = 0; i<3; i++) {
            //        for (int i = 0; i<1; i++) {
            
            JSDTableViewController *jsdTableViewController = [[JSDTableViewController alloc] init];
            jsdTableViewController.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            
            jsdTableViewController.view.backgroundColor = colors[i];
            
            [self.bottomScrollView addSubview:jsdTableViewController.view];
            
            [self.controlleres addObject:jsdTableViewController];
            
            [self.tableViews addObject:jsdTableViewController.tableView];
            
            NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
            [jsdTableViewController.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
            
        }
        
       
        
        
        self.currentTableView = self.tableViews[0];
        self.bottomScrollView.contentSize = CGSizeMake(self.controlleres.count * SCREEN_WIDTH, 0);
        
    }
    return _bottomScrollView;
}


//kvo对应方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
   
    
//    UITableView *tableView = (UITableView *)object;
    UIScrollView *scrollview1 = (UIScrollView *)object;
    
//    if (!(self.currentTableView == tableView)) {
//        return;
//    }
    
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    
//    CGFloat tableViewoffsetY = tableView.contentOffset.y;
     CGFloat tableViewoffsetY = scrollview1.contentOffset.y;
    
//    self.lastTableViewOffsetY = tableViewoffsetY;
    
    
//    if ( tableViewoffsetY>=0 && tableViewoffsetY<=200) {
    if ( tableViewoffsetY>=0 && tableViewoffsetY<=64) {
        
//        self.segmentScrollView.frame = CGRectMake(0, 264-tableViewoffsetY, SCREEN_WIDTH, 40);
//        
//        
//        self.cycleScrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 264);
        

        self.titlesView.frame = CGRectMake(0, 64-tableViewoffsetY, SCREEN_WIDTH, 40);
        
    
//        self.scrollView.frame = CGRectMake(0, 0-tableViewoffsetY, SCREEN_WIDTH, 264);
        
    }else if( tableViewoffsetY < 0){
        
        
        
//        self.segmentScrollView.frame = CGRectMake(0, 264, SCREEN_WIDTH, 40);
//        
//        self.cycleScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 264);
        
        self.titlesView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
        
//    }else if (tableViewoffsetY > 200){
        }else if (tableViewoffsetY > 64){
        
        //让segmentScrollView在当前view的顶部停留.
        //        self.segmentScrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
        
        //让segmentScrollView跟着tableview一起上滑.
//        self.segmentScrollView.frame = CGRectMake(0, 264-tableViewoffsetY, SCREEN_WIDTH, 40);
        
//        self.cycleScrollView.frame = CGRectMake(0, -200, SCREEN_WIDTH, 264);
        
        self.titlesView.frame = CGRectMake(0, 64-tableViewoffsetY, SCREEN_WIDTH, 40);
        
        //        self.cycleScrollView.frame = CGRectMake(0, -200, SCREEN_WIDTH, 264);
        
        
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
