//
//  MeEditInfoSignCell.h
//  DINGE
//
//  Created by chocklee on 2016/11/24.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeEditInfoSignCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) YYTextView *signTextView;

@end
