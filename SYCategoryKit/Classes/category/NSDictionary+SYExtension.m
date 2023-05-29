//
//  NSDictionary+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/17.
//

#import "NSDictionary+SYExtension.h"

@implementation NSDictionary (SYExtension)
- (NSInteger)sy_integerValueForKey:(id)key {
    id value = [self sy_notNullValueForKey:key];
    return value == nil ? 0 : [value integerValue];
}

- (int)sy_intValueForKey:(id)key {
    id value = [self sy_notNullValueForKey:key];
    return value == nil ? 0 : [value intValue];
}


- (long long)sy_longlongValueForKey:(id)key {
    id value = [self sy_notNullValueForKey:key];
    return value == nil ? 0 : [value longLongValue];
}

- (BOOL)sy_boolValueForKey:(id)key {
    id value = [self sy_notNullValueForKey:key];
    return value == nil ? NO : [value boolValue];
}

- (float)sy_floatValueForKey:(id)key {
    id value = [self sy_notNullValueForKey:key];
    return value == nil ? NO : [value floatValue];
}

- (NSString *)sy_stringValueForKey:(id)key {
    return [self sy_notNullValueForKey:key];
}

- (NSArray *)sy_arrayValueForKey:(id)key {
    id value = [self sy_notNullValueForKey:key];
    if(![value isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return value;
}

- (NSMutableArray*)sy_mutableArrayValueForKey:(NSString *)key {
    id value = [self sy_notNullValueForKey:key];
    if(![value isKindOfClass:[NSMutableArray class]]) {
        return nil;
    }
    return value;
}

- (NSDictionary *)sy_dictionaryValueForKey:(id)key {
    id value = [self sy_notNullValueForKey:key];
    if(![value isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return value;
}

- (id)sy_safeObjectForKey:(NSString *)key{
    id value = [self sy_notNullValueForKey:key];
    return value;
}

#pragma mark 判断是否null
- (BOOL)sy_isNullValue:(id)value {
    return [value isEqual:[NSNull null]];
}

- (id)sy_notNullValueForKey:(id)key {
    id value = [self objectForKey:key];
    if([self sy_isNullValue:value]) {
        return nil;
    }
    return value;
}
@end
