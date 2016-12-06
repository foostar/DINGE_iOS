//
//  MeEditInfoController.m
//  DINGE
//
//  Created by chocklee on 2016/11/24.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MeEditInfoController.h"
#import "MeEditInfoCell.h"
#import "MeEditInfoSignCell.h"
#import "MeEditInfoNickNameCell.h"

static const CGFloat HeaderViewHeight = 104.0f;

@interface MeEditInfoController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UIView *headerView;

@property (strong, nonatomic) UIImageView *avatarView;

@property (strong, nonatomic) NSArray *titleArray;

@end

@implementation MeEditInfoController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"编辑资料";
    
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        return 79.0f;
    } else {
        return 45.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MeEditInfoNickNameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeEditInfoNickNameCell"];
        cell.titleLabel.text = self.titleArray[indexPath.row];
        return cell;
    } else if (indexPath.row == 1) {
        MeEditInfoSignCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeEditInfoSignCell"];
        cell.titleLabel.text = self.titleArray[indexPath.row];
        cell.signTextView.text = @"这都是什么👻";
        return cell;
    } else {
        MeEditInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeEditInfoCell"];
        cell.titleLabel.text = self.titleArray[indexPath.row];
        return cell;
    }
}

#pragma mark - getter
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
        _headerView.backgroundColor = [UIColor colorWithHexString:@"FDFDF9"];
        [_headerView setLayerShadow:[UIColor colorWithHexString:ShadowsColor] offset:CGSizeMake(0.0f, 1.0f) radius:2.5];
        _headerView.layer.shadowOpacity = 0.33f;
        [_headerView addSubview:self.avatarView];
    }
    return _headerView;
}

- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _avatarView.center = _headerView.center;
        _avatarView.backgroundColor = [UIColor cyanColor];
        _avatarView.layer.masksToBounds = YES;
        _avatarView.layer.cornerRadius = 30;
    }
    return _avatarView;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"昵称",@"签名",@"性别",@"城市",@"生日"];
    }
    return _titleArray;
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
