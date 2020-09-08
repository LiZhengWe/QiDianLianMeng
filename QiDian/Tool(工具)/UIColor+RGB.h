//
//  UIColor+RGB.h
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (RGB)
/**
 *  根据0xFFFFFF格式RGB值创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSInteger)rgbValue;
/**
 *  根据0xFFFFFF格式RGB值，不透明度创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *  @param alpha    不透明度值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSInteger)rgbValue Alpha:(CGFloat)alpha;


/**
 根据0xFFFFFF字符串格式RGB值，不透明度创建UIColor

 @param rgb 字符串
 @param alpha int
 @return <#return value description#>
 */
+ (UIColor *)colorWithRGBStr:(NSString *)rgb Alpha:(int)alpha;
/**
 *  根据0xFFFFFF格式RGB值创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *
 *  @return UIColor
 */
UIColor* UIColorFromRGB(NSInteger rgbValue);
/**
 *  根据0xFFFFFF格式RGB值，不透明度创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *  @param alpha    不透明度值
 *
 *  @return UIColor
 */

@end

NS_ASSUME_NONNULL_END
