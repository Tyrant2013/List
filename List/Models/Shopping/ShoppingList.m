//
//  ShoppingListItem.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ShoppingList.h"
#import "ShoppingListItem.h"

@implementation ShoppingList

- (id)initWithName:(NSString *)name {
    self = [super initWithName:name];
    if (self) {
        _type = ListTypeShopping;
    }
    return self;
}

- (id)initWithName:(NSString *)name date:(NSDate *)date type:(ListType)type status:(ListStatus)status completeDate:(NSDate *)completeDate overtime:(NSDate *)overtime listId:(NSInteger)listId failedDate:(NSDate *)failedDate {
    self = [super initWithName:name
                          date:date
                          type:ListTypeShopping
                        status:status
                  completeDate:completeDate
                      overtime:overtime
                        listId:listId
                    failedDate:failedDate];
    if (self) {
        
    }
    return self;
}

- (BOOL)removeItem:(id)item {
    if (![item isKindOfClass:[ShoppingListItem class]]) {
        return NO;
    }
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ShoppingListItem *tmpObj = (ShoppingListItem *)obj;
        ShoppingListItem *removeObject = (ShoppingListItem *)item;
        if (tmpObj.itemId == removeObject.itemId) {
            [self.items removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
    return YES;
}

- (BOOL)addItem:(id)item {
    if (![item isKindOfClass:[ShoppingListItem class]]) {
        return NO;
    }
    [self.items insertObject:item atIndex:0];
    return YES;
}

@end
