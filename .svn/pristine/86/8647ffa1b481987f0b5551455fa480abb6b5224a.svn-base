//
//  CustomerMainManager.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/21.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerMainManager.h"
#import "ConfigManage+Expand.h"

@implementation CustomerMainManager
/**
 销售员首页信息
 */
-(void) mainForCustomerWithStartTime:(NSDate*) startTime endTime:(NSDate*) endTime objectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetXSYSY_KH"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        if (success) {
            NSArray *lables;
            if ([result isKindOfClass:[NSDictionary class]]) {
                LableEntity *label = [LableEntity instanceWithJson:result];
                lables = @[label];
            }else if([result isKindOfClass:[NSArray class]]){
                NSMutableArray *temp = [NSMutableArray new];
                for (NSDictionary *json in result) {
                    LableEntity *label = [LableEntity instanceWithJson:json];
                    [temp addObject:label];
                }
                lables = [NSArray arrayWithArray:temp];
            }
            success(lables,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    [hur requestGET:@{@"YH_YHID":[ConfigManage getLoginUser].userId,@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,@"StartTime":startTime?[startTime dateFormateDate:@"yyyy-MM-dd"]:@"2014-01-01",@"EndTime":endTime?[endTime dateFormateDate:@"yyyy-MM-dd"]:@"2018-12-31"}];
}
-(void) upComingCountWithStartTime:(NSDate*) startTime endTime:(NSDate*) endTime objectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetXSYSY_DBSX"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        if (success) {
            NSArray *lables;
            if ([result isKindOfClass:[NSDictionary class]]) {
                LableEntity *label = [LableEntity instanceWithJson:result];
                lables = @[label];
            }else if([result isKindOfClass:[NSArray class]]){
                NSMutableArray *temp = [NSMutableArray new];
                for (NSDictionary *json in result) {
                    LableEntity *label = [LableEntity instanceWithJson:json];
                    [temp addObject:label];
                }
                lables = [NSArray arrayWithArray:temp];
            }
            success(lables,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    [hur requestGET:@{@"YH_YHID":[ConfigManage getLoginUser].userId,@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,@"StartTime":startTime?[startTime dateFormateDate:@"yyyy-MM-dd"]:@"2014-01-01",@"EndTime":endTime?[endTime dateFormateDate:@"yyyy-MM-dd"]:@"2018-12-31"}];
}
-(void) financeCountWithStartTime:(NSDate*) startTime endTime:(NSDate*) endTime objectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetXSYSY_KX"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        if (success) {
            NSArray *lables;
            if ([result isKindOfClass:[NSDictionary class]]) {
                LableEntity *label = [LableEntity instanceWithJson:result];
                lables = @[label];
            }else if([result isKindOfClass:[NSArray class]]){
                NSMutableArray *temp = [NSMutableArray new];
                for (NSDictionary *json in result) {
                    LableEntity *label = [LableEntity instanceWithJson:json];
                    [temp addObject:label];
                }
                lables = [NSArray arrayWithArray:temp];
            }
            success(lables,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    [hur requestGET:@{@"YH_YHID":[ConfigManage getLoginUser].userId,@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,@"StartTime":startTime?[startTime dateFormateDate:@"yyyy-MM-dd"]:@"2014-01-01",@"EndTime":endTime?[endTime dateFormateDate:@"yyyy-MM-dd"]:@"2018-12-31"}];
}
-(void) tradeDoneCountWithStartTime:(NSDate*) startTime endTime:(NSDate*) endTime objectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetXSYSY_CJ"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        if (success) {
            NSArray *lables;
            if ([result isKindOfClass:[NSDictionary class]]) {
                LableEntity *label = [LableEntity instanceWithJson:result];
                lables = @[label];
            }else if([result isKindOfClass:[NSArray class]]){
                NSMutableArray *temp = [NSMutableArray new];
                for (NSDictionary *json in result) {
                    LableEntity *label = [LableEntity instanceWithJson:json];
                    [temp addObject:label];
                }
                lables = [NSArray arrayWithArray:temp];
            }
            success(lables,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    [hur requestGET:@{@"YH_YHID":[ConfigManage getLoginUser].userId,@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,@"StartTime":startTime?[startTime dateFormateDate:@"yyyy-MM-dd"]:@"2014-01-01",@"EndTime":endTime?[endTime dateFormateDate:@"yyyy-MM-dd"]:@"2018-12-31"}];
}

