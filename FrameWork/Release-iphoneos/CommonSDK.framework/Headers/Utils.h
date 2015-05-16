//
//  Utils.h
//  Common
//
//  Created by wlpiaoyi on 14/12/25.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//




#define GALOB_ANIMATION_TIME 0.25f //动画时间参数
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef UINavigationController* (^dispatch_block_create_navigation)(UIViewController *controller);

extern bool globalRotateHasVoice;//旋转有声音
extern NSString *glaobAppIdentify;//appd的唯一标示符，如果不为空就会检查更新

extern const NSString* documentDir;
extern const NSString* documentSkipBackUpFileDir;
extern const NSString* cachesDir;
extern const NSString* cachesFileDir;
extern const NSString* cachesFileImgDir;
extern const NSString* systemVersion;
extern bool flagStatusBarHidden;

@interface Utils : NSObject
//==>
float boundsWidth();
float boundsHeight();
float appWidth();
float appHeight();
//<==
long timeInterval();

+(bool) initParams;
//==>文件和路径操作
/**
 当前路径是否有效
 path 路径
 isDir 是否是文件夹路径
 isCreated 是否创建文件夹
 */
+(BOOL) fileExistsAtPath:(NSString*)path isDirectory:(BOOL*) isDirectory isCreated:(BOOL) isCreated;
//<==

//==>应用设置
+(void) setDispatchBlockCreateNavigation:(dispatch_block_create_navigation) block;
+(UIWindow*) getWindow;
+(UIViewController*) getCurrentController;
+(UIWindow*) setRootController:(UIViewController*) controller;
+(void) setStatusBarHidden:(BOOL) barHidden;
//+(void) setStatusBarHidden:(BOOL) barHidden orientation:(UIDeviceOrientation)orientation;
//<==

//==>
//计算文字占用的大小
+(CGSize) getBoundSizeWithTxt:(NSString*) txt font:(UIFont*) font size:(CGSize) size;
/**
 计算指定字体对应的高度
 */
+(CGFloat) getFontHeightWithSize:(CGFloat) size fontName:(NSString*) fontName;
+(CGFloat) getFontSizeWithHeight:(CGFloat) height fontName:(NSString*) fontName;
//<==


//==>交互UI
+(void) showAlert:(NSString*) message title:(NSString*) title;
+(void) showLoading:(NSString*) message;
+(void) hiddenLoading;
//<==


//==>角度和弧度之间的转换
+(CGFloat) parseDegreesToRadians:(CGFloat) degrees;
+(CGFloat) parseRadiansToDegrees:(CGFloat) radians;
//<==
//添加不向服务器备份的Document下的路径
+(BOOL)addSkipBackupAttributeToItemAtURL:(NSString *)url;
/**
 检查版本信息
 在检查之前必须设置 glaobAppIdentify
 */
+(void) checkAppVersion;
//简易发声
+(BOOL) soundWithPath:(NSString*) path isShake:(BOOL) isShake;

@end
