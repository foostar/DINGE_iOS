//
//  DiscoverController.m
//  DINGE
//
//  Created by chocklee on 2016/11/22.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "DiscoverController.h"
#import "DiscoverCell.h"

static const CGFloat DiscoverCellWidth = 130.0f;
static const CGFloat DiscoverCellHeight = 230.0f;
static const CGFloat MINIMUM_ITEM_SPACE = 16.0f;
static const CGFloat MINIMUM_LINE_SPACE = 0.0f;
static const CGFloat SectionTopAndBottomSpace = 22.0f;
static const CGFloat SectionLeftAndRightSpace = 22.0f;


@interface DiscoverController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation DiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private
- (void)setNavTitleView {
    UIImageView *titleView = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:@"discover_logo"];
    titleView.image = [image imageByTintColor:[UIColor colorWithHexString:NavTitleColor]];
    [titleView sizeToFit];
    self.navigationItem.titleView = titleView;
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DiscoverCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DiscoverCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(RealWidth(DiscoverCellWidth), RealHeight(DiscoverCellHeight));
}

// 该方法是设置一个section的上左下右边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(RealHeight(SectionTopAndBottomSpace), RealHeight(SectionLeftAndRightSpace), RealHeight(SectionTopAndBottomSpace), RealHeight(SectionLeftAndRightSpace));
}

// 两个cell之间的最小间距，是由API自动计算的，只有当间距小于该值时，cell会进行换行
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return MINIMUM_ITEM_SPACE;
}

// 两行之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return MINIMUM_LINE_SPACE;
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
