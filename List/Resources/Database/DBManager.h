//
//  DBManager.h
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
#import "List.h"
#import "ShoppingList.h"
#import "TodoList.h"
#import "ShoppingListItem.h"
#import "TodoListItem.h"

#define DB [DBManager sharedDBManager]

@interface DBManager : NSObject

+ (instancetype)sharedDBManager;

- (void)addList:(List *)listObject complete:(void(^)(Response *response))complete;
- (void)removeListByListId:(NSInteger)listId complete:(void(^)(Response *response))complete;
- (void)updateList:(List *)newObject complete:(void(^)(Response *response))complete;
- (NSArray *)queryShoppingListWithStartIndex:(NSUInteger)index size:(NSUInteger)size;
- (NSArray *)queryTodoListWithStartIndex:(NSUInteger)index size:(NSUInteger)size;

- (void)addShoppingListItem:(ShoppingListItem *)shoppingItem complete:(void(^)(Response *response))complete;
- (void)addShoppingListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete;
- (void)removeShoppingListItemByItemId:(NSInteger)itemId complete:(void(^)(Response *response))complete;
/// itemArray type: ShoppingListItem
- (void)removeShoppingListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete;
- (void)updateShoppingListItem:(ShoppingListItem *)itemObject complete:(void(^)(Response *response))complete;
- (void)updateShoppingListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete;

- (void)addTodoListItem:(TodoListItem *)todoItem complete:(void(^)(Response *response))complete;
- (void)addTodoListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete;
- (void)removeTodoListItemByItemId:(NSInteger)itemId complete:(void(^)(Response *response))complete;
/// itemArray type: TodoListItem
- (void)removeTodoListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete;
- (void)updateTodoListItem:(TodoListItem *)itemObject complete:(void(^)(Response *response))complete;
- (void)updateTodoListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete;

@end
