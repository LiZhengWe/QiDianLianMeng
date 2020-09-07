//
//  QDTabBarPreLoad.h
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QDTabBarItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface QDTabBarPreLoad : NSObject<UIApplicationDelegate>

+ (NSArray<QDTabBarItem *> *)tabBarItems;

@end

NS_ASSUME_NONNULL_END
