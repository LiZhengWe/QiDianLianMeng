//
//  QDDataTableViewCell.m
//  QiDian
//
//  Created by yiner on 2020/9/8.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDDataTableViewCell.h"

@interface QDDataTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *kaoHeBtn;
@property (weak, nonatomic) IBOutlet UIButton *keHeZhongBtn;
@property (weak, nonatomic) IBOutlet UIButton *weiKaiShi;
@property (weak, nonatomic) IBOutlet UIButton *yiDaBiaoBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weiDaBiao;


@end

@implementation QDDataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
