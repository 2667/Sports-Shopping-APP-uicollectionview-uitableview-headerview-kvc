//
//  WoDeJinBiVC.h
//  TNTAPP
//
//  Created by tnt_mdf on 2017/2/20.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WoDeJinBiVC : UIViewController

@property (nonatomic, strong) PYZoomEchartsView *kEchartView;
@property(nonatomic,strong)CMPedometer *pedometer;//必须要是全局的才能运行

@end
