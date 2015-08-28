//
//  ViewManager.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ViewManager.h"

@implementation ViewManager

+ (UIButton *)cornerButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.layer.borderWidth = AppSkins.borderWidthForView;
    button.layer.borderColor = AppSkins.colorForMainTheme.CGColor;
    button.layer.cornerRadius = AppSkins.cornerRadiusForView;
    return button;
}

+ (UITextField *)cornerTextFiled {
    UITextField *textField = [[UITextField alloc] init];
    textField.layer.borderWidth = AppSkins.borderWidthForView;
    textField.layer.borderColor = AppSkins.colorForMainTheme.CGColor;
    textField.layer.cornerRadius = AppSkins.cornerRadiusForView;
    return textField;
}

@end
