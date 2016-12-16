//
//  NSString+Locale.m
//  MeetMeEvent
//
//  Created by LeiMing on 13-8-30.
//  Copyright (c) 2013年 Huatan. All rights reserved.
//

#import "NSString+Locale.h"

@implementation NSString (Locale)

+ (NSString *)currentLanguage
{
    NSString *tmpLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
//    NSLog(@"tmpLanguage=%@",[NSLocale preferredLanguages]);
    //简体中文  ios9之后 @“zh-Hans-CN”:简体中文  @"zh-Hant-CN":繁体中文
    if ([tmpLanguage isEqualToString:@"zh-Hans"]||[tmpLanguage isEqualToString:@"zh-Hans-CN"]||[tmpLanguage isEqualToString:@"zh-Hans-US"]) {
        return @"0";
    }
    //英文   ios9之后 @"en-CN":英文
    else if ([tmpLanguage isEqualToString:@"en"]||[tmpLanguage isEqualToString:@"en-CN"]||[tmpLanguage isEqualToString:@"en-US"]) {
        return @"1";
    }
    return @"1";
}

+ (BOOL)currentLanguageIsZh
{
    NSString *tmpLanguage = [self currentLanguage];
    if ([tmpLanguage isEqualToString:@"0"]) {
        return YES;
    }
    return NO;
}


@end
