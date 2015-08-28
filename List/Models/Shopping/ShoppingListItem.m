//
//  ShoppingListItemDetail.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ShoppingListItem.h"

@implementation ShoppingListItem

- (id)copyWithZone:(NSZone *)zone {
    ShoppingListItem *copy = [[[self class] allocWithZone:zone] initWithListId:self.listId];
    copy.itemId = self.itemId;
    copy.name = [self.name copy];
    copy.number = self.number;
    copy.status = self.status;
    return copy;
}

@end
