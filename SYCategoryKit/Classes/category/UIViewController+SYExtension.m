//
//  UIViewController+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/22.
//

#import "UIViewController+SYExtension.h"
#import <objc/runtime.h>
@implementation UIViewController (SYExtension)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod(self.class, @selector(viewDidAppear:));
        Method swiMethod = class_getInstanceMethod(self.class, @selector(sy_viewDidAppear:));
        
        BOOL added = class_addMethod(self.class, @selector(viewDidAppear:), method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
        if (added) {
            class_replaceMethod(self.class, @selector(sy_viewDidAppear:), method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }else{
            method_exchangeImplementations(originMethod, swiMethod);
        }
    });
}

- (void)sy_viewDidAppear:(BOOL)animated{
    [self sy_viewDidAppear:animated];
    NSLog(@"执行了交换的方法");
}
@end
