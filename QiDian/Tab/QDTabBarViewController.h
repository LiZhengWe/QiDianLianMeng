//
//  QDTabBarViewController.h
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDTabBarItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface QDTabBarViewController : UITabBarController

/**
 当前选中的，默认第一个
 */
@property (nonatomic, weak) UINavigationController *currentNavigation;

- (instancetype)initWithItems:(NSArray<QDTabBarItem *> *)items;

@end

NS_ASSUME_NONNULL_END
