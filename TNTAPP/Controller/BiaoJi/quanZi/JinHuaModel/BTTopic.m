//
//  BTTopic.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/17.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTTopic.h"
#import "BTComment.h"
#import "BTUser.h"

@implementation BTTopic

#pragma mark - other
//将字符串格式的时间转为nsdate格式的时间,重写了属性的get方法,返回个时间.
-(NSString*)created_at{

    //服务器返回的日期
    NSDateFormatter* fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate* createdAtDate = [fmt dateFromString:_created_at];
    if (createdAtDate.isThisYear) {
        //今年
        if (createdAtDate.isToday) {
            //今天
            //当前时间
            NSDate * nowDate = [NSDate date];
            //日历对象
            NSCalendar* calendar = [NSCalendar currentCalendar];
            NSCalendarUnit unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents* cmps = [calendar components:unit fromDate:createdAtDate toDate:nowDate options:0];
            
            if (cmps.hour >= 1) {
                //时间间隔>=1个小时
                return [NSString stringWithFormat:@"%zd小时前",cmps.hour];
                
            }else if (cmps.minute>=1){
            //1个小时>时间间隔>=1分钟
                return [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            
            }else{
            return @"刚刚";
            
            }
            
        }else if (createdAtDate.isYesterday){
        //昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:createdAtDate];
            
        }else{
        //其他
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:createdAtDate];
            
        }
    }else{
    //非今年
        return _created_at;
    
    }
}


/** 
 在这个方法中计算了cellHeight和centerViewFrame
 */
-(CGFloat)cellHeight{

//如果已经计算过cellHeight,就直接返回以前的值
    if (_cellHeight) {
        return _cellHeight;
    }
    //文字的值
    CGFloat textY =55;
    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width-2*XMGMargin;
    //文字的高度
    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
    _cellHeight = textY+textH+XMGMargin;
    //有中间内容
    if (self.type!=BTTopicTypeWord) {
        //中间控件的X值
        CGFloat centerViewX = XMGMargin;
        //中间控件的Y值
        CGFloat centerViewY = textY+textH+XMGMargin;
        
        //中间控件的宽度
        CGFloat centerViewW = textMaxW;
        //中间控件的高度
        CGFloat centerViewH = self.height*centerViewW/self.width;
        if (centerViewH>=[UIScreen mainScreen].bounds.size.height) {
            centerViewH = 200;
            self.bigPicture =YES;
        }
        _centerViewFrame = CGRectMake(centerViewX, centerViewY, centerViewW, centerViewH);
        _cellHeight += centerViewH+XMGMargin;
//        NSLog(@"_centerViewFramex:%f y:%f w:%f h:%f,",_centerViewFrame.origin.x,_centerViewFrame.origin.y,_centerViewFrame.size.width,_centerViewFrame.size.height);
        
    }
    //有最热评论
    if (self.top_cmt) {
        CGFloat topCmtTitleH = 20;
        NSString* topCmtText = [NSString stringWithFormat:@"%@ : %@",self.top_cmt.user.username,self.top_cmt.content];
        CGFloat topCmtTexH = [topCmtText boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil].size.height;
        _cellHeight += topCmtTitleH+ topCmtTexH + XMGMargin;
    }
    //底部工具条
    CGFloat toolbarH = 35;
    _cellHeight +=toolbarH+XMGMargin;
    
    return _cellHeight;
}

@end
