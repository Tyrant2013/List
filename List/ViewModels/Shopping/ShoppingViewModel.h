//
//  ShoppingViewModel.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Response.h"
#import "ShoppingList.h"

static NSString *shoppingReusableTableViewCell = @"shoppingListTableViewCell";
static NSString *shoppingItemReusableTableViewCell = @"shoppingListItemTableViewCell";

@interface ShoppingViewModel : NSObject

/// listArray type: ShoppingList
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, readonly) NSUInteger numberOfList;
@property (nonatomic, readonly) NSUInteger numberOfShoppingListItems;
@property (nonatomic, readonly) NSString *titleForSelectedShoppingList;
@property (nonatomic, readonly) NSIndexPath *selectedIndexPath;
@property (nonatomic, readonly) NSArray *selectedItems;

- (void)registTableViewReusableCell:(UITableView *)tableView;
- (void)registListItemTableViewReusableCell:(UITableView *)tableView;
- (UITableViewCell *)configTableViewCell:(UITableView *)tableView
                               indexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)configListItemTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
- (void)pushShoppingListDetailViewController:(UINavigationController *)navigationController tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
- (void)pushAddNewShoppingListViewController:(UINavigationController *)navigationController;

- (NSString *)statusNameFromStatus:(ListStatus)status;

/// 按名字创建一个ShoppingList, 并返回它
- (ShoppingList *)addNewShoppingListByName:(NSString *)name;
- (void)updateShoppingList:(ShoppingList *)newList complete:(void(^)(Response *response))complete;

@end
