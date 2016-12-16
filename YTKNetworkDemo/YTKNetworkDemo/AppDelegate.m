//
//  AppDelegate.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YTKNetworkConfig.h"
#import "YTKUrlArgumentsFilter.h"
#import "NSString+Locale.h"


#define APP_TOKEN @"1262464ee7916519"

#define APP_KEY 0


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CGRect rect=[UIScreen mainScreen].bounds;
    self.window=[[UIWindow alloc] initWithFrame:rect];
    self.window.backgroundColor=[UIColor whiteColor];
    ViewController *VC=[[ViewController alloc] init];
    UINavigationController *navi=[[UINavigationController alloc] initWithRootViewController:VC];
    self.window.rootViewController=navi;
    [self.window makeKeyAndVisible];
    
    [self setupNewworkFileter];
    
    
    return YES;
}

-(void)setupNewworkFileter{
    YTKNetworkConfig *config=[YTKNetworkConfig sharedInstance];
    config.baseUrl=@"http://test.o2oevent.com/api";
    config.cdnUrl=@"http://fen.bi";
    
    
    //设置好之后，所有的网络请求都会默认使用YTKNetworkConfig中baseUrl参数指定的地址。
    //大部分企业应用都需要对一些静态资源（例如图片、js、css）使用CDN。YTKNetworkConfig的cdnUrl参数用于统一设置这一部分网络请求的地址。

    //当我们需要切换服务器的地址时，只需要修改YTKNewworkConfig中的baseUrl和cdnUrl参数即可。


    //把每一个请求封装成对象其实是用了设计模式中的Command模式
    
    YTKUrlArgumentsFilter *urlFilter = [YTKUrlArgumentsFilter filterWithArguments:@{@"appkey": [NSString stringWithFormat:@"%d",APP_KEY],@"token":APP_TOKEN,@"lang":[NSString currentLanguage]}];
    [config addUrlFilter:urlFilter];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
