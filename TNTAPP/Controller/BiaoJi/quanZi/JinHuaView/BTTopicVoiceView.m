//
//  BTTopicVoiceView.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTTopicVoiceView.h"
#import "BTTopic.h"
#import <UIImageView+WebCache.h>

@interface BTTopicVoiceView ()

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;


@property (weak, nonatomic) IBOutlet UILabel *playTimelabel;


@end

@implementation BTTopicVoiceView

-(void)setTopic:(BTTopic *)topic{
    [super setTopic:topic];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topic.playcount];;
    NSInteger minute = topic.videotime/60;
    NSInteger second = topic.videotime%60;
    self.playTimelabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
}


@end
