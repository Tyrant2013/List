//
//  List.m
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "List.h"

@implementation List

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _listName = name;
        _status = ListStatusWaiting;
        _date = [NSDate date];
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    List *copy = [[[self class] allocWithZone:zone] initWithName:_listName
                                                            date:_date
                                                            type:_type
                                                          status:_status
                                                    completeDate:_completeDate
                                                        overtime:_overtime
                                                          listId:_listId
                                                      failedDate:_failedDate];
    copy.items = [[NSMutableArray alloc] initWithArray:_items copyItems:YES];
    return copy;
}

- (id)initWithName:(NSString *)name
              date:(NSDate *)date
              type:(ListType)type
            status:(ListStatus)status
      completeDate:(NSDate *)completeDate
          overtime:(NSDate *)overtime
            listId:(NSInteger)listId
        failedDate:(NSDate *)failedDate {
    self = [super init];
    if (self) {
        _listId = listId;
        _listName = name;
        _date = date;
        _status = status;
        _completeDate = completeDate;
        _overtime = overtime;
        _failedDate = failedDate;
        
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)removeItem:(id)item {
    return NO;
}

- (BOOL)addItem:(id)item {
    return NO;
}

- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

@end
