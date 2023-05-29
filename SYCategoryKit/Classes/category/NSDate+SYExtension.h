//
//  NSDate+SYExtension.h
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger,SYSameDateType){
    SYSameDateType_Year,//同一年
    SYSameDateType_Month,//同一个月
    SYSameDateType_Day,//同一天
};
@interface NSDate (SYExtension)
///获取当前时间戳
+ (NSTimeInterval)sy_currentTimestamp;

/// 时间戳转具体格式日期字符串
/// @param timestamp 时间戳
/// @param ft yyyy-MM-dd hh:mm:ss zzz
+ (NSString *)sy_timestampToString:(NSInteger)timestamp withFormatter:(NSString *)ft;

/// 判断是否是同个日期
/// @param date date
/// @param dateType 类型
- (BOOL)sy_isSameDateWithDate:(NSDate *)date dateType:(SYSameDateType)dateType;
@end

NS_ASSUME_NONNULL_END
