//
//  UIColor+SYExtension.m
//  SYCategoryKit
//
//  Created by Hyukooooh on 2022/10/25.
//

#import "UIColor+SYExtension.h"

@implementation UIColor (SYExtension)

+ (instancetype)tk_colorGradientChangeWithSize:(CGSize)size
                                     direction:(MOGradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor {
    
    return [self tk_colorGradientChangeWithSize:size direction:direction CGColors:@[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor]];
}

+ (instancetype)tk_colorGradientChangeWithSize:(CGSize)size
                                     direction:(MOGradientChangeDirection)direction
                                      CGColors:(NSArray *)colors {
    
    if (CGSizeEqualToSize(size, CGSizeZero)|| !colors || colors.count == 0) {
        return nil;
    }

    CGPoint startPoint = CGPointZero;
    if (direction == MOGradientChangeDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }

    CGPoint endPoint = CGPointZero;
    switch (direction) {
        case MOGradientChangeDirectionHorizontal:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case MOGradientChangeDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case MOGradientChangeDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case MOGradientChangeDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    return [self tk_colorGradientChangeWithSize:size startPoint:startPoint endPoint:endPoint CGColors:colors];
}

+ (instancetype)tk_colorGradientChangeWithSize:(CGSize)size
                                    startPoint:(CGPoint)startPoint
                                      endPoint:(CGPoint)endPoint
                                      CGColors:(NSArray *)colors{
    
    if (CGSizeEqualToSize(size, CGSizeZero) || !colors || colors.count == 0) {
        return nil;
    }
//
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.colors = colors;
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:image];
}

///十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color{
    return [self colorWithHexString:color alpha:1.0f];
}

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}


/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColor:(UIColor *)lightColor DarkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return lightColor;
            } else {
                return darkColor;
            }
        }];
    } else {
        return lightColor ? lightColor : (darkColor ? darkColor : [UIColor clearColor]);
    }
}

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColorStr:(NSString *)lightColor DarkColor:(NSString *)darkColor{
    return [UIColor colorWithLightColor:[UIColor colorWithHexString:lightColor] DarkColor:[UIColor colorWithHexString:darkColor]];
}
+ (UIColor *)randomColor{
    CGFloat red = ( arc4random() % 255 / 255.0 );
    CGFloat green = ( arc4random() % 255 / 255.0 );
    CGFloat blue = ( arc4random() % 255 / 255.0 );
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
//主色调
+ (UIColor *)main_Color {
    return [UIColor colorWithHexString:@"#FFC700"];
}

//警告红
+ (UIColor *)warningRed {
    return [UIColor colorWithHexString:@"FB5858"];
}

//文字主色
+ (UIColor *)main_text_color {
    return [UIColor colorWithLightColorStr:@"0C101B" DarkColor:@"0C101B"];
}

//文字灰色
+ (UIColor *)main_text_disable_color {
    return [UIColor colorWithHexString:@"#B6B7BA"];
}

//灰色
+ (UIColor *)main_text_gray_color {
    return [UIColor colorWithLightColorStr:@"6D6F76" DarkColor:@"6D6F76"];
}

//文字白色
+ (UIColor *)main_text_white_color {
    return [UIColor colorWithLightColorStr:@"FFFFFF" DarkColor:@"FFFFFF"];
}

//用于间隔线等
+ (UIColor *)assist_Line_Color {
    return [UIColor colorWithLightColorStr:@"EEEEEF" DarkColor:@"EEEEEF"];
}

+ (UIColor *)nav_TabBar_Color {
    return [UIColor colorWithLightColorStr:@"F7F7F8" DarkColor:@"F7F7F8"];
}
//弹窗背景
+ (UIColor *)assist_AlertBG_Color {
    return [UIColor colorWithLightColorStr:@"FFFFFF" DarkColor:@"FFFFFF"];
}

//新弹窗背景
+ (UIColor *)assist_AlertBG_New_Color {
    return [UIColor colorWithLightColorStr:@"20202E" DarkColor:@"20202E"];
}

//弹窗 取消字体颜色
+ (UIColor *)assist_AlertCancel_Color {
    return [UIColor colorWithLightColorStr:@"6d6f76" DarkColor:@"6d6f76"];
}
//列表弹窗 取消背景颜色
+ (UIColor *)assist_AlertCancelBg_Color {
    return [UIColor colorWithLightColorStr:@"F7F7F8" DarkColor:@"F7F7F8"];
}

//弹窗分割线颜色
+ (UIColor *)assist_Alert_Line_Color {
    return [UIColor colorWithLightColorStr:@"58526F" DarkColor:@"58526F"];
}

//警告颜色
+ (UIColor *)assist_Warning_Color {
    return [UIColor colorWithLightColorStr:@"FB5858" DarkColor:@"FB5858"];
}
+ (UIColor *)assist_DB_Color {
    return [UIColor colorWithLightColorStr:@"DBDBDD" DarkColor:@"DBDBDD"];
}

+ (UIColor *)black33Color {
    return [UIColor colorWithHexString:@"000000" alpha:0.2];
}

//贵族金色昵称
+ (UIColor *)goldenNameColor {
    return [UIColor colorWithHexString:@"FFC657"];
}


+ (UIColor *)new_main_color {
    return [UIColor colorWithHexString:@"#FF7AC2"];
}

@end
