//
//  ListItem.m
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (id)initWithListId:(NSInteger)listId {
    self = [super init];
    if (self) {
        _listId = listId;
        _status = ListStatusWaiting;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    ListItem *copy = [[[self class] allocWithZone:zone] initWithListId:_listId];
    copy.itemId = _itemId;
    copy.name = [_name copy];
    copy.status = _status;
    return copy;
}

@end
