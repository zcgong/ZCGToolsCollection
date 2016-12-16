//
//  SHPresentView.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/18.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHPresentView.h"

@implementation SHPresentView{
    NSInteger _type;
    CGFloat _width;
    CGFloat _height;
}

-(void)setUpPropery:(NSInteger)type{
    _type = type;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    _width = CGRectGetWidth(self.frame);
    _height = CGRectGetHeight(self.frame);
    switch (_type) {
        case 0:
            [self addLine];
            break;
        case 1:
            [self addRect];
            break;
        case 2:
            [self addEllipse];
            break;
        case 3:
            [self addArc];
            break;
        case 4:
            [self addLines];
            break;
        case 5:
            [self addCurve];
            break;
        default:
            break;
    }
}

//一条直线
-(void)addLine{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //CGLineCap 设置线的终点样式
    //kCGLineCapButt    终点为方形，显示的线仅仅延伸到路径的确切的终点，默认设置
    //kCGLineCapRound   终点为圆形，显示的线超过路径的终点，距离为线宽的1/2
    //kCGLineCapSquare  终点为方形，显示的线超过路径的终点，距离为线宽的1/2
    CGContextMoveToPoint(context, 50, 10);
    CGContextAddLineToPoint(context, 50, 60);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapButt);
    //线条不能渲染为实心的，所以CGContextFillPath(context)无效
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 100, 10);
    CGContextAddLineToPoint(context, 100, 60);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 150, 10);
    CGContextAddLineToPoint(context, 150, 60);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    
    //CGLineJoin 设置线交汇处的样式
    //kCGLineJoinMiter
    //kCGLineJoinRound
    //kCGLineJoinBevel
    CGContextMoveToPoint(context, 0, 105);
    CGContextAddLineToPoint(context, _width, 105);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 50, 80);
    CGContextAddLineToPoint(context, 50, 130);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineJoin(context, kCGLineJoinMiter);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 100, 80);
    CGContextAddLineToPoint(context, 100, 130);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 150, 80);
    CGContextAddLineToPoint(context, 150, 130);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    
    //角
    CGContextMoveToPoint(context, 80, 150);
    CGContextAddLineToPoint(context, 30, 200);
    CGContextAddLineToPoint(context, 80, 200);
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextStrokePath(context);
    
    //三角形
    CGContextMoveToPoint(context, 100, 220);
    CGContextAddLineToPoint(context, 10, 270);
    CGContextAddLineToPoint(context, 190, 270);
    CGContextClosePath(context);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextDrawPath(context, kCGPathEOFillStroke);
}

//矩形
-(void)addRect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(10, 10, 100, 60));
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextDrawPath(context, kCGPathEOFillStroke);
    
    CGContextAddRect(context, CGRectMake(120, 10, 60, 60));
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextDrawPath(context, kCGPathEOFillStroke);
    
    //CGPathDrawingMode 描绘路径的选择
    /*
    (理解SVG的图形填充规则) http://blog.csdn.net/cuixiping/article/details/7848369
     SVG的图形填充规则通过fill-rule属性来指定
     有效值:  	nonzero | evenodd
     evenodd => EO
     */
    
    CGContextAddRect(context, CGRectMake(10, 80, (_width-50)/4, (_width-50)/4));
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextSetLineWidth(context, 5);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextAddRect(context, CGRectMake(10+(_width-50)/4+10, 80, (_width-50)/4, (_width-50)/4));
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextSetLineWidth(context, 5);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextAddRect(context, CGRectMake(10+((_width-50)/4+10)*2, 80, (_width-50)/4, (_width-50)/4));
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextSetLineWidth(context, 5);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

//椭圆形
-(void)addEllipse{
    CGContextRef  context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, _width/2-20, 60));
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextAddEllipseInRect(context, CGRectMake(10+_width/2, 10, _width/2-20, _width/2-20));
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextDrawPath(context, kCGPathFillStroke);
}

//弧线
-(void)addArc{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, _width/4, _width/4, _width/4, 0, M_PI_2, 0);
    CGContextFillPath(context);
    
    CGContextAddArc(context, _width/4*3, _width/4, _width/4, 0, M_PI_2, 1);
    CGContextFillPath(context);
    
    CGContextAddArc(context, _width/4, _width/4*3, _width/4, 0, M_PI, 0);
    CGContextStrokePath(context);
    CGContextAddArc(context, _width/4*3, _width/4*3, _width/4, 0, M_PI, 1);
    CGContextStrokePath(context);
    
    CGContextAddArc(context, _width/4, _width/4*5, _width/4, 0, 2*M_PI, 0);
    CGContextFillPath(context);
    CGContextAddArc(context, _width/4*3, _width/4*5, _width/4, 0, 2*M_PI, 1);
    CGContextStrokePath(context);
}

//根据点划线
-(void)addLines{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint points[4];
    for (int i = 0 ; i < 4 ; i++) {
        points[i].x = 10+i*50;
        points[i].y = i%2*60+10;
    }
    CGContextAddLines(context, points, 4);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextStrokePath(context);
}

//根据点划线
-(void)addCurve{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //三次元贝塞尔曲线
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddCurveToPoint(context, 50, 100, 100, 50, 150, 150);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextStrokePath(context);
    
    //二次元贝塞尔曲线
    CGContextMoveToPoint(context, 10, 160);
    CGContextAddQuadCurveToPoint(context, 50, 350, 100, 300);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextStrokePath(context);
}


@end
