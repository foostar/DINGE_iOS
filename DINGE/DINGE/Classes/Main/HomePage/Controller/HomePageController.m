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
#import <SDCycleScrollView.h>
// 轮播图模型
#import "HPCarouselModel.h"
// cell模型
#import "HPCellModel.h"

static CGFloat const HeaderViewHeight = 230;

@interface HomePageController () <UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UIView *navBarBgImageView;

@property (strong, nonatomic) SDCycleScrollView *headerView;

@property (strong, nonatomic) UILabel *navTitleLabel;

@end

@implementation HomePageController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navBarBgImageView.alpha = 0;
    self.navigationItem.titleView = self.navTitleLabel;
    self.navTitleLabel.hidden = YES;
    self.navTitleLabel.alpha = 0;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat minAlphaOffset = 0;
    CGFloat maxAlphaOffset = RealHeight(HeaderViewHeight) - 64;
    CGFloat offset = scrollView.contentOffset.y;
    if (offset > 0) {
        self.navTitleLabel.hidden = NO;
    }
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    self.navBarBgImageView.alpha = alpha;
    self.navTitleLabel.alpha = alpha;
}

#pragma mark - SDCycleScrollViewDelegate 
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld", index);
}

#pragma mark - getter
- (UIView *)navBarBgImageView {
    if (!_navBarBgImageView) {
        _navBarBgImageView = self.navigationController.navigationBar.subviews.firstObject;
    }
    return _navBarBgImageView;
}

- (UILabel *)navTitleLabel {
    if (!_navTitleLabel) {
        _navTitleLabel = [[UILabel alloc] init];
        _navTitleLabel.text = @"首页";
        _navTitleLabel.textColor = [UIColor colorWithHexString:NavTitleColor];
        _navTitleLabel.font = [UIFont fontWithName:NavTitleFont size:NavTitleFontNumber];
        _navTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_navTitleLabel sizeToFit];
    }
    return _navTitleLabel;
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

@end
