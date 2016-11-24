//
//  MessageCell.h
//  DINGE
//
//  Created by chocklee on 2016/11/17.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *redPoint;


@end
