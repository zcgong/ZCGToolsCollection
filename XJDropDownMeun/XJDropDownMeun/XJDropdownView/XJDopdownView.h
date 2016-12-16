//
//  XJDopdownView.h
//  XJDropDownMeun
//
//  Created by 徐晶 on 16/3/4.
//  Copyright © 2016年 徐晶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJDopdownView : UIView

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,assign)id delegate;
-(instancetype)initWithFrame:(CGRect)frame andButtonheight:(CGFloat)height;

@end

@protocol XJDopdownViewDelegate <NSObject>

-(void)selectIndex:(NSInteger)index;

@end
