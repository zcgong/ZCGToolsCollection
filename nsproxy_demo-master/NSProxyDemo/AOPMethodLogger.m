//
//  AOPMethodLogger.m
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import "AOPMethodLogger.h"

@implementation AOPMethodLogger

- (void)invokeOriginalMethod:(NSInvocation *)invocation
{
    const char *sels = NSStringFromSelector(invocation.selector).UTF8String;
    const char *cls = NSStringFromClass([invocation.target class]).UTF8String;
    
    NSLog(@"START -[%s %s] args:%ld returns:%s\n",
          sels, cls, invocation.methodSignature.numberOfArguments, invocation.methodSignature.methodReturnType);
    
    [super invokeOriginalMethod:invocation];
    
    NSLog(@"\nEND -[%s %s] args:%ld returns:%s\n",
          sels, cls, invocation.methodSignature.numberOfArguments, invocation.methodSignature.methodReturnType);
}

@end
