//
//  QDTabBarItem.h
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CustomTabBarItemType){
    CustomTabBarItemTypeDefault,
    CustomTabBarItemTypeHome,    // 首页
    CustomTabBarItemTypeData,    // 数据
    CustomTabBarItemTypeMine     // 我的
};

@interface QDTabBarItem : UITabBarItem

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, copy) NSString *unselectedTitle;
@property (nonatomic, copy) NSString *selectedTitle;

@property (nonatomic) UIViewController *rootViewController;
@property (nonatomic, copy) NSDictionary *vcParams;

@property (nonatomic, assign) CustomTabBarItemType itemType;
@end

NS_ASSUME_NONNULL_END
