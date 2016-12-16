//
//  DetailTableCell.h
//  DetailTableView
//
//  Created by refine on 6/23/16.
//  Copyright © 2016 refine. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TapActionType)  {
    TapActionTypeGood,
    TapActionTypeBad,
};

typedef void(^tapActionBlock)(TapActionType tapType);

@interface DetailTableCell : UITableViewCell
@property (nonatomic, copy) tapActionBlock tapBlock;
@end
