//
//  AdminManager.m
//  FDC
//
//  Created by wlpiaoyi on 15/2/12.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "AdminManager.h"

@implementation AdminManager

/**
 管理员首页信息
 */
-(void) queryManagerMainInfoWithObjectId:(NSString*) objectId UserId:(NSString *)userId startTime:(NSString*) startTime endTime:(NSString*) endTime success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYSY_KH"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"YH_YHID":userId?userId:[ConfigManage getLoginUser].userId,
                      @"StartTime":startTime,
                      @"EndTime":endTime,
                      @"YH_YHID":[ConfigManage getLoginUser].userId}];
}
/**
 获取管理员调查表基本信息数组
 */
-(void) queryBaseQuestionaryArrayWithSuccess:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYDCBARRY"];
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
    [hur requestGET:nil];
}

/**
 获取调查表的试题
 */
-(void) queryTestQuestionaryArrayWithQuestionnaireId:(NSString*) questionnaireId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYDCBSTARRYBYID"];
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
    [hur requestGET:@{@"ZD_WJID":questionnaireId?questionnaireId:@""}];

}

/**
 根据试题ID 获取试题的各个选项分布图
 */
-(void) querySeletionPartByTestWithTestId:(NSString*) testId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYDCBSTFBTBYID"];
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
    [hur requestGET:@{@"ZD_ZDID":testId?testId:@""}];

}

/**
 获取项目的总房源信息数组
 */
-(void) queryHouseResourcesWithSuccess:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYXSTJXMFWXXARRY"];
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
    [hur requestGET:nil];
}
/**
 获取房屋销售分布图
 */
-(void) queryHouseSellDistributeWithObjectId:(NSString*) objectId type:(NSString*) type success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYFWXSFBTARRY"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"FW_TJFS":[NSString isEnabled:type]?type:@"总房源"}];
}

/**
 获取广告费用总计-选项
 statisticsYear:统计年份
 statisticsType:统计类型
 outlayType:费用类型
 */
-(void) queryADRateTotalOutlayWithObjectId:(NSString*) objectId statisticsYear:(NSString*) statisticsYear statisticsType:(NSString*) statisticsType outlayType:(NSString*) outlayType success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYFYLXGetGLYFYLX"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"TJ_TJNF":statisticsYear,
                      @"TJ_TJLX":statisticsType,
                      @"FY_FYLX":outlayType,
                      @"FY_FYXX":@"",
                      @"MX_MXYF":@""}
     ];

}


/**
 根据选项获取月份统计数据
 statisticsYear:统计年份
 statisticsType:统计类型
 outlayType:费用类型
 */
-(void) queryADRateByMonthWithObjectId:(NSString*) objectId statisticsYear:(NSString*) statisticsYear statisticsType:(NSString*) statisticsType outlayType:(NSString*) outlayType FY_FYXX:(NSString*) FY_FYXX MX_MXYF:(NSString*)MX_MXYF success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYFYLXGetGLYFYLX"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"TJ_TJNF":statisticsYear,
                      @"TJ_TJLX":statisticsType,
                      @"FY_FYLX":outlayType,
                      @"FY_FYXX":FY_FYXX,
                      @"MX_MXYF":MX_MXYF}
     ];
    
}

/**
 获取月份详情
 */
-(void) queryMontDetailWithObjectId:(NSString*) objectId year:(NSString*) year month:(NSString*) month success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYFYLXGetGLYFYLX"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"TJ_TJNF":year,
                      @"TJ_TJLX":@"总计",
                      @"FY_FYLX":@"广告费用",
                      @"FY_FYXX":@"全部",
                      @"MX_MXYF":month}
     ];
}

/**
 获取广告详情
 */
-(void) queryADRateDetailWithObject:(NSString*) objectId year:(NSString*) year type:(NSString*) type success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetGLYFYLXGetGLYFYLX"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"TJ_TJNF":year,
                      @"TJ_TJLX":@"总计",
                      @"FY_FYLX":@"广告费用",
                      @"FY_FYXX":@"全部",
                      @"MX_MXYF":@"",
                      @"TJ_TJLX":[NSString isEnabled:type]?type:@"明细"}];
}

-(void) querySetterCountsWithObjectId:(NSString*) objectId userId:(NSString*) userId houseId:(NSString*) houseId SYLV:(NSString*) SYLV SDJE:(NSString*) SDJE SDNX:(NSString*) SDNX GJJJE:(NSString*) GJJJE GJJNX:(NSString*) GJJNX DKLX:(NSString*) DKLX success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"YH_YHID":[NSString isEnabled:userId]?userId:[ConfigManage getLoginUser].userId,
                      @"FW_FWID":houseId,
                      @"SDJE":SDJE,
                      @"SYLV":SYLV,
                      @"SDNX":SDNX,
                      @"GJJJE":GJJJE,
                      @"GJJNX":GJJNX,
                      @"DKLX":DKLX}];
    
}
-(void) queryRankingBySellersWithObjectId:(NSString*)objectId Year:(NSString*) year Month:(NSString*) month  success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetPH_PHBXX"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId,
                      @"Year":year,
                      @"Month":month
                      }];
}
-(void) queryHouseImagesWithObjectId:(NSString*)objectId  success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetHX_HXXX"];
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
    [hur requestGET:@{@"WY_WYID":objectId?objectId:[ConfigManage getLoginUser].objectId
                      }];

}
-(void) upLoadFilesWithCustomerName:(NSString*) customerName SellId:(NSString*) sellId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetSCZLHQHX"];
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
    [hur requestGET:@{@"KH_KHXM":customerName,
                      @"XSY_XSYID":sellId
                      }];

}
-(void) queryMarketAndWikiWithFilesType:(NSString*) type success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetYXHDXSBK"];
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
    [hur requestGET:@{@"ZL_ZLLX":type}];

}
-(void) filesUpLoadWithBityes:(NSString*) bites CustomerId:(NSString*) customerId CustomerName:(NSString*) customerName FileName:(NSString*) fileName success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestPostUpLoadWith:@""];
   
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

    
    [hur requestPOST:@{@"bytestr":bites,@"KH_KHID":customerId,@"KH_KHMC":customerName,@"FJ_FJMC":fileName,@"UserName":[ConfigManage getLoginUser].userName,@"UserPwd":[ConfigManage getLoginUser].password}];
}
-(void) serachUpLoadFilesWithContactId:(NSString*) contactId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild{
    id<HttpUtilRequestDelegate> hur = [self createRequestWith:@"GetKHSCZLFWXX"];
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
    [hur requestGET:@{@"YH_YHMC":contactId}];
}
@end
