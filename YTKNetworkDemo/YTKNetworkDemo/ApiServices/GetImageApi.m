//
//  GetImageApi.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "GetImageApi.h"

@interface GetImageApi ()

@property(nonatomic,copy) NSString *kImageId;

@end

@implementation GetImageApi

#pragma mark - Public Method

-(id)initWithImageId:(NSString *)imageId{
    self=[super init];
    if (self) {
        _kImageId=imageId;
    }
    return self;
}

#pragma mark - Override

-(NSString *)requestUrl{
    return [NSString stringWithFormat:@"/iphone/images/%@", self.kImageId];
}

//如果要使用CDN地址，只需要覆盖 YTKRequest 类的 - (BOOL)useCDN;方法
-(BOOL)useCDN{
    return YES;
}

////要启动断点续传功能，只需要覆盖 resumableDownloadPath方法，指定断点续传时文件的暂存路径即可
//-(NSString *)resumableDownloadPath{
//    NSString *filePath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    NSString *cachePath=[filePath stringByAppendingPathComponent:@"Caches"];
//    return [cachePath stringByAppendingPathComponent:self.kImageId];
//}

//缓存时间 增加了一个3分钟的缓存，3分钟内调用Api的start方法，实际上
-(NSInteger)cacheTimeInSeconds{
    return 60*3;
}

@end
