//
//  DBManager.m
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "DBManager.h"
#import "ListModel.h"
#import "ShoppingListItemModel.h"
#import "TodoListItemModel.h"

static NSString *lastListId = @"lastListId";
static NSString *lastShoppingListItemId = @"lastShoppingListItemId";
static NSString *lastTodoListItemId = @"lastTodoListItemId";

@implementation DBManager

+ (instancetype)sharedDBManager {
    static DBManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DBManager alloc] init];
    });
    return sharedInstance;
}

- (NSInteger)newListId {
    NSInteger iLastListId = [[NSUserDefaults standardUserDefaults] integerForKey:lastListId];
    return iLastListId + 1;
}

- (BOOL)setNewListId:(NSInteger)newListId {
    [[NSUserDefaults standardUserDefaults] setValue:@(newListId) forKey:lastListId];
    BOOL result = [[NSUserDefaults standardUserDefaults] synchronize];
    return result;
}

- (NSInteger)newShoppingListItemId {
    NSInteger iLastShoppingListItemId = [[NSUserDefaults standardUserDefaults] integerForKey:lastShoppingListItemId];
    return iLastShoppingListItemId + 1;
}

- (BOOL)setNewShoppingListItemId:(NSInteger)newShoppingListItemId {
    [[NSUserDefaults standardUserDefaults] setValue:@(newShoppingListItemId) forKey:lastListId];
    BOOL result = [[NSUserDefaults standardUserDefaults] synchronize];
    return result;
}

- (NSInteger)newTodoListItemId {
    NSInteger iLastTodoListItemId = [[NSUserDefaults standardUserDefaults] integerForKey:lastTodoListItemId];
    return iLastTodoListItemId + 1;
}

- (BOOL)setNewTodoListItemId:(NSInteger)newTodoListItemId {
    [[NSUserDefaults standardUserDefaults] setValue:@(newTodoListItemId) forKey:lastListId];
    BOOL result = [[NSUserDefaults standardUserDefaults] synchronize];
    return result;
}

- (void)addList:(List *)listObject complete:(void(^)(Response *response))complete {
    ListModel *newListObject = [ListModel MR_createEntity];
    newListObject.listId = @([self newListId]);
    newListObject.listName = listObject.listName;
    newListObject.date = listObject.date;
    newListObject.overtime = listObject.overtime;
    newListObject.type = @(listObject.type);
    newListObject.status = @(listObject.status);
    newListObject.completeDate = listObject.completeDate;
    newListObject.failedDate = listObject.failedDate;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            [self setNewListId:[newListObject.listId integerValue]];
        }
        if (complete) {
            NSString *msg = contextDidSave ? [Localized saveSuccess] : [Localized saveError];
            Response *response = [[Response alloc] initWithResult:contextDidSave msg:msg data:@[newListObject.listId]];
            complete(response);
        }
    }];
}

- (void)removeListByListId:(NSInteger)listId complete:(void(^)(Response *response))complete {
    ListModel *filterListObject = [ListModel MR_findFirstByAttribute:@"listId" withValue:@(listId)];
    if (filterListObject) {
        [[NSManagedObjectContext MR_defaultContext] MR_deleteObjects:@[filterListObject]];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

- (void)updateList:(List *)newObject complete:(void(^)(Response *response))complete {
    ListModel *filterListObject = [ListModel MR_findFirstByAttribute:@"listId" withValue:@(newObject.listId)];
    if (filterListObject) {
        filterListObject.listName = newObject.listName;
        filterListObject.date = newObject.date;
        filterListObject.overtime = newObject.overtime;
        filterListObject.type = @(newObject.type);
        filterListObject.status = @(newObject.status);
        filterListObject.completeDate = newObject.completeDate;
        filterListObject.failedDate = newObject.failedDate;
        
        for (ShoppingListItem *item in newObject.items) {
            ShoppingListItemModel *model = [ShoppingListItemModel MR_findFirstByAttribute:@"itemId" withValue:@(item.itemId)];
            if (!model) {
                model = [ShoppingListItemModel MR_createEntity];
            }
            model.listId = @(item.listId);
            model.itemId = @(item.itemId);
            model.name = item.name;
            model.number = @(item.number);
            model.status = @(item.status);
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        }
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
    if (complete) {
        Response *response = [[Response alloc] initWithResult:YES msg:nil data:nil];
        complete(response);
    }
}

- (NSArray *)queryShoppingListWithStartIndex:(NSUInteger)index size:(NSUInteger)size {
    NSArray *listArray = [ListModel MR_findByAttribute:@"type" withValue:@(ListTypeShopping)];
    NSArray *retArray = [self filterArrayFromArray:listArray index:index size:size];
    for (ShoppingList *list in retArray) {
        NSArray *items = [ShoppingListItemModel MR_findByAttribute:@"listId" withValue:@(list.listId)];
        if (items.count > 0) {
            for (ShoppingListItemModel *model in items) {
                ShoppingListItem *listItem = [[ShoppingListItem alloc] init];
                listItem.listId = [model.listId integerValue];
                listItem.itemId = [model.itemId integerValue];
                listItem.name = model.name;
                listItem.number = [model.number integerValue];
                listItem.status = [model.status integerValue];
                [list.items addObject:listItem];
            }
        }
    }
    return retArray;
}

- (NSArray *)queryTodoListWithStartIndex:(NSUInteger)index size:(NSUInteger)size {
    NSArray *listArray = [ListModel MR_findByAttribute:@"type" withValue:@(ListTypeToDo)];
    NSArray *retArray = [self filterArrayFromArray:listArray index:index size:size];
    return retArray;
}

- (NSArray *)filterArrayFromArray:(NSArray *)listArray index:(NSInteger)index size:(NSInteger)size {
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    
    NSInteger end = index + size;
    end = listArray.count > end ? end : listArray.count;
    
    for (; index < end; ++index) {
        ListModel *listModel = listArray[index];
        List *item = [[List alloc] initWithName:listModel.listName
                                                           date:listModel.date
                                                           type:[listModel.type integerValue]
                                                         status:[listModel.status integerValue]
                                                   completeDate:listModel.completeDate
                                                       overtime:listModel.overtime
                                                         listId:[listModel.listId integerValue]
                                                     failedDate:listModel.failedDate];
        [retArray addObject:item];
    }
    return retArray;
}

- (void)addShoppingListItem:(ShoppingListItem *)shoppingItem complete:(void(^)(Response *response))complete {
    ShoppingListItemModel *newShoppingListItemObject = [ShoppingListItemModel MR_createEntity];
    newShoppingListItemObject.listId = @(shoppingItem.listId);
    newShoppingListItemObject.itemId = @([self newShoppingListItemId]);
    newShoppingListItemObject.name = shoppingItem.name;
    newShoppingListItemObject.number = @(shoppingItem.number);
    newShoppingListItemObject.status = @(shoppingItem.status);
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            [self setNewShoppingListItemId:[newShoppingListItemObject.itemId integerValue]];
        }
    }];
}

