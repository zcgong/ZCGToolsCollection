//
//  DetailTableCell.m
//  DetailTableView
//
//  Created by refine on 6/23/16.
//  Copyright © 2016 refine. All rights reserved.
//

#import "DetailTableCell.h"

@implementation DetailTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (IBAction)buttonAction:(UIButton *)sender {
    TapActionType type = TapActionTypeGood;
    if (sender.tag == 1) {
        type = TapActionTypeBad;
    }
    if (_tapBlock) {
        _tapBlock (type);
    }
}

@end
