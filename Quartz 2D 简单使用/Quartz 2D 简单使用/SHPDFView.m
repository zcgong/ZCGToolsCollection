//
//  SHPDFView.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHPDFView.h"

@implementation SHPDFView


-(void)setPageNum:(NSInteger)pageNum{
    _pageNum = pageNum;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"keychainServConcepts" ofType:@"pdf"];
    CGPDFDocumentRef document = [self getPDFDocumentRefWithFilePath:filePath];
    CFStringRef path = CFStringCreateWithCString(NULL, [filePath UTF8String], kCFStringEncodingUTF8);
    CFURLRef URL = CFURLCreateWithFileSystemPath(NULL, path, kCFURLPOSIXPathStyle, NO);
    CFRelease(path);
    CFRelease(URL);
    CGPDFPageRef page = CGPDFDocumentGetPage(document, _pageNum);
    
    CGContextTranslateCTM(context, 0, self.frame.size.height);
    CGContextScaleCTM(context, 0.5, -0.5);
    CGContextDrawPDFPage(context, page);
    CFRelease(document);
    
    if (self.changePageBlock) {
        self.changePageBlock(_pageCount,_pageNum);
    }
    
}

-(CGPDFDocumentRef)getPDFDocumentRefWithFilePath:(NSString *)filePath{
    CFStringRef path = CFStringCreateWithCString(NULL, [filePath UTF8String], kCFStringEncodingUTF8);
    CFURLRef URL = CFURLCreateWithFileSystemPath(NULL, path, kCFURLPOSIXPathStyle, NO);
    
    CFRelease(path);
    CGPDFDocumentRef document = CGPDFDocumentCreateWithURL(URL);
    CFRelease(URL);
    size_t count = CGPDFDocumentGetNumberOfPages(document);
    _pageCount = count;
    if (count == 0 ) {
        printf("[%s] 最少需要有一页 \n",[filePath UTF8String]);
        return NULL;
    }
    else {
        printf("[%ld] pages loaded in this PDF!\n", count);
    }
    return document;
}


@end
