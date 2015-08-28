//
//  Response.m
//  List
//
//  Created by 庄晓伟 on 15/8/12.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "Response.h"

@implementation Response

- (id)initWithResult:(BOOL)result msg:(NSString *)msg data:(NSArray *)data {
    self = [super init];
    if (self) {
        _result = result;
        _msg = msg;
        _data = data;
    }
    return self;
}

@end
