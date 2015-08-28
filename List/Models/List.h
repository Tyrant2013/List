//
//  List.h
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItem.h"

typedef NS_ENUM(NSUInteger, ListType) {
    ListTypeShopping,
    ListTypeToDo
};

@interface List : NSObject <
  NSCopying
>{
    @public
    NSDate *_date;
    ListType _type;
    ListStatus _status;
    NSDate *_completeDate;
    NSDate *_overtime;
    NSUInteger _listId;
    NSDate *_failedDate;
    NSMutableArray *_items;
}

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) ListType type;
@property (nonatomic, assign) ListStatus status;
@property (nonatomic, strong) NSDate *completeDate;
@property (nonatomic, strong) NSDate *overtime;
@property (nonatomic, assign) NSUInteger listId;
@property (nonatomic, copy) NSString *listName;
@property (nonatomic, strong) NSDate *failedDate;

@property (nonatomic, strong) NSMutableArray *items;

- (id)initWithName:(NSString *)name;
- (id)initWithName:(NSString *)name
              date:(NSDate *)date
              type:(ListType)type
            status:(ListStatus)status
      completeDate:(NSDate *)completeDate
          overtime:(NSDate *)overtime
            listId:(NSInteger)listId
        failedDate:(NSDate *)failedDate;

- (BOOL)removeItem:(id)item;
- (BOOL)addItem:(id)item;

@end
