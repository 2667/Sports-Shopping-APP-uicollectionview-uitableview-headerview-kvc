//
//  JSDTableViewController.m
//  JQBanTangHomeDemo
//
//  Created by jianquan on 2016/12/14.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//ShangJiaRenWuCell

#import "ShangJiaRenWuTableViewController.h"
//#import "ShangJiaRenWuCell.h"
#import "JSDTHomeRecomandModel.h"
#import "ShangJiaRenWuCell.h"

//#import "ShangJiaHeaderRenWuCell.h"
#import "firstRenWuCell.h"

#import "PinJiaHeaderView.h"

//ShangJiaRenWuCell

@interface ShangJiaRenWuTableViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, assign) CGFloat headerLabelHeight;
@property (nonatomic, strong) PinJiaHeaderView *headerView;

@end

@implementation ShangJiaRenWuTableViewController

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


//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        //貌似设置了没什么用
//        [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
//        
////        [tableView setSeparatorInset:UIEdgeInsetsMake(80, 80, 0, 0)];
//        
//    }
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 55;
    } else {
         return 305;
    }
   
//    return 290;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 39;
////    return 227;
////    [self tableView:_tableView viewForHeaderInSection:0];
////    return _headerLabelHeight+20;
//    
//}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 2;
    } else {
       return 3;
    }
    
//    return [self.modelArray count];
}

/*
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    
    _headerView = [[PinJiaHeaderView instance]initWithFrame:CGRectMake
                   (0, 0, SCREEN_WIDTH, 244)];
    PinJiaHeaderView  *headerView = _headerView;
    //    headerView.delegate =self;
    //    [_headerView.guanZhuBtn.button setBackgroundImage:[UIImage imageNamed:@"biaoji_gerenzhuye_guanzhu"] forState:UIControlStateNormal];
    //    NSLog(@"_headerView宽度11是%f",_headerView.frame.size.width);
    headerView.frame =CGRectMake
    (0, 0, SCREEN_WIDTH, 244);
    
    NSLog(@"SCREEN_WIDTH内容是%f",SCREEN_WIDTH);
    
    headerView.backgroundColor = [UIColor blackColor];
    headerView.userInteractionEnabled = YES;
    
    //    //进店看看
//    headerView.moRenView.userInteractionEnabled = YES;
//    UITapGestureRecognizer* singleTapJin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(BianJiBtnClicked:)];
//    [headerView.moRenView.BianJiButton  addGestureRecognizer:singleTapJin];
    
    return  headerView;
}
*/
 
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
    
    if (indexPath.section==0) {
//        [_tableView registerClass:[ShangJiaHeaderRenWuCell class] forCellReuseIdentifier:@"ShangJiaHeaderRenWuCell"];
        
        firstRenWuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstRenWuCell"];
        
        //    static NSString *ID = @"food";
        //    foodCell* cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"firstRenWuCell" owner:nil options:nil] firstObject];
        }
        
        //   if (!cell) {
        //       cell = [[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:nil options:nil][index];
        //       cell.backgroundColor = [UIColor clearColor];
        //   }
        
        //    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
        cell.selectionStyle = NO;    //让单元格无法被选中    此句即可,此时cell里面的button还是可以响应点击事件的.
        
//        UITableViewCell *cell = [[UITableViewCell alloc]init];
//        cell.backgroundColor = [UIColor blueColor];
        return cell;
 
        
        
    } else {
        
   
    
    ShangJiaRenWuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShangJiaRenWuCell"];
    
//    static NSString *ID = @"food";
//    foodCell* cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
    
    if (nil == cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShangJiaRenWuCell" owner:nil options:nil] firstObject];
    }
    
//   if (!cell) {
//       cell = [[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:nil options:nil][index];
//       cell.backgroundColor = [UIColor clearColor];
//   }
    
//    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
        cell.selectionStyle = NO;    //让单元格无法被选中    此句即可,此时cell里面的button还是可以响应点击事件的.
    return cell;
        
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
//         self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44)];

        _tableView.separatorStyle = UITableViewStyleGrouped;
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        [_tableView registerClass:[ShangJiaRenWuCell class] forCellReuseIdentifier:NSStringFromClass([ShangJiaRenWuCell class])];
        
//         [_tableView registerClass:[ShangJiaHeaderRenWuCell class] forCellReuseIdentifier:@"ShangJiaHeaderRenWuCell"];
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ShangJiaRenWuCell class]) bundle:nil] forCellReuseIdentifier:@"ShangJiaRenWuCell"];
       
         [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([firstRenWuCell class]) bundle:nil] forCellReuseIdentifier:@"firstRenWuCell"];

        
        
        
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
