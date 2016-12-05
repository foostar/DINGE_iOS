//
//  MeEditInfoSignCell.m
//  DINGE
//
//  Created by chocklee on 2016/11/24.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MeEditInfoSignCell.h"

@interface MeEditInfoSignCell () <YYTextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *limitLabel;

@end

@implementation MeEditInfoSignCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _signTextView = [[YYTextView alloc] init];
    _signTextView.backgroundColor = [UIColor colorWithHexString:MainColor];
    _signTextView.placeholderText = @"有什么想说的么";
    _signTextView.placeholderFont = [UIFont fontWithName:@"PingFangSC-Light" size:12];
    _signTextView.placeholderTextColor = [UIColor colorWithHexString:@"c8ccd2"];
    _signTextView.font = [UIFont systemFontOfSize:14];
    _signTextView.textColor = [UIColor colorWithHexString:@"55637c"];
    _signTextView.delegate = self;
    [self addSubview:_signTextView];
    _signTextView.sd_layout
    .leftSpaceToView(_titleLabel,14)
    .rightSpaceToView(_limitLabel,20)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textViewDidChange:(YYTextView *)textView {
    if (textView.text.length > 30) {
        NSRange range = NSMakeRange(0, 30);
        NSString *text = textView.text;
        textView.text = [text substringWithRange:range];
    }
    _limitLabel.text = [NSString stringWithFormat:@"%lu/30", textView.text.length];
}

@end
