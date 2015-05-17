//
//  FDCNavigationController.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/13.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
typedef UIViewController* (^dispatch_block_nav_toolbar_onclick)(int index);

@interface FDCNavigationController : BaseNavigationController<UINavigationControllerDelegate>
-(void) setToolButtons:(NSArray*) buttons;
-(void) setDispatchBlockToolbarOnclick:(dispatch_block_nav_toolbar_onclick) block;
-(void) reloadToolsBar;


@end
