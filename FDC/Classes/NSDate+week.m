//
//  NSDate+week.m
//  FDC
//
//  Created by NewDoone on 15/3/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "NSDate+week.h"

@implementation NSDate (week)
+(NSDate *)getFirstDayOfWeek{
//    unsigned units=NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit|NSWeekdayCalendarUnit;
//    NSCalendar *mycal=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now=[NSDate new];
////    NSDateComponents *comp =[mycal components:units fromDate:now];
////    NSInteger month=[comp month];
////    NSInteger year =[comp year];
////    NSInteger day=[comp day];
//    NSDate* now=[NSDate getTodayDate];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *dateComps = [gregorian components:NSWeekdayCalendarUnit fromDate:now];
    int daycount = [dateComps weekday] - 1;
    NSDate *weekdaybegin=[now dateByAddingTimeInterval:-daycount*60*60*24];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: weekdaybegin];
    NSDate *localeDate = [weekdaybegin  dateByAddingTimeInterval: interval];
    
    NSDateFormatter *df1=[[NSDateFormatter alloc]init];
    NSLocale *mylocal=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [df1 setLocale:mylocal];
    [df1 setDateFormat:@"YYYY-MM-dd"];
    return localeDate;
}
+(NSDate *)getLastDayOfWeek{
//    unsigned units=NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit|NSWeekdayCalendarUnit;
//    NSCalendar *mycal=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now=[NSDate new];
//    NSDateComponents *comp =[mycal components:units fromDate:now];
//    NSInteger month=[comp month];
//    NSInteger year =[comp year];
//    NSInteger day=[comp day];
//    NSDate* now=[NSDate getTodayDate];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *dateComps = [gregorian components:NSWeekdayCalendarUnit fromDate:now];
    int daycount = [dateComps weekday] - 1;
    NSDate *weekdayend  =[now  dateByAddingTimeInterval:(6-daycount)*60*60*24];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: weekdayend];
    NSDate *localeDate = [weekdayend  dateByAddingTimeInterval: interval];
    
    NSDateFormatter *df1=[[NSDateFormatter alloc]init];
    NSLocale *mylocal=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [df1 setLocale:mylocal];
    [df1 setDateFormat:@"YYYY-MM-dd"];
    return localeDate;
}

@end
