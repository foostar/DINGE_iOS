//
//  UITabBar+Badge.m
//  DINGE
//
//  Created by chocklee on 2016/11/22.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "UITabBar+Badge.h"

static NSInteger const TabBarNumbers = 5;
static CGFloat const BadgeSize = 6;

@implementation UITabBar (Badge)

// 显示小红点
- (void)showBadgeOnItemIndex:(NSInteger)index {
    [self hideBadgeOnItemIndex:index];
    
    // 新建小红点
    UIView *badgeView = [[UIView alloc] init];
    badgeView.tag = TabBarBadgeTag + index;
    badgeView.layer.cornerRadius = BadgeSize / 2.0f;
    badgeView.backgroundColor = [UIColor colorWithHexString:BadgeColor];
    
    // 确定小红点的位置
    CGRect tabFrame = self.frame;
    float percentX = (index + 0.6) / TabBarNumbers;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.18 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, BadgeSize, BadgeSize);
    [self addSubview:badgeView];
    [self bringSubviewToFront:badgeView];
}

// 隐藏小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index {
    // 按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == TabBarBadgeTag + index) {
            [subView removeFromSuperview];
        }
    }
}

@end
