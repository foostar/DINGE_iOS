//
//  MessageCommentCell.m
//  DINGE
//
//  Created by chocklee on 2016/11/29.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MessageCommentCell.h"

@interface MessageCommentCell ()
// 评论用户的头像
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
// 评论用户的昵称
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
// 评论用户的评论内容
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
// 作者的文章标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation MessageCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = _avatarImageView.height / 2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
