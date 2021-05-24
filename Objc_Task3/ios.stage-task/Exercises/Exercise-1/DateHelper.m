#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) {
        return  nil;
    }
    NSDateComponents * components = [[NSDateComponents alloc] init];
    [components setMonth: monthNumber];
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDate * date = [calendar dateFromComponents: components];
    NSDateFormatter * formater = [[NSDateFormatter alloc] init];
    [formater setLocale: [[NSLocale alloc] initWithLocaleIdentifier: @"en_US"]];
    [formater setDateFormat:@"MMMM"];
    NSString * result = [formater stringFromDate: date];
    
    return result;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents * components = [[NSDateComponents alloc]init];
    [components setCalendar:calendar];
    
    //[components.isValidDate ];
    NSDateFormatter * formater = [[NSDateFormatter alloc] init];
    
    
    [formater setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate * dateDate = [formater dateFromString: date];
    
    [formater setDateFormat:@"dd"];
    NSString * day = [formater stringFromDate:dateDate];
    long res = [day longLongValue];
    return res;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter * formater = [[NSDateFormatter alloc] init];
    formater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RUS"];
    [formater setDateFormat:@"ccc"];
    NSString * dayName = [[formater stringFromDate:date] capitalizedString];
    return dayName;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *start;
    NSTimeInterval extends;
   
    NSCalendar *cal=[[NSCalendar alloc] initWithCalendarIdentifier:( NSCalendarIdentifierGregorian)];
    [cal setLocale: [[NSLocale alloc]initWithLocaleIdentifier:@"ru_RUS"]];
    [cal setTimeZone:[NSTimeZone systemTimeZone]];

    NSDate *today=[NSDate date];
  
    BOOL success= [cal rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&start interval: &extends forDate:today];
    if(!success)return NO;
    NSDate * end = [NSDate dateWithTimeInterval: extends sinceDate: start];
   
    NSDateInterval * dateInterval = [[NSDateInterval alloc] initWithStartDate: start endDate:end];
    return [dateInterval containsDate: date];
}




@end
