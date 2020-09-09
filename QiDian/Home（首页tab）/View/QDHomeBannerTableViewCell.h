//
//  QDHomeBannerTableViewCell.h
//  QiDian
//
//  Created by yiner on 2020/9/9.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDAppMacro.h"

NS_ASSUME_NONNULL_BEGIN

@interface QDHomeBannerTableViewCell : UITableViewCell<SDCycleScrollViewDelegate>

@property (strong, nonatomic)           SDCycleScrollView *cycleScrollView;

/**网络图片数组*/
@property (nonatomic,strong) NSArray <NSString *> *imageGroupUrls;

/**本地图片数组*/
@property (nonatomic,strong) NSArray <NSString *> *localImageGroupUrls;

/**图片描述文字数组*/
@property (nonatomic,strong) NSArray <NSString *> *imageTextValueArr;
/**     */
//@property (strong, nonatomic) NSArray *bannerArray;
/**     */
@property (strong, nonatomic) NSArray *onlyStrArray;
/**        */
@property (nonatomic, copy) void (^cycleViewBlock)(NSInteger index);
/**     */
@property (strong, nonatomic) NSArray *homeBannerArray;
@end

NS_ASSUME_NONNULL_END
