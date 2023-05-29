//
//  UIControl+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/22.
//

#import "UIControl+SYExtension.h"
#import <objc/runtime.h>

static const char *UIControl_eventInterval="UIControl_eventInterval";
static const char *UIControl_ignoreEvent="UIControl_ignoreEvent";

@implementation UIControl (SYExtension)
- (void)setEventInterval:(NSTimeInterval)eventInterval{
    objc_setAssociatedObject(self, UIControl_eventInterval, @(eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)eventInterval{
    return [objc_getAssociatedObject(self, UIControl_eventInterval) doubleValue];
}

- (void)setIgnoreEvent:(BOOL)ignoreEvent{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)ignoreEvent{
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent) boolValue];
}

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod(self.class, @selector(sendAction:to:forEvent:));
        Method swiMethod = class_getInstanceMethod(self.class, @selector(sy_sendAction:to:forEvent:));
        
        BOOL added = class_addMethod(self.class, @selector(sendAction:to:forEvent:), method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
        if (added) {
            class_replaceMethod(self.class, @selector(sy_sendAction:to:forEvent:), method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }else{
            method_exchangeImplementations(originMethod, swiMethod);
        }
    });
}

- (void)sy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (self.ignoreEvent) {
        NSLog(@"忽略此次点击");
        return;
    }
    NSLog(@"间隔时间:%f",self.eventInterval);
    if (self.eventInterval > 0) {
        self.ignoreEvent = YES;
        [self performSelector:@selector(releaseIgnoreState) withObject:nil afterDelay:self.eventInterval];
    }
    [self sy_sendAction:action to:target forEvent:event];
}

-(void)releaseIgnoreState{
    self.ignoreEvent = NO;
}
@end
