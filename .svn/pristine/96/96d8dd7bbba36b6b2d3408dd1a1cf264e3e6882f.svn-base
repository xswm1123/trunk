//
//  ConfigManage+Expand.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/16.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
#import "UserEntity.h"
extern NSString *LoginUserName;
extern NSString *LoginUserPassoword;
extern NSString *LoginProjectName;
@interface ConfigManage(ConfigManage)
/**
 获取当前登录的用户实体
 */
+(UserEntity*) getLoginUser;
/**
 设置当前登录的用户实体
 */
+(void) setLoginUser:(UserEntity*) user;
/**
 获取当前用户的配置信息
 */
+(id) getConfigValueByUser:(NSString *)key;
/**
 设置当前用户的配置信息
 */
+(void) setConfigValueByUser:(id) value Key:(NSString*) key;
@end
