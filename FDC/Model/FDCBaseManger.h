//
//  FDCBaseManger.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/16.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "ConfigManage+Expand.h"
#import "UserEntity.h"
extern NSString * URL_BASE_HTTP;
extern NSString*  URL_MANAGER;
extern NSString* URL_LOGO;

extern NSString *const KEY_STATU_CODE;
extern NSString *const KEY_PROMPT_MSG;
extern NSString *const KEY_RESULT_DATA;

@interface FDCBaseManger : NSObject
@property (nonatomic,strong) FDEntityManager *em;
-(id) checkData:(id) data;
-(id<HttpUtilRequestDelegate>) createRequestWith:(NSString*) action;
-(id<HttpUtilRequestDelegate>) createRequestPostWith:(NSString*) action;
-(id<HttpUtilRequestDelegate>) createRequestPostUpLoadWith:(NSString*) action;
-(id<HttpUtilRequestDelegate>) createRequestCheckUpstateWith:(NSString*) action;
-(NSString*) getKeyConfiger:(NSString*) key;
@end
