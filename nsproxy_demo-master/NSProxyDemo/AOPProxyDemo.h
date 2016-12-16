//
//  AOPProxyDemo.h
//  NSProxyDemo
//
//  Created by arbullzhang on 1/5/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AOPProxyDemo : NSObject

@property (nonatomic, retain) id proxy;

+ (void)testProxy:(id)proxy;

@end
