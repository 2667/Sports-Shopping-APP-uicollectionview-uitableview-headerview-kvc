//
//  BTTopicPictureView.m
//  277t-从子类xib向父类文件中拖控件声明属性
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTTopicPictureView.h"
#import "BTTopic.h"
#import <UIImageView+WebCache.h>
#import <DALabeledCircularProgressView.h>
#import "BTSeeBigViewController.h"

@interface BTTopicPictureView ()

@property (weak, nonatomic) IBOutlet UIImageView *placeholderView;

@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;

@property (weak, nonatomic) IBOutlet UIImageView *gifview;


@end


@implementation BTTopicPictureView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    
    [super awakeFromNib];
    // 初始化
    self.progressView.roundedCorners = 5;
    self.progressView.progressLabel.textColor = [UIColor whiteColor];
    
}


//重写父类topic属性的set方法
-(void)setTopic:(BTTopic *)topic{
    [super setTopic:topic];
    
    [_imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
    
    
    //显示图片,用url给imageview设置图片
//    [_imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // 这个block可能会被调用多次
        if (receivedSize<0 || expectedSize<0) {
            return ;
        }
        // 显示正在下载的提醒
        self.progressView.hidden=NO;
        self.placeholderView.hidden = NO;
        
        // 显示进度值
        CGFloat progress = 1.0* receivedSize/expectedSize;
        self.progressView.progress = progress;
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //下载完毕
        //隐藏正在下载的提醒
        self.progressView.hidden =YES;
        self.placeholderView.hidden = YES;
        
    }];
    
    //是否为gif
    self.gifview.hidden =!topic.is_gif;
    //查看大图
    self.seeBigButton.hidden = !topic.isBigPicture;
    if (topic.isBigPicture) {
//        _imageView.contentMode = UIViewContentModeTop;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds=YES;
    }else{
//        _imageView.contentMode = UIViewContentModeScaleToFill;
         _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds=NO;
    
    }
    
    

}





@end
