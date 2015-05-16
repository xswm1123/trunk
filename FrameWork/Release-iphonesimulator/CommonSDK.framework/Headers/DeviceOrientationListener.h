//
//  DeviceOrientationListener.h
//  Common
//
//  Created by wlpiaoyi on 14/12/26.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol DeviceOrientationListenerDelegate <NSObject>
@optional
// Device oriented vertically, home button on the bottom
-(void) deviceOrientationPortrait;
// Device oriented vertically, home button on the top
-(void) deviceOrientationPortraitUpsideDown;
// Device oriented horizontally, home button on the right
-(void) deviceOrientationLandscapeLeft;
// Device oriented horizontally, home button on the left
-(void) deviceOrientationLandscapeRight;
@end

@interface DeviceOrientationListener : NSObject

+(DeviceOrientationListener*) getSingleInstance;
/**
 旋转当前装置
 */
+(void) attemptRotationToDeviceOrientation:(UIDeviceOrientation) deviceOrientation completion:(void (^)(void)) completion;
@property(nonatomic,readonly) UIDeviceOrientation orientation;
@property(nonatomic,strong) NSString *soundPath;
@property(nonatomic) float duration;
-(void) addListener:(id<DeviceOrientationListenerDelegate>) listener;
-(void) removeListenser:(id<DeviceOrientationListenerDelegate>) listener;
bool isSupportOrientation (UIDeviceOrientation orientation);
@end
