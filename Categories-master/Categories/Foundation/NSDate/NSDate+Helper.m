//
//  NSDate+Helper.m
//  HaoHaoZhu
//
//  Created by 李松 on 15/10/26.
//  Copyright © 2015年 HaoHaoZhu. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

- (NSString *)getStringWithFormatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSDate *)yesterday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:units fromDate:self];
    components.day--;
    return [calendar dateFromComponents:components];
}

- (BOOL)sameYearWithNow {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:units fromDate:self];
    NSDateComponents *components1 = [calendar components:units fromDate:[NSDate date]];
    return components.year == components1.year;
}

- (BOOL)sameDayWithNow {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:units fromDate:self];
    NSDateComponents *components1 = [calendar components:units fromDate:[NSDate date]];
    return components.day == components1.day;
}

- (NSString *)dateAgoWithDays:(NSInteger)days {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:units fromDate:self];
    components.day-= days;
    NSDate *date = [calendar dateFromComponents:components];
    
    NSDateComponents *components1 = [calendar components:units fromDate:[NSDate date]];
    if (components.year == components1.year) {
        return [date getStringWithFormatter:@"MM.dd"];
    }else {
        return [date getStringWithFormatter:@"yyyy.MM.dd"];
    }
}

- (NSString *)featuredDateAgoWithDays:(NSInteger)days {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:units fromDate:self];
    components.day-= days;
    NSDate *date = [calendar dateFromComponents:components];
    
    return [date getStringWithFormatter:@"yyyy.MM.dd"];
}

- (NSString *)dateParamWithDays:(NSInteger)days {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:units fromDate:self];
    components.day-= days;
    NSDate *date = [calendar dateFromComponents:components];
    return [date getStringWithFormatter:@"yyyy-MM-dd"];
}

- (NSInteger)daysAgoFromNow {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *string1 = [formatter stringFromDate:self];
    NSString *string2 = [formatter stringFromDate:[NSDate date]];
    NSDate *date1 = [formatter dateFromString:string1];
    NSDate *date2 = [formatter dateFromString:string2];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date1
                                                 toDate:date2
                                                options:0];
    return [components day];
}


- (NSInteger)secondsAfter{
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitSecond)
                                               fromDate:[NSDate date]
                                                 toDate:self
                                                options:0];
    return [components second];
}
- (NSInteger)minutesAfter{
    NSCalendar *calendar =  [NSCalendar currentCalendar];

    NSDateComponents *components = [calendar components:(NSCalendarUnitMinute)
                                               fromDate: [NSDate date]
                                                toDate:self
                                                options:0];
    return [components minute];
}
- (NSInteger)hoursAfter{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour)
                                               fromDate:[NSDate date]
                                                 toDate: self                                              options:0];
    return [components hour];
}



- (NSInteger)daysAfter{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *string1 = [formatter stringFromDate:self];
    NSString *string2 = [formatter stringFromDate:[NSDate date]];
    NSDate *date1 = [formatter dateFromString:string1];
    NSDate *date2 = [formatter dateFromString:string2];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date2
                                                 toDate:date1
                                                options:0];
    return [components day];
}



//倒计时
-(NSString*)countDown
{
    
    NSString * countDownStr = [NSMutableString string];
    if([self daysAfter]>0)
    {
        
       countDownStr = [countDownStr stringByAppendingString:[NSString stringWithFormat:@"%ld天",(long)[self daysAfter]]];
      
        NSLog(@"%@",countDownStr);
    
    }
    
    if([self hoursAfter]>0)
    {
       countDownStr = [countDownStr stringByAppendingString:[NSString stringWithFormat:@"%ld小时",(long)[self daysAfter]]];
        NSLog(@"%@",countDownStr);

        
    }
    if([self minutesAfter]>0)
    {
       countDownStr = [countDownStr stringByAppendingString:[NSString stringWithFormat:@"%ld分",(long)[self daysAfter]]];
        NSLog(@"%@",countDownStr);

    }

    
    
    return countDownStr;

}



@end
