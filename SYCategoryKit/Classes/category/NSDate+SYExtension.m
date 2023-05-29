//
//  NSDate+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/15.
//

#import "NSDate+SYExtension.h"

@implementation NSDate (SYExtension)
//获取当前时间戳
+ (NSTimeInterval)sy_currentTimestamp{
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

+ (NSString *)sy_timestampToString:(NSInteger)timestamp withFormatter:(NSString *)ft{
    // 初始化时间格式控制器
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    // 设置设计格式
    [matter setDateFormat:ft];
    // 进行转换
    if (timestamp > 9999999999) {
        timestamp = timestamp/1000;
    }
    NSDate * Date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *dateStr = [matter stringFromDate:Date];
    return dateStr;
}

- (BOOL)sy_isSameDateWithDate:(NSDate *)date dateType:(SYSameDateType)dateType{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    switch (dateType) {
        case SYSameDateType_Year:
        {
            return [comp1 year] == [comp2 year];
        }
            break;
        case SYSameDateType_Month:
        {
            return [comp1 year] == [comp2 year] && [comp1 month] == [comp2 month];
        }
            break;
        case SYSameDateType_Day:
        {
            return [comp1 day] == [comp2 day] &&
            [comp1 month] == [comp2 month] &&
            [comp1 year] == [comp2 year];
        }
            break;
        default:
            return [comp1 day] == [comp2 day] &&
            [comp1 month] == [comp2 month] &&
            [comp1 year] == [comp2 year];
            break;
    }
}
@end