- (void)addShoppingListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete {
    [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self addShoppingListItem:obj complete:^(Response *response) {
            
        }];
    }];
}

- (void)removeShoppingListItemByItemId:(NSInteger)itemId complete:(void(^)(Response *response))complete {
    ShoppingListItemModel *filterShoppingListItemObject = [ShoppingListItemModel MR_findFirstByAttribute:@"itemId" withValue:@(itemId)];
    if (filterShoppingListItemObject) {
        [[NSManagedObjectContext MR_defaultContext] MR_deleteObjects:@[filterShoppingListItemObject]];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

- (void)removeShoppingListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete {
    [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ShoppingListItem *shoppingListItem = (ShoppingListItem *)obj;
        [self removeShoppingListItemByItemId:shoppingListItem.itemId complete:^(Response *response) {
            
        }];
    }];
}

- (void)updateShoppingListItem:(ShoppingListItem *)itemObject complete:(void(^)(Response *response))complete {
    ShoppingListItemModel *filterShoppingListItemObject = [ShoppingListItemModel MR_findFirstByAttribute:@"itemId" withValue:@(itemObject.itemId)];
    if (filterShoppingListItemObject) {
        filterShoppingListItemObject.name = itemObject.name;
        filterShoppingListItemObject.number = @(itemObject.number);
        filterShoppingListItemObject.status = @(itemObject.status);
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
    
}

- (void)updateShoppingListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete {
    [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self updateShoppingListItem:obj complete:^(Response *response) {
            
        }];
    }];
}

- (void)addTodoListItem:(TodoListItem *)todoItem complete:(void(^)(Response *response))complete {
    TodoListItemModel *newTodoListItemObject = [TodoListItemModel MR_createEntity];
    newTodoListItemObject.listId = @(todoItem.listId);
    newTodoListItemObject.itemId = @([self newTodoListItemId]);
    newTodoListItemObject.name = todoItem.name;
    newTodoListItemObject.status = @(todoItem.status);
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            [self setNewTodoListItemId:[newTodoListItemObject.itemId integerValue]];
        }
    }];
}

- (void)addTodoListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete {
    [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self addTodoListItems:obj complete:^(Response *response) {
            
        }];
    }];
}

- (void)removeTodoListItemByItemId:(NSInteger)itemId complete:(void(^)(Response *response))complete {
    TodoListItemModel *filterTodoListItemObject = [TodoListItemModel MR_findFirstByAttribute:@"itemId" withValue:@(itemId)];
    if (filterTodoListItemObject) {
        [[NSManagedObjectContext MR_defaultContext] MR_deleteObjects:@[filterTodoListItemObject]];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

- (void)removeTodoListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete {
    [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        TodoListItem *todoListItem = (TodoListItem *)obj;
        [self removeTodoListItemByItemId:todoListItem.itemId complete:^(Response *response) {
            
        }];
    }];
}

- (void)updateTodoListItem:(TodoListItem *)itemObject complete:(void(^)(Response *response))complete {
    TodoListItemModel *filterTodoListItemObject = [TodoListItemModel MR_findFirstByAttribute:@"itemId" withValue:@(itemObject.itemId)];
    if (filterTodoListItemObject) {
        filterTodoListItemObject.name = itemObject.name;
        filterTodoListItemObject.status = @(itemObject.status);
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

- (void)updateTodoListItems:(NSArray *)itemArray complete:(void(^)(Response *response))complete {
    [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self updateList:obj complete:^(Response *response) {
            
        }];
    }];
}

@end
