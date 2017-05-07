//
//  BTTopicViewController.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/16.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTTopicViewController.h"
#import "BTHTTPSessionManager.h"
#import "BTTopic.h"
#import <MJExtension.h>
#import <MJRefresh.h>
#import "BTTopicCell.h"
#import "BTDIYHeader.h"
#import "BTDIYFooter.h"

#import "EssenceViewController.h"
#import "BTNewViewController.h"
#import "BTCommentViewController.h"
#import "XiangCeViewController.h"

@interface BTTopicViewController ()<UITableViewDelegate,UITableViewDataSource,TopicCellDelegate>


/** 请求管理者 */
@property(nonatomic,weak)BTHTTPSessionManager* manager;
/** 帖子数据 */
@property(nonatomic,strong)NSMutableArray<BTTopic*>* topics;

@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;


/** 用来加载下一页数据的参数 */
@property(nonatomic,copy)NSString* maxtime;

@end

static
 NSString* const BTTopicCellId = @"topic";
@implementation BTTopicViewController


-(BTTopicType)type{
    
    //return 0;
    return BTTopicTypeWord;
}


#pragma mark 懒加载
/** manager属性的懒加载 */
-(BTHTTPSessionManager *)manager{

    if (!_manager) {
        _manager = [BTHTTPSessionManager manager];
    }
    return _manager;
}


#pragma mark 监听
/**
 *  监听通知 : 重复点击了tabBar上的某个按钮
 */
-(void)tabBarButtonDidRepeatClick{
    // 如果发现这个控制器的view不在窗口上, 就直接返回
    if (self.view.window==nil) {
        return;
    }
    // 这个控制器的view在窗口上
    CGRect  viewRect = [self.view convertRect:self.view.bounds toView:nil];
    CGRect windowRect = self.view.window.bounds;
    if (!CGRectIntersectsRect(viewRect, windowRect)) {
        return;
    }
    // 只有当前控制器的view显示在window边框范围内, 才需要进入下拉刷新
    [self.tableView.mj_header beginRefreshing];
    
}

/**
 *  监听通知 : 重复点击了titleView上的某个按钮
 */
-(void)titleButtonDidRepeatClick{
    [self tabBarButtonDidRepeatClick];
    
}

//这个方法有时会让tableview不加载
//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        [self setupTable];
////        [self.view addSubview:self.tableView];
////        [self loadData];
//    }
//    return self;
//}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.tableView];
        [self loadNewTopics];
    }
    return self;
}


- (UITableView *)tableView {
    if (!_tableView) {
        
//        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0,1, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
//        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0,33, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;

        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTTopicCell class]) bundle:nil] forCellReuseIdentifier:BTTopicCellId];
        
        
//        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 242)];
        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        
//        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
        
//        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
        
        //        tableHeaderView.backgroundColor = [UIColor whiteColor];
//        tableHeaderView.backgroundColor = [UIColor yellowColor];
        
//        tableHeaderView.backgroundColor = [UIColor redColor];
        
        tableHeaderView.backgroundColor = [UIColor clearColor];
        
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(182, 0, 0, 0);
        _tableView.tableHeaderView = tableHeaderView;
        
        
        
    }
    return _tableView;
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}


/*
-(void)setupTable{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource =self;
    _tableView.delegate = self;
    
    //内边距
    self.tableView.contentInset = UIEdgeInsetsMake(XMGNavBarBottom+XMGTitlesViewH, 0, XMGTabBarH+XMGMargin, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = TNTCommonBgColor;
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTTopicCell class]) bundle:nil] forCellReuseIdentifier:BTTopicCellId];
    
}
*/

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tableView
//    [self setupTable];
    
    // 增加刷新控件
    [self setupRefresh];
    
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleButtonDidRepeatClick) name:XMGTitleButtonDidRepeatClickNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarButtonDidRepeatClick) name:XMGTabBarButtonDidRepeatClickNotification object:nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





