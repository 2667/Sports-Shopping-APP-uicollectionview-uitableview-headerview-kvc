//
//  tbCollectionViewController.m
//  167t-UICollectionView总结
//
//  Created by Inspirr Mac on 16/9/5.
//  Copyright © 2016年 Guangzhou Maxspect Electronic Technology Co., LTD. All rights reserved.
//

#import "FenZuImagesVC.h"
#import "tbCollectionViewCell.h"
#import "ShiJinCollectionViewCell.h"
#import "ReusableView.h"
#import "BtItemTool.h"
#import "ShangJiaAddView.h"
#import "ShangJiaDeleteView.h"

//#import "XiangCeHeader2View.h"

//static float HeaderView_height = 136;//headerview高度
#define HeaderView_height 210
#define Header2View_height 41
#define HeaderYearView_height 76

@interface FenZuImagesVC ()

// 全局记录当前应该显示图片的索引
@property (nonatomic, assign) NSInteger currentIndex;

//记录编辑按钮有没有点击
@property (nonatomic, assign) BOOL IfBianJiBtnClicked;
@property (nonatomic, strong)ShangJiaDeleteView *DeleteView;

//选择的照片数组
@property (nonatomic, strong)NSMutableArray *SelectedPhotoesArray;

@property (nonatomic, strong)UILabel *TitleLabel;

//ShangJiaAddView

@end

@implementation FenZuImagesVC

//static NSString *cellID = @"cellID";
static NSString *headerID = @"headerID";

static NSString *YearHeaderID = @"YearHeaderID";

static NSString *section0HeaderID = @"section0HeaderID";

static NSString *footerID = @"footerID";

static NSString * const reuseIdentifier = @"ShiJinCollectionViewCell";


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.collectionView];
         [self setNavgationBar];
//        [self loadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    /**
     *  collectionHeaderView
     */
    _headerView = [BieRenHeaderImageView instance];
    
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, HeaderView_height);
    
    _YearHeaderView = [BieRenYearHeaderView instance];
    
    _YearHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, HeaderYearView_height);
    
//    _headerView.frame = CGRectMake(0, 244, SCREEN_WIDTH, HeaderView_height);
    
    _header2View = [XiangCeHeader2View instance];
    
    _header2View.frame = CGRectMake(0, 0, SCREEN_WIDTH, Header2View_height);
    
//    [self setNavgationBar];
    
//    _headerView = [[XiangCeHeaderView alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH, HeaderView_height)];
//    _headerView.backgroundColor = [UIColor blackColor];
  
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

-(NSMutableArray *)SelectedPhotoesArray{
    
        if (_SelectedPhotoesArray == nil) {
          _SelectedPhotoesArray = [NSMutableArray array];

        }
        
        return _SelectedPhotoesArray;
    }


//设置导航栏
-(void)setNavgationBar{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:_topView];
    _topView.backgroundColor = [UIColor blackColor];
    
    CGFloat margin = 10;
    //导航栏高度
    CGFloat topMargin = 24;
    //设置导航栏标题
    
//    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin, 24, 40, 40)];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.text = @"标记";
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.font = [UIFont systemFontOfSize:20];
    
          UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(margin, topMargin,40, 40)];
    [button setImage:[UIImage imageNamed:@"biaojishouye_fanhui"] forState:UIControlStateNormal];

            [button addTarget:self action:@selector(LeftBackButtonClicked:)
             forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:button];
    
    CGFloat labelW = 120;
     CGFloat labelH = 40;
    //初始化
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH- labelW)/2, topMargin,labelW, labelH)];
    
    
    label.backgroundColor = [UIColor clearColor];
    [_topView addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.text =@"门面";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    _TitleLabel = label;
//    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-margin-40-45, 24,40, 40)];
//    [rightButton setImage:[UIImage imageNamed:@"gerenzhuye_xinjian"] forState:UIControlStateNormal];
//    
//    [rightButton addTarget:self action:@selector(rightAddButtonClicked:)
//     forControlEvents:UIControlEventTouchUpInside];
//
//    [_topView addSubview:rightButton];
    
    
    UIButton *rightTextButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-margin-40, 24,40, 40)];
