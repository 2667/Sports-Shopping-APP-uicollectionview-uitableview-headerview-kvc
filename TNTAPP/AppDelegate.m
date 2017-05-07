//
//  AppDelegate.m
//  TNTAPP
//
//  Created by tnt_mdf on 2016/12/19.
//  Copyright © 2016年 TNT. All rights reserved.
//

#import "AppDelegate.h"
#import "InformationVC.h"
#import "MyVC.h"
#import "TaskVC.h"
#import "HomeVC.h"
#import "JiBuVC.h"
#import "BiaoJiViewController.h"
#import "TNTNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    [application setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];

    
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    
    [AMapServices sharedServices].apiKey = @"8035fb3ebe337791bcee0bae31c85ed5";
    

    
    [self gengshitu];
    
    
    return YES;
}


#pragma - mark 根视图
-(void)gengshitu
{
    
    HomeVC * homevc = [[HomeVC alloc] init];
    UINavigationController * hongnc = [[UINavigationController alloc] initWithRootViewController:homevc];
    
    
    TaskVC * taskvc = [[TaskVC alloc] init];
    UINavigationController * tasknc = [[UINavigationController alloc] initWithRootViewController:taskvc];
    
    
    BiaoJiViewController * biaojivc = [[BiaoJiViewController alloc] init];
    UINavigationController * biaojinc = [[UINavigationController alloc] initWithRootViewController:biaojivc];
    
    
    MyVC * myvc = [[MyVC alloc] init];
    UINavigationController * mync = [[UINavigationController alloc] initWithRootViewController:myvc];
    
    
    MyTabBar * mytabbar = [[MyTabBar alloc] init];
    mytabbar.viewControllers = @[hongnc,tasknc,biaojinc,mync];
    
    
    
    mytabbar.selectedIndex = 0;
    self.window.rootViewController = mytabbar;
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
