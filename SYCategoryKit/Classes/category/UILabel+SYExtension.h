//
//  UILabel+SYExtension.h
//  LFCApp
//
//  Created by Lssyyy on 2019/9/16.
//  Copyright © 2019年 Lssyyy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (SYExtension)
/**
 设置文本,并指定行间距
 
 @param text 文本内容
 @param lineSpacing 行间距
 */
-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;
@end
