//
//  TodoListItemViewModel.h
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
#import "TodoListItem.h"

@interface TodoListItemViewModel : NSObject

@property (nonatomic, strong, readonly) TodoListItem *todoItem;

- (id)initWithTodoListItem:(TodoListItem *)item;
- (void)updateTodoListItem:(TodoListItem *)item complete:(void(^)(Response *response))complete;

@end