//   [rightTextButton setImage:[UIImage imageNamed:@"biaojishouye_fabiao"] forState:UIControlStateNormal];
    [rightTextButton setTitle:@"选择" forState:UIControlStateNormal];
    [rightTextButton setTitle:@"取消" forState:UIControlStateSelected];
//    [rightTextButton setTintColor:[UIColor orangeColor]];
    [rightTextButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
     [rightTextButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [rightTextButton addTarget:self action:@selector(rightTextButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [_topView addSubview:rightTextButton];

    
    
    /** 初始化下拉菜单 */
//    [self setupDropDownMenu:self.navigationItem.rightBarButtonItem];
    
//    NSLog(@"rightBarButtonItem.customView.centerX是%f",self.navigationItem.rightBarButtonItem.customView.center.x);
//    NSLog(@"leftBarButtonItem.customView.centerX%f",self.navigationItem.leftBarButtonItem.customView.center.x);
//    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f]];
    
//    _topView.backgroundColor = [UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f];
    
    //    去掉UINavigationBar底部的分割线
    
    //导航栏背景透明
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
   
    
}


#pragma mark 点击导航栏按钮
-(void)LeftBackButtonClicked:(UIButton*)btn{
    
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}



-(void)rightAddButtonClicked:(UIButton*)btn{
    if (!_DeleteView) {
        [self.view addSubview:self.DeleteView];
        
        [UIView animateWithDuration:1
                              delay:0.1
             usingSpringWithDamping:0.9
              initialSpringVelocity:1
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                            
                           _DeleteView.frame = CGRectMake(0, SCREEN_HEIGHT-50,SCREEN_WIDTH, 50);
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        
        
    }else{
        [_DeleteView removeFromSuperview];
        _DeleteView=nil;
    
    }
    
}



-(void)rightTextButtonClicked:(UIButton*)btn{
    if (btn.selected==NO) {
        btn.selected=YES;
        _IfBianJiBtnClicked = YES;
        [_collectionView reloadData];
        
        _TitleLabel.text = @"已选择3张照片";
        [self rightAddButtonClicked:btn];
        
    }else{
        btn.selected=NO;
        _IfBianJiBtnClicked = NO;
        [_collectionView reloadData];
       [self rightAddButtonClicked:btn];
        
    }
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [_DeleteView removeFromSuperview];
    _DeleteView = nil;

}

-(ShangJiaDeleteView *)DeleteView{

    if (!_DeleteView) {}
    _DeleteView = [ShangJiaDeleteView instance];
    
    _DeleteView.frame = CGRectMake(0, SCREEN_HEIGHT,SCREEN_WIDTH, 50);
//     _DeleteView.frame = CGRectMake((SCREEN_WIDTH-255)/2, (SCREEN_HEIGHT-155)/2,0, 0);
//    languageView.imageIcon.image = [UIImage imageNamed:@"Language icon"];

    return _DeleteView;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        // 设置 Collection 的布局属性
        // 行间距
        _FlowLayout1=[[UICollectionViewFlowLayout alloc] init];
//        _FlowLayout1.minimumLineSpacing = 1;
        
//        _FlowLayout1.itemSize = CGSizeMake((SCREEN_WIDTH-3)/4, (SCREEN_WIDTH-3)/4);
//        _FlowLayout1.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//        _FlowLayout1.naviHeight = 44.0;
        
        // item之间的间距
//        _FlowLayout1.minimumInteritemSpacing = 20;
         _FlowLayout1.minimumInteritemSpacing = 1;
        
//      (SCREEN_WIDTH-3)/4
        
        // 每一个小格子的尺寸，希望是全屏
        //    _FlowLayout1.itemSize = self.view.bounds.size;
        //    _FlowLayout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _FlowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat headerHeight = 0;
        //设置headerView的尺寸大小
        _FlowLayout1.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, headerHeight);//头部大小
        
//        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, 200) collectionViewLayout:_FlowLayout1];
        
        
        // 设置滚动视图的属性
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        

//    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 244, SCREEN_WIDTH, SCREEN_HEIGHT-44) collectionViewLayout:_FlowLayout1];
_collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:_FlowLayout1];
        

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:NSStringFromClass([BiaoJiQuanZiTableViewCell class])];
        
        //        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:@"BiaoJiQuanZiTableViewCell"];
        
        //注册Cell，必须要有
//        [_collectionView registerClass:[tbCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        [_collectionView registerClass:[ShiJinCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        
        //     [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        
        [_collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:headerID];
        
         [_collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:YearHeaderID];
        
           [_collectionView registerClass:[BieRenHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:section0HeaderID];
        
        
        [_collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:footerID];
        
        //     [self.collectionView registerNib:[UINib nibWithNibName:@"tbCollectionViewCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
        //去掉cell默认的分割线
//        _tableView.separatorStyle = NO;
        
//        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 242)];
//        tableHeaderView.backgroundColor = [UIColor whiteColor];
        
        //        tableHeaderView.backgroundColor = [UIColor colorWithRed:61/255.0f green:64/255.0f blue:68/255.0f alpha:1.0];
        
//        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(182, 0, 0, 0);
//        _tableView.tableHeaderView = tableHeaderView;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}




-(void)setFlowLayout{
    // 设置 Collection 的布局属性
    // 行间距
      _FlowLayout1=[[UICollectionViewFlowLayout alloc] init];
    _FlowLayout1.minimumLineSpacing = 10;
    
     // item之间的间距
    _FlowLayout1.minimumInteritemSpacing = 20;
    // 每一个小格子的尺寸，希望是全屏
//    _FlowLayout1.itemSize = self.view.bounds.size;
//    _FlowLayout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _FlowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, 200) collectionViewLayout:_FlowLayout1];
    
    
    // 设置滚动视图的属性
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    // 初始显示第一页
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
//    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    // 最初显示第0张图片
//    self.currentIndex = 0;


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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
//    if (0==section) {
//        return 6;
//    } else if(1==section){
//        return 2;
//    }else if(2==section){
//        return 6;
//    }else{
//        return 6;
//    }
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShiJinCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
     BOOL ifSelectedImage = NO;
    
    for (NSNumber *number in _SelectedPhotoesArray) {
        NSNumber *nuber1 = [NSNumber numberWithInteger:indexPath.row];
       
        if ( [number isEqualToNumber:nuber1]) {
            ifSelectedImage = YES;
            
 
        } else {
            
//            ifSelectedImage=NO;
            
        }
       
    }
    if (ifSelectedImage==YES) {
        cell.deleteBtn.hidden = NO;
        [cell.deleteBtn setImage:[UIImage imageNamed:@"gerenzhuye_gouxuan"] forState:UIControlStateNormal];
        cell.labelBackView.hidden = NO;
        cell.xiangCeNameLabel.hidden = NO;
    }else{
    
        cell.deleteBtn.hidden = YES;
        cell.labelBackView.hidden = YES;
        cell.xiangCeNameLabel.hidden = YES;
    
    }
    
    
    
    
//   UIImage* image1 = [UIImage imageNamed:@"point.png"];
//    UIImageView* imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//    imageView1.image = image1;
//    [cell.contentView addSubview:imageView1];
    
//    cell.iconImageView.image = [UIImage imageNamed:@"point.png"];
//    NSLog(@"iconImageView.frame内容是%@",cell.iconImageView.frame);
//    cell.image = [UIImage imageNamed:@"point.png"];
//    cell.image =;
    
//    cell.backgroundColor = [UIColor redColor];
    
    // Configure the cell
    
    if (_IfBianJiBtnClicked==NO) {
        cell.deleteBtn.hidden=YES;
    } else {
        cell.deleteBtn.hidden=NO;
 
    }
    return cell;
}




#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-40)/3, (SCREEN_WIDTH-40)/3);
}


//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
//    return UIEdgeInsetsMake(0, 0, 5, 0);
    //分别为上、左、下、右
    return UIEdgeInsetsMake(15,10, 10, 10);
    
}

//这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}


/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    

    //不是footer,自然就是header了
    if (indexPath.section ==0) {
        BieRenHeaderView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:section0HeaderID forIndexPath:indexPath];

        header.backgroundColor = [UIColor whiteColor];
    [header addSubview:_headerView];

        return header;
    }else if (indexPath.section ==1) {

        ReusableView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
        header.backgroundColor =[UIColor whiteColor];
//      [header addSubview:_header2View];
        header.leftLabel.text = [NSString stringWithFormat:@"1月%zd日",26-indexPath.section];
        header.rightLabel.text = [NSString stringWithFormat:@"来自标记"];
        return header;
    }else if (indexPath.section ==2) {
        //      if (indexPath.section >=0) {
        ReusableView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:YearHeaderID forIndexPath:indexPath];
        header.backgroundColor =[UIColor whiteColor];
        //      [header addSubview:_header2View];
