//
//  UIButton+SYExtension.h
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, SYButtonEdgeInsetsStyle) {
    
    SYButtonEdgeInsetsStyleTop, // image在上，label在下
    
    SYButtonEdgeInsetsStyleLeft, // image在左，label在右
    
    SYButtonEdgeInsetsStyleBottom, // image在下，label在上
    
    SYButtonEdgeInsetsStyleRight // image在右，label在左
    
};
@interface UIButton (SYExtension)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *  !! 必须 先 设置 titleLabel和imageView ⚠️
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */

- (void)layoutButtonWithEdgeInsetsStyle:(SYButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

/// 增加点击区域
/// @param top 上
/// @param left 左
/// @param bottom 下
/// @param right 右
- (void)setExtraEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

@end

NS_ASSUME_NONNULL_END
