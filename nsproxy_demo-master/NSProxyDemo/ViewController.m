//
//  ViewController.m
//  NSProxyDemo
//
//  Created by arbullzhang on 1/4/16.
//  Copyright © 2016 arbullzhang. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableStringAndArray.h"
#import "AOPProxyDemo.h"
#import "AOPProxy.h"
#import "AOPMethodLogger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testNSProxy];
    [self testAOP1];
    [self testAOP2];
}

- (void)testNSProxy
{
    id/*NSMutableStringAndArray*/ stringAndArrayProxy = [[NSMutableStringAndArray alloc] init];
    [stringAndArrayProxy appendString:@"This "];
    [stringAndArrayProxy appendString:@"is "];
    [stringAndArrayProxy appendString:@"a "];
    [stringAndArrayProxy appendString:@"test!"];
    
    [stringAndArrayProxy addObject:@"This is a test!"];
    
    NSLog(@"Count should be 1, it is:%lu", (unsigned long)[stringAndArrayProxy  count]);
    
    if([[stringAndArrayProxy objectAtIndex:0] isEqualToString:@"This is a test!"])
    {
        NSLog(@"Appending successful:%@", stringAndArrayProxy);
    }
    else
    {
        NSLog(@"Appending failed:%@", stringAndArrayProxy);
    }
}

- (void)testAOP1
{
    [AOPProxyDemo testProxy:[AOPProxy proxyWithObject:NSMutableArray.new]];
    [AOPProxyDemo testProxy:[AOPMethodLogger proxyWithClass:NSMutableArray.class]];
    
    AOPProxyDemo *proxyTest = [[AOPProxyDemo alloc] init];
    [proxyTest.proxy addObject:@1];
    [proxyTest.proxy removeObjectAtIndex:0];
    [proxyTest.proxy count];
}

- (void)testAOP2
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
