//
//  NSObject+SYExtension.h
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SYExtension)
/// 当前window的栈顶ViewController
- (UIViewController *)sy_topViewControllerForKeyWindow;
@end

NS_ASSUME_NONNULL_END
