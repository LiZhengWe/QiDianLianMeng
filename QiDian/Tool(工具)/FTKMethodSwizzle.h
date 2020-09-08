//
//  FTKMethodSwizzle.h
//  FRWToolKit
//
//  Created by infiq on 2017/4/6.
//  Copyright © 2017年 infiniteQin. All rights reserved.
//

#ifndef FTKMethodSwizzle_h
#define FTKMethodSwizzle_h

#include <stdio.h>
#include <objc/runtime.h>

extern void FTKSwizzleInstanceMethod(Class cls, SEL originalSelector, SEL swizzledSelector);

#endif /* FTKMethodSwizzle_h */
