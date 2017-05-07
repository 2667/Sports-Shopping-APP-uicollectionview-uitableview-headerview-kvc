//
//  JQHeaderView.m
//  JQScrollViewDemo
//
//  Created by jianquan on 2016/11/10.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//

#import "JQHeaderView.h"
#import "UIView+Extension.h"
#import "UIImage+JQImage.h"


#define NAVBAR_CHANGE_POINT 50

@interface JQHeaderView()
//@property (nonatomic, strong) UISearchBar *searchBar;
//@property (nonatomic, strong) UIButton *searchButton;
//@property (nonatomic, strong) UIButton *emailButton;
//@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation JQHeaderView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self addSubview:self.searchBar];
        [self addSubview:self.searchButton];
        [self addSubview:self.emailButton];
         [self addSubview:self.titleLabel];
        
        
        
    }
    return self;
}



- (void)willMoveToSuperview:(UIView *)newSuperview {
    
     [super willMoveToSuperview:newSuperview];
    for (UITableView *tableView in self.tableViews) {
        NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        [tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    }
    
   }


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{

    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    UITableView *tableView = (UITableView *)object;
    CGFloat tableViewoffsetY = tableView.contentOffset.y;
    
//    UIColor * color = [UIColor whiteColor];
    UIColor * color = [UIColor grayColor];
    CGFloat alpha = MIN(1, tableViewoffsetY/136);
    
    self.backgroundColor = [color colorWithAlphaComponent:alpha];
    
//    if (tableViewoffsetY < 125){
    if (tableViewoffsetY < 65){
    
        [UIView animateWithDuration:0.25 animations:^{
            self.searchButton.hidden = NO;
//            [self.emailButton setBackgroundImage:[UIImage imageNamed:@"home_email_black"] forState:UIControlStateNormal];
            [self.emailButton setBackgroundImage:[UIImage imageNamed:@"biaoji_gerenzhuye_gengdou"] forState:UIControlStateNormal];
            
//            self.searchBar.frame = CGRectMake(-(self.width-60), 30, self.width-80, 30);
            self.emailButton.alpha = 1-alpha;
//            self.searchButton.alpha = 1-alpha;
            self.titleLabel.alpha = 1-alpha;
            ;
            
            
        }];
//    } else if (tableViewoffsetY >= 125){
         } else if (tableViewoffsetY >= 65){
        
        [UIView animateWithDuration:0.25 animations:^{
//            self.searchBar.frame = CGRectMake(20, 30, self.width-80, 30);
//            self.searchButton.hidden = YES;
            
            self.emailButton.alpha = 1;
//            [self.emailButton setBackgroundImage:[UIImage imageNamed:@"home_email_red"] forState:UIControlStateNormal];
            
//             [self.emailButton setBackgroundImage:[UIImage imageNamed:@"shouye-rili-you"] forState:UIControlStateNormal];
            
            [self.emailButton setBackgroundImage:[UIImage imageNamed:@"biaoji_gerenzhuye_gengdou"] forState:UIControlStateNormal];
            
            
      self.titleLabel.alpha = 1;
            _titleLabel.text = @"Silvia";
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];//加粗
            _titleLabel.textColor = [UIColor whiteColor];
            
            
        }];
        
        
    }
    
}



- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-(self.width-60), 30, self.width-80, 30)];
        _searchBar.placeholder = @"搜索值得买的好物";
        _searchBar.layer.cornerRadius = 15;
        _searchBar.layer.masksToBounds = YES;

        [_searchBar setSearchFieldBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:_searchBar.size] forState:UIControlStateNormal];
        
        [_searchBar setBackgroundImage:[UIImage imageWithColor:[[UIColor grayColor] colorWithAlphaComponent:0.4] size:_searchBar.size] ];
        
        UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
        searchField.textColor = [UIColor whiteColor];
        [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        
        
        
    }
    return _searchBar;
}

- (UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 30, 30)];

        
//        [_searchButton setBackgroundImage:[UIImage imageNamed:@"shoouye-rili-zuo"] forState:UIControlStateNormal];
//        [_searchButton setBackgroundImage:[UIImage imageNamed:_imageNameAndTitleArray[0]] forState:UIControlStateNormal];
        
        [_searchButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _searchButton;
}



- (UIButton *)emailButton {
    if (!_emailButton) {
        _emailButton = [[UIButton alloc] initWithFrame:CGRectMake(self.width-45, 30, 30, 30)];
 
        
//         [_emailButton setBackgroundImage:[UIImage imageNamed:@"shouye-rili-you"] forState:UIControlStateNormal];
        
//         [_emailButton setBackgroundImage:[UIImage imageNamed:_imageNameAndTitleArray[3]] forState:UIControlStateNormal];
       
        
        [_emailButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _emailButton;
}

-(void)leftButtonClicked:(UIButton*)leftBtn{

    if ([self.delegate respondsToSelector:@selector(leftButtonClicked:)]) {
        [self.delegate leftButtonClicked:leftBtn];
    }

}

-(void)rightButtonClicked:(UIButton*)rightBtn{

    if ([self.delegate respondsToSelector:@selector(rightButtonClicked:)]) {
        [self.delegate rightButtonClicked:rightBtn];
    }

}


-(UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat titleWidth = 120;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.centerX-titleWidth/2, 30, titleWidth, 30)];
//        _titleLabel.text = @"Silvia";
//        _titleLabel.text = _imageNameAndTitleArray[1];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];//加粗
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

-(void)dealloc{

//     [tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//    self.delegate = nil;
//    for (UITableView *tableView in self.tableViews) {
//
////        [tableView removeObserver:self forKeyPath:@"contentOffset" context:nil];
//    }
    
    
    
    
//     [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
