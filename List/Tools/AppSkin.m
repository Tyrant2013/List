//
//  AppSkin.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "AppSkin.h"



@implementation AppSkin

+ (instancetype)sharedInstance {
    static AppSkin *sharedObject;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [[AppSkin alloc] init];
    });
    return sharedObject;
}

- (UIFont *)fontWithSize:(CGFloat)size {
    UIFont *font = [UIFont systemFontOfSize:size];
    
    return font;
}

- (UIColor *)colorForShoppingListDateLabel {
    UIColor *color = [UIColor grayColor];
    
    return color;
}

- (UIColor *)colorForMainTheme {
    UIColor *color = Color4B(0.0f, 91.0f, 255.0f, 1.0f);
    
    return color;
}

- (CGFloat)cornerRadiusForView {
    return 10.0f;
}

- (CGFloat)borderWidthForView {
    return 1.0f;
}

@end
