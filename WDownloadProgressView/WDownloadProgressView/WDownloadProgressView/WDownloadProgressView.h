//
//  WDownloadProgressView.h
//  WDownloadProgressView
//
//  Created by 吴伟军 on 15/12/30.
//  Copyright (c) 2015年 吴伟军. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WDownloadProgressViewDelegate;
@interface WDownloadProgressView : UIView

@property (nonatomic,retain) NSURLRequest *request;
@property (nonatomic,retain) NSURLConnection *connection;
@property (nonatomic,retain) NSString *fileName;
@property (nonatomic,retain) NSMutableData *receivedData;
@property (nonatomic,assign) id<WDownloadProgressViewDelegate> delegate;
@property (nonatomic,assign) CGFloat currentLength;
@property (nonatomic,assign) CGFloat totalLength;
@property (nonatomic,retain) UILabel *downloadMB;
@property (nonatomic,retain) UILabel *downloadpercent;
@property (nonatomic,assign) CGFloat number;
@property (nonatomic,assign) CGFloat radius;

- (WDownloadProgressView *)initWithURL:(NSURL *)fileURL progressFrame:(CGRect)frame font:(UIFont *)font timeout:(NSInteger)timeout radius:(CGFloat)radius alive:(BOOL)alive delegate:(id<WDownloadProgressViewDelegate>)thedelegate;
@end

@protocol WDownloadProgressViewDelegate <NSObject>
//下载完成
- (void)progress:(WDownloadProgressView *)progress didFinishWithData:(NSData *)fileData suggestedFilename:(NSString *)filename;
@optional
//下载错误
- (void)progress:(WDownloadProgressView *)progress didFileWithError:(NSError *)error;
//更新中
- (void)progressUpdated:(WDownloadProgressView *)progress;
@end


