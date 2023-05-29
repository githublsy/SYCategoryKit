//
//  UIButton+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/22.
//

#import "UIButton+SYExtension.h"
#import <objc/runtime.h>

static const char *UIButton_Extra_Top = "UIButton_Extra_Top";
static const char *UIButton_Extra_Left = "UIButton_Extra_Left";
static const char *UIButton_Extra_Bottom = "UIButton_Extra_Bottom";
static const char *UIButton_Extra_Right = "UIButton_Extra_Right";

@implementation UIButton (SYExtension)

- (void)layoutButtonWithEdgeInsetsStyle:(SYButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space{
    /**
     *  前置知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.intrinsicContentSize.width;
    CGFloat imageHeight = self.imageView.intrinsicContentSize.height;
    
    CGFloat labelWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = self.titleLabel.intrinsicContentSize.height;
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case SYButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case SYButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case SYButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case SYButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

- (void)setExtraEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right{
    objc_setAssociatedObject(self, &UIButton_Extra_Top, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &UIButton_Extra_Left, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &UIButton_Extra_Bottom, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &UIButton_Extra_Right, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//新的点击区域
- (CGRect)extraedRect{
    NSNumber* topEdge = objc_getAssociatedObject(self, &UIButton_Extra_Top);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &UIButton_Extra_Right);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &UIButton_Extra_Bottom);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &UIButton_Extra_Left);
    if (topEdge && rightEdge && bottomEdge && leftEdge){
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else{
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event{
    //获得了获得新范围的CGRect
    CGRect rect = [self extraedRect];
    if (CGRectEqualToRect(rect,self.bounds)){
        //如果新的点击范围与原始的一致，就调用super 看看点击范围是不是在父控件上
        return [super hitTest:point withEvent:event];
    }
    //如果触摸点为在新的点击范围内。响应者就为该view
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
