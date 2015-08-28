//
//  Localized.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "Localized.h"

@implementation Localized

+ (NSString *)titleForShoppingViewController {
    return NSLocalizedString(@"titleForShoppingViewController", nil);
}

+ (NSString *)titleForTodoListViewController {
    return NSLocalizedString(@"titleForTodoListViewController", nil);
}

+ (NSString *)titleForNewShoppingListViewControllerNextStepButton {
    return NSLocalizedString(@"titleForNewShoppingListViewControllerNextStepButton", nil);
}

+ (NSString *)saveError {
    return NSLocalizedString(@"saveError", @"保存失败");
}

+ (NSString *)saveSuccess {
    return NSLocalizedString(@"saveSuccess", @"保存成功");
}

@end
