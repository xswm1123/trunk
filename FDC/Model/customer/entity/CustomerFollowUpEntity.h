//
//  CustomerFollowUpEntity.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/31.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
/**
 KH_KHID	客户ID
 KH_ZJLXRQ	客户最近来访日期
 KH_QRXM	客户姓名
 KH_JHGZRQ	计划跟踪时间
 KH_XSY	销售员
 WY_WYID	项目ID
 WY_WYMC	项目名称
 KH_QRDH	联系电话
 KH_KHDJ	客户等级
 TradeState	交易状态
 KH_GZFS	跟踪方式
*/
/**
 客户跟踪信息
 */
@interface CustomerFollowUpEntity : NSObject <ProtocolObjectJson>
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *visteDate;
@property (nonatomic,strong) NSString *customerName;
@property (nonatomic,strong) NSString *planFollowUpTime;
@property (nonatomic,strong) NSString *seller;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *objectName;
@property (nonatomic,strong) NSString *phoneNum;
@property (nonatomic,strong) NSString *customerLevel;
@property (nonatomic,strong) NSString *dealStatu;
@property (nonatomic,strong) NSString *followUpType;
@end
