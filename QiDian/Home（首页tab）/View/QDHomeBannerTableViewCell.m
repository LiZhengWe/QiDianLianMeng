//
//  QDHomeBannerTableViewCell.m
//  QiDian
//
//  Created by yiner on 2020/9/9.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDHomeBannerTableViewCell.h"
#import "QDAppMacro.h"

@implementation QDHomeBannerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setHomeBannerArray:(NSArray *)homeBannerArray {
    _homeBannerArray = homeBannerArray;
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
//    for (Banner *banner in homeBannerArray) {
//        if (banner.slideshowAdvertisingUrlAddress) {
//            [tempArray addObject:banner.slideshowAdvertisingUrlAddress];
//        }
//    }
//    self.cycleScrollView.imageURLStringsGroup = tempArray;
    
    for (int i = 0; i < 3; i++) {
        [tempArray addObject:@"home_banner_placeholder"];
    }
    self.cycleScrollView.localizationImageNamesGroup = tempArray;
}
- (void)setOnlyStrArray:(NSArray *)onlyStrArray {
    _onlyStrArray = onlyStrArray;
//
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
//    for (id string in onlyStrArray) {
//        [tempArray addObject:[NSString stringWithFormat:@"%@/%@", URL_IMG_PREFIX, string]];
//    }
    self.cycleScrollView.imageURLStringsGroup = tempArray;
}

#pragma mark - 重写set方法
-(void)setImageGroupUrls:(NSArray<NSString *> *)imageGroupUrls {
    _imageGroupUrls = imageGroupUrls;
    self.cycleScrollView.imageURLStringsGroup = imageGroupUrls;
}

-(void)setLocalImageGroupUrls:(NSArray<NSString *> *)localImageGroupUrls {
    _localImageGroupUrls = localImageGroupUrls;
    self.cycleScrollView.localizationImageNamesGroup = localImageGroupUrls;
}

-(void)setImageTextValueArr:(NSArray<NSString *> *)imageTextValueArr {
    _imageTextValueArr = imageTextValueArr;
    self.cycleScrollView.titlesGroup = imageTextValueArr;
}

- (void)setupViewCell {
    [self addSubview:self.cycleScrollView];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.bottom.right.equalTo(self).offset(0);
    }];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    _cycleViewBlock ? _cycleViewBlock(index) : nil;
}

#pragma mark - 懒加载
-(SDCycleScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
        
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"home_banner_placeholer"]];
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.currentPageDotColor = [UIColor colorWithRGB:0xFFFFFF]; // 自定义分页控件小圆标颜色
        _cycleScrollView.pageDotColor = [UIColor colorWithRGB:0x666666];
        _cycleScrollView.backgroundColor = [UIColor clearColor];
        _cycleScrollView.autoScrollTimeInterval = 5;
        _cycleScrollView.userInteractionEnabled = YES;
    }
    return _cycleScrollView;
}

@end
