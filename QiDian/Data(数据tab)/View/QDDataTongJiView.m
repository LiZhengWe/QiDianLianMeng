//
//  QDDataTongJiView.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDDataTongJiView.h"
#import "QDAppMacro.h"

@interface QDDataTongJiView ()

@property (strong, nonatomic)           UIImageView *bgView;
@property (strong, nonatomic)           UILabel *tongJiTitle; // 数据统计

@property (strong, nonatomic)           UIButton *tiaoJianBtn; // 选择条件按钮 全部、直营、下级
@property (strong, nonatomic)           UIButton *shaiXuanBtn; // 筛选按钮
@property (strong, nonatomic)           UIButton *questionBtn; // ？按钮
@property (strong, nonatomic)           UIButton *resetShaiXuan; // 筛选后重置按钮

@property (strong, nonatomic)           UILabel *totalTransaction; // 6月总交易量
@property (strong, nonatomic)           UILabel *totalTransactionNum; // 6月总交易量(元)
@property (strong, nonatomic)           UILabel *transactionCount; // 交易笔数
@property (strong, nonatomic)           UILabel *transactionCountNum; // 交易笔数（笔）
@property (strong, nonatomic)           UILabel *leiJiShop; // 累计商户
@property (strong, nonatomic)           UILabel *leiJiShopNum; // 累计商户（数量）
@property (strong, nonatomic)           UILabel *leiJiAgent; // 累计代理商
@property (strong, nonatomic)           UILabel *leiJiAgentNum; // 累计代理商（个数）
@property (strong, nonatomic)           UILabel *totalMachine; // 机具总数
@property (strong, nonatomic)           UILabel *totalMachineNum; // 机具总数（台）
@property (strong, nonatomic)           UILabel *activeMachine; // 已激活
@property (strong, nonatomic)           UILabel *activeMachineNum; // 已激活 (台)

@end

@implementation QDDataTongJiView

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self configureView];
    }
    return self;
}

- (void)configureView {
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.tongJiTitle];
    [self.bgView addSubview:self.tiaoJianBtn];
    [self.bgView addSubview:self.shaiXuanBtn];
//    [self.bgView addSubview:self.questionBtn];
    [self.bgView addSubview:self.resetShaiXuan];
    [self.bgView addSubview:self.totalTransaction];
    [self.bgView addSubview:self.totalTransactionNum];
    [self.bgView addSubview:self.transactionCount];
    [self.bgView addSubview:self.transactionCountNum];
    [self.bgView addSubview:self.leiJiShop];
    [self.bgView addSubview:self.leiJiShopNum];
    [self.bgView addSubview:self.leiJiAgent];
    [self.bgView addSubview:self.leiJiAgentNum];
    [self.bgView addSubview:self.totalMachine];
    [self.bgView addSubview:self.totalMachineNum];
    [self.bgView addSubview:self.activeMachine];
    [self.bgView addSubview:self.activeMachineNum];
    
    [self configureLayout];
}

- (void)configureLayout {
 
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.bottom.equalTo(self);
    }];
    
    [self.tongJiTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.bgView).offset(20);
    }];
    
    [self.tiaoJianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.centerY.equalTo(self.tongJiTitle);
        make.size.mas_equalTo(CGSizeMake(100, 46));
    }];
    
    [self.shaiXuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView).offset(-20);
        make.centerY.equalTo(self.tongJiTitle);
    }];
    
    [self.resetShaiXuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tongJiTitle);
        make.top.equalTo(self.tongJiTitle.mas_bottom).offset(15);
        make.height.mas_equalTo(0);
    }];
    
    [self.totalTransaction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.resetShaiXuan.mas_bottom).offset(15);
    }];
    
    [self.totalTransactionNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.totalTransaction);
        make.top.equalTo(self.totalTransaction.mas_bottom).offset(15);
    }];
    
    [self.transactionCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.totalTransactionNum.mas_bottom).offset(60);
    }];
    
    [self.transactionCountNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.transactionCount);
        make.top.equalTo(self.transactionCount.mas_bottom).offset(15);
    }];
    
    [self.leiJiShop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.centerY.equalTo(self.transactionCount);
    }];
    
    [self.leiJiShopNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leiJiShop);
        make.top.equalTo(self.leiJiShop.mas_bottom).offset(15);
    }];
    
    [self.leiJiAgent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView).offset(-40);
        make.centerY.equalTo(self.transactionCount);
    }];
    
    [self.leiJiAgentNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leiJiAgent);
        make.top.equalTo(self.leiJiAgent.mas_bottom).offset(15);
    }];
    
    [self.totalMachine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.transactionCountNum.mas_bottom).offset(60);
    }];
    
    [self.totalMachineNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.totalMachine);
        make.top.equalTo(self.totalMachine.mas_bottom).offset(15);
    }];
    
    [self.activeMachine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.centerY.equalTo(self.totalMachine);
    }];
    
    [self.activeMachineNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.activeMachine);
        make.top.equalTo(self.activeMachine.mas_bottom).offset(15);
        make.bottom.equalTo(self.bgView).offset(-40);
    }];
}

