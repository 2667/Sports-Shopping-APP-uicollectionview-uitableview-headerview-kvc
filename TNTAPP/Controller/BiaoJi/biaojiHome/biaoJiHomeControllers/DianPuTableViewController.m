//
//  JSDTableViewController.m
//  JQBanTangHomeDemo
//
//  Created by jianquan on 2016/12/14.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "DianPuTableViewController.h"
#import "YouHuiCell.h"
#import "ShiJinCell.h"
#import "JSDTHomeRecomandModel.h"
#import "DianPuHeaderView.h"
#import "ShangJiaShiJinVC.h"
#import "ShangPinYouHuiVC.h"

//YouHuiCell

@interface DianPuTableViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong)DianPuHeaderView  *headerView;
//
@property (nonatomic, assign) CGFloat headerLabelHeight;

@end

@implementation DianPuTableViewController

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
    _headerLabelHeight = 245;
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
    if (indexPath.section==0) {
        return  230+15;
    } else {
        //20底部流出一点空白
        return 130+80;
    }
//    return 130;
//    return 290;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    [self tableView:_tableView viewForHeaderInSection:0];
//
//    return _headerLabelHeight+35;
    if (section==0) {
        return _headerLabelHeight;
    } else {
        return 0;
    }
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.modelArray count];
    return 1;
}


- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
   
  _headerView = [[DianPuHeaderView instance]initWithFrame:CGRectMake
                   (0, 0, SCREEN_WIDTH, 244)];
    DianPuHeaderView  *headerView = _headerView;
//    headerView.delegate =self;
    //    [_headerView.guanZhuBtn.button setBackgroundImage:[UIImage imageNamed:@"biaoji_gerenzhuye_guanzhu"] forState:UIControlStateNormal];
//    NSLog(@"_headerView宽度11是%f",_headerView.frame.size.width);
    headerView.frame =CGRectMake
    (0, 0, SCREEN_WIDTH, 244);
    
    NSLog(@"SCREEN_WIDTH内容是%f",SCREEN_WIDTH);
    
    headerView.backgroundColor = [UIColor blackColor];
    headerView.userInteractionEnabled = YES;
    
//    //进店看看
    headerView.moRenView.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTapJin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(BianJiBtnClicked:)];
    [headerView.moRenView.BianJiButton  addGestureRecognizer:singleTapJin];
    
    
    //    //进店看看
    headerView.SelectView.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTapCaiDan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wangCenBtnClicked:)];
    [headerView.SelectView.wangCenButton  addGestureRecognizer:singleTapCaiDan];
    
    return  headerView;
}


//解决kvo监听tableview上移时headerview移动一点就悬停的问题.
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat sectionHeaderHeight = 227;
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        
        
        
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        
        
        
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        
    }
    
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

-(void)BianJiBtnClicked:(UIButton*)btn{
    _headerView.moRenView.hidden =YES;
    _headerView.SelectView.hidden =NO;


}

-(void)wangCenBtnClicked:(UIButton*)btn{
     _headerView.SelectView.hidden =YES;
    _headerView.moRenView.hidden =NO;
   
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        YouHuiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YouHuiCell"];
        //    YouHuiCell
        //    static NSString *ID = @"food";
        //    foodCell* cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"YouHuiCell" owner:nil options:nil] firstObject];
        }
        
        //   if (!cell) {
        //       cell = [[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:nil options:nil][index];
        //       cell.backgroundColor = [UIColor clearColor];
        //   }
        
        //    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
        return cell;

    } else {
        ShiJinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShiJinCell"];
        //    YouHuiCell
        //    static NSString *ID = @"food";
        //    foodCell* cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ShiJinCell" owner:nil options:nil] firstObject];
        }
        
        //   if (!cell) {
        //       cell = [[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:nil options:nil][index];
        //       cell.backgroundColor = [UIColor clearColor];
        //   }
        
        //    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
        return cell;

    }
    
    
    
    }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        
        ShangJiaShiJinVC *ShangJiaShiJinVC1 = [[ShangJiaShiJinVC alloc]init];
        [self presentViewController:ShangJiaShiJinVC1 animated:YES completion:^{
            
        }];
        
    } else {
        
        ShangPinYouHuiVC *ShangJiaShiJinVC1 = [[ShangPinYouHuiVC alloc]init];
        [self presentViewController:ShangJiaShiJinVC1 animated:YES completion:^{
            
        }];
        
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

        _tableView.separatorStyle = UITableViewStyleGrouped;
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        [_tableView registerClass:[YouHuiCell class] forCellReuseIdentifier:NSStringFromClass([YouHuiCell class])];
        
//        [_tableView registerClass:[YouHuiCell class] forCellReuseIdentifier:@"YouHuiCell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YouHuiCell class]) bundle:nil] forCellReuseIdentifier:@"YouHuiCell"];
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ShiJinCell class]) bundle:nil] forCellReuseIdentifier:@"ShiJinCell"];
        
        
        
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
