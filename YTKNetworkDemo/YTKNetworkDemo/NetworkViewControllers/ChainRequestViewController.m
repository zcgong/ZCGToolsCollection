//
//  ChainRequestViewController.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "ChainRequestViewController.h"
#import "RegisterApi.h"
#import "GetImageApi.h"
#import "YTKChainRequest.h"

@interface ChainRequestViewController () <YTKChainRequestDelegate>

@end

@implementation ChainRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sendChainRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - YTKChainRequestDelegate

-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    //all requests are done
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest failedBaseRequest:(YTKBaseRequest *)request{
    //some one of request is failed
}

//用于管理有相互依赖的网络请求，它实际上最终可以用来管理多个拓扑排序后的网络请求。
//例如，我们有一个需求，需要用户在注册时，先发送注册的Api，然后:
//如果注册成功，再发送读取用户信息的Api。并且，读取用户信息的Api需要使用注册成功返回的用户id号。
//如果注册失败，则不发送读取用户信息的Api了。
//们就可以通过chainRequestFinished回调来处理所有网络请求都发送成功的逻辑了。如果有任何其中一个网络请求失败了，则会触发chainRequestFailed回调。
-(void)sendChainRequest{
    RegisterApi *regApi=[[RegisterApi alloc] initWithAccount:@"13122718227@qq.com" andPassword:@"123456" andRpassword:@"123456"];
    YTKChainRequest *chainRequest=[[YTKChainRequest alloc] init];
    [chainRequest addRequest:regApi callback:^(YTKChainRequest *chainRequest, YTKBaseRequest *baseRequest) {
        RegisterApi *api=(RegisterApi*)baseRequest;
        NSString *userId=[api userId];
        GetImageApi *getImgApi=[[GetImageApi alloc] initWithImageId:userId];
        [chainRequest addRequest:getImgApi callback:nil];
    }];
    chainRequest.delegate=self;
    [chainRequest start];
}

@end
