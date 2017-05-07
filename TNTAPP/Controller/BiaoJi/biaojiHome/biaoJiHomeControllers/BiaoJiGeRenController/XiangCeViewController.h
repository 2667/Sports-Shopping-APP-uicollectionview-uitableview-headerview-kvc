//
//  tbCollectionViewController.h
//  167t-UICollectionView总结
//
//  Created by Inspirr Mac on 16/9/5.
//  Copyright © 2016年 Guangzhou Maxspect Electronic Technology Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XiangCeHeaderView.h"
#import "XiangCeHeader2View.h"

@protocol XiangCeViewControllerDelegate <NSObject>


- (void)ZhuYePushController:(UIViewController*)ViewC;

@end


@interface XiangCeViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,XiangCeHeadViewDelegate>

// 流水布局
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *FlowLayout1;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong)XiangCeHeaderView *headerView;

@property (nonatomic, strong)XiangCeHeader2View *header2View;

@property(nonatomic,weak)id<XiangCeViewControllerDelegate>delegate;
@end
