//
//  QDDataViewController.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDDataViewController.h"
#import "QDAppMacro.h"
#import <Masonry/Masonry.h>
#import "QDDataTableHeaderView.h"
#import "QDDataTongJiView.h"
#import "QDKaoHeHeaderView.h"
#import "QDDataTableViewCell.h"


static NSString *const kQDDataTableCellId = @"QDDataTableViewCell";

@interface QDDataViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)           UIScrollView *scrollView;
@property (strong, nonatomic)           UIImageView *topBgImgView;
@property (strong, nonatomic)           UILabel *dataLabel;
@property (strong, nonatomic)           UIButton *kTableBtn;

@property (strong, nonatomic)           QDDataTableHeaderView *shouRuView; // 我的收入
@property (strong, nonatomic)           QDDataTongJiView *tongJiView; // 数据统计


@property (strong, nonatomic)           UITableView *tableView;
@property (strong, nonatomic)           QDKaoHeHeaderView *headerView;

@end

@implementation QDDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xF5F5F5];
    self.navigationController.navigationBarHidden = YES;
    
    [self configureView];
    [self reloadView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)configureView {
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.topBgImgView];
    [self.scrollView addSubview:self.dataLabel];
    [self.scrollView addSubview:self.kTableBtn];
    [self.scrollView addSubview:self.shouRuView];
    [self.scrollView addSubview:self.tongJiView];
    [self.scrollView addSubview:self.tableView];
    
    [self configureLayout];
}

- (void)configureLayout {
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self.topBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self.scrollView);
    }];
    
    [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView).offset(20);
        make.top.equalTo(self.scrollView).offset(44 + kStatusBarHeight);
    }];
    
    [self.kTableBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.scrollView).offset(-20);
        make.centerY.equalTo(self.dataLabel);
    }];
    
    [self.shouRuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dataLabel.mas_bottom).offset(15);
        make.left.right.equalTo(self.scrollView);
    }];
    
    [self.tongJiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.scrollView);
        make.top.equalTo(self.shouRuView.mas_bottom).offset(15);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView).offset(20);
        make.right.equalTo(self.scrollView).offset(-20);
        make.top.equalTo(self.tongJiView.mas_bottom).offset(-25);
        make.bottom.equalTo(self.scrollView).offset(-20);
        make.height.mas_equalTo(0);
    }];
    
}

- (void)reloadView {
    
    CGFloat height = 0;
    height = self.headerView.frame.size.height;
    height += (4*74);
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QDDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kQDDataTableCellId];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 74;
}

#pragma mark - Action
- (void)kTableBtnClick:(id)sender {
    //TODO: 跳转
}

#pragma mark - 懒加载
- (UIImageView *)topBgImgView {
    if (!_topBgImgView) {
        _topBgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"data_top_bg"]];
    }
    return _topBgImgView;
}

- (UILabel *)dataLabel {
    if (!_dataLabel) {
        _dataLabel =  (UILabel *)({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.text = @"数据";
            label.font = [UIFont boldSystemFontOfSize:25];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label;
        });
    }
    return _dataLabel;
}

- (UIButton *)kTableBtn {
    if (!_kTableBtn) {
        _kTableBtn = (UIButton *)({
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"data_k_table"] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor clearColor];
            
            [button addTarget:self action:@selector(kTableBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _kTableBtn;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = (UITableView *)({
            UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
            //delegate
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.layer.cornerRadius = 15;
            tableView.scrollEnabled = NO;
            //separator
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            
            //background
            tableView.backgroundColor = [UIColor clearColor];
            
           
            [tableView registerNib:[UINib nibWithNibName:kQDDataTableCellId bundle:nil] forCellReuseIdentifier:kQDDataTableCellId];
            
            //header & footer
            tableView.tableHeaderView = [self headerView];
            
            
            tableView.tableFooterView = (UIView *)({
                UIView *view = [UIView new];
                view.frame = CGRectMake(0, 0, 0, CGFLOAT_MIN);
                view.backgroundColor = [UIColor clearColor];
                view;
            });
            
            tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
                [self.tableView.mj_header endRefreshing];
                
            }];
            tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
                [self.tableView.mj_footer endRefreshing];
                [self.tableView.mj_footer resetNoMoreData];
                
            }];
            
            //iOS 11
            if (@available(iOS 11.0, *)) {
                tableView.estimatedRowHeight = 0;
                tableView.estimatedSectionFooterHeight = 0;
                tableView.estimatedSectionHeaderHeight = 0;
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
            
            tableView;
        });
    }
    return _tableView;
}


- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHight)];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}


- (QDDataTableHeaderView *)shouRuView {
    if (!_shouRuView) {
        _shouRuView = [[QDDataTableHeaderView alloc] init];
    }
    return _shouRuView;
}

- (QDDataTongJiView *)tongJiView {
    if (!_tongJiView) {
        _tongJiView = [[QDDataTongJiView alloc] init];
    }
    return _tongJiView;
}

- (QDKaoHeHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[QDKaoHeHeaderView alloc] init];
        _headerView.bounds = CGRectMake(0, 0, kScreenWidth, 93);
    }
    return _headerView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
