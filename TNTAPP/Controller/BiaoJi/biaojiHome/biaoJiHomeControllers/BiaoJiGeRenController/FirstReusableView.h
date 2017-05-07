//
//  ReusableView.h
//  PlainLayout
//
//  Created by hebe on 15/7/30.
//  Copyright (c) 2015年 ___ZhangXiaoLiang___. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FirstReusableViewDelegate <NSObject>

- (IBAction)renWuBtnClicked:(id)sender;

- (IBAction)BiaoJiBtnClicked:(id)sender;


- (IBAction)QuanZiBtnClicked:(id)sender;


- (IBAction)GenDuoBtnClicked:(id)sender;

@end

@interface FirstReusableView : UICollectionReusableView

//@property (nonatomic, strong) NSString *text;

 @property (nonatomic, strong)UILabel *leftLabel;
@property (nonatomic, strong)UILabel *rightLabel;
@property(nonatomic,weak)id<FirstReusableViewDelegate> delegate;

@end