-(void)setupRefresh{
    //header  下拉
    self.tableView.mj_header = [BTDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    
//    self.tableView.tableHeaderView = [BTDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    
    //进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    //footer  上拉
    self.tableView.mj_footer = [BTDIYFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    
    

}


#pragma mark -  数据处理
/**
 参数a
 */
-(NSString*)paramA{
    // isKindOfClass: 判断是否为[这种类型]或者是[这种类型的子类],新帖控制器则返回newlist
    if ([self.parentViewController isKindOfClass:[BTNewViewController class]]) {
        return @"newlist";
        
    }
    return @"list";

}


/**
 *  加载更多的帖子数据
 */
-(void)loadMoreTopics{
// 取消之前的所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    params[@"a"] = self.paramA;   params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    params[@"maxtime"] = self.maxtime;
    //发送请求
    __weak typeof(self) WeakSelf = self;
//    [self.manager GET:XMGRequestURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    [self.manager GET:XMGRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        //存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        // 字典数组 -> 模型数组
//        NSArray* moreTopcs = [BTTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        NSArray* moreTopcs = [BTTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        NSLog(@"list内容是%@",responseObject[@"list"]);
//        NSLog(@"moreTopcs内容是%@",responseObject[@"moreTopcs"]);
        for (BTTopic* topic1 in moreTopcs) {
            NSLog(@"小图%@,中图%@,大图%@,头像%@",topic1.small_image,topic1.middle_image,topic1.large_image,topic1.profile_image);
        }
        
//        for (NSObject* object2 in moreTopcs[1]) {
//            NSLog(@"object2内容是%@",object2);
//        }
        
//        for (NSObject * objec1 in responseObject[@"list"]) {
//            NSLog(@"objec1内容是%@",objec1);
//            
//        }
        
        // 增加到以前数组的最后面
        [WeakSelf.topics addObjectsFromArray:moreTopcs];
        // 刷新表格
        [WeakSelf.tableView reloadData];
        
        // 结束刷新
        [WeakSelf.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 结束刷新
        [WeakSelf.tableView.mj_footer endRefreshing];

    }];
    
    
}


/**
 *  加载新的帖子数据
 */
-(void)loadNewTopics{
    // 取消之前的所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    // 请求参数
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    params[@"a"] = self.paramA;
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    
    //发送请求
    __weak typeof(self) WeakSelf = self;
//    [self.manager GET:XMGRequestURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    [self.manager GET:XMGRequestURL parameters:params  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        // 字典数组 -> 模型数组
//        WeakSelf.topics = [BTTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        WeakSelf.topics = [BTTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        // 增加到以前数组的最后面
       // [WeakSelf.topics addObjectsFromArray:moreTopcs];
        // 刷新表格
        [WeakSelf.tableView reloadData];
        
        // 结束刷新
        [WeakSelf.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 结束刷新
        [WeakSelf.tableView.mj_header endRefreshing];
        
    }];
    

    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _topics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BTTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:BTTopicCellId];
//    cell.topic会调用topic的setTopic方法对cell对象的topic属性赋值.
    //self.topics[indexPath.row]是取出一个模型对象
    cell.topic = self.topics[indexPath.row];
    BTTopic* topic1 = self.topics[indexPath.row];
//NSLog(@"topics内容是%@",self.topics[indexPath.row]);
//    NSLog(@"topic1.large_image内容是%@",topic1.large_image);
//    for (BTTopic* topic1 in moreTopcs) {
  //NSLog(@"yyy小图%@,中图%@,大图%@,头像%@",topic1.small_image,topic1.middle_image,topic1.large_image,topic1.profile_image);
//    }
    cell.delegate = self;
    return cell;
}


-(void)headerImageVieClicked{

    XiangCeViewController *XiangCeVC = [[XiangCeViewController alloc]init];
    
//  [self.navigationController pushViewController:XiangCeVC animated:YES];
    [self presentViewController:XiangCeVC animated:YES completion:^{
    }];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return self.topics[indexPath.row].cellHeight;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    BTCommentViewController* commentVC = [[BTCommentViewController alloc]init];
    commentVC.topic = self.topics[indexPath.row];
    [self.navigationController pushViewController:commentVC animated:YES];

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
