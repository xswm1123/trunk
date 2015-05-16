//
//  UserManager.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/16.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "UserManager.h"
#import "ConfigManage+Expand.h"
#import "CustomerMainManager.h"
#import "AdminManager.h"
@implementation UserManager

-(void) loginWithUserName:(NSString*) userName password:(NSString*) password ProjectName:(NSString*) projectName success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    LoginUserName =  userName;
    LoginUserPassoword = password;
    LoginProjectName=projectName;
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"CheckLoginUserInfo"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        if (success) {
            [ConfigManage setConfigValueByUser:result Key:[self getKeyConfiger:@"CheckLoginUserInfo"]];
            UserEntity *user = [UserEntity instanceWithJson:result];
            [ConfigManage setLoginUser:user];
            success(result,nil);
            if (result) {
            }
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
//        id result = [ConfigManage getConfigValueByUser:[self getKeyConfiger:@"CheckLoginUserInfo"]];
//         id result = @"";
//        if (result) {
//            CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
//            if (success) {
//                UserEntity *user = [UserEntity instanceWithJson:result];
//                [ConfigManage setLoginUser:user];
//                success(result,nil);
//            }
//            return;
//        }
        
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    [hur requestGET:[ConfigManage getLoginUser]?@{}:@{@"UserName":userName,@"UserPwd":password} OutTime:10];
//     [hur requestGET:nil];
}
-(void) reLoginWithUserName:(NSString*) userName password:(NSString*) password ProjectName:(NSString*) projectName success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    LoginUserName =  userName;
    LoginUserPassoword = password;
    LoginProjectName=projectName;
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"CheckLoginUserInfo"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        if (success) {
            [ConfigManage setConfigValueByUser:result Key:[self getKeyConfiger:@"CheckLoginUserInfo"]];
            UserEntity *user = [UserEntity instanceWithJson:result];
            [ConfigManage setLoginUser:user];
            success(result,nil);
            if (result) {
            }
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
//        id result = [ConfigManage getConfigValueByUser:[self getKeyConfiger:@"CheckLoginUserInfo"]];
//         id result = @"";
//        if (result) {
//            CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
//            if (success) {
//                UserEntity *user = [UserEntity instanceWithJson:result];
//                [ConfigManage setLoginUser:user];
//                success(result,nil);
//            }
//            return;
//        }
        
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
     [hur requestGET:[ConfigManage getLoginUser]?@{}:@{@"UserName":userName,@"UserPwd":password}  OutTime:10];
//         [hur requestGET:nil];
}
-(void) checkUpdateStateWithVersion:(NSString*)version success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestCheckUpstateWith:@"CheckUpdate"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        if (success) {
            success(result,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"IPA" forKey:@"CheckMode"];
    [params setObject:version forKey:@"Verison"];
    [hur requestGET:params];
}
@end
