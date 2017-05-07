//
//  tbCollectionViewCell.m
//  167t-UICollectionView总结
//
//  Created by Inspirr Mac on 16/9/6.
//  Copyright © 2016年 Guangzhou Maxspect Electronic Technology Co., LTD. All rights reserved.
//

#import "tbCollectionViewCell.h"

@implementation tbCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"tbCollectionViewCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

//- (void)setImage:(UIImage *)image
//{
//    UIImage* image1 = [UIImage imageNamed:@"tutorial_en_0.jpg"];
//    self.iconImageView.image = image1;
//}

//-(UIImageView*)iconImageView{
//    
//    //    UIImage* image1 = [UIImage imageNamed:@"point.png"];
//    UIImageView* imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//    //    imageView1.image = image1;
//    [self.contentView addSubview:imageView1];
//    return imageView1;
//    
//}



@end
