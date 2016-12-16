//
//  AOPProxy.h
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, InterceptionPoint){
    InterceptPointStart,
    InterceptPointEnd
};

typedef void(^InterceptionBlock)(NSInvocation *inv, InterceptionPoint time);

@interface AOPProxy : NSProxy

- (id)initWithObject:(id)obj;

+ (instancetype)proxyWithObject:(id)obj;

+ (instancetype)proxyWithClass:(Class)aClass;

- (void)interceptMethodStartForSelector:(SEL)interceptedSel
                      interceptorTarget:(id)interceptorTarget
                     interceptorSeletor:(SEL)interceptorSel;

- (void)interceptMethodEndForSelector:(SEL)interceptedSel
                    interceptorTarget:(id)interceptorTarget
                    interceptorSeletor:(SEL)interceptorSel;

- (void)interceptMethodForSelector:(SEL)sel
                  interceptorPoint:(InterceptionPoint)point
                             block:(InterceptionBlock)block;

- (void)invokeOriginalMethod:(NSInvocation *)invocation;

@end
