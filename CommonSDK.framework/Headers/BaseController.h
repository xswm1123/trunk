//
//  BaseController.h
//  Common
//
//  Created by wlpiaoyi on 14/12/25.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import "Common.h"

#define BAR_HEIGHT 44

typedef void (^CallBackKeyboardStart)(void);
typedef void (^CallBackKeyboardEnd)(CGRect keyBoardFrame);

@interface BaseController : UIViewController<UIGestureRecognizerDelegate>{
@protected
    CallBackKeyboardStart  showStart;
    CallBackKeyboardStart hiddenStart;
    CallBackKeyboardEnd  showEnd;
    CallBackKeyboardEnd hiddenEnd;
}


@property (nonatomic) UIDeviceOrientation deviceOrientation;
@property (nonatomic) UIInterfaceOrientationMask supportInterfaceOrientation;
@property (nonatomic) UIInterfaceOrientation toInterfaceOrientation;
@property (nonatomic) UIInterfaceOrientation fromInterfaceOrientation;
@property (nonatomic, readonly) UITapGestureRecognizer* tapGestureRecognizer;
@property (nonatomic, readonly) UIView* viewTopBar;
@property (nonatomic) CGSize rectTopBar;

/**
 设置显示键盘的动画
 */
-(void) setSELShowKeyBoardStart:(CallBackKeyboardStart) start End:(CallBackKeyboardEnd) end;
/**
 设置隐藏键盘的动画
 */
-(void) setSELHiddenKeyBoardBefore:(CallBackKeyboardStart) start End:(CallBackKeyboardEnd) end;
//==>动画
-(CATransition*) backPerviousWithTransitionIn;
-(CATransition*) backPerviousWithTransitionOut;
-(CATransition*) goNextWithTransitionIn;
-(CATransition*) goNextWithTransitionOut;
//<==
-(void) backPreviousController;
-(void) backPreviousControllerToSuper:(UIViewController*) superController;
-(void) goNextController:(UIViewController*) nextController;
//==>
-(void) setNavigationRightItem;
-(void) setNavigationCenterItem;
-(void) setNavigationLeftItem;
//<==
-(void) setToolbarItem;
//==>例子
-(void) setRightButtonName:(NSString*) name  action:(SEL) action;
-(void) setLeftButtonName:(NSString*) name  action:(SEL) action;
//<==

@end