//        header.leftLabel.text = [NSString stringWithFormat:@"1月%zd日",26-indexPath.section];
//        header.rightLabel.text = [NSString stringWithFormat:@"来自标记"];
        [header addSubview:_YearHeaderView];
        return header;
    }else if (indexPath.section >2) {
        //      if (indexPath.section >=0) {
        ReusableView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
        header.backgroundColor =[UIColor whiteColor];
        //      [header addSubview:_header2View];
        header.leftLabel.text = [NSString stringWithFormat:@"1月%zd日",26-indexPath.section];
        header.rightLabel.text = [NSString stringWithFormat:@"来自标记"];
        return header;
    }
    
    return nil;
}
*/

/*
#pragma mark Header的frame
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
//    if (section>0) {
    if (section==0) {
//    return CGSizeMake(0, 113);
//        return CGSizeMake(SCREEN_WIDTH, (SCREEN_WIDTH-3)/4+43);
        return CGSizeMake(SCREEN_WIDTH, HeaderView_height);

//        return CGSizeMake(0, (SCREEN_WIDTH-3)/4+20);
    
    }
    
     if (section==1) {
        return CGSizeMake(SCREEN_WIDTH, Header2View_height);
    }
    if (section==2) {
        return CGSizeMake(SCREEN_WIDTH, HeaderYearView_height);
    }
    
    if (section>2) {
        return CGSizeMake(SCREEN_WIDTH, Header2View_height);
    }
    
    
    return CGSizeZero;
//     return CGSizeMake(0, 40);
}

#pragma mark Footer的frame
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
    
//    if (section==3) {
//        return CGSizeZero;
//    }
//    return CGSizeMake(0, 20);
}
*/

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    ShiJinCollectionViewCell * cell = (ShiJinCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    BOOL ifSelectedImage = NO;
    
    for (NSNumber *number in _SelectedPhotoesArray) {
        NSNumber *nuber1 = [NSNumber numberWithInteger:indexPath.row];
        
        if ( [number isEqualToNumber:nuber1]) {
            ifSelectedImage = YES;
            
            
        }
        
    }
    
    if (ifSelectedImage == NO) {
        [_SelectedPhotoesArray addObject:@(indexPath.row)];
        [_collectionView reloadData];
    }else{
        [_SelectedPhotoesArray removeObject:@(indexPath.row)];
       
        [_collectionView reloadData];
    
    }
    
    
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
//    cell.backgroundColor = [UIColor yellowColor];
//    NSLog(@"item======%ld",(long)indexPath.item);
//    NSLog(@"row=======%ld",(long)indexPath.row);
//    NSLog(@"section===%ld",(long)indexPath.section);
    
//    cell.deleteBtn
    
}



//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
