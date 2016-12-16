//
//  CDNViewController.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "CDNViewController.h"
#import "GetImageApi.h"

@interface CDNViewController ()

@end

@implementation CDNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GetImageApi *api=[[GetImageApi alloc] initWithImageId:@"1.jpg"];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"data=%@",[request fetchDataWithReformer:nil]);
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"code=%ld error=%@",(long)request.responseStatusCode,request.responseString);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
