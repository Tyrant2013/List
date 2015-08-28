//
//  AppSkin.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define AppSkins [AppSkin sharedInstance]
#define Color4B(r,g,b,a) [UIColor colorWithRed:a/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface AppSkin : NSObject
#pragma mark - 常量
/// view的圆角
@property (nonatomic, assign) CGFloat cornerRadiusForView;
/// view的边线宽
@property (nonatomic, assign) CGFloat borderWidthForView;
#pragma mark - 颜色
/// 主色调
@property (nonatomic, readonly) UIColor *colorForMainTheme;
/// 购物单上日期颜色
@property (nonatomic, readonly) UIColor *colorForShoppingListDateLabel;

+ (instancetype)sharedInstance;

#pragma mark - 字体
- (UIFont *)fontWithSize:(CGFloat)size;

@end
