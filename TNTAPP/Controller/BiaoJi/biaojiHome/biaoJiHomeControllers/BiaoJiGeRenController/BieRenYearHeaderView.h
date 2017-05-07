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
@protocol BieRenYearHeaderViewDelegate <NSObject>

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




@interface BieRenYearHeaderView : UICollectionReusableView
//@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property(nonatomic,weak)id<BieRenYearHeaderViewDelegate> delegate;

+(BieRenYearHeaderView*)instance;

//@property (weak, nonatomic) IBOutlet HeaderViewButton *renWuBtn;

//@property (weak, nonatomic) IBOutlet HeaderViewButton *biaoJiBtn;

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end
