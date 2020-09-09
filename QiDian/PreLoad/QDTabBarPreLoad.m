//
//  QDTabBarPreLoad.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDTabBarPreLoad.h"

#import "QDTabBarViewController.h"
#import "QDHomePageViewController.h"
#import "QDDataViewController.h"
#import "QDMineViewController.h"


@implementation QDTabBarPreLoad

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    
    [self configureController];
    return YES;
}

- (void)configureController {
    
    
    
}

+ (NSArray<QDTabBarItem *> *)tabBarItems {
    
   static NSArray<QDTabBarItem *> *_tabBarItems;
    if (!_tabBarItems) {
        NSArray<NSString *> *titles = @[@"首页", @"数据", @"我的"];
        
        QDHomePageViewController *homeVC = [[QDHomePageViewController alloc] init];
        QDDataViewController *dataVC = [[QDDataViewController alloc] init];
        QDMineViewController *mineVC = [[QDMineViewController alloc] init];
        
        
        NSArray *itemTypes = [NSArray arrayWithObjects:@(CustomTabBarItemTypeHome), @(CustomTabBarItemTypeData), @(CustomTabBarItemTypeMine), nil];
        NSArray *vcs = [NSArray arrayWithObjects:homeVC, dataVC, mineVC, nil];
        NSArray<NSString *> *selectImgArr = self.selectImageArray;
        NSArray<NSString *> *unselectImgArr = self.unselectImageArray;
        
        NSMutableArray<QDTabBarItem *> *mItems = [NSMutableArray arrayWithCapacity:3];
        for (int i = 0; i < 3; i++) {
            UIImage *normalImage = [[UIImage imageNamed:unselectImgArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIImage *selectedImage = [[UIImage imageNamed:selectImgArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            QDTabBarItem *item = [[QDTabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectedImage];
            item.selectedTitle = titles[i];
            item.unselectedTitle = titles[i];
            item.rootViewController = vcs[i];
            item.itemType = [itemTypes[i] unsignedIntegerValue];
            [mItems addObject:item];
        }
        _tabBarItems = mItems.copy;
    }
    return _tabBarItems;
}

+ (NSArray<NSString *> *)selectImageArray {
    
    return @[@"tab_home_select", @"tab_data_unselect", @"tab_mine_select"];
}

+ (NSArray<NSString *> *)unselectImageArray {
    return @[@"tab_home_unselect", @"tab_data_unselect", @"tab_mine_unselect"];
}

@end
