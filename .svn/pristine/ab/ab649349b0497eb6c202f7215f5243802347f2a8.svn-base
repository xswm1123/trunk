//
//  FDCController.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/14.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
#import "UIImageView+MJWebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import <QuickLook/QuickLook.h> 
#import "NSDate+week.h"
#import "LeveyPopListView.h"
#import "TelephoneCenter.h"
#import "NSDictionary+MutableDeepCopy.h"


//主域名
//#define URL_FOR_TOOLS @"http://hwtris.wicp.net:61/HWT.WEB/"
//临时IP
#define URL_FOR_TOOLS @"http://hwtrisapp.gnway.cc:61/HWT.WEB/"

#define IOS8_OR_LATER ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define DEVICE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define DEVICE_HEIGHT ( [UIScreen mainScreen].bounds.size.height)

extern NSString *const URL_BASE_DATA;


@interface FDCController : BaseController<UITextFieldDelegate>
/**
 项目选择
 */
-(UIBarButtonItem*) createButtonItemSelecteObject:(SEL) action;
/**
 注销
 */
-(UIBarButtonItem*) createButtonItemLogout:(SEL) action;
/**
 退出
 */
-(UIBarButtonItem*) createButtonItemBack:(SEL) actio;
@end
