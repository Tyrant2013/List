//
//  ShoppingListDetailViewController.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ShoppingListDetailViewController.h"
#import "ShoppingViewModel.h"

@interface ShoppingListDetailViewController ()

@property (nonatomic, strong) ShoppingViewModel *viewModel;

@end

@implementation ShoppingListDetailViewController

- (id)initWithViewModel:(ShoppingViewModel *)viewModel {
    self = [self init];
    if (self) {
        _viewModel = viewModel;
        NSLog(@"view Model:%@", _viewModel);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.viewModel registListItemTableViewReusableCell:self.tableView];
    
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.numberOfShoppingListItems;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.viewModel configListItemTableViewCell:tableView indexPath:indexPath];
    
    return cell;
}

@end
