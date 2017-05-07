//
//  SCXXCell.h
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/21.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCXXCell : UITableViewCell

@property (nonatomic,strong) UILabel * shijian;

//**************商城消息***********
@property (nonatomic,strong) UIView * scdikuan;

@property (nonatomic,strong) UILabel * scfukuancenggong;

@property (nonatomic,strong) UILabel * scriqi;

@property (nonatomic,strong) UILabel * scjiage;

@property (nonatomic,strong) UIView * scxian1;

@property (nonatomic,strong) UILabel * scfukuanfs;

@property (nonatomic,strong) UILabel * scfukuanfs2;

@property (nonatomic,strong) UILabel * scjiaoyidueixiang;

@property (nonatomic,strong) UILabel * scjiaoyidueixiang2;

@property (nonatomic,strong) UILabel * scspshuoming;

@property (nonatomic,strong) UILabel * scspshuoming2;

@property (nonatomic,strong) UIView * scxian2;

@property (nonatomic,strong) UILabel * scchakanxiangqing;

@property (nonatomic,strong) UIImageView * scjiantou;



//**************通知消息***********
@property (nonatomic,strong) UIView * tzdikuan;

@property (nonatomic,strong) UILabel * tzhongdian;

@property (nonatomic,strong) UILabel * tzbiaoting;

@property (nonatomic,strong) UIImageView * tztupian;

@property (nonatomic,strong) UILabel * tzshuoming;



//**************系统消息***********
@property (nonatomic,strong) UIView * xtdikuan;

@property (nonatomic,strong) UIImageView * xttupian;

@property (nonatomic,strong) UILabel * xtbiaoting;

@property (nonatomic,strong) UILabel * xtshuoming;



@end
