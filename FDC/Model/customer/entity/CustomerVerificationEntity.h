//
//  CustomerVerificationEntity.h
//  FDC
//
//  Created by wlpiaoyi on 15/2/10.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>

/**
 客户验证信息
 KH_KHID	【必须】	客户ID
 KH_KHBH		客户编号
 WY_WYID		项目ID
 WY_WYMC		项目名称
 KH_QRXM		客户姓名
 KH_QRDH		客户电话
 KH_LDXS		客户来电显示
 KH_XB		客户性别
 KH_KHXM		客户姓名
 KH_LXDZ		联系地址
 KH_XSY		接待的销售员名称
 KH_XSZB		销售员所在组别
 KH_LFFS		客户来访方式
 KH_LFRQ		客户来访日期
 KH_KHDJ		客户等级
 */
@interface CustomerVerificationEntity : NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *customerNum;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *objectName;
@property (nonatomic,strong) NSString *customerName;
@property (nonatomic,strong) NSString *customerPhone;
@property (nonatomic,strong) NSString *customerCID;
@property (nonatomic,strong) NSString *customerSex;
@property (nonatomic,strong) NSString *customerName2;
@property (nonatomic,strong) NSString *connectionAddress;
@property (nonatomic,strong) NSString *sellerName;
@property (nonatomic,strong) NSString *sellerGroup;
@property (nonatomic,strong) NSString *customerVisitWay;
@property (nonatomic,strong) NSString *customerVisitDate;
@property (nonatomic,strong) NSString *customerLevel;


@end
