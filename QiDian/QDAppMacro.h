//
//  QDAppMacro.h
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#ifndef QDAppMacro_h
#define QDAppMacro_h

#import "UIColor+RGB.h"
#import <MJRefresh/MJRefresh.h>
#import <Masonry/Masonry.h>
#import <SDCycleScrollView/SDCycleScrollView.h>

#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height<812)?NO:YES)
#define kStatusBarHeight (IS_IPHONEX ? 44 : 20)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHight [UIScreen mainScreen].bounds.size.height

#endif /* QDAppMacro_h */
