//
//  biaoJiSelfHeaderView.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/13.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "buttonView.h"
#import "HeaderViewButton.h"
@protocol XiangCeHeadViewDelegate <NSObject>

- (void)renWuBtnClicked:(id)sender;

- (void)BiaoJiBtnClicked:(id)sender;


- (void)QuanZiBtnClicked:(id)sender;


- (void)GenDuoBtnClicked:(id)sender;

@end




@interface XiangCeHeaderView : UICollectionReusableView
//@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property(nonatomic,weak)id<XiangCeHeadViewDelegate> delegate;

+(XiangCeHeaderView*)instance;

@property (weak, nonatomic) IBOutlet HeaderViewButton *renWuBtn;

@property (weak, nonatomic) IBOutlet HeaderViewButton *biaoJiBtn;




@end
