//
//  SHClipImageView.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHClipImageView.h"

@implementation SHClipImageView

-(void)setRadio:(NSInteger)radio{
    _radio = radio;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, _radio, _radio));
    CGContextClip(context);
    
    UIImage *image = [UIImage imageNamed:@"flower.png"];
    [image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), 200)];
}


@end
