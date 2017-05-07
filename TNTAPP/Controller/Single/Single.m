//
//  Single.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/4.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "Single.h"

@implementation Single

static Single * dan;

+(Single *)danle {
    if(dan == nil)
    {
        dan = [[Single alloc] init];
    }
    return dan;
    
}

@end
