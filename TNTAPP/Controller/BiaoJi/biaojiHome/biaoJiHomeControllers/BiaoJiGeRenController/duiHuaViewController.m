//
//  BiaoJiViewController.m
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/6.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "duiHuaViewController.h"
#import "UIImage+TNTExtension.h"

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
#import "SiXinTableViewCell.h"

#import "FFDropDownMenuCell.h"
#import "FFDropDownMenuView.h"

#import "DuiHuaTaTableViewCell.h"
#import "DuiHuaWoTableViewCell.h"

@interface duiHuaViewController ()<UITableViewDelegate,UITableViewDataSource,FFDropDownMenuViewDelegate>

/** 下拉菜单 */
@property (nonatomic, strong) FFDropDownMenuView *dropdownMenu;

//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


//@property (weak, nonatomic) IBOutlet UITableView *tableView;

//@property (weak, nonatomic) IBOutlet UIView *topView;


//@property (weak, nonatomic) IBOutlet guanZuTwoLabelView *guanZuWoDeView;
//
//@property (weak, nonatomic) IBOutlet guanZuTwoLabelView *woGuanZuDeView;
//
//@property(nonatomic,weak)UIImageView *sanJiaoXinImageView;

@end

@implementation duiHuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
//    [self load];
    
    
//    BTButton * btn1 = [[BTButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:btn1];
    
//    [self setupTopView];
   
//    [self setUpTableView];
 
    
   
    
    
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
//    UINib *cellNib = [UINib nibWithNibName:@"GeRenGuanZuTableViewCell" bundle:nil];
//    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"GeRenGuanZuTableViewCellID"];
    
//    UINib *DonTaiCellNib = [UINib nibWithNibName:@"DonTaiCell" bundle:nil];
//    [self.tableView registerNib:DonTaiCellNib forCellReuseIdentifier:@"DonTaiCellID"];
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.view.backgroundColor = [UIColor blueColor];
     [self.view addSubview:self.tableView];
    
//    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f];
//    _tableView.scrollEnabled =YES;
    
    
    //设置导航栏标题

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"陈小浩";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
//    NSLog(@"",self.navigationItem.title);
    
    self.navigationItem.titleView = titleLabel;


    self.navigationItem.leftBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fanhui" highImage:@"biaojishouye_fanhui" target:self action:@selector(LeftBackButtonClicked:)];
    
    
    
    self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fabiao" highImage:@"biaojishouye_fabiao" target:self action:@selector(showDropDownMenu)];
    
    /** 初始化下拉菜单 */
    [self setupDropDownMenu:self.navigationItem.rightBarButtonItem];

    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f]];
  
//    _topView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];
    
   
    
//    去掉UINavigationBar底部的分割线
    
    //导航栏背景透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //导航栏底部线清楚
    self.navigationController.navigationBar.translucent = NO;
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    //segmentControl
    //分段控制
    NSArray *itemsArray = [[NSArray alloc]initWithObjects:
                           @"消息",
                           @"好友",
                           nil];
    UISegmentedControl *segmentedControl = [self createSegmentedControlWithItems:itemsArray];
    
    //在navigationBar上添加 —— navigationBar高44
    CGFloat width = 115;
    CGFloat height = 35;
    CGFloat x = (self.view.frame.size.width - width) / 2;   //根据宽算出x
    CGFloat y = (44 - height) / 2;  //根据高算出y
    
    //设置Frame
    segmentedControl.frame = CGRectMake(x, y, width, height);
    
    
    
    
}


#pragma mark - 创建/初始化UI控件
- (UISegmentedControl *)createSegmentedControlWithItems:(NSArray *)items
{
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:items];
    //设置默认选择项索引
    segmentedControl.selectedSegmentIndex = 0;
    
    segmentedControl.segmentedControlStyle= UISegmentedControlStyleBar;//设置
    //设置痕迹颜色
    segmentedControl.tintColor = [UIColor whiteColor];
    [segmentedControl setBackgroundColor:[UIColor colorWithRed:64/255.0f green:70/255.0f blue:79/255.0f alpha:1.0]];
    
//    [segmentedControl setBackgroundImage:[UIImage initWithColor:[UIColor colorWithRed:41/255.0f green:44/255.0f blue:49/255.0f alpha:1.0]rect:segmentedControl.frame] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    
//    [segmentedControl setBackgroundImage:[UIImage initWithColor:[UIColor colorWithRed:64/255.0f green:70/255.0f blue:79/255.0f alpha:1.0]rect:segmentedControl.frame] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    //设置在点击后是否恢复原样
    segmentedControl.momentary = NO;
    //在指定索引插入一个分段并设置标题
