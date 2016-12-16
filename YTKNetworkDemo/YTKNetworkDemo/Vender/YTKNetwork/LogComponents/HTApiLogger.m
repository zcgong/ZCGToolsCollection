//
//  AXLogger.m
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "HTApiLogger.h"
#import "NSObject+AXNetworkingMethods.h"
#import "NSMutableString+AXNetworkingMethods.h"
#import "NSArray+AXNetworkingMethods.h"

@interface HTApiLogger ()


@end

@implementation HTApiLogger

+ (void)logDebugInfoWithRequest:(YTKBaseRequest *)request requsetrul:(NSString *)url requestParams:(id)requestParams httpMethod:(NSString *)httpMethod
{
#ifdef DEBUG
    
    NSMutableString *logString = [NSMutableString stringWithString:@"\n\n**************************************************************\n*                       Request Start                        *\n**************************************************************\n\n"];
    
    [logString appendFormat:@"API Name:\t\t%@\n", [request AIF_defaultValue:@"N/A"]];
    
    [logString appendFormat:@"Method:\t\t%@\n",httpMethod];
   
    
//    [logString appendFormat:@"Version:\t\t%@\n", [service.apiVersion AIF_defaultValue:@"N/A"]];
//    [logString appendFormat:@"Service:\t\t%@\n", [service class]];
//    [logString appendFormat:@"Status:\t\t%@\n", isOnline ? @"online" : @"offline"];
//    [logString appendFormat:@"Public Key:\t\t%@\n", [service.publicKey AIF_defaultValue:@"N/A"]];
//    [logString appendFormat:@"Private Key:%@\n", [service.privateKey AIF_defaultValue:@"N/A"]];
    [logString appendFormat:@"Params:\n%@", requestParams];
    
//    [logString appendURLRequest:request];
    [logString appendFormat:@"\nURL:\n%@",url];
    
    [logString appendFormat:@"\n\n**************************************************************\n*                         Request End                        *\n**************************************************************\n\n\n\n"];
    NSLog(@"%@", logString);
#endif
}

+ (void)logDebugInfoWithResposeString:(NSString *)responseString request:(YTKBaseRequest *)request url:(NSString *)url
{
#ifdef DEBUG
//    BOOL shouldLogError = error ? YES : NO;
    
    NSMutableString *logString = [NSMutableString stringWithString:@"\n\n==============================================================\n=                        API Response                        =\n==============================================================\n\n"];
    
    [logString appendFormat:@"Status:\t%ld\t(%@)\n\n", (long)request.responseStatusCode, [NSHTTPURLResponse localizedStringForStatusCode:request.responseStatusCode]];
    [logString appendFormat:@"Content:\n\t%@\n\n", responseString];
//    if (shouldLogError) {
//        [logString appendFormat:@"Error Domain:\t\t\t\t\t\t\t%@\n", error.domain];
//        [logString appendFormat:@"Error Domain Code:\t\t\t\t\t\t%ld\n", (long)error.code];
//        [logString appendFormat:@"Error Localized Description:\t\t\t%@\n", error.localizedDescription];
//        [logString appendFormat:@"Error Localized Failure Reason:\t\t\t%@\n", error.localizedFailureReason];
//        [logString appendFormat:@"Error Localized Recovery Suggestion:\t%@\n\n", error.localizedRecoverySuggestion];
//    }
    
    [logString appendString:@"\n---------------  Related Request Content  --------------\n"];
    
//    [logString appendURLRequest:request];
     [logString appendFormat:@"\nURL:\n%@",url];
    
    [logString appendFormat:@"\n\n==============================================================\n=                        Response End                        =\n==============================================================\n\n\n\n"];
    
    NSLog(@"%@", logString);
#endif
}

//+ (void)logDebugInfoWithCachedResponse:(HTURLResponse *)response methodName:(NSString *)methodName serviceIdentifier:(AIFService *)service; {
//#ifdef DEBUG
//    NSMutableString *logString = [NSMutableString stringWithString:@"\n\n==============================================================\n=                      Cached Response                       =\n==============================================================\n\n"];
//    
//    [logString appendFormat:@"API Name:\t\t%@\n", [methodName AIF_defaultValue:@"N/A"]];
//    [logString appendFormat:@"Version:\t\t%@\n", [service.apiVersion AIF_defaultValue:@"N/A"]];
//    [logString appendFormat:@"Service:\t\t%@\n", [service class]];
//    [logString appendFormat:@"Public Key:\t\t%@\n", [service.publicKey AIF_defaultValue:@"N/A"]];
//    [logString appendFormat:@"Private Key:\t%@\n", [service.privateKey AIF_defaultValue:@"N/A"]];
//    [logString appendFormat:@"Method Name:\t%@\n", methodName];
//    [logString appendFormat:@"Params:\n%@\n\n", response.requestParams];
////    [logString appendFormat:@"Content:\n\t%@\n\n", response.contentString];
//    
//    [logString appendFormat:@"\n\n==============================================================\n=                        Response End                        =\n==============================================================\n\n\n\n"];
//    NSLog(@"%@", logString);
//#endif
//}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static HTApiLogger *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

@end
