//
//  FDCBaseManger.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/16.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCBaseManger.h"
#import "ConfigManage+Expand.h"
//主域名
//NSString *const URL_BASE_HTTP = @"http://hwtris.wicp.net:61/HWT.WEB/index.aspx?ActionModel=";
//临时IP  hwtrisapp.gnway.cc 125.64.9.232
NSString * URL_BASE_HTTP;
//= [NSString stringWithFormat:@"http://%@:61/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
//管理端网页URL
NSString *  URL_MANAGER;

NSString* URL_LOGO;

NSString *const KEY_STATU_CODE = @"StatuCode";
NSString *const KEY_PROMPT_MSG = @"PromptMsg";
NSString *const KEY_RESULT_DATA = @"ResultData";

static FDEntityManager *STATIC_EM;
@implementation FDCBaseManger
+(void) initialize{
    STATIC_EM = [FDEntityManager getSingleInstanceWithDBName:@"FDC.DATABASE"];
    [FDEntityManager checkAllTables:@[[UserEntity class]] dbName:@"FDC.DATABASE"];
    URL_BASE_HTTP=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
    URL_MANAGER=[NSString stringWithFormat:@"http://%@/HWT.WEB/manager",LoginProjectName];
    URL_LOGO=[NSString stringWithFormat:@"http://%@/HWT.WEB/",LoginProjectName];
}
-(id) init{
    if (self=[super init]) {
        self.em = STATIC_EM;
    }
    return self;
}

-(id) checkData:(id) data{
    id result;
    if (data) {
        result = [data JSONValue];
    }
    if(result){
        NSNumber *statusCode = [result objectForKey:KEY_STATU_CODE];
        NSString *promptMsg = [result objectForKey:KEY_PROMPT_MSG];
        id resultData = [result objectForKey:KEY_RESULT_DATA];
        if (statusCode.intValue == 1) {
            result = resultData;
        }else{
            [Utils showAlert:promptMsg?promptMsg:@"" title:nil];
            result = 0;
        }
    }
    return result;
}
-(id<HttpUtilRequestDelegate>) createRequestWith:(NSString*) action{
    id<HttpUtilRequestDelegate> htr = [HttpUtilRequest new];
    if ([ConfigManage getLoginUser]&&LoginUserName&&LoginUserPassoword) {
        [htr setRequestString:[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=%@&UserName=%@&UserPwd=%@",LoginProjectName,action,LoginUserName,LoginUserPassoword]];
//         [htr setRequestString:[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=%@",LoginProjectName,action]];
        URL_BASE_HTTP=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
        URL_MANAGER=[NSString stringWithFormat:@"http://%@/HWT.WEB/manager",LoginProjectName];
    }else{
        [htr setRequestString:[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=%@",LoginProjectName,action]];
        URL_BASE_HTTP=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
        URL_MANAGER=[NSString stringWithFormat:@"http://%@/HWT.WEB/manager",LoginProjectName];
    }
    return htr;
}
-(id<HttpUtilRequestDelegate>) createRequestPostWith:(NSString*) action{
    id<HttpUtilRequestDelegate> htr = [HttpUtilRequest new];
   
        [htr setRequestString:[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx",LoginProjectName]];
    NSLog(@"setRequestString:%@",[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx",LoginProjectName]);
    URL_BASE_HTTP=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
    URL_MANAGER=[NSString stringWithFormat:@"http://%@/HWT.WEB/manager",LoginProjectName];

    return htr;
}
-(id<HttpUtilRequestDelegate>) createRequestPostUpLoadWith:(NSString*) action{
    id<HttpUtilRequestDelegate> htr = [HttpUtilRequest new];
    
    [htr setRequestString:[NSString stringWithFormat:@"http://%@/HWT.WEB/WebService.asmx/FileUpload",LoginProjectName]];
    NSLog(@"setRequestString:%@",[NSString stringWithFormat:@"http://%@/HWT.WEB/WebService.asmx/FileUpload",LoginProjectName]);
    URL_BASE_HTTP=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
    URL_MANAGER=[NSString stringWithFormat:@"http://%@/HWT.WEB/manager",LoginProjectName];
    
    return htr;
}
-(id<HttpUtilRequestDelegate>) createRequestCheckUpstateWith:(NSString*) action{
    id<HttpUtilRequestDelegate> htr = [HttpUtilRequest new];
    if ([ConfigManage getLoginUser]&&LoginUserName&&LoginUserPassoword) {
        [htr setRequestString:[NSString stringWithFormat:@"http://125.64.9.232/HWT.WEB/index.aspx?ActionModel=%@",action]];

        URL_BASE_HTTP=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
        URL_MANAGER=[NSString stringWithFormat:@"http://%@/HWT.WEB/manager",LoginProjectName];
    }else{
        [htr setRequestString:[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=%@",LoginProjectName,action]];
        URL_BASE_HTTP=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=",LoginProjectName];
        URL_MANAGER=[NSString stringWithFormat:@"http://%@/HWT.WEB/manager",LoginProjectName];
    }
    return htr;
}
-(NSString*) getKeyConfiger:(NSString*) key{
    NSString *keyConfiger = [NSString stringWithFormat:@"%@_%@_%@",key,LoginUserName,LoginUserPassoword];
    return keyConfiger;
}
@end
