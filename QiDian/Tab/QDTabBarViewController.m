//
//  QDTabBarViewController.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDTabBarViewController.h"

@interface QDTabBarViewController ()<UINavigationBarDelegate, UIGestureRecognizerDelegate, UITabBarControllerDelegate>

@property (nonatomic, strong) NSArray<QDTabBarItem*>* barItems;
@property (assign, nonatomic) NSTimeInterval lastClickDateTimeInterval;


@end

@implementation QDTabBarViewController

- (instancetype)initWithItems:(NSArray<QDTabBarItem *> *)items {
    if (self = [super init]) {
          self.delegate = self;
          _barItems = items;

          NSMutableArray *viewControllers = [NSMutableArray array];
          for (QDTabBarItem *item in self.barItems) {
              if (![item isKindOfClass:[QDTabBarItem class]]) {
                  continue;
              }
              
              if ([_barItems indexOfObject:item] == 0) {
                  item.isSelected = YES;
              }
              
              UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:item.rootViewController];
              navigationController.interactivePopGestureRecognizer.delegate = self;
              navigationController.tabBarItem = item;
              
              [viewControllers addObject:navigationController];
              
        
          }
          [self setViewControllers:viewControllers];
      }
      return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
