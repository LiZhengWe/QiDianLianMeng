//
//  QDHomeYeJiTableViewCell.h
//  QiDian
//
//  Created by yiner on 2020/9/9.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, QDHomeYeJiCellType) {
    QDHomeYeJiCellTypeToday,
    QDHomeYeJiCellTypeMonth
};

@interface QDHomeYeJiTableViewCell : UITableViewCell

@property (assign, nonatomic)           QDHomeYeJiCellType cellType;

@end

NS_ASSUME_NONNULL_END
