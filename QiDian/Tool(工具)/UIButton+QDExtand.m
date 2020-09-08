//
//  UIButton+QDExtand.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "UIButton+QDExtand.h"
#import "FTKMethodSwizzle.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (assign, nonatomic,setter=frw_setEdge:) UIEdgeInsets frw_edge;

@end

@implementation UIButton (QDExtand)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        FTKSwizzleInstanceMethod([self class], @selector(hitTest:withEvent:), @selector(ftk_hitTest:withEvent:));
        FTKSwizzleInstanceMethod([self class], @selector(pointInside:withEvent:), @selector(ftk_pointInside:withEvent:));
        FTKSwizzleInstanceMethod([self class], @selector(layoutSubviews), @selector(frw_layoutSubviews));
        FTKSwizzleInstanceMethod([self class], @selector(intrinsicContentSize), @selector(frw_intrinsicContentSize));
    });
}

- (void)setTouchEdge:(UIEdgeInsets)edge {
    self.frw_edge = edge;
}





#pragma mark - overload
- (BOOL)ftk_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.frw_edge, UIEdgeInsetsZero)) {
        return [self ftk_pointInside:point withEvent:event];
    }
    CGRect rect = self.bounds;
    rect.origin.x -= self.frw_edge.left;
    rect.origin.y -= self.frw_edge.top;
    rect.size.width += (self.frw_edge.left + self.frw_edge.right);
    rect.size.height += (self.frw_edge.top + self.frw_edge.bottom);

    return CGRectContainsPoint(rect, point);
}

//- (UIView *)ftk_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//
//    if (UIEdgeInsetsEqualToEdgeInsets(self.frw_edge, UIEdgeInsetsZero)) {
//        return [self ftk_hitTest:point withEvent:event];
//    }
//
//    CGRect rect = self.bounds;
//    rect.origin.x -= self.frw_edge.left;
//    rect.origin.y -= self.frw_edge.top;
//    rect.size.width += (self.frw_edge.left + self.frw_edge.right);
//    rect.size.height += (self.frw_edge.top + self.frw_edge.bottom);
//
//    if (CGRectContainsPoint(rect, point)) {
//        //如果作为UIView的Extend,则会导致手势无效，暂且继续用button
//        CGPoint center = CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2.0);
//        return [self ftk_hitTest:center withEvent:event];
//    }
//    else {
//        return [self ftk_hitTest:point withEvent:event];
//    }
//
//
//}

- (void)frw_layoutSubviews {
    if (self.frw_style == FRWButtonMixStyleNone) {
        [self frw_layoutSubviews];
        return;
    }
    //计算布局
    [self frw_layoutSubviews];
    
    //重设图片文字
    //    self.titleLabel.backgroundColor = self.backgroundColor;
    //    self.imageView.backgroundColor = self.backgroundColor;
    
    
    // 1. 得到imageView和titleLabel的size
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    // 3. 根据style和space设置imageEdgeInsets和labelEdgeInsets的值
    switch (self.frw_style) {
        case FRWButtonMixStyleImageBottom:
        {
            labelEdgeInsets = UIEdgeInsetsMake(0,-(imageSize.width), imageSize.height + self.frw_padding, 0);
            imageEdgeInsets = UIEdgeInsetsMake(titleSize.height + self.frw_padding, 0, 0, -(titleSize.width));
        }
            break;
        case FRWButtonMixStyleImageRight:
        {
            //            NSLog(@"buttonSize:%@-labelSize:%@\n", NSStringFromCGSize(self.bounds.size), NSStringFromCGSize(titleSize));
                        titleSize.width = MIN(self.bounds.size.width - self.frw_padding - imageSize.width, titleSize.width);
                        self.titleLabel.bounds = CGRectMake(0, 0, titleSize.width, titleSize.height);
            //            NSLog(@"buttonSize2:%@-labelSize:%@\n", NSStringFromCGSize(self.bounds.size), NSStringFromCGSize(titleSize));
                        imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, - titleSize.width);
                        labelEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width - self.frw_padding, 0, imageSize.width);
        }
            break;
        case FRWButtonMixStyleImageUp:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0,0, titleSize.height + self.frw_padding, -(titleSize.width));
            labelEdgeInsets = UIEdgeInsetsMake(imageSize.height + self.frw_padding, -(imageSize.width), 0, 0);
        }
            break;
        case FRWButtonMixStyleDefault:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, - self.frw_padding, 0, 0);
            labelEdgeInsets = UIEdgeInsetsMake(0, self.frw_padding, 0, 0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

- (CGSize)frw_intrinsicContentSize
{
    CGSize size = [self frw_intrinsicContentSize];
    if (self.frw_style == FRWButtonMixStyleNone) {
        return size;
    }
    
    
    if (self.frw_style == FRWButtonMixStyleDefault || self.frw_style == FRWButtonMixStyleImageRight) {
        //左右布局
        return CGSizeMake(size.width + self.frw_padding, size.height);
    }
    else {
        //上下布局
        CGSize titleSize = self.titleLabel.intrinsicContentSize;
        CGSize imageSize = self.imageView.intrinsicContentSize;
        UIEdgeInsets contentInsets = self.contentEdgeInsets;
        
        CGSize contentSize = CGSizeZero;
        contentSize.width = MAX(titleSize.width, imageSize.width);
        contentSize.height = titleSize.height + imageSize.height + self.frw_padding;
        
        return CGSizeMake(contentSize.width + contentInsets.left + contentInsets.right, contentSize.height + contentInsets.top + contentInsets.bottom);
    }
}
#pragma mark - get & set
- (UIEdgeInsets)frw_edge {
    return [(NSValue *)objc_getAssociatedObject(self, _cmd) UIEdgeInsetsValue];
}

- (void)frw_setEdge:(UIEdgeInsets)edge {
    NSValue *value = [NSValue valueWithUIEdgeInsets:edge];
    objc_setAssociatedObject(self, @selector(frw_edge), value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)frw_padding {
    NSNumber *padding = objc_getAssociatedObject(self, _cmd);
    return [padding doubleValue];
}
- (void)frw_setPadding:(CGFloat)frw_padding {
    objc_setAssociatedObject(self, @selector(frw_padding), @(frw_padding), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (FRWButtonMixStyle)frw_style {
    NSNumber *style = objc_getAssociatedObject(self, _cmd);
    return [style unsignedIntegerValue];
}

- (void)frw_setStyle:(FRWButtonMixStyle)frw_style {
    objc_setAssociatedObject(self, @selector(frw_style), @(frw_style), OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
