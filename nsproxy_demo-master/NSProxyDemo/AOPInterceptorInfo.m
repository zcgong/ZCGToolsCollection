//
//  AOPInterceptorInfo.m
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import "AOPInterceptorInfo.h"

@implementation AOPInterceptorInfo

+ (instancetype)interceptedSelector:(SEL)interceptedSel
                  interceptorTarget:(id)interceptorTarget
                       withSelector:(SEL)interceptorSel
                            atPoint:(InterceptionPoint)point
                              block:(InterceptionBlock)block
{
    AOPInterceptorInfo *obj = [[AOPInterceptorInfo alloc] init];
    obj.interceptedSel = interceptedSel;
    obj.point = point;
    
    if(interceptorTarget) obj.interceptorTarget = interceptorTarget;
    if(interceptorSel) obj.interceptorSel = interceptorSel;
    if(block) obj.block = block;
    
    return obj;
}

@end
