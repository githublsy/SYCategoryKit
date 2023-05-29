//
//  NSArray+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/17.
//

#import "NSArray+SYExtension.h"
#import <Objc/runtime.h>
@implementation NSArray (SYExtension)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
        Method swiMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(sy_objectAtIndex:));
        method_exchangeImplementations(originMethod, swiMethod);
    });
}

- (id)sy_objectAtIndex:(NSUInteger)index{
    if (self.count - 1 < index) {
        @try {
            return [self sy_objectAtIndex:index];
        } @catch (NSException *exception) {
            //崩溃信息
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            return nil;
        } @finally {
            
        }
    }else{
        return [self sy_objectAtIndex:index];
    }
}

- (id)sy_safeObjectAtIndex:(NSUInteger)index{
    if (self.count == 0) {
        return nil;
    }
    if (index >= self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}
@end
