//
//  JSDTableViewController.m
//  JQBanTangHomeDemo
//
//  Created by jianquan on 2016/12/14.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "yunDongViewController.h"
#import "yunDongTableViewCell.h"
#import "JSDTHomeRecomandModel.h"

#import "yunDongRightImageCell.h"

//BiaoJiTableViewCell

@interface yunDongViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@end

@implementation yunDongViewController

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

//    return 200;
    return 200;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.modelArray count];
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        
        yunDongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yunDongTableViewCell"];
        
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"yunDongTableViewCell" owner:nil options:nil] firstObject];
        }
        
        //设置UITableViewCell的选中背景颜色的方法：
        UIView *view = [[UIView alloc]init];
        
//        view.backgroundColor = [UIColor colorWithRed:168/255.0f green:167/255.0f blue:129/255.0f alpha:0.5f];
        view.backgroundColor = [UIColor clearColor];
        
        cell.selectedBackgroundView=view;
        cell.fengGeXianView.backgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1.0f];
        
        return cell;
        
        
    } else if(indexPath.row==1){
        
        yunDongRightImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yunDongRightImageCell"];
        
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"yunDongRightImageCell" owner:nil options:nil] firstObject];
        }
        
        //设置UITableViewCell的选中背景颜色的方法：
        UIView *view = [[UIView alloc]init];
        
//        view.backgroundColor = [UIColor colorWithRed:168/255.0f green:167/255.0f blue:129/255.0f alpha:0.5f];
         view.backgroundColor = [UIColor clearColor];
        
        cell.selectedBackgroundView=view;
        cell.fengGeXianView.backgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1.0f];
        return cell;
        
    }else{
    
        yunDongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yunDongTableViewCell"];
        
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"yunDongTableViewCell" owner:nil options:nil] firstObject];
        }
        
        //设置UITableViewCell的选中背景颜色的方法：
        UIView *view = [[UIView alloc]init];
        
//      view.backgroundColor = [UIColor colorWithRed:168/255.0f green:167/255.0f blue:129/255.0f alpha:0.5f];
        view.backgroundColor = [UIColor clearColor];
        
        cell.selectedBackgroundView=view;
        cell.fengGeXianView.backgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1.0f];
        return cell;
    
    }
   
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        
        yunDongTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        cell.fengGeXianView.backgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1.0f];
        
    } else if(indexPath.row==1){
        yunDongRightImageCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        cell.fengGeXianView.backgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1.0f];
        
    }else {
    
        yunDongTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        cell.fengGeXianView.backgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1.0f];
        
    }
    
   

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
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([yunDongTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"yunDongTableViewCell"];
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([yunDongRightImageCell class]) bundle:nil] forCellReuseIdentifier:@"yunDongRightImageCell"];
        
        //去掉cell默认的分割线
        _tableView.separatorStyle = NO;
        
        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 242)];

        tableHeaderView.backgroundColor = [UIColor whiteColor];
        
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(182, 0, 0, 0);
        _tableView.tableHeaderView = tableHeaderView;
        
        //设置背景图片
        UIImage *backGroundImage=[UIImage imageNamed:@"beuty1"];
        _tableView.contentMode=UIViewContentModeScaleAspectFill;
        _tableView.layer.contents=(__bridge id _Nullable)(backGroundImage.CGImage);
        
        
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
