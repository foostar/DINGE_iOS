//
//  BaseNavigationController.m
//  DINGE
//
//  Created by chocklee on 2016/11/17.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置NavigationBar样式
    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:MainColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    // 设置NavTitle的字体样式
    NSDictionary *attributedDic = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:NavTitleColor], NSFontAttributeName:[UIFont fontWithName:NavTitleFont size:NavTitleFontNumber]};
    self.navigationBar.titleTextAttributes = attributedDic;
    // 设置NavigationBar阴影效果
    self.navigationBar.layer.shadowColor = [UIColor colorWithHexString:ShadowsColor].CGColor; //shadowColor阴影颜色
    self.navigationBar.layer.shadowOffset = CGSizeMake(0.0f , 1.0f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
    self.navigationBar.layer.shadowOpacity = 0.33f;//阴影透明度，默认0
    self.navigationBar.layer.shadowRadius = 2.5f;//阴影半径
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        // 如果在堆栈控制器数量大于1 加返回按钮
        if (self.viewControllers.count > 0) {
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(popViewControllerAnimated:)];
            viewController.navigationItem.leftBarButtonItem = leftItem;
            viewController.hidesBottomBarWhenPushed = YES;
        } else {
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] init];
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
