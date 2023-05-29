//
//  UIControl+SYExtension.h
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (SYExtension)
@property(nonatomic, assign) BOOL ignoreEvent;
@property(nonatomic, assign) NSTimeInterval eventInterval;
@end

NS_ASSUME_NONNULL_END
