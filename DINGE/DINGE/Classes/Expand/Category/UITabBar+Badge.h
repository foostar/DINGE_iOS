//
//  UITabBar+Badge.h
//  DINGE
//
//  Created by chocklee on 2016/11/22.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

// 显示小红点
- (void)showBadgeOnItemIndex:(NSInteger)index;

// 隐藏小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index;

@end
