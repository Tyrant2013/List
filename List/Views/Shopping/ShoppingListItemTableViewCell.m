//
//  ShoppingListItemTableViewCell.m
//  List
//
//  Created by 庄晓伟 on 15/8/18.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "ShoppingListItemTableViewCell.h"

@implementation ShoppingListItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)appendSubviews {
    UILabel *name = [[UILabel alloc] init];
    UILabel *number = [[UILabel alloc] init];
    UILabel *statue = [[UILabel alloc] init];
    
    [self.contentView addSubview:name];
    [self.contentView addSubview:number];
    [self.contentView addSubview:statue];
    
    [name makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [number makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [statue makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

@end
