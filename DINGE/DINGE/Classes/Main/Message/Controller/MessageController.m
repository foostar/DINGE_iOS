//
//  MessageController.m
//  DINGE
//
//  Created by chocklee on 2016/11/17.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MessageController.h"
#import "MessageCell.h"
#import "UITabBar+Badge.h"
#import "MessageFansController.h"

@interface MessageController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) NSArray *controllerNameArray;

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"消息中心";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView.tableFooterView = [[UIView alloc] init];
    
    // 如果有新消息显示
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
//    MessageCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    cell.redPoint.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - lazy
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@{@"icon":@"message_comment",@"title":@"评论"},
                       @{@"icon":@"message_message",@"title":@"私信"},
                       @{@"icon":@"message_like",@"title":@"喜欢"},
                       @{@"icon":@"message_fans",@"title":@"粉丝"}];
    }
    return _dataArray;
}

- (NSArray *)controllerNameArray {
    if (!_controllerNameArray) {
        _controllerNameArray = @[@"MessageCommentController",@"MessageMessageController",@"MessageLikeController",@"MessageFansController"];
    }
    return _controllerNameArray;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = (MessageCell *)[tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    cell.iconImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"icon"]];
    cell.titleLabel.text = self.dataArray[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc =  [[UIStoryboard storyboardWithName:@"Message" bundle:nil] instantiateViewControllerWithIdentifier:self.controllerNameArray[indexPath.row]];
    [self.navigationController showViewController:vc sender:nil];
}

@end
