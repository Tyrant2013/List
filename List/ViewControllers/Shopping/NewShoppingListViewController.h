//
//  NewShoppingListViewController.h
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingViewModel.h"
#import "ListBasicViewController.h"

@interface NewShoppingListViewController : ListBasicViewController

@property (nonatomic, weak) ShoppingViewModel *viewModel;

- (id)initWithViewModel:(ShoppingViewModel *)viewModel;

@end
