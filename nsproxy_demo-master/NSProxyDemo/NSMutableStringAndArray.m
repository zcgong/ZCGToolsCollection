//
//  NSMutableStringAndArray.m
//  NSProxyDemo
//
//  Created by arbullzhang on 1/4/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import "NSMutableStringAndArray.h"

@interface NSMutableStringAndArray ()

@property (nonatomic, retain) NSMutableString *stringObject;
@property (nonatomic, retain) NSMutableArray  *arrayObject;

@end

@implementation NSMutableStringAndArray

- (instancetype)init
{
    self.stringObject = [[NSMutableString alloc] init];
    self.arrayObject = [[NSMutableArray alloc] init];
    
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *sig;
    sig = [self.stringObject methodSignatureForSelector:sel];
    if(sig) return sig;
    sig = [self.arrayObject methodSignatureForSelector:sel];
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    id target = [self.stringObject methodSignatureForSelector:[invocation selector]] ? self.stringObject : self.arrayObject;
    [invocation invokeWithTarget:target];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if([self.stringObject respondsToSelector:aSelector]) return YES;
    if([self.arrayObject respondsToSelector:aSelector]) return YES;
    return NO;
}

@end
