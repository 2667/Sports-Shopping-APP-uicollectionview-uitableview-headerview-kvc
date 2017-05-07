//
//  JQHeaderView.h
//  JQScrollViewDemo
//
//  Created by jianquan on 2016/11/10.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol JQHeaderViewDelegate <NSObject>

-(void)leftButtonClicked:(UIButton*)leftBtn;

-(void)rightButtonClicked:(UIButton*)rightBtn;

@end

@interface JQHeaderView : UIView

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *emailButton;
@property (nonatomic, strong) UILabel *titleLabel;


@property (nonatomic, weak) UITableView *tableView;

@property(nonatomic,copy)NSMutableArray *tableViews;
@property(nonatomic,copy)NSMutableArray *imageNameAndTitleArray;
@property(nonatomic,weak)id<JQHeaderViewDelegate> delegate;

@end
