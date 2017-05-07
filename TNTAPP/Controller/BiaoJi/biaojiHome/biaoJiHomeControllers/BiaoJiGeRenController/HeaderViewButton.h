//
//  buttonView.h
//  TNTAPP
//
//  Created by Bin Tang on 2017/1/8.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderViewButton : UIButton

//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UILabel *topLabel;


//@property (weak, nonatomic) IBOutlet UILabel *DownLabel;

@property (strong, nonatomic) IBOutlet UIView *view;


+(HeaderViewButton *)instance;

@end
