//
//  tbCollectionViewCell.h
//  167t-UICollectionView总结
//
//  Created by Inspirr Mac on 16/9/6.
//  Copyright © 2016年 Guangzhou Maxspect Electronic Technology Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShiJinCollectionViewCell : UICollectionViewCell
//@property (nonatomic, strong) UIImage *image;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

//蒙板
@property (weak, nonatomic) IBOutlet UIImageView *menBanImageView;

@property (weak, nonatomic) IBOutlet UIView *labelBackView;


@property (weak, nonatomic) IBOutlet UILabel *xiangCeNameLabel;


@end
