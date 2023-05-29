//
//  UIColor+SYExtension.h
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/10/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SYExtension)

/**
 渐变方式
 
 - MOGradientChangeDirectionHorizontal:              水平渐变
 - MOGradientChangeDirectionVertical:           竖直渐变
 - MOGradientChangeDirectionUpwardDiagonalLine: 向下对角线渐变
 - MOGradientChangeDirectionDownDiagonalLine:   向上对角线渐变
 */
typedef NS_ENUM(NSInteger, MOGradientChangeDirection) {
    MOGradientChangeDirectionHorizontal,
    MOGradientChangeDirectionVertical,
    MOGradientChangeDirectionUpwardDiagonalLine,
    MOGradientChangeDirectionDownDiagonalLine,
};

/**
 创建渐变颜色
 
 @param size       渐变的size
 @param direction  渐变方式
 @param startcolor 开始颜色
 @param endColor   结束颜色
 @return 创建的渐变颜色
 */
+ (instancetype)tk_colorGradientChangeWithSize:(CGSize)size
                                     direction:(MOGradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor;

+ (instancetype)tk_colorGradientChangeWithSize:(CGSize)size
                                     direction:(MOGradientChangeDirection)direction
                                      CGColors:(NSArray *)colors;
/**
 创建渐变颜色
 
 @param size       渐变的size
 @param startPoint 渐变起点，取值[0, 1]
 @param endPoint   渐变结束，取值[0, 1]
 @param colors     渐变颜色组 CGColor的数组
 @return 创建的渐变颜色
 */
+ (instancetype)tk_colorGradientChangeWithSize:(CGSize)size
                                    startPoint:(CGPoint)startPoint
                                      endPoint:(CGPoint)endPoint
                                      CGColors:(NSArray *)colors;

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color;
/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColor:(UIColor *)lightColor DarkColor:(UIColor *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColorStr:(NSString *)lightColor DarkColor:(NSString *)darkColor;

+ (UIColor *)randomColor;
#pragma mark -- 特殊色值
+ (UIColor *)main_Color;
+ (UIColor *)main_text_color;
+ (UIColor *)warningRed;
+ (UIColor *)main_text_disable_color;
+ (UIColor *)main_text_gray_color;
+ (UIColor *)main_text_white_color;
+ (UIColor *)assist_Line_Color;
+ (UIColor *)nav_TabBar_Color;
//弹窗背景
+ (UIColor *)assist_AlertBG_Color;
//新弹窗背景
+ (UIColor *)assist_AlertBG_New_Color;
+ (UIColor *)assist_AlertCancelBg_Color;
//弹窗 取消字体颜色
+ (UIColor *)assist_AlertCancel_Color;
//弹窗分割线颜色
+ (UIColor *)assist_Alert_Line_Color;
+ (UIColor *)assist_Warning_Color;
+ (UIColor *)assist_DB_Color;
/// 黑色33透明度
+ (UIColor *)black33Color;
//贵族金色昵称
+ (UIColor *)goldenNameColor;


///新UI主题色
+ (UIColor *)new_main_color;


@end

NS_ASSUME_NONNULL_END
