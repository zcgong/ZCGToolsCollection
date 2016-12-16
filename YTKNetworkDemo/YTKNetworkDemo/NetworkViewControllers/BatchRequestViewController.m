//
//  BatchRequestViewController.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "BatchRequestViewController.h"
#import "YTKBatchRequest.h"
#import "GetImageApi.h"

@interface BatchRequestViewController ()

@end

@implementation BatchRequestViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     [self sendBatchRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//YTKBatchRequest 类：用于方便地发送批量的网络请求，YTKBatchRequest是一个容器类，它可以放置多个 YTKRequest 子类，并统一处理这多个网络请求的成功和失败

-(void)sendBatchRequest{
    GetImageApi *api1=[[GetImageApi alloc] initWithImageId:@"1.jpg"];
    GetImageApi *api2=[[GetImageApi alloc] initWithImageId:@"2.jpg"];
    GetImageApi *api3=[[GetImageApi alloc] initWithImageId:@"3.jpg"];
    
    YTKBatchRequest *batchRequest=[[YTKBatchRequest alloc] initWithRequestArray:@[api1,api2,api3]];
    [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
        NSArray *requests=batchRequest.requestArray;
        GetImageApi *a=(GetImageApi *)[requests objectAtIndex:0];
        GetImageApi *b=(GetImageApi *)[requests objectAtIndex:1];
        GetImageApi *c=(GetImageApi *)[requests objectAtIndex:2];
        
        id data1=[a fetchDataWithReformer:nil];
        id data2=[b fetchDataWithReformer:nil];
        id data3=[c fetchDataWithReformer:nil];
        
        NSLog(@"data1=%@ data2=%@ data3=%@",data1,data2,data3);
        
    } failure:^(YTKBatchRequest *batchRequest) {
        
    }];
}

@end
