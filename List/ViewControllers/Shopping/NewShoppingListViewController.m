//
//  NewShoppingListViewController.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "NewShoppingListViewController.h"
#import "NSDate+Category.h"

@interface NewShoppingListViewController () <
  UITableViewDataSource,
  UITableViewDelegate
>

@property (nonatomic, weak) UITextField *titleTextField;
@property (nonatomic, weak) UIButton *nextButton;
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *listItems;
@property (nonatomic, strong) ShoppingList *shoppingList;
@end

@implementation NewShoppingListViewController

- (id)initWithViewModel:(ShoppingViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self addRightBarButton];
    [self appendTextInput];
    [self appendNextButton];
    [self appendTableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.titleTextField layoutIfNeeded];
//    [Animations expandAnimationOnView:self.titleTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shoppingList.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ShoppingListItem *item = self.shoppingList.items[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = [self.viewModel statusNameFromStatus:item.status];
    return cell;
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button addTarget:self action:@selector(addButtonAddItem:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [headerView addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(headerView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - btton response

- (void)nextButtonTouchUpInside:(UIButton *)sender {
    self.shoppingList = [self.viewModel addNewShoppingListByName:self.titleTextField.text];
    
    self.tableView.hidden = NO;
    [self.tableView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(64);
    }];
    [UIView animateWithDuration:0.25f animations:^{
        [self.tableView layoutIfNeeded];
        sender.alpha = 0.0f;
        self.titleTextField.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.title = self.shoppingList.listName;
        [self addRightBarButton];
    }];
    [self.tableView reloadData];
}

- (void)addButtonAddItem:(UIButton *)sender {
    ShoppingListItem *item = [[ShoppingListItem alloc] initWithListId:self.shoppingList.listId];
    item.name = @"aaaaa";
    item.number = 1;
    [self.shoppingList.items insertObject:item atIndex:0];
    
    [self.tableView reloadData];
}

- (void)addNewShoppingListBarButton:(UIBarButtonItem *)sender {
    [self.viewModel updateShoppingList:self.shoppingList complete:^(Response *response) {
        if (response.result) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else {
            NSLog(@"%@", response.msg);
        }
    }];
}

#pragma mark - others

- (void)appendTextInput {
    UITextField *textInput = [ViewManager cornerTextFiled];
    textInput.placeholder = [Localized titleForShoppingViewController];
    [self.view addSubview:textInput];
    
    [textInput makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.top.equalTo(self.view).with.offset(100);
        make.height.equalTo(@45);
    }];
    self.titleTextField = textInput;
}

- (void)appendNextButton {
    UIButton *button = [ViewManager cornerButton];
    [button setTitle:[Localized titleForNewShoppingListViewControllerNextStepButton]
            forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.nextButton = button;
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-50);
        make.top.equalTo(self.titleTextField.bottom).with.offset(20);
    }];
}

- (void)appendTableView {
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.hidden = YES;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextButton.bottom).with.offset(10);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
}

- (void)addRightBarButton {
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addNewShoppingListBarButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}



@end