/**
 客户生日信息
 */
-(void) birthDayForCustomerWithObjectId:(NSString*) objectId UserId:(NSString *)userId success:(CallBackHttpUtilRequest)success faild:(CallBackHttpUtilRequest)faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetKH_SRXXARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        if (success) {
//            NSMutableArray *arrayResult;
//            if(result&&[result isKindOfClass:[NSArray class]]){
//                for (NSDictionary *json in result) {
//                    CustomerBirthdayEntity *entity = [CustomerBirthdayEntity instanceWithJson:json];
//                    [arrayResult addObject:entity];
//                }
//            }
            success(result,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    [hur requestGET:@{@"YH_YHID":userId?userId:[ConfigManage getLoginUser].userId,
                      @"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId}];
    
}
/**
 客户跟踪接口
 customerName:客户名称
 visitData:访问时间
 orderLevel:客户意向程度
 customerType:客户类型
 */
-(void) followUpForCustomerWithName:(NSString*) customerName visitDate:(NSDate*) visitDate orderLevel:(NSString*) orderLevel customerType:(NSString*) customerType objectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetKH_GZXXARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
//        
//        NSMutableArray *arrayResult=[NSMutableArray array];
//        if(result&&[result isKindOfClass:[NSArray class]]){
//            for (NSDictionary *json in result) {
//                CustomerFollowUpEntity *entity = [CustomerFollowUpEntity instanceWithJson:json];
//                [arrayResult addObject:entity];
//            }
//        }
        NSArray* arr=(NSArray*)result;
        
        if (success) {
            success(arr,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"YH_YHID":[ConfigManage getLoginUser].userId,@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId}];
    [params setObject:@"" forKey:@"KH_KHXM"];
    if ([NSString isEnabled:customerName]) {
        [params setObject:customerName forKey:@"KH_KHXM"];
    }
    [params setObject:@"" forKey:@"LF_LFRQ"];
    if (visitDate) {
        [params setObject:[visitDate dateFormateDate:@"yyyy-MM-dd"] forKey:@"LF_LFRQ"];
    }
    [params setObject:@"" forKey:@"KH_YXCD"];
    if ([NSString isEnabled:orderLevel]) {
        [params setObject:orderLevel forKey:@"KH_YXCD"];
    }
    [params setObject:@"" forKey:@"KH_KHLX"];
    if ([NSString isEnabled:customerType]) {
        [params setObject:customerType forKey:@"KH_KHLX"];
    }
    [hur requestGET:params];
    
}

-(void) followUpDetailForCustomerWithObjectId:(NSString*) objectId customerId:(NSString*) customerId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetKH_KHGZ_EDITBYID"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
//        id result = [self checkData:data];
//        NSLog(@"data==%@",data);
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        NSDictionary* dic=(NSDictionary*)data;
//        if (result) {
//            CustomerFollowUpDetailEnity *entity = [CustomerFollowUpDetailEnity instanceWithJson:result];
//            result = entity;
//        }
        if (success) {
            success(dic,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"YH_YHID":[ConfigManage getLoginUser].userId,@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId}];
    if ([NSString isEnabled:customerId]) {
        [params setObject:customerId forKey:@"KH_KHID"];
    }
    [hur requestGET:params];
}


/**
 联系状态改变接口
 customerId:客户ID
 followUpDate:跟踪日期
 followUpWay:跟踪方式
 isEnabled:是否有效
 */
-(void) optFollowUpForCustomer:(NSString*) customerId followUpDate:(NSString*) followUpDate followUpWay:(NSString*) followUpWay isEnabled:(NSString*) isEnabled success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"TJKH_GZJHXX"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"YH_YHID":[ConfigManage getLoginUser].userId}];
    if ([NSString isEnabled:customerId]) {
        [params setObject:customerId forKey:@"KH_KHID"];
    }
    if ([NSString isEnabled:followUpDate]) {
        [params setObject:followUpDate forKey:@"KH_GZRQ"];
    }
    if ([NSString isEnabled:followUpWay]) {
        [params setObject:followUpWay forKey:@"KH_GZFS"];
    }
    [params setObject:isEnabled?isEnabled:@"失效" forKey:@"GZ_SFSX"];
    [hur requestGET:params];
}
/**
 逾期签约列表
 */
