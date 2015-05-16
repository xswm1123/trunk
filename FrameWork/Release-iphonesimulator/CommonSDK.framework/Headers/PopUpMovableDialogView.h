//
//  PopUpDialogVendorView.h
//  ShiShang
//
//  Created by wlpiaoyi on 14/12/19.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//

#import "PopUpMovableView.h"


@class PopUpDialogVendorView;

typedef BOOL (^dispatch_block_dialog_vendor)(PopUpDialogVendorView* dialogView,NSInteger buttonIndex);

@interface PopUpDialogVendorView : PopUpMovableView
@property (nonatomic,strong,readonly) UIView *dialogContext;
@property (nonatomic,strong) UIColor *buttonNameColorNormal;
@property (nonatomic,strong) UIColor *buttonNameColorHighLight;
@property (nonatomic,strong) UIColor *buttonBgColorNormal;
@property (nonatomic,strong) UIColor *buttonBgColorHighLight;
@property (nonatomic,strong) UIColor *borderColor;
@property (nonatomic,strong) UIFont *buttonNameFont;

@property (nonatomic) float buttonHeight;





/**
 构建对话框
 */
+(PopUpDialogVendorView*) dialogWithView:(UIView*) view onclickBlock:(dispatch_block_dialog_vendor) onclickBlock buttonNames:(NSString*) buttonName,...;


/**
 构建提醒框
 */
+(PopUpDialogVendorView*) alertWithMessage:(NSString*) message title:(NSString*) title onclickBlock:(dispatch_block_dialog_vendor) onclickBlock buttonNames:(NSString*) buttonName,...;

@end


