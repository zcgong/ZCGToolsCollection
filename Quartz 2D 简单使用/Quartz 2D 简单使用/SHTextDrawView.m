//
//  SHTextDrawView.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHTextDrawView.h"
#import <CoreText/CoreText.h>

@implementation SHTextDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSString *string = @"生如夏花之绚烂，死如秋叶之静美。 ----泰戈尔 《飞鸟集》\n 黑夜给了我一双黑色的眼睛,我却用它去寻找黎明 －－－－顾城 《一代人》";
    [string drawInRect:CGRectMake(10, 10, CGRectGetWidth(self.frame)-20, 200) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    [string drawAtPoint:CGPointMake(10, 200) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
}


@end
