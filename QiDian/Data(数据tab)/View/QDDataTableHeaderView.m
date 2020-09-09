//
//  QDDataTableHeaderView.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDDataTableHeaderView.h"
#import "QDAppMacro.h"
#import <Masonry/Masonry.h>

@interface QDDataTableHeaderView ()

@property (strong, nonatomic)           UIView *bgView;
@property (strong, nonatomic)           UIView *grayLine;
@property (strong, nonatomic)           UILabel *allIncomLab;
@property (strong, nonatomic)           UILabel *totalIncomLab;
@property (strong, nonatomic)           UILabel *totalIncomNumLab;
@property (strong, nonatomic)           UILabel *fenRunIncomLab;
@property (strong, nonatomic)           UILabel *fenRunIncomNumLab;
@property (strong, nonatomic)           UILabel *buTieIncomLab;
@property (strong, nonatomic)           UILabel *buTieIncomNumLab;
@property (strong, nonatomic)           UIButton *hiddenBtn;

@end

@implementation QDDataTableHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        [self configureView];
        
    }
    return self;
}

- (void)configureView {
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.allIncomLab];
    [self.bgView addSubview:self.totalIncomLab];
    [self.bgView addSubview:self.totalIncomNumLab];
    [self.bgView addSubview:self.fenRunIncomNumLab];
    [self.bgView addSubview:self.fenRunIncomLab];
    [self.bgView addSubview:self.buTieIncomNumLab];
    [self.bgView addSubview:self.buTieIncomLab];
    [self.bgView addSubview:self.grayLine];
    [self.bgView addSubview:self.hiddenBtn];
    
    [self configureLayout];
}

- (void)configureLayout {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self);
        make.bottom.equalTo(self).offset(-10);
    }];
    
    [self.allIncomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.bgView).offset(16);
    }];
    
    [self.hiddenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.allIncomLab.mas_right).offset(20);
        make.centerY.equalTo(self.allIncomLab);
    }];
    
    [self.totalIncomNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.allIncomLab);
        make.top.equalTo(self.allIncomLab.mas_bottom).offset(25);
    }];
    
    [self.totalIncomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.totalIncomNumLab);
        make.top.equalTo(self.totalIncomNumLab.mas_bottom).offset(16);
    }];
    
    [self.grayLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.totalIncomLab.mas_bottom).offset(30);
        make.bottom.equalTo(self.bgView).offset(-32);
        make.size.mas_equalTo(CGSizeMake(1, 45));
    }];
    
    [self.fenRunIncomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.grayLine).offset(-40);
        make.top.equalTo(self.grayLine).offset(5);
        make.left.greaterThanOrEqualTo(self.bgView).offset(10);
    }];
    
    [self.fenRunIncomNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fenRunIncomLab.mas_bottom).offset(16);
        make.centerX.equalTo(self.fenRunIncomLab);
    }];
    
    [self.buTieIncomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.grayLine).offset(40);
        make.top.equalTo(self.grayLine).offset(5);
        make.right.lessThanOrEqualTo(self.bgView).offset(-10);
    }];
    
    [self.buTieIncomNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buTieIncomLab.mas_bottom).offset(16);
        make.centerX.equalTo(self.buTieIncomLab);
    }];
    
}

#pragma mark - lazy load
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = (UIView *)({
            UIView *style = [[UIView alloc] initWithFrame:CGRectZero];
            style.layer.cornerRadius = 15;
            style.layer.backgroundColor = [[UIColor whiteColor] CGColor];
            style.layer.shadowColor = [UIColor blackColor].CGColor;
            style.layer.shadowOpacity = 0.05;
            style.layer.shadowOffset = CGSizeMake(5, 5);
            style.layer.shadowRadius = 3;
            style;
        });
    }
    return _bgView;
}

- (UIView *)grayLine {
    if (!_grayLine) {
        _grayLine = [[UIView alloc] init];
        _grayLine.backgroundColor = [UIColor colorWithRGB:0x666666];
    }
    return _grayLine;
}

- (UILabel *)allIncomLab {
    if (!_allIncomLab) {
        _allIncomLab = [[UILabel alloc] init];
        _allIncomLab.text = @"我的收入";
        _allIncomLab.font = [UIFont boldSystemFontOfSize:18];
        _allIncomLab.textColor = [UIColor blackColor];
        _allIncomLab.textAlignment = NSTextAlignmentCenter;
    }
    return _allIncomLab;
}

- (UILabel *)totalIncomLab {
    if (!_totalIncomLab) {
        _totalIncomLab = [[UILabel alloc] init];
        _totalIncomLab.text = @"累计收入(元)";
        _totalIncomLab.font = [UIFont systemFontOfSize:12];
        _totalIncomLab.textColor = [UIColor colorWithRGB:0x666666];
        _totalIncomLab.textAlignment = NSTextAlignmentCenter;
    }
    return _totalIncomLab;
}

- (UILabel *)totalIncomNumLab {
    if (!_totalIncomNumLab) {
        _totalIncomNumLab = [[UILabel alloc] init];
        _totalIncomNumLab.text = @"642334.32";
        _totalIncomNumLab.font = [UIFont boldSystemFontOfSize:25];
        _totalIncomNumLab.textColor = [UIColor blackColor];
        _totalIncomNumLab.textAlignment = NSTextAlignmentCenter;
    }
    return _totalIncomNumLab;
}

- (UILabel *)fenRunIncomLab {
    if (!_fenRunIncomLab) {
        _fenRunIncomLab = [[UILabel alloc] init];
        _fenRunIncomLab.text = @"分润收入(元)";
        _fenRunIncomLab.font = [UIFont boldSystemFontOfSize:12];
        _fenRunIncomLab.textColor = [UIColor colorWithRGB:0x666666];
        _fenRunIncomLab.textAlignment = NSTextAlignmentCenter;
    }
    return _fenRunIncomLab;
}

- (UILabel *)fenRunIncomNumLab {
    if (!_fenRunIncomNumLab) {
        _fenRunIncomNumLab = [[UILabel alloc] init];
        _fenRunIncomNumLab.text = @"4341.2";
        _fenRunIncomNumLab.font = [UIFont boldSystemFontOfSize:12];
        _fenRunIncomNumLab.textColor = [UIColor blackColor];
        _fenRunIncomNumLab.textAlignment = NSTextAlignmentCenter;
    }
    return _fenRunIncomNumLab;
}

- (UILabel *)buTieIncomLab {
    if (!_buTieIncomLab) {
        _buTieIncomLab = [[UILabel alloc] init];
        _buTieIncomLab.text = @"活动补贴(元)";
        _buTieIncomLab.font = [UIFont boldSystemFontOfSize:12];
        _buTieIncomLab.textColor = [UIColor colorWithRGB:0x666666];
        _buTieIncomLab.textAlignment = NSTextAlignmentCenter;
    }
    return _buTieIncomLab;
}

- (UILabel *)buTieIncomNumLab {
    if (!_buTieIncomNumLab) {
        _buTieIncomNumLab = [[UILabel alloc] init];
        _buTieIncomNumLab.text = @"34313.23";
        _buTieIncomNumLab.font = [UIFont boldSystemFontOfSize:12];
        _buTieIncomNumLab.textColor = [UIColor blackColor];
        _buTieIncomNumLab.textAlignment = NSTextAlignmentCenter;
    }
    return _buTieIncomNumLab;
}

- (UIButton *)hiddenBtn {
    if (!_hiddenBtn) {
        _hiddenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hiddenBtn setImage:[UIImage imageNamed:@"data_eye"] forState:UIControlStateNormal];
    }
    return _hiddenBtn;
}

@end
