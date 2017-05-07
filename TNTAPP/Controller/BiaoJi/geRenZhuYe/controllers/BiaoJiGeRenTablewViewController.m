//
//  BiaoJiGeRenTablewViewController.m
//  TNTAPP
//
//  Created by mac on 17/2/7.
//  Copyright © 2017年 TNT. All rights reserved.

#import "BiaoJiGeRenTablewViewController.h"
#import "JSDTHomeRecomandModel.h"
#import "JQBTHomeTableViewCell.h"

@interface BiaoJiGeRenTablewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *modelArray;
@property(nonatomic,strong)UIViewController *controller;

@end

@implementation BiaoJiGeRenTablewViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.tableView];
        [self loadData];
    }
    return self;
}

 
 

//初始化数据
- (void)loadData{
    
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
        
        //  [tableView setSeparatorInset:UIEdgeInsetsMake(80, 80, 0, 0)];
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"self.modelArray内容是%@",self.modelArray);
//    return [self.modelArray count];
     return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    JQBTHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JQBTHomeTableViewCell class])];
    
    JQBTHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"biaojiCellID"];
    
//    [_tableView registerClass:[JQBTHomeTableViewCell class] forCellReuseIdentifier:@"biaojiCellID"];
    
    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
    return cell;
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        [_tableView registerClass:[JQBTHomeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([JQBTHomeTableViewCell class])];
        [_tableView registerClass:[JQBTHomeTableViewCell class] forCellReuseIdentifier:@"biaojiCellID"];
        
        
        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 242)];
                tableHeaderView.backgroundColor = [UIColor whiteColor];
//        tableHeaderView.backgroundColor = [UIColor yellowColor];
        
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
