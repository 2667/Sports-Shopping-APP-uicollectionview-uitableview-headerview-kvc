//
//  BTRecommendTagCell.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/23.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTRecommendTagCell.h"
#import "BTRecommendTag.h"

@interface BTRecommendTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageListView;

@property (weak, nonatomic) IBOutlet UILabel *themNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;


@end

@implementation BTRecommendTagCell

-(void)setRecommendTag:(BTRecommendTag *)recommendTag{
    _recommendTag = recommendTag;
    //头像
    [self.imageListView setHeaderWithURL:recommendTag.image_list];
    // 名字
    self.themNameLabel.text = recommendTag.theme_name;
    //订阅数
    if (recommendTag.sub_number>=10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人订阅",recommendTag.sub_number/10000.0];
        
    }else{
        
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
        
    }
    
    
}


/**
 *  重写setFrame的作用,监听设置cell的frame的过程
 */
-(void)setFrame:(CGRect)frame{
    frame.size.height -=1;
    [super setFrame:frame];
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
