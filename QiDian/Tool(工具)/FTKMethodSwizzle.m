//
//  FTKMethodSwizzle.c
//  FRWToolKit
//
//  Created by infiq on 2017/4/6.
//  Copyright © 2017年 infiniteQin. All rights reserved.
//

#include "FTKMethodSwizzle.h"


void FTKSwizzleInstanceMethod(Class cls, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}
