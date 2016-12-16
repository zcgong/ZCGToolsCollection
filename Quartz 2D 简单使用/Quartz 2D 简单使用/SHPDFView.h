//
//  SHPDFView.h
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangePageBlock)(NSInteger pageCount,NSInteger pageNum);

@interface SHPDFView : UIView
@property (nonatomic, strong) ChangePageBlock changePageBlock;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageCount;
@end
