//
//  BTCommentHeaderView.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/23.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTCommentHeaderView.h"

@interface BTCommentHeaderView ()

/** label */
@property(nonatomic,weak)UILabel* label;
@end


@implementation BTCommentHeaderView


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = TNTCommonBgColor;
        
        // 添加label
        UILabel *label = [[UILabel alloc]init];
        [self.contentView addSubview:label];
        
        //设置label
        label.x= 10;
        label.width =100;
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor darkGrayColor];
        self.label = label;
        
    }
    return self;
}


-(void)setText:(NSString *)text{

    _text = [text copy];
    self.label.text = text;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
