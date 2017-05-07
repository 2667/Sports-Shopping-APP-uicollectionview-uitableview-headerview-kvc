//
//  JSDTableViewController.m
//  JQBanTangHomeDemo
//
//  Created by jianquan on 2016/12/14.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "RenWuZaiBiaoJiVC.h"
#import "RenWuTaYaoCell.h"
#import "RenWuTaNengCell.h"
#import "RenWuPinJiaCell.h"
#import "RenWuPinLunCell.h"
#import "JSDTHomeRecomandModel.h"


//RenWuTaYaoCell

@interface RenWuZaiBiaoJiVC ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, assign) CGFloat headerLabelHeight;

//存放3个label的数组
@property(nonatomic,strong)NSMutableArray *titleLabels;
//当前选中的label
@property (nonatomic, weak) UILabel *currentLabel;
//是否第一次加载
@property (nonatomic, assign) BOOL IsFirstloadOrNot;

@end

@implementation RenWuZaiBiaoJiVC

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
    self.titleLabels = [[NSMutableArray alloc] initWithCapacity:3];
//    _tableView.separatorStyle = NO;
    
    //加这一句才正常
    [self tableView:_tableView viewForHeaderInSection:0];
    
//    _currentLabel = self.titleLabels
    
//    [self setUpViewForHeader];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{

    _currentLabel = self.titleLabels[0];
    [_tableView reloadData];

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
//    }
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 317;
    
    //第一个按钮点击
    if (_currentLabel.tag==600) {
        //ta要cell
        NSLog(@"ta要点击了");
        return 275;
    }else if (_currentLabel.tag==601) {
        //ta能cell
        
        return 317;
    }else if (_currentLabel.tag==602){
        // 评价cell
        if (indexPath.row==0) {
            return 132;
        }else{
        return 166;
            
        }
        
    }
    
    return 317;
    
}

#pragma mark heightForHeaderInSection

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //    [self HeaderLabelHeight];
//    [self tableView:_tableView viewForHeaderInSection:0];
    //    _tableView.tableHeaderView = _tableHeaderView;
//    return _headerLabelHeight+20;
    return 40;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
//    return [self.modelArray count];
    
}


- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{

//- (UIView *)setUpViewForHeader{
    CGFloat headerHeight=40;
//    UIView *v_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headerHeight)];//创建一个视图（v_headerView）
    
    UIView *v_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 264, SCREEN_WIDTH, headerHeight)];//创建一个视图（v_headerView）
    
    _tableHeaderView = v_headerView;
    v_headerView.backgroundColor = [UIColor whiteColor];
//    CGFloat ButtonWidth = SCREEN_WIDTH/3;
//    CGFloat ButtonFontSize= 15;
    CGFloat LabelWidth = SCREEN_WIDTH/3;
    CGFloat LabelFontSize= 18;
    
    for (int i=0; i<3; i++) {

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(LabelWidth*i, 0,LabelWidth, headerHeight)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
//      NSMutableAttributedString *noteStr;
       
        
        switch (i) {
            case 0:
            {
                 label.text = @"Ta要";
//  noteStr = [[NSMutableAttributedString alloc] initWithString:@"Ta要"];
                [self smallRMBByLabel:label font:LabelFontSize];
                

                if (_IsFirstloadOrNot==NO) {
    _currentLabel = label;
                }
              
//                [_tableView reloadData];
            }

                break;
                
            case 1:
            {
                 label.text = @"Ta能";
//                noteStr = [[NSMutableAttributedString alloc] initWithString:@"Ta能"];
                  [self smallRMBByLabel:label font:LabelFontSize];
            }
                break;
            case 2:
            {
//                noteStr = [[NSMutableAttributedString alloc] initWithString:@"评价"];
                label.text = @"评价";
                label.font = [UIFont systemFontOfSize:LabelFontSize];
            }
                break;
            default:
                break;
        }
        label.tag = 600+i;
        [_tableHeaderView addSubview:label];
        _tableHeaderView.userInteractionEnabled = YES;
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(HeaderButtonClicked:)];
        [label addGestureRecognizer:singleTap1];

        label.textColor = [UIColor grayColor];
        [self.titleLabels addObject:label];
        

    }
    

    
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    [style setLineBreakMode:NSLineBreakByWordWrapping];
//    [style setAlignment:NSTextAlignmentRight];
    
    
    //                               }
//    [self.tableView addSubview:_tableHeaderView];
//    self.tableView.tableHeaderView =_tableHeaderView;
    return  v_headerView;
}

