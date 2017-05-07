//
//  BTCommentCell.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/23.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTCommentCell.h"
#import "BTUser.h"
#import "BTComment.h"

//#import <AVFoundation/AVFoundation.h>
//#import <MediaPlayer/MediaPlayer.h>

@interface BTCommentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UIImageView *sexView;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;

@property (weak, nonatomic) IBOutlet UIButton *voiceButton;


@end


@implementation BTCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}


-(void)setComment:(BTComment *)comment{
    _comment = comment;
    
    //    if (arc4random_uniform(100) > 50) {
    //        comment.voicetime = arc4random_uniform(60);
    //        comment.voiceuri = @"http://123.mp3";
    //        comment.content = nil;
    //    }
    self.usernameLabel.text = comment.user.username;
    self.contentLabel.text = comment.content;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%zd",comment.like_count];
    [self.profileImageView setHeaderWithURL:comment.user.profile_image];
    NSString* sexImageName = [comment.user.sex isEqualToString:@"m"]?@"Profile_manIcon":@"Profile_womanIcon";
    self.sexView.image = [UIImage imageNamed:sexImageName];
    if (self.comment.voiceurl.length) {
        self.voiceButton.hidden =NO;
        [self.voiceButton setTitle:[NSString stringWithFormat:@"%zd''",comment.voicetime] forState:UIControlStateNormal];
        
    }else{
        self.voiceButton.hidden =YES;
        
    }
    

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
