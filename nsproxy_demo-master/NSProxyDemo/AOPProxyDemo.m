//
//  AOPProxyDemo.m
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import "AOPProxyDemo.h"
#import "AOPMethodLogger.h"

@interface AOPProxyDemo ()

@property (nonatomic, retain) NSMutableArray *testMutableArray;

@end

@implementation AOPProxyDemo

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _testMutableArray = NSMutableArray.new;
        _proxy = [AOPMethodLogger proxyWithObject:_testMutableArray];
        [_proxy interceptMethodForSelector:@selector(addObjectsFromArray:)
                          interceptorPoint:InterceptPointStart
                                     block:^(NSInvocation *inv, InterceptionPoint time) {
                                         [AOPProxyDemo printInvocation:inv atPoint:time];
                                     }];
        
    }
    return self;
}

//- (NSMutableArray *)testMutableArray
//{
//    if(!_testMutableArray)
//    {
//        _testMutableArray = [[NSMutableArray alloc] init];
//    }
//    return _testMutableArray;
//}

+ (void)addObjectInterceptor:(NSInvocation *)invocation
{
    [AOPProxyDemo printInvocation:invocation
                          atPoint:InterceptPointStart];
}

+ (void)removeObjectAtIndexInterceptor:(NSInvocation *)invocation
{
    [AOPProxyDemo printInvocation:invocation
                          atPoint:InterceptPointEnd];
}

+ (void)testProxy:(id)proxy
{
    [proxy interceptMethodStartForSelector:@selector(addObject:)
                         interceptorTarget:self
                        interceptorSeletor:@selector(addObjectInterceptor:)];
    
    [proxy interceptMethodEndForSelector:@selector(removeObjectAtIndex:)
                       interceptorTarget:self
                      interceptorSeletor:@selector(removeObjectAtIndexInterceptor:)];
    
    [proxy interceptMethodForSelector:@selector(count)
                     interceptorPoint:InterceptPointStart
                                block:^(NSInvocation *inv, InterceptionPoint time) {
                                    [AOPProxyDemo printInvocation:inv atPoint:time];
                                }];
    
    [proxy addObject:@1];
    [proxy removeObjectAtIndex:0];
    [proxy count];
}

+ (void)printInvocation:(NSInvocation *)invocation
                atPoint:(InterceptionPoint)point
{
    NSLog(@"%@ -[__NSArrayM %@] intercepted with custom interceptor!\n",
          point == InterceptPointStart ? @"START" : @"END", NSStringFromSelector(invocation.selector));
}

@end
