//
//  QDHomeYeJiTableViewCell.m
//  QiDian
//
//  Created by yiner on 2020/9/9.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDHomeYeJiTableViewCell.h"

@interface QDHomeYeJiTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgeView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *shouRu;
@property (weak, nonatomic) IBOutlet UILabel *jiaoYiCount;
@property (weak, nonatomic) IBOutlet UILabel *jiaoYiLiang;
@property (weak, nonatomic) IBOutlet UILabel *shopNum;
@property (weak, nonatomic) IBOutlet UILabel *shopCountNum;


@end

@implementation QDHomeYeJiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellType:(QDHomeYeJiCellType)cellType {
    _cellType = cellType;
    if (cellType == QDHomeYeJiCellTypeToday) {
        [self.imageView setImage:[UIImage imageNamed:@"home_yeji_d"]];
        self.titleLab.text = @"今日业绩";
    }
    else {
        [self.imageView setImage:[UIImage imageNamed:@"home_yeji_m"]];
        self.titleLab.text = @"本月业绩";
    }
}

@end
