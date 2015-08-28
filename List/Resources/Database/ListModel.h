//
//  List.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ListModel : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSDate * completeDate;
@property (nonatomic, retain) NSDate * overtime;
@property (nonatomic, retain) NSNumber * listId;
@property (nonatomic, retain) NSString * listName;
@property (nonatomic, retain) NSDate * failedDate;

@end
