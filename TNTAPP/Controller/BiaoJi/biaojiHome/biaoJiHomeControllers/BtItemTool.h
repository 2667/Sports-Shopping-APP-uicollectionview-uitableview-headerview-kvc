//
//  BtItemTool.h
//  274t-APP框架搭建
//
//  Created by Inspirr Mac on 16/11/15.
//  Copyright © 2016年 tangbin. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BtItemTool : NSObject

+(UIBarButtonItem*)itemWithImage:(NSString*)image highImage:(NSString*)highImage target:(id)target action:(SEL)action;

@end
