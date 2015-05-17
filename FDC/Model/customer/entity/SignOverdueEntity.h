//
//  SignOverdueEntity.h
//  FDC
//
//  Created by wlpiaoyi on 15/2/5.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
/**
 逾期签约
 FW_FWBH	房屋编号
 HT_DH	合同电话
 HT_HTID	 合同ID
 HT_JHQYRQ	合同计划签约日期
 HT_MSR	合同客户签约人名
 HT_RGRQ	合同认购日期
 HT_XSYMC	合同销售员名称
 LZ_LZMC	楼座名称
 WY_WYID	项目ID
 WY_WYMC	项目名称
 KH_KHID	客户ID
 KH_KHMC	客户名称
 KH_KHXB	客户性别
 LX_SFLX	是否已联系
 */
@interface SignOverdueEntity : NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *houseNum;
@property (nonatomic,strong) NSString *signPhone;
@property (nonatomic,strong) NSString *signPlanDate;
@property (nonatomic,strong) NSString *signCustomerName;
@property (nonatomic,strong) NSString *signSubscriptionDate;
@property (nonatomic,strong) NSString *signSellerName;
@property (nonatomic,strong) NSString *biuldName;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *objectName;
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *customerName;
@property (nonatomic,strong) NSString *customerSex;
@property (nonatomic,strong) NSString *isConnection;
@property (nonatomic,strong) NSString * contactId;
@property (nonatomic,strong) NSString * payType;
@property (nonatomic,strong) NSString * moneyCount;
@end
