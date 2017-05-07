//
//  BTRecommendTagViewController.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/16.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTRecommendTagViewController.h"
#import "BTHTTPSessionManager.h"
#import <MJExtension.h>
#import "BTRecommendTag.h"
#import "BTRecommendTagCell.h"
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import "BTDIYHeader.h"

@interface BTRecommendTagViewController ()

/** 所有的标签数据(数组中存放的都是btrecommendTag模型) */
@property(nonatomic,strong)NSArray* recommendTags;

/** 任务 */
//@property(nonatomic,strong)NSURLSessionDataTask* task;

/** 请求管理者 */
@property(nonatomic,weak)BTHTTPSessionManager* manager;
@end


/**
 cell的重用标识
 */
static NSString* BTRecommendTagCellId = @"recommendTag";
@implementation BTRecommendTagViewController

/** manager属性的懒加载 */
-(BTHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [BTHTTPSessionManager manager];
    }
    return _manager;
}


#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //基本设置
    self.title = @"推荐标签";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:BTRecommendTagCellId];
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = TNTCommonBgColor;
    
    // 测试刷新控件,一进入这个页面就先刷新数据
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [BTDIYHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView.mj_header endRefreshing];
            
        });
        
    }];
    
    // 加载标签数据
    [self loadNewRecommendTags];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


// 加载标签数据
-(void)loadNewRecommendTags{
    // 弱引用
    __weak typeof(self) weakSelf = self;
    //弹框
    [SVProgressHUD show];
    //请求参数
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
     // 发送请求
    [self.manager GET:XMGRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // responseObject : 字典数组 -> self.recommandTags : 模型数组
        weakSelf.recommendTags = [BTRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        NSLog(@"推荐关注responseObject内容是%@",responseObject);
        //刷新表格
        [weakSelf.tableView reloadData];
        //隐藏弹框
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //如果是因为取消任务来到这个block就直接返回
        if (error.code == NSURLErrorCancelled) {
            //隐藏弹框
//            [SVProgressHUD dismiss];
            //提示失败信息
            [SVProgressHUD showWithStatus:@"加载推荐标签数据失败"];
            
        }
        
        
    }];
    
}


-(void)dealloc{

    TNTLogFuc;
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    //隐藏弹框
    [SVProgressHUD dismiss];
    //取消当前的所有请求
    [self.manager invalidateSessionCancelingTasks:YES];
    
    
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
    return self.recommendTags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BTRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:BTRecommendTagCellId];
    
    cell.recommendTag = self.recommendTags[indexPath.row];
    
    return cell;
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