#pragma mark - Action
- (void)tiaoJianBtnClick:(id)sender {
    
}

- (void)shaiXuanBtnClick:(id)sender {
    
}

- (void)resetShaiXuanClick:(id)sender {
    
}

#pragma mark - lazy Load
- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"data_tongji_bg"]];
//        _bgView.layer.masksToBounds = YES;
//        _bgView.layer.cornerRadius = 12;
    }
    return _bgView;
}

-(UILabel *)tongJiTitle {
    if (!_tongJiTitle) {
        _tongJiTitle =  (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"数据统计";
            label.font = [UIFont boldSystemFontOfSize:18];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x333333];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _tongJiTitle;
}

+ (NSArray<NSString *> *)tiaoJianArray {
    return @[@"全部", @"直营", @"仅下级"];
}

- (UIButton *)tiaoJianBtn {
    if (!_tiaoJianBtn) {
        _tiaoJianBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"全部" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRGB:0x4b1400] forState:UIControlStateNormal];
            
            [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            button.backgroundColor = [UIColor whiteColor];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 23;
            [button addTarget:self action:@selector(tiaoJianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _tiaoJianBtn;
}

- (UIButton *)shaiXuanBtn {
    if (!_shaiXuanBtn) {
        _shaiXuanBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"筛选" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRGB:0x4b1400] forState:UIControlStateNormal];
            
            [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.backgroundColor = [UIColor clearColor];
            [button addTarget:self action:@selector(shaiXuanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _shaiXuanBtn;
}

//- (UIButton *)questionBtn {
//    if (!_questionBtn) {
//        _questionBtn = (UIButton *)({
//            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
//
//            [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//
//            button.titleLabel.font = [UIFont systemFontOfSize:14];
//            button.backgroundColor = [UIColor whiteColor];
//            button.layer.masksToBounds = YES;
//            button.layer.cornerRadius = 23;
//            [button addTarget:self action:@selector(questionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//            button;
//        });
//    }
//    return _questionBtn;
//}

- (UIButton *)resetShaiXuan {
    if (!_resetShaiXuan) {
        _resetShaiXuan = (UIButton *)({
                       UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
                   
                       [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
                       
                       button.titleLabel.font = [UIFont systemFontOfSize:14];
                       button.backgroundColor = [UIColor whiteColor];
                       button.layer.masksToBounds = YES;
                       button.layer.cornerRadius = 23;
                       [button addTarget:self action:@selector(resetShaiXuanClick:) forControlEvents:UIControlEventTouchUpInside];
                       button;
                   });
        }
    return _resetShaiXuan;
}

- (UILabel *)totalTransaction {
    if (!_totalTransaction) {
        _totalTransaction =  (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"近6月交易量(元)";
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _totalTransaction;
}

- (UILabel *)totalTransactionNum {
    if (!_totalTransactionNum) {
        _totalTransactionNum = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"3453462.34";
            label.font = [UIFont boldSystemFontOfSize:25];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _totalTransactionNum;
}

- (UILabel *)transactionCount {
    if (!_transactionCount) {
        _transactionCount = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"近6月交易笔数";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _transactionCount;
}

- (UILabel *)transactionCountNum {
    if (!_transactionCountNum) {
        _transactionCountNum = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"3553";
            label.font = [UIFont boldSystemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _transactionCountNum;
}

- (UILabel *)leiJiShop {
    if (!_leiJiShop) {
        _leiJiShop = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"累计商户";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _leiJiShop;
}

- (UILabel *)leiJiShopNum {
    if (!_leiJiShopNum) {
        _leiJiShopNum = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"356";
            label.font = [UIFont boldSystemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _leiJiShopNum;
}

- (UILabel *)leiJiAgent {
    if (!_leiJiAgent) {
        _leiJiAgent = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"累计代理商";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _leiJiAgent;
}

- (UILabel *)leiJiAgentNum {
    if (!_leiJiAgentNum) {
        _leiJiAgentNum = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"53342";
            label.font = [UIFont boldSystemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _leiJiAgentNum;
}

- (UILabel *)totalMachine {
    if (!_totalMachine) {
        _totalMachine = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"机具总数";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _totalMachine;
}

- (UILabel *)totalMachineNum {
    if (!_totalMachineNum) {
        _totalMachineNum = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"3593.32";
            label.font = [UIFont boldSystemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _totalMachineNum;
}

- (UILabel *)activeMachine {
    if (!_activeMachine) {
        _activeMachine = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"已激活";
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _activeMachine;
}

- (UILabel *)activeMachineNum {
    if (!_activeMachineNum) {
        _activeMachineNum = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"4442";
            label.font = [UIFont boldSystemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x4b1400];
            label.backgroundColor = [UIColor clearColor];
            label;
        });
    }
    return _activeMachineNum;
}

@end
