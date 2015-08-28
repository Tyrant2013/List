//
//  ViewModel.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewModel : NSObject

+ (void)pushShoppingTableViewController:(UINavigationController *)navigationController;
+ (void)pushTodoListTableViewController:(UINavigationController *)navigationController;

@end
