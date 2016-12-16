//
//  NSDate+Helper.h
//  HaoHaoZhu
//
//  Created by 李松 on 15/10/26.
//  Copyright © 2015年 HaoHaoZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

//获取日期的指定格式字符串
- (NSString *)getStringWithFormatter:(NSString *)format;

- (NSDate *)yesterday;

- (BOOL)sameYearWithNow;
- (BOOL)sameDayWithNow;

//获取今天之前几天的日期字符串
- (NSString *)dateAgoWithDays:(NSInteger)days;

//精选日期
- (NSString *)featuredDateAgoWithDays:(NSInteger)days;

//获取今天之前几天的日期字符串
- (NSString *)dateParamWithDays:(NSInteger)days;

//计算日期距离今天又几天，按零点分割天
- (NSInteger)daysAgoFromNow;

//倒计时几天几小时几分
-(NSString*)countDown;

//- (NSString *)intervalSinceNow: (NSString *) theDate;

@end
