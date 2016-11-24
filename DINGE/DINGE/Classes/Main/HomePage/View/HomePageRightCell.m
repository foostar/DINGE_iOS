//
//  HomePageRightCell.m
//  DINGE
//
//  Created by chocklee on 2016/11/20.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "HomePageRightCell.h"
#import "HPCellModel.h"

@interface HomePageRightCell ()

// 电影海报
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
// 用户头像
@property (weak, nonatomic) IBOutlet UIImageView *userAvatarView;
// 用户昵称
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
// 发表时间
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
// 评论标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// 阅读数
@property (weak, nonatomic) IBOutlet UILabel *readNumberLabel;
// 评论数
@property (weak, nonatomic) IBOutlet UILabel *replyNumberLabel;
// 喜欢数
@property (weak, nonatomic) IBOutlet UILabel *starNumberLabel;

@end

@implementation HomePageRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _userAvatarView.layer.masksToBounds = YES;
    _userAvatarView.layer.cornerRadius = _userAvatarView.height / 2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
