//
//  JSDTableViewController.m
//  JQBanTangHomeDemo
//
//  Created by jianquan on 2016/12/14.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "BiaoJiZaiGeRenTVC.h"
#import "BiaoJiTableViewCell.h"
#import "JSDTHomeRecomandModel.h"

//BiaoJiTableViewCell

@interface BiaoJiZaiGeRenTVC ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@end

@implementation BiaoJiZaiGeRenTVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.tableView];
        [self loadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        //貌似设置了没什么用
        [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        //        [tableView setSeparatorInset:UIEdgeInsetsMake(80, 80, 0, 0)];
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
    //    return 290;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.modelArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BiaoJiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BiaoJiTableViewCell"];
    
    //    static NSString *ID = @"food";
    //    foodCell* cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
    
    if (nil == cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BiaoJiTableViewCell" owner:nil options:nil] firstObject];
    }
    
    //   if (!cell) {
    //       cell = [[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:nil options:nil][index];
    //       cell.backgroundColor = [UIColor clearColor];
    //   }
    
    //    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
    return cell;
}

//初始化数据
- (void)loadData {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSArray * dataArray = [[dic objectForKey:@"data"] objectForKey:@"topic"];
    
    
    [self.modelArray removeAllObjects];
    for (unsigned long i = 0; i<[dataArray count]; i++) {
        JSDTHomeRecomandModel *model = [[JSDTHomeRecomandModel alloc] init];
        NSString *string = [NSString stringWithFormat:@"recomand_%02ld%@",i+1,@".jpg"];
        UIImage *image  = [UIImage imageNamed:string];
        
        model.placeholderImage = image;
        
        NSDictionary *itemDic = dataArray[i];
        model.picUrl = [itemDic objectForKey:@"pic"];
        model.title = [itemDic objectForKey:@"title"];
        model.views = [itemDic objectForKey:@"views"];
        model.likes = [itemDic objectForKey:@"likes"];
        
        NSDictionary *userDic = [itemDic objectForKey:@"user"];
        model.author = [userDic objectForKey:@"nickname"];
        
        [self.modelArray addObject:model];
        
    }
    
    
    [self.tableView reloadData];
}



- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:NSStringFromClass([BiaoJiQuanZiTableViewCell class])];
        
        //        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:@"BiaoJiQuanZiTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BiaoJiTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"BiaoJiTableViewCell"];
        //去掉cell默认的分割线
        _tableView.separatorStyle = NO;
        
        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 242)];
                tableHeaderView.backgroundColor = [UIColor whiteColor];
//        tableHeaderView.backgroundColor = [UIColor colorWithRed:61/255.0f green:64/255.0f blue:68/255.0f alpha:1.0];
        
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


@end
