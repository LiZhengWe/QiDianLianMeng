//
//  QDHomeMenuTableViewCell.m
//  QiDian
//
//  Created by yiner on 2020/9/9.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDHomeMenuTableViewCell.h"
#import "QDAppMacro.h"

@interface QDHomeMenuTableViewCell ()

@property (strong, nonatomic)           UIButton *inviteBtn;
@property (strong, nonatomic)           UIButton *myShopBtn;
@property (strong, nonatomic)           UIButton *caiGouBtn;
@property (strong, nonatomic)           UIButton *myMachineBtn;
@property (strong, nonatomic)           UIButton *myPartnerBtn;
@property (strong, nonatomic)           UIButton *myWalletBtn;

@end

@implementation QDHomeMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView {
    [self.contentView addSubview:self.inviteBtn];
    [self.contentView addSubview:self.myShopBtn];
    [self.contentView addSubview:self.caiGouBtn];
    [self.contentView addSubview:self.myMachineBtn];
    [self.contentView addSubview:self.myPartnerBtn];
    [self.contentView addSubview:self.myWalletBtn];
    
    [self configureLayout];
}

- (void)configureLayout {
    
    [self.inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(40);
        make.top.equalTo(self.contentView).offset(20);
    }];
    
    [self.myShopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.inviteBtn);
    }];
    
    [self.caiGouBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-40);
        make.centerY.equalTo(self.inviteBtn);
    }];
    
    [self.myMachineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.inviteBtn);
        make.top.equalTo(self.inviteBtn.mas_bottom).offset(25);
    }];
    
    [self.inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.myMachineBtn);
    }];
    
    [self.inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-40);
        make.centerY.equalTo(self.myMachineBtn);
    }];
}

- (void)inviteBtnClick:(id)sender {
    
}

- (UIButton *)inviteBtn {
    if (!_inviteBtn) {
        _inviteBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"邀请伙伴" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"home_invite"] forState:UIControlStateNormal];
            
            [button frw_setStyle:FRWButtonMixStyleImageUp];
            [button frw_setPadding:15];
            [button setTitleColor:[UIColor colorWithRGB:0x333333] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            
            [button addTarget:self action:@selector(inviteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _inviteBtn;
}

- (UIButton *)myShopBtn {
    if (!_myShopBtn) {
        _myShopBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"我的商户" forState:UIControlStateNormal];
            
            
            [button setImage:[UIImage imageNamed:@"home_shop"] forState:UIControlStateNormal];
            [button frw_setStyle:FRWButtonMixStyleImageUp];
            [button frw_setPadding:15];
            [button setTitleColor:[UIColor colorWithRGB:0x333333] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            
            [button addTarget:self action:@selector(inviteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _myShopBtn;
}

- (UIButton *)caiGouBtn {
    if (!_caiGouBtn) {
        _caiGouBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"物料采购" forState:UIControlStateNormal];
            
            
            [button setImage:[UIImage imageNamed:@"home_caigou"] forState:UIControlStateNormal];
            [button frw_setStyle:FRWButtonMixStyleImageUp];
            [button frw_setPadding:15];
            [button setTitleColor:[UIColor colorWithRGB:0x333333] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            
            [button addTarget:self action:@selector(inviteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _caiGouBtn;
}

- (UIButton *)myMachineBtn {
    if (!_myMachineBtn) {
        _myMachineBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"我的机具" forState:UIControlStateNormal];
            
            
            [button setImage:[UIImage imageNamed:@"home_posmachine"] forState:UIControlStateNormal];
            [button frw_setStyle:FRWButtonMixStyleImageUp];
            [button frw_setPadding:15];
            [button setTitleColor:[UIColor colorWithRGB:0x333333] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            
            [button addTarget:self action:@selector(inviteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _myMachineBtn;
}

- (UIButton *)myPartnerBtn {
    if (!_myPartnerBtn) {
        _myPartnerBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"我的伙伴" forState:UIControlStateNormal];
            
            
            [button setImage:[UIImage imageNamed:@"home_partner"] forState:UIControlStateNormal];
            [button frw_setStyle:FRWButtonMixStyleImageUp];
            [button frw_setPadding:15];
            
            [button setTitleColor:[UIColor colorWithRGB:0x333333] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            
            [button addTarget:self action:@selector(inviteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _myPartnerBtn;
}

- (UIButton *)myWalletBtn {
    if (!_myWalletBtn) {
        _myWalletBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"我的钱包" forState:UIControlStateNormal];
            [button frw_setStyle:FRWButtonMixStyleImageUp];
            [button frw_setPadding:15];
            
            [button setImage:[UIImage imageNamed:@"home_wallet"] forState:UIControlStateNormal];
            
            
            [button setTitleColor:[UIColor colorWithRGB:0x333333] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            
            [button addTarget:self action:@selector(inviteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _myWalletBtn;
}

@end
