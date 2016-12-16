//
//  WDownloadProgressView.m
//  WDownloadProgressView
//
//  Created by 吴伟军 on 15/12/30.
//  Copyright (c) 2015年 吴伟军. All rights reserved.
//

#import "WDownloadProgressView.h"
#import <QuartzCore/QuartzCore.h>
#define kWidth [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
@implementation WDownloadProgressView

- (void)drawRect:(CGRect)rect
{
    [self drawProgress];
}

- (void)drawProgress
{
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设定线条宽度
    CGContextSetLineWidth(context, 10);
    //设定线条样式
    CGContextSetLineCap(context, kCGLineCapButt);
    //设定虚线
    CGFloat length[] = {4,0};
    /**
     参数1
     参数2 跳过的点数
     参数3 虚线
     参数4 数组的长度
     */
    CGContextSetLineDash(context, 0, length, 2);
    //设置颜色
    [[UIColor orangeColor] set];
    //设置路径
    CGFloat end = - 4 * M_PI_4 + (2 * M_PI *_number);
    //绘制圆
    /**
     参数1
     参数2 圆心x
     参数3 圆心y
     参数4 半径
     参数5 起点
     参数6 绘制大小
     参数7 0为逆时针 1为顺时针
     */
    CGContextAddArc(context, kWidth / 2, kWidth / 2, self.radius, - 4 * M_PI_4, end, 0);
    //绘制图形
    CGContextStrokePath(context);
}

- (WDownloadProgressView *)initWithURL:(NSURL *)fileURL progressFrame:(CGRect)frame font:(UIFont *)font timeout:(NSInteger)timeout radius:(CGFloat)radius alive:(BOOL)alive delegate:(id<WDownloadProgressViewDelegate>)thedelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //添加控件
        _downloadMB = [self labelWithFrame:(CGRectMake(kWidth / 2 - 50, kWidth / 2.2, 100, 20)) font:font color:[UIColor orangeColor]];
        _downloadpercent = [self labelWithFrame:(CGRectMake(kWidth / 2 - 40, kWidth / 1.8, 80, 20)) font:font color:[UIColor orangeColor]];
        if (alive) {
            [self addSubview:_downloadMB];
            [self addSubview:_downloadpercent];
        }else{
            
        }
        self.delegate = thedelegate;
        self.number = 0.0;
        self.radius = radius;
        self.fileName = [[[fileURL absoluteString] lastPathComponent]copy];
        self.receivedData = [[NSMutableData alloc] initWithLength:0];
        self.request = [[NSURLRequest alloc] initWithURL:fileURL cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:timeout];
        self.connection = [[NSURLConnection alloc] initWithRequest:self.request delegate:self startImmediately:YES];
        if (self.connection == nil) {
            [self.delegate progress:self didFileWithError:[NSError errorWithDomain:@"域错误" code:1 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"链接不存在",NSLocalizedDescriptionKey,nil]]];
        }
    }
    return self;
}

- (UILabel *)labelWithFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = font;
    label.textColor = [UIColor orangeColor];
    return label;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
    self.currentLength += data.length;
    //MB
    self.downloadMB.text = [NSString stringWithFormat:@"%.02fMB/%.02fMB",self.currentLength / 1024.0 / 1024.0,self.totalLength / 1024.0 / 1024.0];
    //百分比
    self.downloadpercent.text = [NSString stringWithFormat:@"%.02f%%",(self.currentLength / self.totalLength) * 100];
    if (self.totalLength != NSURLResponseUnknownLength) {
        self.number = self.currentLength / self.totalLength;
    }
    //调用描绘方法
    [self setNeedsDisplay];
    [self.delegate progressUpdated:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.totalLength = [response expectedContentLength];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.delegate progress:self didFileWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.delegate progress:self didFinishWithData:self.receivedData suggestedFilename:self.fileName];
}

@end
