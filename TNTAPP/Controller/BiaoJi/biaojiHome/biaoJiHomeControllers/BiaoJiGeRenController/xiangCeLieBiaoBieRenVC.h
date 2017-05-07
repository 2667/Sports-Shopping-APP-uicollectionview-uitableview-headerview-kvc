//
//  tbCollectionViewController.h
//  167t-UICollectionView总结
//
//  Created by Inspirr Mac on 16/9/5.
//  Copyright © 2016年 Guangzhou Maxspect Electronic Technology Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BieRenHeaderView.h"
#import "BieRenHeaderImageView.h"
#import "BieRenYearHeaderView.h"
#import "XiangCeHeader2View.h"
@interface xiangCeLieBiaoBieRenVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// 顶部导航栏
@property (nonatomic, strong) UIView *topView;


// 流水布局
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *FlowLayout1;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong)BieRenHeaderView *headerView;

@property (nonatomic, strong)XiangCeHeader2View *header2View;
@property (nonatomic, strong)BieRenYearHeaderView *YearHeaderView;


@end
