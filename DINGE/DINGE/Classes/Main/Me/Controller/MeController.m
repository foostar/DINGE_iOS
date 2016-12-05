//
//  MeController.m
//  DINGE
//
//  Created by chocklee on 2016/11/22.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MeController.h"
#import "MeInfoCell.h"
#import "MeCell.h"
#import "MeNightCell.h"
#import "MeEditInfoController.h"

@interface MeController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) NSArray *controllerNameArray;

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0,CGFLOAT_MIN)];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@[@{@"icon":@"me_write",@"title":@"我的影评"},
                         @{@"icon":@"me_followed",@"title":@"我关注的"},
                         @{@"icon":@"me_collection",@"title":@"我收藏的"},
                         @{@"icon":@"me_history",@"title":@"浏览历史"},
                         @{@"icon":@"me_draft",@"title":@"草稿箱"}],
                       @[@{@"icon":@"me_set",@"title":@"设置"}]];
    }
    return _dataArray;
}

- (NSArray *)controllerNameArray {
    if (!_controllerNameArray) {
        _controllerNameArray = @[@[@"MeWriteController",@"MeFollowedController",@"MeCollectionController",@"MeHistoryController",@"MeDraftController"],
              @[@"MeSetController"]];
    }
    return _controllerNameArray;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return [self.dataArray[0] count];
        case 2:
            return 2;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    } else if (section == 1) {
        return 13;
    } else {
        return 9;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 9;
    } else {
        return 13;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 90.0f;
    } else {
        return 42.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeInfoCell"];
        return cell;
    } else {
        if (indexPath.section == 2 && indexPath.row == 1) {
            MeNightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeNightCell"];
            return cell;
        } else {
            MeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeCell"];
            cell.iconImageView.image = [UIImage imageNamed:self.dataArray[0][indexPath.row][@"icon"]];
            cell.titleLabel.text = self.dataArray[indexPath.section - 1][indexPath.row][@"title"];
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 0 ) {
        // 夜间模式时return
        if (indexPath.section == 2 && indexPath.row == 1) {
            return;
        }
        UIViewController *vc =  [[UIStoryboard storyboardWithName:@"Me" bundle:nil] instantiateViewControllerWithIdentifier:self.controllerNameArray[indexPath.section - 1][indexPath.row]];
        [self.navigationController showViewController:vc sender:nil];
    }
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//    if ([segue.identifier isEqualToString:@"ShowEditInfo"]) {
//        MeEditInfoController *mEIVC = (MeEditInfoController *)[segue destinationViewController];
//    }
}


@end
