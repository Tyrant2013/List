//
//  SwipeTableViewCell.h
//  List
//
//  Created by 庄晓伟 on 15/8/19.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SwipeTableViewCellDirection) {
    SwipeTableViewCellDirectionNone,                    ///不可滑动
    SwipeTableViewCellDirectionSingleLeft,              ///左边可滑动
    SwipeTableViewCellDirectionSingleRight,             ///右边可滑动,
    SwipeTableViewCellDirectionBoth                     ///两边都可滑动
};

@interface SwipeTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL isSwiped;
@property (nonatomic, assign) CGFloat maxRightOffsetX;
@property (nonatomic, assign) CGFloat maxLeftOffsetX;
@property (nonatomic, strong) UIView *foregroundContainerView;
@property (nonatomic, strong) UIView *backgroundContainerView;
@property (nonatomic, assign) SwipeTableViewCellDirection direction;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier direction:(SwipeTableViewCellDirection)direction;

- (void)swipeOver;

@end
