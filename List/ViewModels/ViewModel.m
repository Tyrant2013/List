//
//  ViewModel.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ViewModel.h"
#import "ShoppingListTableViewController.h"
#import "TodoListTableViewController.h"

@implementation ViewModel

+ (void)pushShoppingTableViewController:(UINavigationController *)navigationController {
    ShoppingListTableViewController *shoppingTableViewController = [[ShoppingListTableViewController alloc] init];
    [navigationController pushViewController:shoppingTableViewController animated:YES];
}

+ (void)pushTodoListTableViewController:(UINavigationController *)navigationController {
    TodoListTableViewController *todoTableViewController = [[TodoListTableViewController alloc] init];
    [navigationController pushViewController:todoTableViewController animated:YES];
}

@end
