//
//  QDHomePageViewController.m
//  QiDian
//
//  Created by yiner on 2020/9/9.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDHomePageViewController.h"
#import "QDHomeMenuTableViewCell.h"
#import "QDHomeBannerTableViewCell.h"
#import "QDGuangBoTableViewCell.h"
#import "QDHomeYeJiTableViewCell.h"

static NSString*const QDHomeBannerTableViewCellId = @"QDHomeBannerTableViewCell";
static NSString*const QDGuangBoTableViewCellId = @"QDGuangBoTableViewCell";
static NSString*const QDHomeMenuTableViewCellId = @"QDHomeMenuTableViewCell";
static NSString*const QDHomeYeJiTableViewCellId = @"QDHomeYeJiTableViewCell";

@interface QDHomePageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QDHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:QDHomeBannerTableViewCellId bundle:nil] forCellReuseIdentifier:QDHomeBannerTableViewCellId];
    [self.tableView registerNib:[UINib nibWithNibName:QDHomeYeJiTableViewCellId bundle:nil] forCellReuseIdentifier:QDHomeYeJiTableViewCellId];
    [self.tableView registerClass:[QDHomeBannerTableViewCell class] forCellReuseIdentifier:QDHomeBannerTableViewCellId];
    [self.tableView registerClass:[QDHomeMenuTableViewCell class] forCellReuseIdentifier:QDHomeMenuTableViewCellId];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"common"];
    
    QDHomeBannerTableViewCell *bannerCell = [tableView dequeueReusableCellWithIdentifier:QDHomeBannerTableViewCellId];
    QDGuangBoTableViewCell *guangboCell = [tableView dequeueReusableCellWithIdentifier:QDGuangBoTableViewCellId];
    QDHomeMenuTableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:QDHomeMenuTableViewCellId];
    QDHomeYeJiTableViewCell *yejiCell = [tableView dequeueReusableCellWithIdentifier:QDHomeYeJiTableViewCellId];
    
    if (indexPath.section == 0) {
        return bannerCell;
    }
    else if (indexPath.section == 1) {
        return guangboCell;
    }
    else if (indexPath.section == 2) {
        return menuCell;
    }
    else if (indexPath.section == 3) {
        return yejiCell;
    }
    else {
        return cell;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 168;
    }
    else if (indexPath.section == 1) {
        return 48;
    }
    else if (indexPath.section == 2) {
        return 185;
    }
    else if (indexPath.section == 3) {
        return 300;
    }
    return 0.01;
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
