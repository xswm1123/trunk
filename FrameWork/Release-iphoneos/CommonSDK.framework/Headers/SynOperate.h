//
//  SynOperate.h
//  wanxue
//
//  Created by wlpiaoyi on 14-9-11.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class SynOperate;


typedef void (^CallBackSynOperate) (SynOperate* so);
/**
 异步操作协议
 */
@protocol SynOperateDelegate <NSObject>
/**
 开始操作
 */
-(void) startOperate:(SynOperate*) synOperate;
/**
 正在操作
 */
-(void) operate:(SynOperate*) operate;
/**
 结束操作
 */
-(void) endOperate:(SynOperate*) synOperate;
@end

@interface SynOperate : NSObject
@property (nonatomic,strong) NSString *waitmsg;
+(SynOperate*) initWithDelegate:(id<SynOperateDelegate>) delegate;
+(SynOperate*) initWithDelegate:(id<SynOperateDelegate>) delegate UserInfo:(id) userInfo;
+(SynOperate*) initWIthCallBack:(CallBackSynOperate) callBack CallBackStart:(CallBackSynOperate) callBackStart CallBackEnd:(CallBackSynOperate) callBackEnd;
+(SynOperate*) initWIthCallBack:(CallBackSynOperate) callBack CallBackStart:(CallBackSynOperate) callBackStart CallBackEnd:(CallBackSynOperate) callBackEnd UserInfo:(id) userInfo;
@property (nonatomic,strong,readonly) id userInfo;
-(void) start;

@end
