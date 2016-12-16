//
//  AOPInterceptorInfo.h
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOPProxy.h"

@interface AOPInterceptorInfo : NSObject

@property (nonatomic, assign) SEL interceptedSel;

@property (nonatomic, retain) id interceptorTarget;
@property (nonatomic, assign) SEL interceptorSel;
@property (nonatomic, assign) InterceptionPoint point;
@property (nonatomic, copy)   InterceptionBlock block;

+ (instancetype)interceptedSelector:(SEL)interceptedSel
                  interceptorTarget:(id)interceptorTarget
                       withSelector:(SEL)interceptorSel
                            atPoint:(InterceptionPoint)point
                              block:(InterceptionBlock)block;

@end
