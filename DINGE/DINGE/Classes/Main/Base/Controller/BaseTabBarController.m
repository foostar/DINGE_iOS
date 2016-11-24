//
//  BaseTabBarController.m
//  DINGE
//
//  Created by chocklee on 2016/11/17.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "BaseTabBarController.h"
#import "UITabBar+Badge.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 去掉tabbar黑线并设置背景颜色
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:MainColor]]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // title正常颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:TabBarNormalColor]} forState:UIControlStateNormal];
    // title选中颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:TabBarSelectedColor]} forState:UIControlStateSelected];
    // 设置tabBar阴影效果
    self.tabBar.layer.shadowColor = [UIColor colorWithHexString:ShadowsColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0.0f , -1.0f);
    self.tabBar.layer.shadowRadius = 2.5f;
    self.tabBar.layer.shadowOpacity = 0.33f;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 如果有新消息显示
    // 给消息页面的TabbarItem添加小红点
//    [self.tabBar showBadgeOnItemIndex:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
