//
//  ListItem.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ShoppingListItemModel : NSManagedObject

@property (nonatomic, retain) NSNumber * listId;
@property (nonatomic, retain) NSNumber * itemId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * status;

@end
