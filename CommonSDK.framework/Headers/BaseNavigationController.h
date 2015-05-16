//
//  BaseNavigationController.h
//  Common
//
//  Created by wlpiaoyi on 14/12/25.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface BaseNavigationController : UINavigationController
@property BOOL flagCheckInterfaceOrientation;
//设置导航栏背景位置
-(void) setImageNavigationBarBg:(UIImage *)imagenavigationBarBg position:(UIBarPosition) posistion;
//设置工具栏背景位置
-(void) setImageToolsBarBg:(UIImage *)imageToolsBarBg position:(UIBarPosition) posistion;
@end
