//
//  FDCToolBar.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/14.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCToolBar.h"
#import <CommonSDK/CommonSDK.h>

SEL gaction;
id gtarget;
@interface FDCToolBar(){
    dispatch_block_toolbar_onclick blocktoolbar;
}
@end

@implementation FDCToolBar
-(id) init{
    if (self=[super init]) {
        [self initParam];
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        [self initParam];
    }
    return self;
}
- (void)initParam{
   
}

-(void) setDispatchBlockToolbarOnclick:(dispatch_block_toolbar_onclick) block{
    blocktoolbar = block;
}
-(void) setButtons:(NSArray *)buttons{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    _buttons = buttons;
    if (!_buttons||![buttons count]) {
        return;
    }
    
    for (UIButton *button in _buttons) {
        [button removeFromSuperview];
        if (gaction) {
            [button removeTarget:gtarget action:gaction forControlEvents:UIControlEventTouchUpInside];
        }
        [ViewAutolayoutCenter removeConstraints:button];
    }
    
    gaction = @selector(onclickButtons:);
    gtarget = self;
    for (UIButton *button in _buttons) {
        [button removeFromSuperview];
        [self addSubview:button];
        [button addTarget:gtarget action:gaction forControlEvents:UIControlEventTouchUpInside];
    }
    [self persistConstraintEqualWith:_buttons margins:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIButton* btn=[buttons firstObject];
    [btn setSelected:YES];
    
}
-(void) persistConstraintEqualWith:(NSArray*) buttons margins:(UIEdgeInsets)margins{
    
    for (UIButton *button in _buttons) {
        [ViewAutolayoutCenter persistConstraintRelation:button margins:UIEdgeInsetsMake(margins.top, DisableConstrainsValueMAX, margins.bottom, DisableConstrainsValueMAX) toItems:nil];
    }
    UIButton *buttonFirst = [_buttons firstObject];
    [ViewAutolayoutCenter persistConstraintRelation:buttonFirst margins:UIEdgeInsetsMake(DisableConstrainsValueMAX, margins.left, DisableConstrainsValueMAX, DisableConstrainsValueMAX) toItems:nil];
    int i = 0;
    for (UIButton *button in _buttons) {
        
        if (button==buttonFirst) {
            continue;
        }
        NSLayoutConstraint *marginsEquqlsWidth = [NSLayoutConstraint constraintWithItem:buttonFirst attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeWidth multiplier:1 constant:buttonFirst.frameWidth];
        [self addConstraint:marginsEquqlsWidth];
        
        UIButton *perButton = [_buttons objectAtIndex:i];
        [ViewAutolayoutCenter persistConstraintRelation:button margins:UIEdgeInsetsMake(DisableConstrainsValueMAX, 0, DisableConstrainsValueMAX, DisableConstrainsValueMAX) toItems:@{@"left":perButton}];
        i++;
    }
    UIButton *buttonLast = [_buttons lastObject];
    [ViewAutolayoutCenter persistConstraintRelation:buttonLast margins:UIEdgeInsetsMake(DisableConstrainsValueMAX, DisableConstrainsValueMAX, DisableConstrainsValueMAX, margins.right) toItems:nil];
}
-(void) onclickButtons:(id) sender{
    int index = (int)[_buttons indexOfObject:sender];
    for (UIButton *button in _buttons) {
        [button setSelected:button==sender];
    }
    if (blocktoolbar) {
        blocktoolbar(index);
    }
}
-(void) dealloc{

}



@end
