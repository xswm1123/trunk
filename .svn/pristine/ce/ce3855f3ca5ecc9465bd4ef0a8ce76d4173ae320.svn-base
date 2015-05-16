//
//  Button+Param.h
//  wanxuefoursix
//
//  Created by wlpiaoyi on 14-10-31.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


typedef struct UIButtonImageTextOffset {
    CGFloat x,y,h; // x:横向偏移量 y:纵向偏移量 h:图片和文字的距离
} UIButtonImageTextOffset;

UIKIT_STATIC_INLINE UIButtonImageTextOffset UIButtonImageTextOffsetMake(CGFloat x, CGFloat y, CGFloat h) {
    UIButtonImageTextOffset insets = {x, y, h};
    return insets;
}

@interface UIButton(Expand)
-(void) addTarget:(id) target action:(SEL) action;
/**
 将文字转化成图片显示在按钮上
 */
-(void) setTitleImage:(NSString *)title forState:(UIControlState)state;
/**
 图片文字纵向显示
 */
-(void) setTitle:(NSString*) title image:(UIImage*) image forState:(UIControlState)state;
/**
 图片文字纵向显示
 */
-(void) setTitle:(NSString*) title image:(UIImage*) image forState:(UIControlState)state offset:(UIButtonImageTextOffset) offset;
@end
