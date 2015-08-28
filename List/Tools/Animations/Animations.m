//
//  Animations.m
//  List
//
//  Created by 庄晓伟 on 15/8/10.
//  Copyright (c) 2015年 &#24196;&#26195;&#20255;. All rights reserved.
//

#import "Animations.h"

@implementation Animations

+ (void)expandAnimationOnView:(UIView *)expendView {
    CGRect bounds = expendView.bounds;
    CABasicAnimation *expend = [CABasicAnimation animationWithKeyPath:@"bounds"];
    expend.fromValue = [NSValue valueWithCGRect:CGRectZero];
    expend.toValue = [NSValue valueWithCGRect:bounds];
    expend.duration = 0.25f;
    expend.fillMode = kCAFillModeForwards;
    expend.removedOnCompletion = NO;
    
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue = @(0.0f);
    alpha.toValue = @(1.0f);
    alpha.duration = 0.25f;
    alpha.fillMode = kCAFillModeForwards;
    alpha.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[expend, alpha];
    
    [expendView.layer addAnimation:group forKey:nil];
}
@end
