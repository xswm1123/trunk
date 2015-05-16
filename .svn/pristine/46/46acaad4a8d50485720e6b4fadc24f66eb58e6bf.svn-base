//
//  HttpUtilRequest.h
//  Common
//
//  Created by wlpiaoyi on 14-10-7.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//

#define HttpUtilOutTime 30

#import <Foundation/Foundation.h>



@protocol HttpUtilConnectionDataDelegate;

//http请求反馈
typedef void (^CallBackHttpUtilRequest)(id data,NSDictionary* userInfo);
//下载请求完成时反馈
typedef void (^CallBackHttpUtilDownLoaded)(NSString* relativePath ,NSString* downLoadKey ,NSDictionary* userInfo);
//下载请求恢复数据反馈
typedef NSData* (^CallBackHttpUtilDownLoadResume)(NSString* downLoadKey ,NSDictionary* userInfo);
//下载请求暂停数据反馈
typedef void (^CallBackHttpUtilDowndLoadSuspend)(NSData *resumeData ,NSString *downLoadKey);
typedef void (^CallBackHttpUtilUpLoading)(NSDictionary* userInfo);
/**
 HTTP数据请求
 */
@protocol HttpUtilRequestDelegate <NSObject>
/**
 用户参数信息
 */
-(void) setUserInfo:(id) userInfo;
/**
 http编码方式
 */
-(void) setHttpEncoding:(NSStringEncoding) encoding;
/**
 http请求地址
 */
-(void) setRequestString:(NSString*) requestString;
/**
 添加头信息
 */
-(void) addRequestHeadValue:(NSDictionary*) dic;
-(void) requestPOST:(NSDictionary*) params;
-(void) requestPUT:(NSDictionary*) params;
-(void) requestGET:(NSDictionary*) params;
-(void) requestDELETE:(NSDictionary*) params;
-(void) requestPOST:(NSDictionary*) params OutTime:(int) outTime;
-(void) requestPUT:(NSDictionary*) params OutTime:(int) outTime;
-(void) requestGET:(NSDictionary*) params OutTime:(int) outTime;
-(void) requestDELETE:(NSDictionary*) params OutTime:(int) outTime;
//-(void) startAsynRequest;
/**
 http请求成功后的反馈
 */
-(void) setSuccessCallBack:(CallBackHttpUtilRequest) callback;
/**
 http请求失败后的反馈
 */
-(void) setFaildCallBack:(CallBackHttpUtilRequest) callback;
-(void) cancel;
//@optional
//-(void) startSynRequest;
@end
/**
 数据下载
 */
@protocol HttpUtilDownLoadDelegate <NSObject>
//下载地址
@property (nonatomic,strong) NSString* downLoadString;
//特殊用途的标示符
@property (nonatomic,strong) NSString* downLoadKey;
//用户数据
@property (nonatomic,strong) id userInfo;
@property (nonatomic,assign) id<HttpUtilConnectionDataDelegate> delegate;
-(void) setDownLoadedSuccessCallBack:(CallBackHttpUtilDownLoaded) callback;
-(void) setDownLoadingFaildCallBack:(CallBackHttpUtilDownLoaded) callback;
-(void) setDownLoadingSuspendCallBack:(CallBackHttpUtilDowndLoadSuspend) callback;
-(void) setDownLoadingCancelCallBack:(CallBackHttpUtilDowndLoadSuspend) callback;
-(void) setDownLoadedResumeDataCallBack:(CallBackHttpUtilDownLoadResume) callback;
-(BOOL) resumeDownLoad;
-(BOOL) suspendDownLoad;
-(BOOL) cancelDownLoad;
@end
/**
 数据上传
 */
@protocol HttpUtilUpLoadDelegate <NSObject>
-(void) setUpLoadString:(NSString*) upLoadString;
-(void) setUpLoadingSuccessCallBack:(CallBackHttpUtilUpLoading) callback;
-(void) setUpLoadingFaildCallBack:(CallBackHttpUtilUpLoading) callback;
-(void) resumeUpLoad;
-(void) suspendUpLoad;
-(void) cancelUpLoad;
@end
/**
 数据连接协议
 */
@protocol HttpUtilConnectionDataDelegate <NSObject>
@required
-(void)connection:(unsigned long long int) totalBytes;
-(void)connection:(id)connection didFailWithError:(NSError *)error;
-(void)connectionHasFinishLoaded:(id)connection Path:(NSString*) path;
@optional
-(void)connectionHasReceiveData:(int) persent;
-(void)connectionHasSendData:(int) persent;
-(void)connectionWait:(id)connection;
@end
