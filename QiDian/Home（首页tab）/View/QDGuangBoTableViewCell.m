//
//  QDGuangBoTableViewCell.m
//  QiDian
//
//  Created by yiner on 2020/9/9.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDGuangBoTableViewCell.h"
#import "QDAppMacro.h"

@interface QDGuangBoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImg;

@property (strong, nonatomic)           UILabel *contextLab;
@property (assign, nonatomic)           NSInteger index;
@end

@implementation QDGuangBoTableViewCell

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
    
    self.backView.layer.cornerRadius = 15;
    self.backView.layer.shadowColor = [UIColor colorWithRGB:0x000000 Alpha:0.06].CGColor;
    self.backView.layer.shadowOffset = CGSizeMake(0, 0);
    self.backView.layer.shadowRadius = 3;
    self.backView.layer.shadowOpacity = 1;
    
    self.backgroundColor = [UIColor clearColor];
    
    [self.backView addSubview:self.contextLab];
    
    if (@available(iOS 10.0, *)) {
        [NSTimer timerWithTimeInterval:2.85 repeats:YES block:^(NSTimer * _Nonnull timer) {
            
            [self timeRun];
        }];
    } else {
        
        [NSTimer scheduledTimerWithTimeInterval:2.85 target:self selector:@selector(timeRun) userInfo:nil repeats:YES];
    }
}

- (void)configureLayout {
    [self.contextLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView.mas_right).offset(7);
        make.right.equalTo(self.arrowImg.mas_left).offset(-7);
    }];
}

- (void)timeRun {
    
    _index += 1;
    if (_index == self.titleArr.count) {
        _index = 0;
    }
    
    CATransition * transition =[CATransition animation];
    [transition setDuration:0.3f];
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = @"cube";
    transition.subtype =kCATransitionFromTop ;
    [self.contextLab.layer addAnimation:transition forKey:nil];
    
    NSInteger idx = _index;
    self.contextLab.text =self.titleArr[idx];
}

- (void)setTitleArr:(NSArray<NSString *> *)titleArr {
    _titleArr = titleArr;
    
    _titleArr = @[@"两元，两元，瞧一瞧，看一看！", @"两块钱你买不了吃亏，你买不了上当！", @"两块钱你什么都买不到，你们这帮穷逼！"];
    
    self.contextLab.text = _titleArr[0];
}

#pragma mark - lazy load
- (UILabel *)contextLab {
    if (!_contextLab) {
        _contextLab = (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"暂无广播";
            label.font = [UIFont systemFontOfSize:13];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRGB:0x333333];
            label;
        });
    }
    return _contextLab;
}

@end
