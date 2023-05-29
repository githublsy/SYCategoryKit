//
//  NSArray+SYExtension.h
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SYExtension)
- (id)sy_safeObjectAtIndex:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END
