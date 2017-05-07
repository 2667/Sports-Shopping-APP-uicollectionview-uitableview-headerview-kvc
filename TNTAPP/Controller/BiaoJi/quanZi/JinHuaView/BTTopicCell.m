//
//  BTTopicCell.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTTopicCell.h"
#import "BTTopic.h"
#import "BTComment.h"
#import "BTUser.h"
#import "BTTopicPictureView.h"
#import "BTTopicVideoView.h"
#import "BTTopicVoiceView.h"


@interface BTTopicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *profilerImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;

@property (weak, nonatomic) IBOutlet UILabel *text_Label;

@property (weak, nonatomic) IBOutlet UIButton *dingBtn;

@property (weak, nonatomic) IBOutlet UIButton *caiBtn;

@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
/** 评论按钮 */
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

/** 最热评论整体 */
@property (weak, nonatomic) IBOutlet UIView *topCmtView;

@property (weak, nonatomic) IBOutlet UILabel *topCmtContentLabel;
/* 中间控件 */
/** 图片控件 */
@property(nonatomic,weak)BTTopicPictureView* pictureView;
/** 视频控件 */
@property(nonatomic,weak)BTTopicVideoView* videoView;

/** 声音控件 */
@property(nonatomic,weak)BTTopicVoiceView* VoiceView;

@end

@implementation BTTopicCell

#pragma mark 懒加载
-(BTTopicPictureView *)pictureView{

    if (!_pictureView) {
        BTTopicPictureView* pictureview = [BTTopicPictureView centerView];
        _pictureView = pictureview;
        [self.contentView addSubview:pictureview];
    }
    return  _pictureView;
}


-(BTTopicVoiceView *)VoiceView{
    
    if (!_VoiceView) {
        BTTopicVoiceView* VoiceView = [BTTopicVoiceView centerView];
        [self.contentView addSubview:VoiceView];
        _VoiceView = VoiceView;
    }
    return  _VoiceView;
}


-(BTTopicVideoView *)videoView{
    
    if (!_VoiceView) {
        BTTopicVideoView* videoView = [BTTopicVideoView centerView];
        _videoView = videoView;
        [self.contentView addSubview:videoView];
    }
    return  _videoView;
}


- (void)awakeFromNib {
    //[super awakeFromNib];
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    
    _profilerImageView.userInteractionEnabled=YES;
            UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImageViewTouchUpInside:)];
   
           [_profilerImageView addGestureRecognizer:labelTapGestureRecognizer];
    
    
//    profilerImageView
    
    // Initialization code
}


-(void)ImageViewTouchUpInside:(UITapGestureRecognizer *)recognizer{

    NSLog(@"image点击了");
    if ([self.delegate respondsToSelector:@selector(headerImageVieClicked)]) {
        [self.delegate headerImageVieClicked];
        
    }
    

}

/**
 *  这个方法调用非常频繁
 */
-(void)setTopic:(BTTopic *)topic{
    _topic = topic;
    [self.profilerImageView setHeaderWithURL:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    self.text_Label.text = topic.text;
//    [_text_Label sizeToFit];还是不能自动换行
    // 设置底部工具条的数字
    // 弹出emoji表情: control + command + 空格
    [self setUpButton:_dingBtn withNumber:topic.ding andTitle:@"顶"];
    [self setUpButton:_caiBtn withNumber:topic.cai andTitle:@"踩"];
     [self setUpButton:_commentBtn withNumber:topic.comment andTitle:@"评论"];
     [self setUpButton:_repostBtn withNumber:topic.repost andTitle:@"分享"];
    
     // 最热评论
    if (topic.top_cmt) {
        // 有最热评论

        _topCmtView.hidden = NO;
        // 内容
        NSString* content = topic.top_cmt.content;
        // 用户名
        NSString* name = topic.top_cmt.user.username;
        _topCmtContentLabel.text = [NSString stringWithFormat:@"%@ : %@",name,content];
    }else{
        _topCmtView.hidden =YES;
    }
    
    //中间的具体内容
     if (topic.type == BTTopicTypePicture){// 往中间添加图片控件
        self.pictureView.hidden =NO;
        self.videoView.hidden =YES;
          self.VoiceView.hidden =YES;
        self.pictureView.frame = topic.centerViewFrame;
         
       self.pictureView.topic = topic;//数据
    
         
         NSLog(@"yyy_centerViewFramex:%f y:%f w:%f h:%f,",topic.centerViewFrame.origin.x,topic.centerViewFrame.origin.y,topic.centerViewFrame.size.width,topic.centerViewFrame.size.height);
     }else if(topic.type == BTTopicTypeVideo){
         self.videoView.hidden =NO;
         self.pictureView.hidden =YES;
         self.VoiceView.hidden =YES;
         self.videoView.frame = topic.centerViewFrame;
//       self.videoView.frame = CGRectMake(0, 60, 100, 100);
         self.videoView.topic = topic;
         
     }else if (topic.type == BTTopicTypeVoice){
         self.VoiceView.hidden =NO;
         self.pictureView.hidden =YES;
         self.videoView.hidden =YES;
         self.VoiceView.frame = topic.centerViewFrame;
         self.VoiceView.topic = topic;
         
     }else{//文字
        self.pictureView.hidden =YES;
        self.videoView.hidden =YES;
        self.VoiceView.hidden =YES;
    
    }
    
    
}


/**
 *  设置按钮的数字
 *
 *  @param button 按钮
 *  @param number 数字
 *  @param title  数字为0时显示的文字
 */

-(void)setUpButton:(UIButton*)btn withNumber:(NSInteger)number andTitle:(NSString*)title{

    if (number>=10000) {
        if (btn==_dingBtn) {
            [btn setTitle:[NSString stringWithFormat:@"浏览%.1f次",number/10000.0] forState:UIControlStateNormal];
        }else{
         [btn setTitle:[NSString stringWithFormat:@"%.1f",number/10000.0] forState:UIControlStateNormal];
        
        }
       
    }else if(number==0){
        [btn setTitle:title forState:UIControlStateNormal];
    
    }else{
        if (btn==_dingBtn) {
           
            [btn setTitle:[NSString stringWithFormat:@"浏览%zd次",number] forState:UIControlStateNormal];
        }else{
         [btn setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
        }
       
    
    }

}


-(void)setFrame:(CGRect)frame{
    frame.origin.y += XMGMargin;
     frame.size.height -= XMGMargin;
    [super setFrame:frame];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





- (IBAction)moreBtnClicked:(id)sender {
    // iOS8之前
    // UIAlertView
    // UIActionSheet;
    
    // iOS8开始
    // UIAlertController == UIAlertView + UIActionSheet
    UIAlertController* alert= [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
      // 添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        TNTLog(@"点击了收藏");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        TNTLog(@"点击了举报");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        TNTLog(@"点击了取消");
    }]];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
}


@end
