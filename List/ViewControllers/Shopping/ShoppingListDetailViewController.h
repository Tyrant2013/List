//
//  ShoppingListDetailViewController.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListBasicTableViewController.h"

@class ShoppingViewModel;

@interface ShoppingListDetailViewController : ListBasicTableViewController

- (id)initWithViewModel:(ShoppingViewModel *)viewModel;

@end
