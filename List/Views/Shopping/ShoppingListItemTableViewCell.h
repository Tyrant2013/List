//
//  ShoppingListItemTableViewCell.h
//  List
//
//  Created by 庄晓伟 on 15/8/18.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeTableViewCell.h"

@interface ShoppingListItemTableViewCell : SwipeTableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLael;
@property (nonatomic, strong) UILabel *statusLabel;

@end
