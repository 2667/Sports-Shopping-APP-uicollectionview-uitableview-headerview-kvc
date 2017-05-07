//
//  DiTuLieBiaoTableViewCell.h
//  TNTAPP
//
//  Created by mac on 17/2/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DiTuLieBiaoTableViewCellDelegate <NSObject>

-(void)firstBtnClicked;
-(void)secondBtnClicked;
-(void)thirdBtnClicked;

@end
@interface DiTuLieBiaoTableViewCell : UITableViewCell

@property(nonatomic,weak)id<DiTuLieBiaoTableViewCellDelegate> delegate;
+ (id)returnCell;

@end
