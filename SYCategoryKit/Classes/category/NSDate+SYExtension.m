//
//  NSDate+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/15.
//

#import "NSDate+SYExtension.h"

@implementation NSDate (SYExtension)
//获取当前时间戳
+ (NSString *)currentTimeStampStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}
@end
