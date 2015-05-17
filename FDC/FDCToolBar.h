//
//  FDCToolBar.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/14.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^dispatch_block_toolbar_onclick)(int index);
@interface FDCToolBar : UIView
@property (nonatomic,strong) NSArray *buttons;
-(void) setDispatchBlockToolbarOnclick:(dispatch_block_toolbar_onclick) block;
@end
