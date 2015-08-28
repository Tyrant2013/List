//
//  ShoppingViewModel.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ShoppingViewModel.h"
#import "ShoppingListTableViewController.h"
#import "ShoppingListDetailViewController.h"
#import "NewShoppingListViewController.h"
#import "ShoppingTableViewCell.h"
#import "ShoppingListItemTableViewCell.h"
#import "ShoppingList.h"
#import "NSDate+Category.h"
#import "DBManager.h"

@implementation ShoppingViewModel

- (void)registTableViewReusableCell:(UITableView *)tableView {
    [tableView registerClass:[ShoppingTableViewCell class] forCellReuseIdentifier:shoppingReusableTableViewCell];
}

- (void)registListItemTableViewReusableCell:(UITableView *)tableView {
    [tableView registerClass:[ShoppingListItemTableViewCell class] forCellReuseIdentifier:shoppingItemReusableTableViewCell];
}

- (UITableViewCell *)configTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    ShoppingTableViewCell *cell = (ShoppingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:shoppingReusableTableViewCell forIndexPath:indexPath];
    ShoppingList *data = self.listArray[indexPath.row];
    cell.nameLabel.text = data.listName;
    cell.dateLabel.text = [data.date stringWithFormat:@"yyyy-MM-dd"];
    cell.statusLabel.text = [self statusNameFromStatus:data.status];
    return cell;
}

- (UITableViewCell *)configListItemTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    ShoppingListItemTableViewCell *cell = (ShoppingListItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:shoppingItemReusableTableViewCell forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ShoppingListItem *item = self.selectedItems[indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

- (void)pushShoppingListDetailViewController:(UINavigationController *)navigationController tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    ShoppingTableViewCell *cell = (ShoppingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell.isSwiped) {
//        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        [cell swipeOver];
    }
    else {
        _selectedIndexPath = indexPath;
        ShoppingListDetailViewController *detailViewController = [[ShoppingListDetailViewController alloc] initWithViewModel:self];
        [navigationController pushViewController:detailViewController animated:YES];
    }
}

- (void)pushAddNewShoppingListViewController:(UINavigationController *)navigationController {
    NewShoppingListViewController *newShoppingListViewController = [[NewShoppingListViewController alloc] initWithViewModel:self];
    [navigationController pushViewController:newShoppingListViewController animated:YES];
}

- (NSString *)statusNameFromStatus:(ListStatus)status {
    NSString *name = @"未知";
    switch (status) {
        case ListStatusWaiting:
            name = @"等待";
            break;
        case ListStatusDoing:
            name = @"进行";
            break;
        case ListStatusComplete:
            name = @"完成";
            break;
        case ListStatusFailed:
            name = @"失效";
            break;
        default:
            break;
    }
    return name;
}

#pragma mark - data

- (ShoppingList *)addNewShoppingListByName:(NSString *)name {
    if (name == nil || [name isEqualToString:@""]) {
        name = [NSString stringWithFormat:@"%@的购物单", [[NSDate date] stringWithFormat:@"yyyy-MM-dd"]];
    }
    ShoppingList *newList = [[ShoppingList alloc] initWithName:name];
    [DB addList:newList complete:^(Response *response) {
        if (response.result) {
            newList.listId = [response.data[0] integerValue];
            [self.listArray insertObject:newList atIndex:0];
        }
    }];
    return newList;
}

- (void)updateShoppingList:(ShoppingList *)newList complete:(void (^)(Response *))complete {
    [DB updateList:newList complete:^(Response *response) {
        if (response.result) {
            [self.listArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                ShoppingList *tmpObj = (ShoppingList *)obj;
                if (tmpObj.listId == newList.listId) {
                    [self.listArray replaceObjectAtIndex:idx withObject:newList];
                    *stop = YES;
                }
            }];
        }
        if (complete) {
            complete(response);
        }
    }];
    
}

- (void)queryShoppingListByNumber:(NSUInteger)number {
    NSArray *list = [DB queryShoppingListWithStartIndex:0 size:number];
    _listArray = [[NSMutableArray alloc] initWithArray:list copyItems:YES];
}

#pragma mark - getter setter

- (NSMutableArray *)listArray {
    if (_listArray == nil) {
        [self queryShoppingListByNumber:10];
    }
    return _listArray;
}

- (NSUInteger)numberOfList {
    return self.listArray.count;
}

- (NSUInteger)numberOfShoppingListItems {
    if (self.selectedIndexPath == nil) {
        return 0;
    }
    ShoppingList *list = self.listArray[self.selectedIndexPath.row];
    NSLog(@"items: %ld", list.items.count);
    return list.items.count;
}

- (NSString *)titleForSelectedShoppingList {
    if (self.selectedIndexPath == nil) {
        return @"";
    }
    ShoppingList *list = self.listArray[self.selectedIndexPath.row];
    return list.listName;
}

- (NSArray *)selectedItems {
    if (self.selectedIndexPath == nil) {
        return nil;
    }
    ShoppingList *list = self.listArray[self.selectedIndexPath.row];
    return list.items;
}

@end
