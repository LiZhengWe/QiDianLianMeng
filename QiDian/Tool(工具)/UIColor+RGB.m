//
//  UIColor+RGB.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)
/**
 *  根据0xFFFFFF格式RGB值创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSInteger)rgbValue{
    return [UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((rgbValue & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (rgbValue & 0xFF))            / 0xFF
                           alpha:1.0];
}
/**
 *  根据0xFFFFFF格式RGB值，不透明度创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *  @param alpha    不透明度值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSInteger)rgbValue Alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((rgbValue & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (rgbValue & 0xFF))            / 0xFF
                           alpha:alpha];
}


+ (UIColor *)colorWithRGBStr:(NSString *)rgb Alpha:(int)alpha {
    const char *hexChar = [rgb cStringUsingEncoding:NSUTF8StringEncoding];
    
    int hexNumber;
    
    sscanf(hexChar, "%x", &hexNumber);
    
    return [UIColor colorWithRGB:(NSInteger)hexNumber Alpha:alpha/100.0];
}

/**
 *  根据0xFFFFFF格式RGB值创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *
 *  @return UIColor
 */
UIColor* UIColorFromRGB(NSInteger rgbValue) {
    return [UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((rgbValue & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (rgbValue & 0xFF))            / 0xFF
                           alpha:1.0];
}
/**
 *  根据0xFFFFFF格式RGB值，不透明度创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *  @param alpha    不透明度值
 *
 *  @return UIColor
 */
UIColor* UIColorFromRGBA(NSInteger rgbValue, CGFloat alpha) {
    return [UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((rgbValue & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (rgbValue & 0xFF))            / 0xFF
                           alpha:alpha];
}

@end
