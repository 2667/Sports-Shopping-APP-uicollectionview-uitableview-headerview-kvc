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
@protocol BieRenHeaderImageViewDelegate <NSObject>

//- (void)renWuBtnClicked:(id)sender;
//
//- (void)BiaoJiBtnClicked:(id)sender;
//
//
//- (void)QuanZiBtnClicked:(id)sender;
//
//
//- (void)GenDuoBtnClicked:(id)sender;

@end




@interface BieRenHeaderImageView : UICollectionReusableView
//@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property(nonatomic,weak)id<BieRenHeaderImageViewDelegate> delegate;

+(BieRenHeaderImageView*)instance;

@property (weak, nonatomic) IBOutlet HeaderViewButton *renWuBtn;

@property (weak, nonatomic) IBOutlet HeaderViewButton *biaoJiBtn;




@end
