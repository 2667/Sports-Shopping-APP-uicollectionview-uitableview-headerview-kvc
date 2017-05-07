//
//  MJViewController.m
//  04-图片浏览器
//
//  Created by apple on 14-3-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

// strong : 一般对象
// weak : UI控件

#define MJIconKey @"icon"
#define MJDescKey @"desc"

#import "DiTuTanChuanViewController.h"
#import "BtItemTool.h"

@interface DiTuTanChuanViewController ()
- (IBAction)previous;
- (IBAction)next;
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UILabel *noLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property(nonatomic,strong) NSMutableArray *arrayImageName;

// 记录当前显示的是第几张图片
@property (nonatomic, assign) int index;

// 图片数据集合
@property (nonatomic, strong) NSArray *imageData;
@end

@implementation DiTuTanChuanViewController

-(void)viewWillAppear:(BOOL)animated{

    //两个都不能少,否则出现tabbar不能显示却能点击的情况
    self.tabBarController.tabBar.hidden = YES;

    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 默认显示index为0对应的数据
    [self changeData];
    
    [self setNavigationBar];
    
}

-(void)setNavigationBar{

    //设置导航栏标题
    //    self.navigationItem.title = @"标记";
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"关注";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
    //    NSLog(@"",self.navigationItem.title);
    
    self.navigationItem.titleView = titleLabel;
    //    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.leftBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fanhui" highImage:@"biaojishouye_fanhui" target:self action:@selector(LeftBackButtonClicked:)];
    
    
    
    self.navigationItem.rightBarButtonItem = [BtItemTool itemWithImage:@"biaojishouye_fabiao" highImage:@"biaojishouye_fabiao" target:self action:@selector(rightCameraButtonClicked:)];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:40/255.0f green:44/255.0f blue:49/255.0f alpha:1.0f]];
    
}

-(void)LeftBackButtonClicked:(UIButton*)btn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)rightCameraButtonClicked:(UIButton*)btn{
    
    
}

- (NSArray *)imageData
{
    if (_imageData == nil) { // 从未初始化
        // 初始化数据
        // File : 全路径
        // NSBundle : 一个NSBundle代表一个文件夹

        // 利用mainBundle就可以访问软件资源包中的任何资源
        NSBundle *bundle = [NSBundle mainBundle];
        
        //  获得imageData.plist的全路径
        NSString *path = [bundle pathForResource:@"imageData" ofType:@"plist"];
        
        _imageData = [NSArray arrayWithContentsOfFile:path];
        
  
    }
    return _imageData;
}

- (NSMutableArray *)arrayImageName
{
    if (_arrayImageName==nil) {
        
        _arrayImageName = [NSMutableArray array];
//        for (int i=1; i<4; i++) {
//            NSString *imageName = [NSString stringWithFormat:@"beauty%d",i];
//            [_arrayImageName addObject:imageName];
//        }
         [_arrayImageName addObjectsFromArray:@[@"beauty1",@"beauty2",@"beauty3"]];
        
    }
    
    NSLog(@"arrayImageName内容是%@",_arrayImageName);
    
    return _arrayImageName;

}

#pragma mark 改变数据
- (void)changeData
{
    // 1.改变数据
    self.noLabel.text = [NSString stringWithFormat:@"%d/%d", self.index + 1, self.imageData.count];
    
   
    // 2.取出index对应的字典数据
    NSDictionary *imageDict = self.imageData[self.index];
    
    
    // 3.设置图片
//    self.iconView.image = [UIImage imageNamed:imageDict[MJIconKey]];
    NSLog(@"self.index内容是%d",self.index);
    self.iconView.image = [UIImage imageNamed:self.arrayImageName[self.index]];
//    self.iconView.image = [UIImage imageNamed:@"beauty1"];
    
    // 4.设置描述
    self.descLabel.text = imageDict[MJDescKey];
    
    // 5.改变按钮状态
    self.previousBtn.enabled = (self.index != 0);
    self.nextBtn.enabled = (self.index != self.imageData.count - 1);
}

#pragma mark 上一张
- (IBAction)previous {
    if (self.index>0) {
        // 1.减小索引
        --self.index;
        
        // 2.改变数据
        [self changeData];
    }else if (self.index<=0) {
        // 1.减小索引
       self.index=2;
        
        // 2.改变数据
        [self changeData];
    }

   
}

#pragma mark 下一张
- (IBAction)next {
    if (self.index<=1){
        // 1.增加索引
        ++self.index;
    
    // 2.根据索引显示对应的内容
    [self changeData];
    }else if(self.index>1){
        self.index= 0;
        [self changeData];
        
    }

}
@end
