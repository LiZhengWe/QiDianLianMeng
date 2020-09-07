//
//  QDTabBarItem.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDTabBarItem.h"

@implementation QDTabBarItem

- (void)setSelectedTitle:(NSString *)selectedTitle {
    _selectedTitle = selectedTitle;
    if (self.isSelected) {
        self.title = selectedTitle;
    }
}

- (void)setUnselectedTitle:(NSString *)unselectedTitle {
    _unselectedTitle = unselectedTitle;
    if (!self.isSelected) {
        self.title = unselectedTitle;
    }
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    self.title = isSelected ? self.selectedTitle : self.unselectedTitle;
}

- (void)setVcParams:(NSDictionary *)vcParams {
    _vcParams = vcParams;
}

- (void)setItemType:(CustomTabBarItemType)itemType {
    _itemType = itemType;
}

@end