-(void) singedOverdueForCustomer:(NSString*) customerId objectId:(NSString*) objectId startTime:(NSString*) startTime endTime:(NSString*) endTime success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetQYYQXXARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for (NSDictionary* json in result) {
            SignOverdueEntity *entity = [SignOverdueEntity instanceWithJson:json];
            [resultArray addObject:entity];
        }
        if (success) {
            success(resultArray,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary new];
    if ([NSString isEnabled:objectId]) {
        [params setObject:objectId forKey:@"WY_WYID"];
    }else{
        [params setObject:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    }
    if ([NSString isEnabled:customerId]) {
        [params setObject:customerId forKey:@"YH_YHID"];
    }
    if ([NSString isEnabled:startTime]) {
        [params setObject:startTime forKey:@"StartTime"];
    }
    if ([NSString isEnabled:endTime]) {
        [params setObject:endTime forKey:@"EndTime"];
    }
    [hur requestGET:params];
}
-(void)unPayForCustomer:(NSString*) customerId objectId:(NSString*) objectId startTime:(NSString*) startTime endTime:(NSString*) endTime success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetDQ_WFXXARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for (NSDictionary* json in result) {
            SignOverdueEntity *entity = [SignOverdueEntity instanceWithJson:json];
            [resultArray addObject:entity];
        }
        if (success) {
            success(resultArray,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary new];
    if ([NSString isEnabled:objectId]) {
        [params setObject:objectId forKey:@"WY_WYID"];
    }else{
        [params setObject:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    }
    if ([NSString isEnabled:customerId]) {
        [params setObject:customerId forKey:@"YH_YHID"];
    }
    if ([NSString isEnabled:startTime]) {
        [params setObject:startTime forKey:@"StartTime"];
    }
    if ([NSString isEnabled:endTime]) {
        [params setObject:endTime forKey:@"EndTime"];
    }
    [hur requestGET:params];
}
-(void)willOnTimeForCustomer:(NSString*) customerId objectId:(NSString*) objectId startTime:(NSString*) startTime endTime:(NSString*) endTime success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetJJDQ_WFXXARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for (NSDictionary* json in result) {
            SignOverdueEntity *entity = [SignOverdueEntity instanceWithJson:json];
            [resultArray addObject:entity];
        }
        if (success) {
            success(resultArray,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary new];
    if ([NSString isEnabled:objectId]) {
        [params setObject:objectId forKey:@"WY_WYID"];
    }else{
        [params setObject:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    }
    if ([NSString isEnabled:customerId]) {
        [params setObject:customerId forKey:@"YH_YHID"];
    }
    if ([NSString isEnabled:startTime]) {
        [params setObject:startTime forKey:@"StartTime"];
    }
    if ([NSString isEnabled:endTime]) {
        [params setObject:endTime forKey:@"EndTime"];
    }
    [hur requestGET:params];
}
/**
 联系状态改变
 */
-(void) optContactedStatusWithCompactId:(NSString*) compactId userId:(NSString*) userId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"ModifyHT_LXSTATE"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"YH_YHID":[ConfigManage getLoginUser].userId}];
    if ([NSString isEnabled:compactId]) {
        [params setObject:compactId forKey:@"HT_HTID"];
    }
    if ([NSString isEnabled:userId]) {
        [params setObject:userId forKey:@"YH_YHID"];
    }
    [hur requestGET:params];
    
}

