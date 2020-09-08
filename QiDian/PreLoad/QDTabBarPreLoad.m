//
//  QDTabBarPreLoad.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDTabBarPreLoad.h"

#import "QDHomePageViewController.h"
#import "QDDataViewController.h"


@implementation QDTabBarPreLoad

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    
    
    return YES;
}

//- (void)configure

+ (NSArray<QDTabBarItem *> *)tabBarItems {
    
   static NSArray<QDTabBarItem *> *_tabBarItems;
    if (!_tabBarItems) {
        NSArray<NSString *> *titles = @[@"首页", @"数据", @"我的"];
//        NSArray<UIImage *> *images = self.defaultTabbarImages;
//        NSArray<UIImage *> *selectedImages = self.defaultTabbarSelectedImages;
//        NSArray<NSDictionary *> *params = self.defaultTabbarParams;
        
        QDHomePageViewController *homeVC = [[QDHomePageViewController alloc] init];
        QDDataViewController *dataVC = [[QDDataViewController alloc] init];
        
        NSArray *itemTypes = [NSArray arrayWithObjects:@(CustomTabBarItemTypeHome), @(CustomTabBarItemTypeData), @(CustomTabBarItemTypeMine), nil];
        NSArray *vcs = [NSArray arrayWithObjects:homeVC, dataVC, nil];
        
        NSMutableArray<QDTabBarItem *> *mItems = [NSMutableArray arrayWithCapacity:5];
        for (int i = 0; i < 5; i++) {
//            UIImage *normalImage = [images[i] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            UIImage *selectedImage = [selectedImages[i] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            FRWTabBarItem *item = [[FRWTabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectedImage];
//            item.selectedTitle = titles[i];
//            item.unselectedTitle = titles[i];
//            item.rootViewController = vcs[i];
//            item.vcParams = params[i];
//            item.itemType = [itemTypes[i] unsignedIntegerValue];
//            [mItems addObject:item];
            QDTabBarItem *item = [[QDTabBarItem alloc] initWithTitle:titles[i] image:nil tag:123];
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

@end
