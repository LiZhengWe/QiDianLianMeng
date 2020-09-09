//
//  QDKaoHeHeaderView.m
//  QiDian
//
//  Created by yiner on 2020/9/8.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDKaoHeHeaderView.h"
#import "QDAppMacro.h"

@interface QDKaoHeHeaderView ()

@property (strong, nonatomic)           UILabel *titleLab;
@property (strong, nonatomic)           UILabel *titleNumLab;
@property (strong, nonatomic)           UILabel *arrowLab;
@property (strong, nonatomic)           UILabel *kaoHeZhong;
@property (strong, nonatomic)           UILabel *weiKaiShi;
@property (strong, nonatomic)           UILabel *yiDaBiao;
@property (strong, nonatomic)           UILabel *weiDaBiao;

@end

@implementation QDKaoHeHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configureView];
    }
    return self;
}

- (void)configureView {
    [self addSubview:self.titleLab];
    [self addSubview:self.titleNumLab];
    [self addSubview:self.arrowLab];
    [self addSubview:self.kaoHeZhong];
    [self addSubview:self.weiKaiShi];
    [self addSubview:self.yiDaBiao];
    [self addSubview:self.weiDaBiao];
    
    [self configureLayout];
}

- (void)configureLayout {
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(15);
    }];
    
    [self.titleNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right);
        make.bottom.equalTo(self.titleLab);
    }];
    
    [self.arrowLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleNumLab.mas_right).offset(7);
        make.centerY.equalTo(self.titleLab);
    }];
    
    [self.kaoHeZhong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(30);
        make.top.equalTo(self.titleLab.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake((kScreenWidth - 40 - 60 - 10 * 3 - 40)/4, 25)); // 有问题的约束
    }];
    
    [self.weiKaiShi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.kaoHeZhong.mas_right).offset(10);
        make.centerY.equalTo(self.kaoHeZhong);
        make.size.equalTo(self.kaoHeZhong);
    }];
    
    [self.yiDaBiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.weiKaiShi.mas_right).offset(10);
        make.centerY.equalTo(self.weiKaiShi);
        make.size.equalTo(self.kaoHeZhong);
    }];
    
    [self.weiDaBiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yiDaBiao.mas_right).offset(10);
        make.centerY.equalTo(self.yiDaBiao);
        make.size.equalTo(self.kaoHeZhong);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"新欢乐送";
            label.font = [UIFont boldSystemFontOfSize:15];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x000000];
            label;
        });
    }
    return _titleLab;
}

- (UILabel *)titleNumLab {
    if (!_titleNumLab) {
        _titleNumLab = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"(213户)";
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x888888];
            label;
        });
    }
    return _titleNumLab;
}

- (UILabel *)arrowLab {
    if (!_arrowLab) {
        _arrowLab = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @">";
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x000000];
            label;
        });
    }
    return _arrowLab;
}

- (UILabel *)kaoHeZhong {
    if (!_kaoHeZhong) {
        _kaoHeZhong = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"考核中";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x000000];
            label;
        });
    }
    return _kaoHeZhong;
}

- (UILabel *)weiKaiShi {
    if (!_weiKaiShi) {
        _weiKaiShi = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"未开始";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x11BFFF];
            label;
        });
    }
    return _weiKaiShi;
}

- (UILabel *)yiDaBiao {
    if (!_yiDaBiao) {
        _yiDaBiao = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"已达标";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x00E360];
            label;
        });
    }
    return _yiDaBiao;
}

- (UILabel *)weiDaBiao {
    if (!_weiDaBiao) {
        _weiDaBiao = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"未达标";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0xFF1142];
            label;
        });
    }
    return _weiDaBiao;
}

@end
