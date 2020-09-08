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

@interface QDDataViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)           UIScrollView *scrollView;
@property (strong, nonatomic)           UIImageView *topBgImgView;
@property (strong, nonatomic)           UILabel *dataLabel;
@property (strong, nonatomic)           UIButton *kTableBtn;

@property (strong, nonatomic)           UITableView *tableView;

@end

@implementation QDDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    [self configureView];
}

- (void)configureView {
    
    [self.scrollView addSubview:self.topBgImgView];
    [self.scrollView addSubview:self.dataLabel];
    [self.scrollView addSubview:self.kTableBtn];
    
    [self configureLayout];
}

- (void)configureLayout {
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
}

#pragma mark - Action
- (void)kTableBtnClick:(id)sender {
    //TODO: 跳转
}

#pragma mark - 懒加载
- (UIImageView *)topBgImgView {
    if (!_topBgImgView) {
        _topBgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        _topBgImgView.backgroundColor = [UIColor colorWithRGB:0xffba1b];
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
            
            //separator
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            
            //background
            tableView.backgroundColor = [UIColor clearColor];
            
            //section header/footer & cells
//            [tableView registerClass:<#(nullable Class)#> forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>];
//            [tableView registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>];
            
            //header & footer
            tableView.tableHeaderView = (UIView *)({
                UIView *view = [UIView new];
                view.frame = CGRectMake(0, 0, 0, CGFLOAT_MIN);
                view.backgroundColor = [UIColor clearColor];
                view;
            });
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
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
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
