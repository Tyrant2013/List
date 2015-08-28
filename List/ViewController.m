//
//  ViewController.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 庄晓伟. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"

@interface ViewController ()

@property (nonatomic, assign) CGPoint startLocation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self appendButtonForShoppingListViewController];
    [self appendButtonForTodoListViewController];
    [self addOneViewForTest];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button response 

- (void)shoppingButtonResponse:(UIButton *)sender {
    [ViewModel pushShoppingTableViewController:self.navigationController];
}

- (void)todoButtonResponse:(UIButton *)sender {
    [ViewModel pushTodoListTableViewController:self.navigationController];
}

#pragma mark - UI

- (void)appendButtonForShoppingListViewController {
    UIButton *button = [ViewManager cornerButton];
    [button setTitle:[Localized titleForShoppingViewController]
            forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.top.equalTo(@100);
    }];

    [button addTarget:self
               action:@selector(shoppingButtonResponse:)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void)appendButtonForTodoListViewController {
    UIButton *button = [ViewManager cornerButton];
    [button setTitle:[Localized titleForTodoListViewController]
            forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.top.equalTo(@170);
    }];
    
    [button addTarget:self
               action:@selector(todoButtonResponse:)
     forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - test

- (void)addOneViewForTest {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    UIView *view = [[UIView alloc] init];
    [view addGestureRecognizer:panGesture];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
}

- (void)panGesture:(UIPanGestureRecognizer *)recognizer {
    UIView *view = recognizer.view;
    CGPoint location = [recognizer translationInView:view];
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.startLocation = view.center;
    }
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint center = view.center;
        
//        CGPoint superCenter = self.view.center;
//        CGPoint offset = CGPointZero;
//        offset.x = self.startLocation.x - superCenter.x + location.x;
//        offset.y = self.startLocation.y - superCenter.y + location.y;
//        [view updateConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.view).with.offset(location.x);
//            make.centerY.equalTo(self.view).with.offset(location.y);
//        }];
        
        center.x = self.startLocation.x + location.x;
        center.y = self.startLocation.y + location.y;
        view.center = center;
    }
}

@end
