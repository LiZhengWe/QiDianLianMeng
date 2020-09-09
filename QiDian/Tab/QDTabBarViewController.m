//
//  QDTabBarViewController.m
//  QiDian
//
//  Created by yiner on 2020/9/7.
//  Copyright © 2020 Henan Sanliuba Network Technology Co., Ltd. All rights reserved.
//

#import "QDTabBarViewController.h"
#import "QDAppMacro.h"

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
              
              UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:item.rootViewController];
              navigationController.interactivePopGestureRecognizer.delegate = self;
              navigationController.tabBarItem = item;
              
              [viewControllers addObject:navigationController];
              
              if ([_barItems indexOfObject:item] == 0) {
                  item.isSelected = YES;
                  self.currentNavigation = navigationController;
              }
              
          }
          [self setViewControllers:viewControllers];
      }
      return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGB:0xFF5239],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil]forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGB:0x333333],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil]forState:UIControlStateNormal];

}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}


@end
