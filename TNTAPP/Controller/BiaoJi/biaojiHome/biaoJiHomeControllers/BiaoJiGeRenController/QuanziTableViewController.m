//
//  JSDTableViewController.m
//  JQBanTangHomeDemo
//
//  Created by jianquan on 2016/12/14.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "QuanziTableViewController.h"
#import "BiaoJiQuanZiTableViewCell.h"
#import "JSDTHomeRecomandModel.h"

//BiaoJiQuanZiTableViewCell

@interface QuanziTableViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, assign) CGFloat headerLabelHeight;

@end

@implementation QuanziTableViewController

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


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    [self HeaderLabelHeight];
    [self tableView:_tableView viewForHeaderInSection:0];
//    _tableView.tableHeaderView = _tableHeaderView;
    return _headerLabelHeight+20;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.modelArray count];
}


- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    ;
    UIView *v_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];//创建一个视图（v_headerView）
    _tableHeaderView = v_headerView;
    v_headerView.backgroundColor = [UIColor clearColor];
//    CGFloat labelWidth = SCREEN_WIDTH-135;
    CGFloat labelWidth = SCREEN_WIDTH-SCREEN_WIDTH*1.5/5;
    CGFloat labelFont= 15;
    UILabel *v_headerLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-10-labelWidth, 0, labelWidth, 70)];//创建一个UILable（v_headerLab）用来显示标题
    v_headerLab.backgroundColor = [UIColor clearColor];//设置v_headerLab的背景颜色
    v_headerLab.textColor = [UIColor blackColor];//设置v_headerLab的字体颜色
    v_headerLab.numberOfLines = 0;
//    v_headerLab.font = [UIFont fontWithName:@"Arial" size:13];//设置v_headerLab的字体样式和大小
    v_headerLab.font = [UIFont systemFontOfSize:labelFont];
    v_headerLab.adjustsFontSizeToFitWidth = YES;
    
    [v_headerView addSubview:v_headerLab];
    
    //设置每组的标题
//    if (section == 0) {
    
    v_headerLab.text = @"拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航";
//    _headerLabel = v_headerLab;
//        
//        // 设置文字属性 要和label的一致
//        NSDictionary *attrs = @{NSFontAttributeName : v_headerLab.font};
//        CGSize maxSize = CGSizeMake(SCREEN_WIDTH-100, MAXFLOAT);
//        
//        // 计算文字占据的宽度
//        CGSize size = [_headerLabel.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
//        _headerLabelHeight = size.height;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByWordWrapping];
        [style setAlignment:NSTextAlignmentRight];
        
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:labelFont], NSParagraphStyleAttributeName : style};
        CGSize size = [v_headerLab.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil].size;
         _headerLabelHeight = size.height;
        NSLog(@"_headerLabelHeight内容是%f",_headerLabelHeight);
//        return size;
        
//                               }
    
    
    return  v_headerView;
}

/*
-(void)HeaderLabelHeight{
    
    _headerLabel.text = @"拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航拍品导航";
    _headerLabel.font = [UIFont systemFontOfSize:15];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    [style setAlignment:NSTextAlignmentCenter];
    
    NSDictionary *dic = @{NSFontAttributeName : _headerLabel.font, NSParagraphStyleAttributeName : style};
    CGSize size = [_headerLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil].size;
    _headerLabelHeight = size.height;
    NSLog(@"_headerLabelHeight内容是%f",_headerLabelHeight);
    //        return size;


}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BiaoJiQuanZiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BiaoJiQuanZiTableViewCell"];
    
//    static NSString *ID = @"food";
//    foodCell* cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
    
    if (nil == cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BiaoJiQuanZiTableViewCell" owner:nil options:nil] firstObject];
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

        _tableView.separatorStyle = UITableViewStyleGrouped;
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:NSStringFromClass([BiaoJiQuanZiTableViewCell class])];
        
//        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:@"BiaoJiQuanZiTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BiaoJiQuanZiTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"BiaoJiQuanZiTableViewCell"];
        //去掉cell默认的分割线
        _tableView.separatorStyle = NO;
        
        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 242)];

         tableHeaderView.backgroundColor = [UIColor whiteColor];
        
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
