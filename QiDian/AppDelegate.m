//
//  AppDelegate.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "QDTabBarViewController.h"
#import "QDTabBarPreLoad.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    QDTabBarViewController *tabBarVC = [[QDTabBarViewController alloc] initWithItems:QDTabBarPreLoad.tabBarItems];
    
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
