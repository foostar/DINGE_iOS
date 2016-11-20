//
//  HomePageController.m
//  DINGE
//
//  Created by chocklee on 2016/11/20.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "HomePageController.h"
#import "HomePageLeftCell.h"
#import "HomePageRightCell.h"
#import "BaseNavigationController.h"
#import <SDCycleScrollView.h>

static CGFloat const HeaderViewHeight = 230;

@interface HomePageController () <UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UIView *navBarBgImageView;

@property (strong, nonatomic) SDCycleScrollView *headerView;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navBarBgImageView.alpha = 0;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - lazy
- (UIView *)navBarBgImageView {
    if (!_navBarBgImageView) {
        _navBarBgImageView = self.navigationController.navigationBar.subviews.firstObject;
    }
    return _navBarBgImageView;
}

- (SDCycleScrollView *)headerView {
    if (!_headerView) {
        _headerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, RealHeight(HeaderViewHeight)) delegate:self placeholderImage:nil];
        _headerView.pageControlDotSize = CGSizeMake(6.0f, 6.0f);
        _headerView.pageDotColor = [UIColor colorWithHexString:@"2e323c"];
        // 本地图片
        _headerView.localizationImageNamesGroup = @[@"HP_first",@"HP_second",@"HP_third"];
        // 网络图片
//        _headerView.imageURLStringsGroup = 
    }
    return _headerView;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        // HomePageLeftCell
        HomePageLeftCell *cell = (HomePageLeftCell *)[tableView dequeueReusableCellWithIdentifier:@"HomePageLeftCell"];
        return cell;
    } else {
        // HomePageRightCell
        HomePageRightCell *cell = (HomePageRightCell *)[tableView dequeueReusableCellWithIdentifier:@"HomePageRightCell"];
        return cell;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat minAlphaOffset = 0;
    CGFloat maxAlphaOffset = RealHeight(HeaderViewHeight) - 64;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    _navBarBgImageView.alpha = alpha;
    if (alpha > 1.0f) {
        self.navigationItem.title = @"首页";
    } else {
        self.navigationItem.title = nil;
    }
}

#pragma mark - SDCycleScrollViewDelegate 
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld", index);
}

@end
