//
//  MessageLikeController.m
//  DINGE
//
//  Created by chocklee on 2016/11/29.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MessageLikeController.h"
#import "MessageLikeCell.h"

@interface MessageLikeController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MessageLikeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"喜欢";
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageLikeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageLikeCell"];
    cell.likeLabel.text = @"椰子奥利奥 喜欢了你的「荒野中，你为了什么活下来」";
    return cell;
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
