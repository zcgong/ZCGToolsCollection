//
//  RegisterViewController.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterApi.h"

#define  KUSERNAME  @"13122718091@163.com"
#define  KPASSWORD  @"123456"

@interface RegisterViewController () <YTKRequestDelegate>

@end

@implementation RegisterViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self test1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark YTKRequestDelegate

-(void)requestFinished:(YTKBaseRequest *)request{
    id data=[request fetchDataWithReformer:nil];
    NSLog(@"data=%@",data);
    if ([data[@"ems_code"] integerValue]==403) {
        NSLog(@"ems_msg=%@",data[@"ems_msg"]);
    }
}

-(void)requestFailed:(YTKBaseRequest *)request{
    NSLog(@"responseString=%@",request.responseString);
}

#pragma mark - Privaet Method

-(void)test1{
    //注意：你可以直接在block回调中使用 self，不用担心循环引用。因为 YTKRequest 会在执行完 block 回调之后，将相应的 block 设置成 nil。从而打破循环引用。
    RegisterApi *api=[[RegisterApi alloc] initWithAccount:KUSERNAME andPassword:KPASSWORD andRpassword:KPASSWORD];
    api.delegate=self;
    [api start];
}


@end