- (void)smallRMBByLabel:(UILabel *)label font:(int)font
{
    //label  需要操作的Label
    //font   该字符的字号
    NSMutableAttributedString *noteString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange stringRange = NSMakeRange(0, 2); //该字符串的位置
    [noteString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Alba Matter" size:font] range:stringRange];
    
      NSRange stringRange2 = NSMakeRange([[noteString string] rangeOfString:@"要"].location, [[noteString string] rangeOfString:@"要"].length);
    
//    NSRange stringRange2 = NSMakeRange(1, 3); //该字符串的位置
    [noteString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:stringRange2];
    
    [label setAttributedText: noteString];
}



- (void)smallRMBByLabelForCell:(UILabel *)label font:(int)font
{
    //label  需要操作的Label
    //font   该字符的字号
    NSMutableAttributedString *noteString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange stringRange = NSMakeRange(0, 2); //该字符串的位置
    [noteString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Alba Matter" size:font] range:stringRange];
    
//    NSRange stringRange2 = NSMakeRange([[noteString string] rangeOfString:@"能"].location, [[noteString string] rangeOfString:@"要"].length);
    
    //    NSRange stringRange2 = NSMakeRange(1, 3); //该字符串的位置
//    [noteString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:stringRange2];
    
    [label setAttributedText: noteString];
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
    
    //———— 切换label
//    NSInteger index = [self.titleLabels indexOfObject:label];
    
    //第一个按钮点击
    if (_currentLabel.tag==600) {
        NSLog(@"ta要点击了");
//        self.currentLabel = self.titleLabels[index];
        
        
        RenWuTaYaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RenWuTaYaoCell"];
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"RenWuTaYaoCell" owner:nil options:nil] firstObject];
        }
        
        cell.priceLabel.layer.cornerRadius = 5;
        //设置为yes，就可以使用圆角
        cell.priceLabel.layer.masksToBounds = YES;
        
        //    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
        return cell;

    
    }else if (_currentLabel.tag==601) {
        NSLog(@"ta要点击了");
        //        self.currentLabel = self.titleLabels[index];
        
        
        RenWuTaNengCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RenWuTaNengCell"];
        
        if (nil == cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"RenWuTaNengCell" owner:nil options:nil] firstObject];
        }
        
        cell.priceLabel.layer.cornerRadius = 5;
        //设置为yes，就可以使用圆角
        cell.priceLabel.layer.masksToBounds = YES;
        
        //    cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
        return cell;
        
        
    }else if (_currentLabel.tag==602) {
        //第一行
        if (indexPath.row==0) {
            
            RenWuPinJiaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RenWuPinJiaCell"];
            
            if (nil == cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"RenWuPinJiaCell" owner:nil options:nil] firstObject];
            }
            
            cell.priceLabel.layer.cornerRadius = 5;
            //设置为yes，就可以使用圆角
            cell.priceLabel.layer.masksToBounds = YES;
            cell.selectionStyle = NO;
            
            return cell;
            
        } else if (indexPath.row>0) {
    
            RenWuPinLunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RenWuPinLunCell"];
            
            if (nil == cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"RenWuPinLunCell" owner:nil options:nil] firstObject];
            }
            
            
//            label.text = @"Ta能";
            //                noteStr = [[NSMutableAttributedString alloc] initWithString:@"Ta能"];
            CGFloat LabelFontSize = 14;
    [self smallRMBByLabelForCell:cell.TaNenglabel font:LabelFontSize];
            
            cell.headerBtn.layer.cornerRadius = cell.headerBtn.frame.size.height/2;
            cell.headerBtn.layer.masksToBounds = YES;
            
            cell.priceLabel.layer.cornerRadius = 5;
            //设置为yes，就可以使用圆角
            cell.priceLabel.layer.masksToBounds = YES;
            return cell;
        }
        
        NSLog(@"ta要点击了");
        
    // cell.homeRecomandModel = [self.modelArray objectAtIndex:indexPath.row];
        
//        return cell;
        
    }

    UITableViewCell *cell = [[UITableViewCell alloc]init];

    return cell;

    
    }




  -(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
     
         UILabel *label=(UILabel*)recognizer.view;
     
        NSLog(@"%@被点击了",label.text);
     
    
      
}

#pragma mark 选中某个按钮label
-(void)HeaderButtonClicked:(UITapGestureRecognizer*)recognizer{
    UILabel *label=(UILabel*)recognizer.view;
    NSLog(@"label.tag是%zd",label.tag);
    
    
//    NSInteger index = [self.titleLabels indexOfObject:label];
    
    if (label.tag==600) {
        NSLog(@"ta要点击了");
        self.currentLabel = label;
//        _IsFirstloadOrNot = YES;
        [_tableView reloadData];
    
        
    }else if (label.tag==601) {
        
        self.currentLabel = label;
        _IsFirstloadOrNot = YES;
        [_tableView reloadData];
        
        NSLog(@"taneng点击了");
        
    }else if (label.tag==602) {
        NSLog(@"pinjia要点击了");
        
        self.currentLabel = label;
        _IsFirstloadOrNot = YES;
        [_tableView reloadData];
        
    }else{
     NSLog(@"mm点击了");
    
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
        
//        _tableView.separatorStyle = UITableViewStyleGrouped;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        [_tableView registerClass:[RenWuTaYaoCell class] forCellReuseIdentifier:NSStringFromClass([RenWuTaYaoCell class])];
        
        //        [_tableView registerClass:[RenWuTaYaoCell class] forCellReuseIdentifier:@"RenWuTaYaoCell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RenWuTaYaoCell class]) bundle:nil] forCellReuseIdentifier:@"RenWuTaYaoCell"];
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RenWuTaNengCell class]) bundle:nil] forCellReuseIdentifier:@"RenWuTaNengCell"];
        
     [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RenWuPinJiaCell class]) bundle:nil] forCellReuseIdentifier:@"RenWuPinJiaCell"];
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RenWuPinLunCell class]) bundle:nil] forCellReuseIdentifier:@"RenWuPinLunCell"];

        
        //去掉cell默认的分割线
        _tableView.separatorStyle = NO;
        _tableView.separatorColor = [UIColor clearColor];
        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 242)];
        //背景色
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

-(void)viewDidDisappear:(BOOL)animated{
    _IsFirstloadOrNot = NO;

}

@end
