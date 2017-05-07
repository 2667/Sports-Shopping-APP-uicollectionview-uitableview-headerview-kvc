//
//  tbCollectionViewController.m
//  167t-UICollectionView总结
//
//  Created by Inspirr Mac on 16/9/5.
//  Copyright © 2016年 Guangzhou Maxspect Electronic Technology Co., LTD. All rights reserved.
//

#import "XiangCeViewController.h"
//相册页面cell
#import "tbCollectionViewCell.h"
#import "ReusableView.h"
#import "xiangCeLieBiaoBieRenVC.h"
#import "FirstReusableView.h"
//#import "XiangCeHeader2View.h"

//static float HeaderView_height = 136;//headerview高度
#define HeaderView_height ((SCREEN_WIDTH-3)/4+43)
#define Header2View_height 41

@interface XiangCeViewController ()<FirstReusableViewDelegate>

// 全局记录当前应该显示图片的索引
@property (nonatomic, assign) NSInteger currentIndex;


@end

@implementation XiangCeViewController

//static NSString *cellID = @"cellID";
static NSString *headerID = @"headerID";

static NSString *section0HeaderID = @"section0HeaderID";

static NSString *footerID = @"footerID";

static NSString * const reuseIdentifier = @"Cell";


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.collectionView];
//        [self loadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    /**
     *  collectionHeaderView
     */
 
    _headerView = [XiangCeHeaderView instance];
    
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, HeaderView_height);
    
    /*
    [_headerView.renWuBtn addTarget:self action:@selector(renWuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    */
    
    _header2View = [XiangCeHeader2View instance];
    
    _header2View.frame = CGRectMake(0, 0, SCREEN_WIDTH, Header2View_height);
    _headerView.delegate = self;
    
//    _headerView = [[XiangCeHeaderView alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH, HeaderView_height)];
//    _headerView.backgroundColor = [UIColor blackColor];
  
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}


#pragma mark headerbtn代理方法
-(void)renWuBtnClicked:(id)sender{
    
    
    //隐藏tabbar
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
    xiangCeLieBiaoBieRenVC *xiangCeLieBiaoVC= [[xiangCeLieBiaoBieRenVC alloc]init];
    
    // 取出当前的导航控制器
//    MyTabBar *tabBarVc = (MyTabBar *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([self.delegate respondsToSelector:@selector(ZhuYePushController:)]) {
        
        [self.delegate ZhuYePushController:xiangCeLieBiaoVC];
        
    }

    
    
//    self.presentationController
//    [self presentViewController:xiangCeLieBiaoVC animated:YES completion:^{
//
//    }];
    
}

-(void)BiaoJiBtnClicked:(id)sender{}

-(void)QuanZiBtnClicked:(id)sender{}

-(void)GenDuoBtnClicked:(id)sender{}


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
        CGFloat headerHeight = 93;
        //设置headerView的尺寸大小
        _FlowLayout1.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, headerHeight);//头部大小
        
//        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, 200) collectionViewLayout:_FlowLayout1];
        
        
        // 设置滚动视图的属性
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
//  _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44) collectionViewLayout:_FlowLayout1];
        
        //
        //uicollectionview时让顶部随着底部一起滚动.
//    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 244, SCREEN_WIDTH, SCREEN_HEIGHT-44) collectionViewLayout:_FlowLayout1];
       
        
        //uicollectionview时不让顶部随着底部一起滚动.
 _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 244, SCREEN_WIDTH, SCREEN_HEIGHT-288) collectionViewLayout:_FlowLayout1];
        
        
//        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 294, SCREEN_WIDTH, SCREEN_HEIGHT-44) collectionViewLayout:_FlowLayout1];
        

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:NSStringFromClass([BiaoJiQuanZiTableViewCell class])];
        
        //        [_tableView registerClass:[BiaoJiQuanZiTableViewCell class] forCellReuseIdentifier:@"BiaoJiQuanZiTableViewCell"];
        
        //注册Cell，必须要有
        [_collectionView registerClass:[tbCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        
        //     [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        
        [_collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:headerID];
           [_collectionView registerClass:[FirstReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:section0HeaderID];
        
        
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
    return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    tbCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
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
    
    return cell;
}




#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-3)/4, (SCREEN_WIDTH-3)/4);
}



//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 5, 0);
    
}

//这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 1;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
//    if (kind==UICollectionElementKindSectionFooter) {
//        
//        ReusableView *footer = [collectionView  dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerID forIndexPath:indexPath];
//        footer.backgroundColor = [UIColor yellowColor];
//        footer.leftLabel.text = [NSString stringWithFormat:@"第%ld个分区的footer",indexPath.section];
//        return footer;
//    }
    
    //不是footer,自然就是header了
    if (indexPath.section ==0) {
        FirstReusableView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:section0HeaderID forIndexPath:indexPath];
//        header.backgroundColor = indexPath.section%2?[[UIColor blackColor] colorWithAlphaComponent:0.5] : [[UIColor blueColor] colorWithAlphaComponent:0.5];
        header.backgroundColor = [UIColor whiteColor];
    [header addSubview:_headerView];
//    header.leftLabel.text = [NSString stringWithFormat:@"第%ld个分区的header",indexPath.section];
//        header.delegate =self;
        return header;
    }
    
    if (indexPath.section >0) {
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
    
     if (section>0) {
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

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    cell.backgroundColor = [UIColor yellowColor];
    NSLog(@"item======%ld",(long)indexPath.item);
    NSLog(@"row=======%ld",(long)indexPath.row);
    NSLog(@"section===%ld",(long)indexPath.section);
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
