//
//  AOPThreadInvoker.m
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import "AOPThreadInvoker.h"

@interface AOPThreadInvoker ()

@property (nonatomic, retain) NSThread *serializerThread;

@end

@implementation AOPThreadInvoker

- (instancetype)initWithInstance:(id)instance
                          thread:(NSThread *)thread
{
    if([super initWithObject:instance]) self.serializerThread = thread;
    
    return self;
}

- (void)invokeOriginalMethod:(NSInvocation *)invocation
{
    [invocation performSelector:@selector(invoke)
                       onThread:self.serializerThread
                     withObject:nil
                  waitUntilDone:YES];
}

@end
