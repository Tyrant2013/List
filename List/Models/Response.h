//
//  Response.h
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject

@property (nonatomic, assign, readonly) BOOL result;
@property (nonatomic, copy, readonly) NSString *msg;
@property (nonatomic, strong, readonly) NSArray *data;

- (id)initWithResult:(BOOL)result msg:(NSString *)msg data:(NSArray *)data;

@end
