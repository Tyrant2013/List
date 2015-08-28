//
//  ShoppingListTableViewController.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ShoppingListTableViewController.h"
#import "ShoppingViewModel.h"

@interface ShoppingListTableViewController ()

@property (nonatomic, strong) ShoppingViewModel *shopping;

@end

@implementation ShoppingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.shopping registTableViewReusableCell:self.tableView];
    [self appendNavigationBarItem];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.title = [Localized titleForShoppingViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shopping.numberOfList;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.shopping configTableViewCell:tableView indexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.shopping pushShoppingListDetailViewController:self.navigationController tableView:tableView indexPath:indexPath];
}

#pragma mark - UIBarButtonItem response

- (void)addListBarButton:(UIButton *)sender {
    [self.shopping pushAddNewShoppingListViewController:self.navigationController];
}

#pragma mark - UI

- (void)appendNavigationBarItem {
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addListBarButton:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

#pragma mark - getter

- (ShoppingViewModel *)shopping {
    if (_shopping == nil) {
        _shopping = [[ShoppingViewModel alloc] init];
    }
    return _shopping;
}

@end
