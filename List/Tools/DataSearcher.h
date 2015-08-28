//
//  DataSearcher.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DataManager [DataSearcher sharedInstance]

@interface DataSearcher : NSObject

@property (nonatomic, assign, readonly) NSUInteger shoppingListIndex;

+ (instancetype)sharedInstance;

- (NSArray *)top5ListFromDatabase;
- (NSArray *)firstPageListFromDatabase;
- (NSArray *)nextPageListFromDatabase;

@end
