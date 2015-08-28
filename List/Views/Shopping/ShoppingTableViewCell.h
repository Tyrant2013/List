//
//  ShoppingTableViewCell.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeTableViewCell.h"

@interface ShoppingTableViewCell : SwipeTableViewCell

/// 日期
@property (nonatomic, strong) UILabel *dateLabel;
/// 名称
@property (nonatomic, strong) UILabel *nameLabel;
/// 状态
@property (nonatomic, strong) UILabel *statusLabel;

@end
