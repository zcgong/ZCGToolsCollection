//
//  UploadImageViewController.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "UploadImageViewController.h"
#import "UploadImageApi.h"

@interface UploadImageViewController ()

@end

@implementation UploadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"imagename"];
    [self uploadImage:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)uploadImage:(UIImage *)image{
    UploadImageApi *api=[[UploadImageApi alloc] initWithImage:image];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"upload success");
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"upload failed");
    }];
}

@end
