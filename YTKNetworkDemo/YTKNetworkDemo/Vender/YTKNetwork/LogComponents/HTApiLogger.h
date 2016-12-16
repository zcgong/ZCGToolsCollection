//
//  HTLogger.h
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKBaseRequest.h"

@interface HTApiLogger : NSObject

+ (instancetype)sharedInstance;

+ (void)logDebugInfoWithRequest:(YTKBaseRequest *)request requsetrul:(NSString *)url requestParams:(id)requestParams httpMethod:(NSString *)httpMethod;

+ (void)logDebugInfoWithResposeString:(NSString *)responseString request:(YTKBaseRequest *)request url:(NSString *)url;

//+ (void)logDebugInfoWithCachedResponse:(HTURLResponse *)response methodName:(NSString *)methodName serviceIdentifier:(AIFService *)service;

@end
