//
//  AdminManager.h
//  FDC
//
//  Created by wlpiaoyi on 15/2/12.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCBaseManger.h"
/**
 管理员业务
 */
@interface AdminManager : FDCBaseManger
/**
 管理员首页信息
 */
-(void) queryManagerMainInfoWithObjectId:(NSString*) objectId UserId:(NSString*) userId startTime:(NSString*) startTime endTime:(NSString*) endTime success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 获取管理员调查表基本信息数组
 */
-(void) queryBaseQuestionaryArrayWithSuccess:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 获取调查表的试题
 */
-(void) queryTestQuestionaryArrayWithQuestionnaireId:(NSString*) questionnaireId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 根据试题ID 获取试题的各个选项分布图
 */
-(void) querySeletionPartByTestWithTestId:(NSString*) testId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 获取项目的总房源信息数组
 */
-(void) queryHouseResourcesWithSuccess:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 获取房屋销售分布图
 */
-(void) queryHouseSellDistributeWithObjectId:(NSString*) objectId type:(NSString*) type success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 获取广告费用总计-选项
 statisticsYear:统计年份
 statisticsType:统计类型
 outlayType:费用类型
 */
-(void) queryADRateTotalOutlayWithObjectId:(NSString*) objectId statisticsYear:(NSString*) statisticsYear statisticsType:(NSString*) statisticsType outlayType:(NSString*) outlayType success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;

/**
 根据选项获取月份统计数据
 statisticsYear:统计年份
 statisticsType:统计类型
 outlayType:费用类型
 */
-(void) queryADRateByMonthWithObjectId:(NSString*) objectId statisticsYear:(NSString*) statisticsYear statisticsType:(NSString*) statisticsType outlayType:(NSString*) outlayType FY_FYXX:(NSString*) FY_FYXX MX_MXYF:(NSString*)MX_MXYF success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 获取月份详情
 */
-(void) queryMontDetailWithObjectId:(NSString*) objectId year:(NSString*) year month:(NSString*) month success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 获取广告详情
 */
-(void) queryADRateDetailWithObject:(NSString*) object year:(NSString*) year type:(NSString*) type success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
/**
 算价接口
 */
-(void) querySetterCountsWithObjectId:(NSString*) objectId userId:(NSString*) userId houseId:(NSString*) houseId SYLV:(NSString*) SYLV SDJE:(NSString*) SDJE SDNX:(NSString*) SDNX GJJJE:(NSString*) GJJJE GJJNX:(NSString*) GJJNX DKLX:(NSString*) DKLX success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
//工具箱
//销售排行榜
-(void) queryRankingBySellersWithObjectId:(NSString*)objectId Year:(NSString*) year Month:(NSString*) month  success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
//获取户型图
-(void) queryHouseImagesWithObjectId:(NSString*)objectId  success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
//上传资料根据名称查询所在房屋编号
-(void) upLoadFilesWithCustomerName:(NSString*) customerName SellId:(NSString*) sellId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
//获取营销活动跟销售百科
-(void) queryMarketAndWikiWithFilesType:(NSString*) type success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
//文件上传
-(void) filesUpLoadWithBityes:(NSString*) bites CustomerId:(NSString*) customerId CustomerName:(NSString*) customerName FileName:(NSString*) fileName success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
//上传资料搜索
-(void) serachUpLoadFilesWithContactId:(NSString*) contactId success:(CallBackHttpUtilRequest) success faild:(CallBackHttpUtilRequest) faild;
@end
