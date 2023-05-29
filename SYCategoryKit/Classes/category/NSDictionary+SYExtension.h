//
//  NSDictionary+SYExtension.h
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SYExtension)

/// 获取NSInteger类型value
/// @param key key
- (NSInteger)sy_integerValueForKey:(id)key;

/// 获取int类型value
/// @param key key
- (int)sy_intValueForKey:(id)key;

/// 获取long long类型value
/// @param key key
- (long long)sy_longlongValueForKey:(id)key;

/// 获取BOOL类型value
/// @param key key
- (BOOL)sy_boolValueForKey:(id)key;

/// 获取float类型value
/// @param key key
- (float)sy_floatValueForKey:(id)key;

/// 获取NSString类型value
/// @param key key
- (NSString *)sy_stringValueForKey:(id)key;

/// 获取NSArray类型value
/// @param key key
- (NSArray *)sy_arrayValueForKey:(id)key;

/// 获取NSMutableArray类型value
/// @param key key
- (NSMutableArray *)sy_mutableArrayValueForKey:(NSString *)key;

/// 获取NSDictionary类型value
/// @param key key
- (NSDictionary *)sy_dictionaryValueForKey:(id)key;

- (id)sy_safeObjectForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
