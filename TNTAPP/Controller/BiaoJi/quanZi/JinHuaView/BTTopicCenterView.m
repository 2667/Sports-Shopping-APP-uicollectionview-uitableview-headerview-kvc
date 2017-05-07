//
//  BTTopicCenterView.m
//  277t-从子类xib向父类文件中拖控件声明属性
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTTopicCenterView.h"
#import "BTSeeBigViewController.h"

//用类扩展为这个类文件扩充一些只能在这个.m文件中才能调用的私有成员变量和私有方法
@interface BTTopicCenterView ()
//从继承于XMGTopicCenterView的之类XMGTopicPictureView的xib中拖过来的
@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end


@implementation BTTopicCenterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+(instancetype)centerView{
    
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
    
}


-(void)awakeFromNib{
    //[super awakeFromNib];
    // 去除默认的autoresizingMask设置
    self.autoresizingMask = UIViewAutoresizingNone;
    // 监听图片点击
    self.imageView.userInteractionEnabled =YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageviewClicked)]];
    
}


-(void)imageviewClicked{
    
    if (self.imageView.image==nil) {
        return;
    }
    BTSeeBigViewController * bigseevc= [[BTSeeBigViewController alloc]init];
    bigseevc.topic =self.topic;
    [self.window.rootViewController presentViewController:bigseevc animated:YES completion:nil];
    
}


@end