-(void) queryCustomerWithObjectId:(NSString*) objectId UserId:(NSString*) userId customerName:(NSString*) customerName customerPhone:(NSString*) customerPhone certificate:(NSString*) certificate visitDate:(NSString*) visitDate visitWay:(NSString*) visitWay orderLevel:(NSString*) orderLevel  tradeState:(NSString*) tradeState success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetKH_KHCX"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for (NSDictionary* json in result) {
            CustomerInfoEntity *entity = [CustomerInfoEntity instanceWithJson:json];
            [resultArray addObject:entity];
        }
        if (success) {
            success(resultArray,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary new];
    if ([NSString isEnabled:objectId]) {
        [params setObject:objectId forKey:@"WY_WYID"];
    }else{
        [params setObject:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    }
    [params setObject:@"" forKey:@"KH_KHMC"];
    [params setObject:@"" forKey:@"KH_KHDH"];
    [params setObject:@"" forKey:@"KH_ZJHM"];
    [params setObject:@"" forKey:@"KH_LFRQ"];
    [params setObject:@"" forKey:@"KH_LFFS"];
    [params setObject:@"" forKey:@"KH_YXCD"];
    [params setObject:@"" forKey:@"tradeState"];
    [params setObject:@"" forKey:@"YH_YHID"];
    if ([NSString isEnabled:customerName]) {
        [params setObject:customerName forKey:@"KH_KHMC"];
    }
    if ([NSString isEnabled:customerPhone]) {
        [params setObject:customerPhone forKey:@"KH_KHDH"];
    }
    if ([NSString isEnabled:certificate]) {
        [params setObject:certificate forKey:@"KH_ZJHM"];
    }
    if ([NSString isEnabled:visitDate]) {
        [params setObject:visitDate forKey:@"KH_LFRQ"];
    }
    if ([NSString isEnabled:visitWay]) {
        [params setObject:visitWay forKey:@"KH_LFFS"];
    }
    if ([NSString isEnabled:orderLevel]) {
        [params setObject:orderLevel forKey:@"KH_YXCD"];
    }
    if ([NSString isEnabled:tradeState]) {
        [params setObject:tradeState forKey:@"tradeState"];
    }
    if ([NSString isEnabled:userId]) {
        [params setObject:userId forKey:@"YH_YHID"];
    }
    [hur requestGET:params];
}
-(void)queryBaseInfomationWithCustomerId:(NSString *)customerId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetKH_JBXXBYID"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
//        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
//        for (NSDictionary* json in result) {
//            CustomerEntity *entity = [CustomerEntity instanceWithJson:json];
//            [resultArray addObject:entity];
//        }

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
    [params setObject:customerId forKey:@"KH_KHID"];
    [hur requestGET:params];
}

/**
 客户验证
 */
-(void) verificationForCustomerWithObjectId:(NSString*) objectId customerName:(NSString*) customerName customerPhone:(NSString*) customerPhone certificate:(NSString*) certificate success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"CustomerValidate"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for (NSDictionary* json in result) {
            CustomerVerificationEntity *entity = [CustomerVerificationEntity instanceWithJson:json];
            [resultArray addObject:entity];
        }
        if (success) {
            success(resultArray,nil);
        }
    }];
    [hur setFaildCallBack:^(id data, NSDictionary *userInfo) {
        CallBackHttpUtilRequest faild = [userInfo objectForKey:@"faild"];
        if (faild) {
            faild(data,nil);
        }
    }];
    NSMutableDictionary *params = [NSMutableDictionary new];
    if ([NSString isEnabled:objectId]) {
        [params setObject:objectId forKey:@"WY_WYID"];
    }else{
        [params setObject:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    }
    [params setObject:@"" forKey:@"KH_KHMC"];
    [params setObject:@"" forKey:@"KH_KHDH"];
    [params setObject:@"" forKey:@"KH_ZJHM"];
    if ([NSString isEnabled:customerName]) {
        [params setObject:customerName forKey:@"KH_KHMC"];
    }
    if ([NSString isEnabled:customerPhone]) {
        [params setObject:customerPhone forKey:@"KH_KHDH"];
    }
    if ([NSString isEnabled:certificate]) {
        [params setObject:certificate forKey:@"KH_ZJHM"];
    }
    [hur requestGET:params];
}
/**
 客户来电专访
 */
-(void) customerCallVisitWithIds:(NSString*) customerIds UserName:(NSString *)userName success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"XSY_LDZLF"];
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
    if ([NSString isEnabled:customerIds]) {
        [params setObject:customerIds forKey:@"KH_KHID"];
    }
    [params setObject:userName forKey:@"YH_YHMC"];
    [hur requestGET:params];
    
}

/**
 新增客户
 */
