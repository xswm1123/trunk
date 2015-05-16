//
//  ReachabilityListener.h
//  wanxue
//
//  Created by wlpiaoyi on 14-9-16.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Reachability.h"

/**
网络链接发生改变是对应要执行的协议方法
 */
@protocol ReachabilityListenerDelegate <NSObject>
/**
没有网络
 */
-(void) notReachable;
/**
 2G/3G/4G网络
 */
-(void) reachableViaWWAN;
/**
 WIFI/WLAN网络
 */
-(void) reachableViaWiFi;
@end
/**
 网络监听器
 */
@interface ReachabilityListener : NSObject
+(ReachabilityListener*) getSingleInstance;
@property (nonatomic,readonly) NetworkStatus networkStatus ;
-(void) addListener:(id<ReachabilityListenerDelegate>) listener;
-(void) removeListenser:(id<ReachabilityListenerDelegate>) listener;
@end
