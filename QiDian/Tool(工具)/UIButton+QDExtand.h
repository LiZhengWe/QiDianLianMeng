//
//  UIButton+QDExtand.h
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//button图文混排样式
typedef NS_ENUM(NSUInteger, FRWButtonMixStyle) {
    FRWButtonMixStyleNone = 0,              //当为none时什么都不做，使用系统默认的排版方式，设置padding也无效
    FRWButtonMixStyleDefault = 1,
    FRWButtonMixStyleImageUp,
    FRWButtonMixStyleImageRight,
    FRWButtonMixStyleImageBottom
};

@interface UIButton (QDExtand)

/**
 更改按钮的触控响应区域

 @param edge e.g. edge为UIEdgeInsetsMake(10, 10, 10, 10)时，按钮响应区域上下左右分别扩大10
 */
- (void)setTouchEdge:(UIEdgeInsets)edge;

@property (assign, nonatomic, setter=frw_setPadding:) IBInspectable CGFloat frw_padding;
@property (assign, nonatomic, setter=frw_setStyle:) IBInspectable FRWButtonMixStyle frw_style;

@end

NS_ASSUME_NONNULL_END