-(void) persistCustomer:(CustomerEntity*) entity Questionnaire:(NSDictionary *)qentity CustomerName:(NSString *)customerName CustomerPhone:(NSString *)customerPhone ModifyStatu:(NSString*) modifyStatu success:(CallBackHttpUtilRequest)success faild:(CallBackHttpUtilRequest)faild{
//    NSString* url=[NSString stringWithFormat:@"http://%@/HWT.WEB/index.aspx?ActionModel=%@&UserName=%@&UserPwd=%@",LoginProjectName,action,LoginUserName,LoginUserPassoword]];
    id<HttpUtilRequestDelegate> hur = [self createRequestPostWith:@""];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:[ConfigManage getLoginUser].userName forKey:@"UserName"];
    [params setObject:[ConfigManage getLoginUser].password forKey:@"UserPwd"];
//    [params setObject:[ConfigManage getLoginUser].sellerName forKey:@"KH_XSY"];
//    [params setObject:[ConfigManage getLoginUser].sellGroup forKey:@"KH_XSZB"];
//    [params setObject:[ConfigManage getLoginUser].sellerId forKey:@"XSY_XSYID"];
    [params setObject:@"KH_JBXXADD" forKey:@"ActionModel"];
    [params setObject:[entity toInstanceJson] forKey:@"khxx"];
    [params setObject:qentity forKey:@"dcbxx"];
    [params setObject:customerName forKey:@"KH_KHMC"];
    [params setObject:customerPhone forKey:@"KH_KHDH"];
    [params setObject:modifyStatu forKey:@"ModifyStatu"];
    [hur requestPOST:params];
    
}
/**
 修改客户信息
 */
-(void) persistCustomer:(CustomerEntity*) entity Questionnaire:(NSDictionary *)qentity CustomerName:(NSString *)customerName CustomerPhone:(NSString *)customerPhone  success:(CallBackHttpUtilRequest)success faild:(CallBackHttpUtilRequest)faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"KH_JBXXADD"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:[entity toInstanceJson] forKey:@"khxx"];
    [params setObject:qentity forKey:@"dcbxx"];
    [params setObject:customerName forKey:@"KH_KHMC"];
    [params setObject:customerPhone forKey:@"KH_KHDH"];
    [hur requestGET:params];
    
}

/**
 调查表
 */
-(void) findQuestionaryWithObjectId:(NSString*) objectId visitWay:(NSString*) visitWay custormerId:(NSString*) custormerId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GETDCBXXBYLFFS"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
//        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
//        for (NSDictionary* json in result) {
//            QuestionaryEntity *entity = [QuestionaryEntity instanceWithJson:json];
//            [resultArray addObject:entity];
//        }
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
    [params setObject:objectId?objectId:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    [params setObject:custormerId?custormerId:[ConfigManage getLoginUser].userId forKey:@"KH_KHID"];
    if ([NSString isEnabled:visitWay]) [params setObject:visitWay forKey:@"LF_LFFS"];
    [hur requestGET:params];
}
/**
 客户跟踪下拉信息
 */
-(void) pullDownForFollowupWithDic:(NSString*) dic objectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetZDGLARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:objectId?objectId:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    [params setObject:dic forKey:@"ZD_ZDID"];
    [hur requestGET:params];
}

/**
 查询户型
 */
-(void) queryHouseholderWithObjectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetHXGLARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:objectId?objectId:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    [hur requestGET:params];
}

/**
 查询房屋信息
 objectId:项目ID
 houseloderId:户型ID
 houseNum:房屋编号
 biuldId:楼座ID
 unitId:单元ID
 floorNum:楼层编号
 */
