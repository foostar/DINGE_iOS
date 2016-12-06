//
//  MeInfoCell.m
//  DINGE
//
//  Created by chocklee on 2016/11/22.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MeInfoCell.h"

@interface MeInfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarView;

@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;

@property (weak, nonatomic) IBOutlet UILabel *signLabel;


@end

@implementation MeInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.avatarView.layer.masksToBounds = YES;
    self.avatarView.layer.cornerRadius = _avatarView.height / 2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