//    [segmentedControl insertSegmentWithTitle:@"插入分段" atIndex:2 animated:NO];
    //在指定索引插入一个分段并设置图标
//    UIImage *image = [[UIImage imageNamed:@"mortgage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [segmentedControl insertSegmentWithImage:image atIndex:3 animated:NO];
    //移除指定索引的分段
//    [segmentedControl removeSegmentAtIndex:4 animated:NO];
    //设置指定索引分段的宽度
    [segmentedControl setWidth:115/2 forSegmentAtIndex:0];
    [segmentedControl setWidth:115/2  forSegmentAtIndex:1];
    
    //设置分段内容偏移量
//    [segmentedControl setContentOffset:CGSizeMake(0.0, 5.0) forSegmentAtIndex:2];
    
    //设置监听事件
    //UIControlEventValueChanged——值改变时响应
    [segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
    return segmentedControl;
}

#pragma mark - UISegmentedControl 值改变时响应
- (void)segmentedControlAction:(UISegmentedControl *)segmentedControl
{
    NSInteger Index = segmentedControl.selectedSegmentIndex;
    NSLog(@"当前分段选择为： %li", (long)Index);
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//self.extendedLayoutIncludesOpaqueBars=YES;
//    self.navigationController.navigationBar.translucent=NO;
    
    //两个都不能少,否则出现tabbar不能显示却能点击的情况
    self.tabBarController.tabBar.hidden = YES;
    //self.hidesBottomBarWhenPushed =YES;
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;

}


-(void)viewWillDisappear:(BOOL)animated{

//    self.navigationController.navigationBar.translucent=YES;
    
    self.tabBarController.tabBar.hidden =YES;
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;

}

-(void)viewDidAppear:(BOOL)animated{


}


/*
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
*/


-(void)woGuanZuDeViewClicked:(guanZuTwoLabelView*)guanZuTwoLabelView{

    NSLog(@"woGuanZuDeViewClicked");
    
    [UIView animateWithDuration:0.3 animations:^{
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/5, 2);
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/3, 2);
//        _sanJiaoXinImageView.frame = CGRectMake(_woGuanZuDeView.frame.origin.x+_guanZuWoDeView.frame.size.width/2-10, _woGuanZuDeView.frame.size.height-10, 20, 10);
        
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 5, 0);
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 3, 0);
        
    }];

    
}

-(void)guanZuWoDeViewClicked:(guanZuTwoLabelView*)guanZuTwoLabelView{

    NSLog(@"guanZuWoDeViewClicked");
    
    
    [UIView animateWithDuration:0.3 animations:^{
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/5, 2);
        //        self.blueView.frame = CGRectMake(button.frame.origin.x, 41, SCREEN_WIDTH/3, 2);
//        _sanJiaoXinImageView.frame = CGRectMake(_guanZuWoDeView.frame.origin.x+_guanZuWoDeView.frame.size.width/2-10, _guanZuWoDeView.frame.size.height-10, 20, 10);
        
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 5, 0);
        //        self.scrollView.contentOffset = CGPointMake(button.frame.origin.x * 3, 0);
        
    }];

}


-(UITableView *)tableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-22) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor blackColor];

    UINib *cellNib = [UINib nibWithNibName:@"DuiHuaTaTableViewCell" bundle:nil];
    
    [_tableView registerNib:cellNib forCellReuseIdentifier:@"DuiHuaTaTableViewCell"];
    
    UINib *cellNib2 = [UINib nibWithNibName:@"DuiHuaWoTableViewCell" bundle:nil];
    
    [_tableView registerNib:cellNib2 forCellReuseIdentifier:@"DuiHuaWoTableViewCell"];
    
    
    
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate =self;
    _tableView.dataSource = self;
    return  _tableView;
}

