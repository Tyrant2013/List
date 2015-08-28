//
//  TodoListItemViewModel.m
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "TodoListItemViewModel.h"
#import "DBManager.h"

@implementation TodoListItemViewModel

- (id)initWithTodoListItem:(TodoListItem *)item {
    self = [super init];
    if (self) {
        _todoItem = item;
    }
    return self;
}

- (void)updateTodoListItem:(TodoListItem *)item complete:(void (^)(Response *response))complete {
    [DB updateTodoListItem:item complete:^(Response *response) {
        if (complete) {
            complete(response);
        }
    }];
}

@end
