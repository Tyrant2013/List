//
//  DataSearcher.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "DataSearcher.h"
#import "DBManager.h"

@implementation DataSearcher

+ (instancetype)sharedInstance {
    static DataSearcher *sharedObject;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [[DataSearcher alloc] init];
    });
    return sharedObject;
}

- (NSArray *)top5ListFromDatabase {
    NSArray *retList = [self filterArrayWithIndex:0 size:5];
    return retList;
}

- (NSArray *)firstPageListFromDatabase {
    NSArray *retList = [self filterArrayWithIndex:0 size:10];
    _shoppingListIndex += retList.count;
    return retList;
}

- (NSArray *)nextPageListFromDatabase {
    NSArray *retList = [self filterArrayWithIndex:self.shoppingListIndex size:10];
    _shoppingListIndex += retList.count;
    return retList;
}

- (NSArray *)filterArrayWithIndex:(NSInteger)index size:(NSInteger)size {
    NSArray *retList = [DB queryShoppingListWithStartIndex:index size:size];
    return retList;
}

@end
