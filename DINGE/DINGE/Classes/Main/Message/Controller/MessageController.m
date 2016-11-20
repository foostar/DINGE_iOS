//
//  MessageController.m
//  DINGE
//
//  Created by chocklee on 2016/11/17.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MessageController.h"
#import "MessageCell.h"

@interface MessageController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"消息中心";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView.tableFooterView = [[UIView alloc] init];
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

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = (MessageCell *)[tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    cell.iconImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"icon"]];
    cell.titleLabel.text = self.dataArray[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
