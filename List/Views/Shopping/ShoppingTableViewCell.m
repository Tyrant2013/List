//
//  ShoppingTableViewCell.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ShoppingTableViewCell.h"
#import "AppSkin.h"
#import <Masonry.h>

@implementation ShoppingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier direction:SwipeTableViewCellDirectionSingleRight];
    if (self) {
        [self appendSubviews];
        [self installConstraints];
    }
    return self;
}

- (void)appendSubviews {
    self.dateLabel.font = [AppSkins fontWithSize:12];
    self.dateLabel.textColor = [AppSkins colorForShoppingListDateLabel];

    [self.foregroundContainerView addSubview:self.dateLabel];
    [self.foregroundContainerView addSubview:self.nameLabel];
    [self.foregroundContainerView addSubview:self.statusLabel];
}

- (void)installConstraints {
    [self.dateLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.foregroundContainerView).with.offset(-10);
        make.bottom.equalTo(self.foregroundContainerView).with.offset(-5);
    }];
    
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.foregroundContainerView).with.offset(10);
        make.top.equalTo(self.foregroundContainerView).with.offset(5);
        make.bottom.equalTo(self.foregroundContainerView).with.offset(-5);
    }];
    
    [self.statusLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.foregroundContainerView).with.offset(-10);
        make.bottom.equalTo(self.dateLabel.top).with.offset(-2);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (UILabel *)dateLabel {
    if (_dateLabel == nil) {
        _dateLabel = [[UILabel alloc] init];
    }
    return _dateLabel;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UILabel *)statusLabel {
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc] init];
    }
    return _statusLabel;
}

@end