-(void)setUpTableView{
    
//    _tableView.backgroundColor = [UIColor redColor];
//    _tableView.delegate =self;
//    _tableView.dataSource = self;

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    } else if(section==1){
        return 1;
    }else if(section==2){
        return 2;
    }
    
    return 2;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section<=1) {
    
        DuiHuaTaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DuiHuaTaTableViewCell" forIndexPath:indexPath];
        
        // 2.如果缓存池中没有cell就用BorrowCell创建
        if (!cell) {
            cell = [DuiHuaTaTableViewCell returnCell];
        }

        //圆角
        cell.guanzuIcon.layer.cornerRadius = cell.guanzuIcon.frame.size.width/2;
        cell.guanzuIcon.layer.masksToBounds = YES;
        
        [cell.guanzuIcon setImage:[[UIImage imageNamed:@"beauty5"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
 
        return cell;
        
    }else if (indexPath.section==2) {
        
        DuiHuaWoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DuiHuaWoTableViewCell" forIndexPath:indexPath];
        
        // 2.如果缓存池中没有cell就用BorrowCell创建
        if (!cell) {
            cell = [DuiHuaWoTableViewCell returnCell];
        }
        
        //圆角
        cell.guanzuIcon.layer.cornerRadius = cell.guanzuIcon.frame.size.width/2;
        cell.guanzuIcon.layer.masksToBounds = YES;
        
        [cell.guanzuIcon setImage:[[UIImage imageNamed:@"beauty5"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
        
        return cell;
        
    }

    
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    return cell;
    
    
    

}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        _tableView.sectionFooterHeight = 10;
        return 0.0001;
    }else if (section==1) {
        return 40;
    }else if (section==2) {
        return 40;
    }
    return 0.0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
        _tableView.sectionFooterHeight = 0.0001;
//        return 38;
        return 60;
//    }else if (indexPath.section==1) {
//        return 118;
//    }
//    return 0.0001;

}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    CGFloat labelW = SCREEN_WIDTH;
    CGFloat labelH = 40;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,labelW, labelH)];
    
    label.backgroundColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text =@"昨天16:58";
    label.textColor = [UIColor clearColor];
    
    if (section==0) {
        label.text =@"";

        
        return label;
    }else if (section==1) {
 label.text =@"昨天16:58";
        return label;
        
    }else if (section==2) {
         label.text =@"昨天16:58";
        return label;
        
    }
    return label;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}


/**
 *  只要实现了这个方法，左滑出现Delete按钮的功能就有了
 *  点击了“左滑出现的Delete按钮”会调用这个方法
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除模型
//    [self.wineArray removeObjectAtIndex:indexPath.row];
    
    // 刷新
//[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//    
//    [tableView reloadData];
    
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
    
    //如果有需要，可以设置代理（非必须）
    self.dropdownMenu.delegate = self;
    
    self.dropdownMenu.ifShouldScroll = NO;
    
    [self.dropdownMenu setup];
}



/** 获取菜单模型数组 */
- (NSArray *)getMenuModelsArray {
    __weak typeof(self) weakSelf = self;
    
    //菜单模型0
//    FFDropDownMenuModel *menuModel0 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"发表:" menuItemIconName:@"menu2"  menuBlock:^{
//        
//    }];
    
    
    //菜单模型1
    FFDropDownMenuModel *menuModel1 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"添加好友" menuItemIconName:@"biaojishouye_dianji_biaoji" menuBlock:^{
       
    }];
    
    
    //菜单模型2
    FFDropDownMenuModel *menuModel2 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"扫一扫" menuItemIconName:@"biaojishouye_dianji_quanz" menuBlock:^{
        //        FFMenuViewController *vc = [FFMenuViewController new];
        //        vc.backgroundImageName = @"menuBackground";
        //        vc.navigationItem.title = @"Twitter";
        //        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
    NSArray *menuModelArr = @[menuModel1, menuModel2];
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
//    FFDropDownMenuCell *cell = (FFDropDownMenuCell *)menuCell;
    
    FFDropDownMenuCell *cell = (FFDropDownMenuCell *)menuCell;
    
    
    //如果自定义cell,你可以在这里进行一些小修改，比如是否需要下划线之类的
    //最后一个菜单选项去掉下划线（FFDropDownMenuCell 内部已经做好处理，最后一个是没有下划线的，以下代码只是举个例子）
    if (menuView.menuModelsArray.count - 1 == index) {
        cell.separaterView.hidden = YES;
        cell.customImageView.hidden = NO;
    }else if (0 == index) {
        
//        cell.customTitleLabel.hidden = YES;
//        cell.faBiaoLabel.text = @"发表:";
        //        cell.faBiaoLabel.textColor  = [UIColor blackColor];
    }
    
    else {
        cell.separaterView.hidden = NO;
        cell.customImageView.hidden = NO;
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
