//
//  BTVoiceViewController.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/16.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTVoiceViewController.h"

@interface BTVoiceViewController ()

@end

@implementation BTVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwitch* sw = [[UISwitch alloc]init];
    sw.center = CGPointMake(100, 200);
    [self.view addSubview:sw];
    
}


-(BTTopicType)type{
    return BTTopicTypeVoice;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
