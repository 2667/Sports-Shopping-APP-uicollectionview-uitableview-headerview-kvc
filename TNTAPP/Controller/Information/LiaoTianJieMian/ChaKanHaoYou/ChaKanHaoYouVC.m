//
//  ChaKanHaoYouVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/27.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "ChaKanHaoYouVC.h"
#import "BeiZhuVC.h"

@interface ChaKanHaoYouVC ()<UIAlertViewDelegate>

@end

@implementation ChaKanHaoYouVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.view.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    
    
    [self zdydhl];
    
    [self zdyUI];
    

}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = _biaoting;
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    //**********好友头像*********
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, APPwidth, 80)];
    btn1.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [self.view addSubview:btn1];
    
    
    UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    img.backgroundColor = [UIColor orangeColor];
    img.layer.cornerRadius = 25;
    img.layer.masksToBounds = YES;
    [btn1 addSubview:img];
    
    
    UILabel * label1 =[[UILabel alloc] initWithFrame:CGRectMake(75, 0, btn1.frame.size.width-120, 80)];
    label1.text = _biaoting;
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    [btn1 addSubview:label1];
    
    
    UIImageView * jiantou = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 32.5, 15, 15)];
    jiantou.image = [UIImage imageNamed:@"xiaoxizhongxin_you"];
    [btn1 addSubview:jiantou];
    
    
    //**********设置备注*********
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn1.frame.origin.y+btn1.frame.size.height+15, APPwidth, 40)];
    btn2.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [btn2 addTarget:self action:@selector(beizhuclick) forControlEvents:1<<6];
    [self.view addSubview:btn2];
    
    
    
    UILabel * label2 =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, btn2.frame.size.width-40, 40)];
    label2.text = @"    设置备注";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:16];
    [btn2 addSubview:label2];
    
    
    UIImageView * jiantou2 = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-30, 12.5, 15, 15)];
    jiantou2.image = [UIImage imageNamed:@"xiaoxizhongxin_you"];
    [btn2 addSubview:jiantou2];
    
     


    //**********清空记录*********
    UIButton * qingkongbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, btn2.frame.origin.y+btn2.frame.size.height+15, APPwidth, 40)];
    qingkongbtn.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:61/255.0 alpha:1.0];
    [qingkongbtn setTitle:@"    清空聊天记录" forState:0];
    [qingkongbtn setTitleColor:[UIColor whiteColor] forState:0];
    qingkongbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    qingkongbtn.contentHorizontalAlignment = 1;
    [qingkongbtn addTarget:self action:@selector(qingkong) forControlEvents:1<<6];
    [self.view addSubview:qingkongbtn];
    

}

#pragma mark - 清空聊天记录
-(void)qingkong
{
    
    UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:nil message:@"确定删除当前好友聊天记录吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"清空", nil];
    alertview.alertViewStyle = UIAlertViewStyleDefault;
    [alertview show];
//
    
#if 0
    NSString * title = @"确定删除当前好友聊天记录吗？";

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    NSMutableAttributedString *titleAtt = [[NSMutableAttributedString alloc] initWithString:title];
    [titleAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    [titleAtt addAttribute:NSForegroundColorAttributeName value:WenZiHeiColor range:NSMakeRange(0, title.length)];
    [alertController setValue:titleAtt forKey:@"attributedTitle"];

 
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消",@"确定") style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];

#endif
    
   
}



#pragma mark - 弹出框代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"取消");
            break;
        case 1:
            NSLog(@"确定");
            break;
            
        default:
            break;
    }
    
    
}

#pragma mark - 修改备注
-(void)beizhuclick
{
    
    BeiZhuVC * beizhu = [[BeiZhuVC alloc] init];
    [self.navigationController pushViewController:beizhu animated:YES];
    
}

#pragma mark - 返回
-(void)fanhuei
{
    [self.navigationController popViewControllerAnimated:YES];
    
}




-(void)viewWillAppear:(BOOL)animated{
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
}



-(void)viewWillDisappear:(BOOL)animated
{
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
    
    
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
