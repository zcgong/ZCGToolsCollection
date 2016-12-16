//
//  AOPProxy.m
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import "AOPProxy.h"
#import "AOPInterceptorInfo.h"

@interface AOPProxy ()

@property (readonly) id proxiedObject;
@property (nonatomic, retain) NSMutableArray *methodInterceptors;

@end

@implementation AOPProxy

- (NSMutableArray *)methodInterceptors
{
    if(!_methodInterceptors)
    {
        _methodInterceptors = [[NSMutableArray alloc] init];
    }
    return _methodInterceptors;
}

- (id)initWithObject:(id)obj
{
    _proxiedObject = obj;
    return self;
}

+ (instancetype)proxyWithObject:(id)obj
{
    return [self.class.alloc initWithObject:obj];
}

+ (instancetype)proxyWithClass:(Class)aClass
{
    return [self.class proxyWithObject:[aClass new]];
}

- (BOOL)isKindOfClass:(Class)aClass
{
    return [_proxiedObject isKindOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    return [_proxiedObject conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    return [_proxiedObject respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [_proxiedObject methodSignatureForSelector:sel];
}

- (void)invokeOriginalMethod:(NSInvocation *)invocation
{
    [invocation invoke];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL aSel = invocation.selector;
    if(![_proxiedObject respondsToSelector:aSel]) return;
    invocation.target = _proxiedObject;
    
    void (^invokeSelectors)(NSArray *) = ^(NSArray *interceptors){ @autoreleasepool{
            [interceptors enumerateObjectsUsingBlock:^(AOPInterceptorInfo*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if(obj.block) return obj.block(invocation, obj.point);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [(NSObject *)obj.interceptorTarget performSelector:obj.interceptorSel withObject:invocation];
#pragma clang diagnostic pop
            }];
        }
    };
    
    NSArray *sameSelectors = [self.methodInterceptors filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(AOPInterceptorInfo * _Nonnull info, NSDictionary<NSString *,id> * _Nullable bindings) {
        return info.interceptedSel == aSel;
    }]];
    
    invokeSelectors([sameSelectors filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"point == %@", @(InterceptPointStart)]]);
    
    [self invokeOriginalMethod:invocation];
    
    invokeSelectors([sameSelectors filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"point == %@", @(InterceptPointEnd)]]);
}

- (void)interceptMethodStartForSelector:(SEL)interceptedSel
                      interceptorTarget:(id)interceptorTarget
                     interceptorSeletor:(SEL)interceptorSel
{
    NSParameterAssert(interceptorTarget != NULL);
    
    [self.methodInterceptors addObject:[AOPInterceptorInfo interceptedSelector:interceptedSel
                                                             interceptorTarget:interceptorTarget
                                                                  withSelector:interceptorSel
                                                                       atPoint:InterceptPointStart
                                                                         block:NULL]];
}

- (void)interceptMethodEndForSelector:(SEL)interceptedSel
                    interceptorTarget:(id)interceptorTarget
                   interceptorSeletor:(SEL)interceptorSel
{
    NSParameterAssert(interceptorTarget != NULL);
    
    [self.methodInterceptors addObject:[AOPInterceptorInfo interceptedSelector:interceptedSel
                                                            interceptorTarget:interceptorTarget
                                                                  withSelector:interceptorSel
                                                                       atPoint:InterceptPointEnd
                                                                         block:NULL]];
}

- (void)interceptMethodForSelector:(SEL)sel
                  interceptorPoint:(InterceptionPoint)point
                             block:(InterceptionBlock)block
{
    NSParameterAssert(block != NULL);
    
    [self.methodInterceptors addObject:[AOPInterceptorInfo interceptedSelector:sel
                                                             interceptorTarget:NULL
                                                                  withSelector:NULL
                                                                       atPoint:point
                                                                         block:block]];
}

@end
