//
//  RegisterApi.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "RegisterApi.h"

@interface RegisterApi ()

@property(nonatomic,copy) NSString *kUsername,*kPassword,*kRPwd;

@end

@implementation RegisterApi

#pragma mark - Public Method

- (id)initWithAccount:(NSString *) account andPassword:(NSString *)pwd andRpassword:(NSString *)rwd{
    self=[super init];
    if (self) {
        _kUsername=account;
        _kPassword=pwd;
        _kRPwd=rwd;
    }
    return self;
}

-(NSString *)userId{
    id data=[self fetchDataWithReformer:nil];
    return [data objectForKey:@"userId"];
}

#pragma mark - Override

-(NSString *)requestUrl{
    //在YTKNetworkConfig中已经设置，这里只填除去域名剩余的网址信息
    return @"/login/join";
}

-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodPost;
}

-(id)requestArgument{
    return @{
             @"username": _kUsername,
             @"password":_kPassword,
             @"confirmpwd":_kRPwd
             };
    //如果有一些特殊字符（如中文或空格），也会被自动编码
}

//有些时候，由于服务器的Bug，会造成服务器返回一些不合法的数据，如果盲目地信任这些数据，可能会造成客户端Crash.使用 YTKRequest 的验证服务器返回值功能，可以很大程度上节省验证代码的编写时间。
//-(id)jsonValidator{
//    return @{
//             @"ems_code": [NSNumber class],
//             @"ems_msg": [NSNumber class],
//             @"user_info":@{
//                   @"addr":[NSString class],
//                   @"avatar":[NSString class],
//                   @"birthday":[NSString class],
//                   @"companyName":[NSString class],
//                   @"content":[NSString class],
//                   @"email":[NSString class],
//                   @"job":[NSString class],
//                   @"mobile":[NSString class],
//                   @"name":[NSString class],
//                   @"sex":[NSNumber class],
//                   @"uid":[NSNumber class],
//                   @"username":[NSString class]
//                }
//             };
//}

//data={
//    "ems_code" = 200;
//    "ems_msg" = OK;
//    "user_info" =     {
//        addr = "";
//        avatar = "http://test.o2oevent.com/public/images/avatar-large.png?1441683848";
//        birthday = "";
//        companyName = "";
//        content = "";
//        email = "13122718091@163.com";
//        job = "";
//        mobile = "";
//        name = "";
//        sex = 0;
//        uid = 2758;
//        username = "13122718091@163.com";
//    };
//}

@end
