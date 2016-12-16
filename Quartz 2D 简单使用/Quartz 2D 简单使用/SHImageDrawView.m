//
//  SHImageDrawView.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHImageDrawView.h"

@implementation SHImageDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"flower.png"];
    //平铺
    [image drawAsPatternInRect:CGRectMake(10, 10, 140, 400)];
    //拉伸
    [image drawInRect:CGRectMake(170, 10, 140, 400)];
}


@end
