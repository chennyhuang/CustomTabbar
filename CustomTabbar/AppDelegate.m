//
//  AppDelegate.m
//  CustomTabbar
//
//  Created by 黄振宇 on 15/9/28.
//  Copyright (c) 2015年 YunMei. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    
    ViewController1 *vc1 = [[ViewController1 alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    ViewController4 *vc4 = [[ViewController4 alloc] init];
    
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"发现音乐" image:[[UIImage imageNamed:@"cm2_btm_icn_discovery_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"cm2_btm_icn_discovery_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item1 setTitleTextAttributes:[NSDictionary
                                  dictionaryWithObjectsAndKeys: [UIColor whiteColor],
                                  NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"我的音乐" image:[[UIImage imageNamed:@"cm2_btm_icn_music_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"cm2_btm_icn_music_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item2 setTitleTextAttributes:[NSDictionary
                                   dictionaryWithObjectsAndKeys: [UIColor whiteColor],
                                   NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"朋友" image:[[UIImage imageNamed:@"cm2_btm_icn_friend_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"cm2_btm_icn_friend_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item3 setTitleTextAttributes:[NSDictionary
                                   dictionaryWithObjectsAndKeys: [UIColor whiteColor],
                                   NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTitle:@"账号" image:[[UIImage imageNamed:@"cm2_btm_icn_account_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"cm2_btm_icn_account_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item4 setTitleTextAttributes:[NSDictionary
                                   dictionaryWithObjectsAndKeys: [UIColor whiteColor],
                                   NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    nav1.tabBarItem = item1;
    vc2.tabBarItem = item2;
    vc3.tabBarItem = item3;
    vc4.tabBarItem = item4;
    
    tabbarVc.tabBar.backgroundImage = [UIImage imageNamed:@"cm2_msg_tab_mid_prs"];
    [tabbarVc.tabBar setTintColor:[UIColor whiteColor]];
    [tabbarVc.tabBar setShadowImage:[UIImage new]];//去除横线
    tabbarVc.viewControllers = @[nav1,vc2,vc3,vc4];
    
    UIImage *image = [UIImage imageNamed:@"cm2_set_btn_sign_ad_prs"];
    
    UIImage *selTab = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CGSize tabSize = CGSizeMake(CGRectGetWidth(self.window.frame)/tabbarVc.viewControllers.count, 49);
    UIGraphicsBeginImageContext(tabSize);
    [selTab drawInRect:CGRectMake(0, 0, tabSize.width, tabSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [tabbarVc.tabBar setSelectionIndicatorImage:reSizeImage];//添加选中后变色的图片
    
    
    self.window.rootViewController = tabbarVc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