-(void) queryHouseInfoWithObjectId:(NSString*) objectId householderId:(NSString*) householderId houseNum:(NSString*) houseNum biuldId:(NSString*) biuldId unitId:(NSString*) unitId floorNum:(NSString*) floorNum buildType:(NSString*) type success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetHXFWGLARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:objectId?objectId:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    [params setObject:householderId?householderId:@"" forKey:@"HX_HXID"];
    [params setObject:houseNum?houseNum:@"" forKey:@"FW_FWBH"];
    [params setObject:biuldId?biuldId:@"" forKey:@"LZ_LZID"];
    [params setObject:unitId?unitId:@"" forKey:@"FW_DYBH"];
    [params setObject:floorNum?floorNum:@"" forKey:@"FW_LCBH"];
    [params setObject:type?type:@"" forKey:@"HQLX"];
    [hur requestGET:params];
}
-(void) queryByHouseID:(NSString*)houseId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetSJ_FWXXBYFWID"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:houseId?houseId:@"" forKey:@"FW_FWID"];
    [hur requestGET:params];

}
-(void)queryMonthPlansForSellersWithObjectId:(NSString*) objectId UserId:(NSString*) userId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetXSYSY_JH"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:objectId?objectId:@"" forKey:@"WY_WYID"];
    [params setObject:userId?userId:@"" forKey:@"YH_YHID"];
    [hur requestGET:params];
}
-(void)caculateWithUserId:(NSString* )userId HouseId:(NSString*) houseId LoanRates:(NSString*) loadRates FundRates:(NSString*) fundRates FundLoanRates:(NSString*)fundLoanRates BuisnessLoanCount:(NSString*)businessLoadCount BuisnessLoadYear:(NSString*)buisnessLoadYear FundCount:(NSString*)fundCount FundYear:(NSString*) fundYear MatchPrincipal:(NSString*) matchPrincipal Discount:(NSString*) discount TotalCount:(NSString*) totalCount success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetSJDKXXARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:userId?userId:@"" forKey:@"YH_YHID"];
    [params setObject:houseId?houseId:@"" forKey:@"FW_FWID"];
    [params setObject:loadRates?loadRates:@"" forKey:@"SYLV"];
    [params setObject:businessLoadCount?businessLoadCount:@"" forKey:@"SDJE"];
    [params setObject:buisnessLoadYear?buisnessLoadYear:@"" forKey:@"SDNX"];
    [params setObject:fundCount?fundCount:@"" forKey:@"GJJJE"];
    [params setObject:fundYear?fundYear:@"" forKey:@"GJJNX"];
    [params setObject:matchPrincipal?matchPrincipal:@"" forKey:@"DKLX"];
    [params setObject:fundRates forKey:@"GJJLV"];
    [params setObject:fundLoanRates forKey:@"GJJDKLX"];
    [params setObject:discount forKey:@"ZKD"];
    [params setObject:totalCount forKey:@"HT_FKZJ"];
    [hur requestGET:params];
}
-(void)queryLoanTypessuccess:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetLVLBXXARRY"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [hur requestGET:params];

}
-(void) queryLoanRatesWithLoanTypeId:(NSString*) loadTypeId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetAJHKLL"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
     [params setObject:loadTypeId?loadTypeId:@"" forKey:@"dK_FLBH"];
    [hur requestGET:params];
}
-(void) queryPayLoanTypesWithObjectId:(NSString*) objectId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetFKLX"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:objectId?objectId:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    [hur requestGET:params];
}

-(void)addTrackPlanWithObjectId:(NSString*) objectId CustomerId:(NSString*) customerId TrackDate:(NSString*) trackDate TrackWay:(NSString*) trackWay IsOn:(NSString*) isOn success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"TJKH_GZJHXX"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:objectId?objectId:[ConfigManage getLoginUser].objectId forKey:@"WY_WYID"];
    [params setObject:customerId forKey:@"KH_KHID"];
    [params setObject:trackDate forKey:@"KH_GZRQ"];
    [params setObject:trackWay forKey:@"KH_GZFS"];
    [params setObject:isOn forKey:@"GZ_SFSX"];
    [hur requestGET:params];
}
-(void)addCallBackPlanWithCustomerId:(NSString*)customerId CallType:(NSString*)callType Content:(NSString*)content Name:(NSString*) name Summary:(NSString*)summary success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"TJKH_GZXX"];
    [hur setUserInfo:@{@"success":success,@"faild":faild}];
    [hur setSuccessCallBack:^(id data, NSDictionary *userInfo) {
        id result = [self checkData:data];
        CallBackHttpUtilRequest success = [userInfo objectForKey:@"success"];
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
    [params setObject:customerId forKey:@"KH_KHID"];
     [params setObject:callType forKey:@"KG_LFFS"];
     [params setObject:content forKey:@"KG_LFNR"];
     [params setObject:name forKey:@"KG_LFXM"];
     [params setObject:summary forKey:@"KG_BZ"];
    
    [hur requestGET:params];
}
@end
