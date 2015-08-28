//
//  ListItem.h
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ListStatus) {
    ListStatusWaiting,
    ListStatusDoing,
    ListStatusComplete,
    ListStatusFailed
};

@interface ListItem : NSObject <
  NSCopying
>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger listId;
@property (nonatomic, assign) NSInteger itemId;
@property (nonatomic, assign) ListStatus status;

- (id)initWithListId:(NSInteger)listId;

@end
