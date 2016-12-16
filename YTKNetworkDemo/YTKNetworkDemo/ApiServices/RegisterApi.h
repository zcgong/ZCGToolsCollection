//
//  RegisterApi.h
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "YTKRequest.h"

@interface RegisterApi : YTKRequest

- (id)initWithAccount:(NSString *) account andPassword:(NSString *)pwd andRpassword:(NSString *)rwd;

-(NSString *)userId;

@end
