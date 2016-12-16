//
//  LoadCacheDataViewController.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "LoadCacheDataViewController.h"
#import "GetImageApi.h"

@interface LoadCacheDataViewController ()

@end

@implementation LoadCacheDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCacheData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//在实际开发中，有一些内容可能会加载很慢，我们想先显示上次的内容，等加载成功后，再用最新的内容替换上次的内容。也有时候，由于网络处于断开状态，为了更加友好，我们想显示上次缓存中的内容。这个时候，可以使用 YTKReqeust 的直接加载缓存的高级用法。

//具体的方法是直接使用YTKRequest的- (id)cacheJson方法，即可获得上次缓存的内容。当然，你需要把- (NSInteger)cacheTimeInSeconds覆盖，返回一个大于等于0的值，这样才能开启YTKRequest的缓存功能，否则默认情况下，缓存功能是关闭的。

//以下是一个示例，我们在加载用户信息前，先取得上次加载的内容，然后再发送请求，请求成功后再更新界面：

-(void)loadCacheData{
    GetImageApi *api=[[GetImageApi alloc] initWithImageId:@"1.jpg"];
    if ([api cacheJson]) {
        NSDictionary *json=[api cacheJson];
        NSLog(@"json=%@",json);
        //show cached data
    }
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        id data=[request fetchDataWithReformer:nil];
        NSLog(@"update ui");
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"failed");
    }];
}

@end
