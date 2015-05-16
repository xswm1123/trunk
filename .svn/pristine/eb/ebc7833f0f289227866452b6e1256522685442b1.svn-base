//
//  MovableView.h
//  ShiShang
//
//  Created by wlpiaoyi on 14-11-15.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^CallBackVendorTouchOpt)(CGRect frame);
@interface MovableView : UIView
//是否可以移动，默认是true
@property (nonatomic) BOOL flagShouldTouchMove;

-(void) setCallBackVendorTouchBegin:(CallBackVendorTouchOpt) begin;
-(void) setCallBackVendorTouchMove:(CallBackVendorTouchOpt) move;
-(void) setCallBackVendorTouchEnd:(CallBackVendorTouchOpt) end;
@end
