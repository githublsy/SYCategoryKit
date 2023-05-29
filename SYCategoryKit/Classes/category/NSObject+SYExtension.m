//
//  NSObject+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/17.
//

#import "NSObject+SYExtension.h"

@implementation NSObject (SYExtension)

- (UIViewController *)sy_topViewControllerForKeyWindow{
    UIViewController *resultVC;
    UIWindow *keyWindow = [self sy_keyWindow];
    resultVC = [self _topViewController:[keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


- (UIWindow *)sy_keyWindow{
    UIWindow *keyWindow = nil;
    if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
        keyWindow = [[UIApplication sharedApplication].delegate window];
    }else{
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (UIWindow *window in windows) {
            if (!window.hidden) {
                keyWindow = window;
                break;
            }
        }
    }
    return keyWindow;
}

@end
