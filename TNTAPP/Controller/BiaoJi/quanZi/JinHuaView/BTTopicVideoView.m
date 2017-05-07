//
//  BTTopicVideoView.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/21.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTTopicVideoView.h"

#import "BTTopic.h"
#import <UIImageView+WebCache.h>

@interface BTTopicVideoView ()

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *voiceTimeLabel;

@end

@implementation BTTopicVideoView


-(void)setTopic:(BTTopic *)topic{
    [super setTopic:topic];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    NSLog(@"topic.large_image视频图片url内容是%@",topic.large_image);
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topic.playcount];
    
    NSInteger minute = topic.videotime/60;
     NSInteger second = topic.videotime%60;
self.voiceTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
