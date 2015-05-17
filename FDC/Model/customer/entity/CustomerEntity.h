//
//  CustomerEntity.h
//  FDC
//
//  Created by wlpiaoyi on 15/2/6.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
/**
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
@interface CustomerInfoEntity:NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *customerNum;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *objectName;
@property (nonatomic,strong) NSString *customerName;
@property (nonatomic,strong) NSString *customerPhone;
@property (nonatomic,strong) NSString *customerCallShow;
@property (nonatomic,strong) NSString *customerSex;
@property (nonatomic,strong) NSString *customerName2;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *sellerName;
@property (nonatomic,strong) NSString *sellerGroup;
@property (nonatomic,strong) NSString *visitWay;
@property (nonatomic,strong) NSString *visitDate;
@property (nonatomic,strong) NSString *costomerLevel;
@property (nonatomic,strong) NSString * mindLevel;
@property (nonatomic,strong) NSString * tradeState;
@property (nonatomic,strong) NSString * customerType;
@end

/**
 客户信息
 KH_KHID	客户ID
 WY_WYID	项目ID
 WY_WYMC	项目名称
 WY_WYJC	项目简称
 KH_KHMC	客户名称
 KH_LXDH	客户电话
 KH_CYDZ	常用地址
 KH_ZJHM	证件号码
 KH_KHSR	客户生日
 LF_LFFS	来访方式
 KH_KHLX	客户类型
 KH_KHDJ	客户等级
 KH_YXCD	意向程度
 KH_JDDD	客户接待地点
 TJR_KHID	推荐人ID
 TJR_KHMC	推荐人名称
 TJR_WYID	推荐项目ID
 KH_KHMC	验证的客户名称
 KH_KHDH	验证的客户电话
 
 Linkers	其他联系人数组
 dcbxx	调查表JSON字符串
 */
@interface CustomerEntity : NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *objectName;
@property (nonatomic,strong) NSString *objectSimpleName;
@property (nonatomic,strong) NSString *customerName;
@property (nonatomic,strong) NSString *customerPhone;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *certificate;
@property (nonatomic,strong) NSString *customerBirthday;
@property (nonatomic,strong) NSString *visitWay;
@property (nonatomic,strong) NSString *customerType;
@property (nonatomic,strong) NSString *customerLevel;
@property (nonatomic,strong) NSString *orderLevel;
@property (nonatomic,strong) NSString *receptionPlace;
@property (nonatomic,strong) NSString *nominaterId;
@property (nonatomic,strong) NSString *nominaterName;
@property (nonatomic,strong) NSString *nominateObjectId;
@property (nonatomic,strong) NSString *verificationerName;
@property (nonatomic,strong) NSString *verificationerPhone;
@property (nonatomic,strong) NSArray *otherConnectionGroups;
@property (nonatomic,strong) NSArray *questionarys;
@property (nonatomic,strong) NSString* sex;
@property (nonatomic,strong) NSString* summary;
@property (nonatomic,strong) NSString* sellerName;
@property (nonatomic,strong) NSString* sellerId;
@property (nonatomic,strong) NSString* sellerGroup;
@end
/**
 调查表
 ZD_WJID	调查表问卷ID
 WY_WYID	项目ID
 WY_WYMC	项目名称
 ZD_WJMC	问卷名称
 ZD_LFFS	来电/来访
 BT_SFBT	是否有必填项
 TC_WJST_ARRY	试题JSON数组
 */
@interface QuestionaryEntity : NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *questionaryId;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *objectName;
@property (nonatomic,strong) NSString *questionaryName;
@property (nonatomic,strong) NSString *questionaryWay;
@property (nonatomic,strong) NSString *hasCompulsory;
@property (nonatomic,strong) NSArray *testQuestions;
@end
/**
 试题
 ZD_ZDID	试题ID
 ZD_XMMC	试题名称
 ZD_XMLB	问卷类别（客户自定义调查表）
 WY_WYID	项目ID
 ZM_XH	题序号
 SFSY	是否使用
 DUOXUAN	是否多选
 ZD_WJID	问卷ID
 ZD_ISNEED	是否必填
 ST_ARRY	试题数组可以为空数组[]
 kH_KHDA	客户答案JSON数组
 */
@interface TestQuestionEntity : NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *testId;
@property (nonatomic,strong) NSString *testName;
@property (nonatomic,strong) NSString *testType;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *questionNum;
@property (nonatomic,strong) NSString *isUsed;
@property (nonatomic,strong) NSString *isSelects;
@property (nonatomic,strong) NSString *questionId;
@property (nonatomic,strong) NSString *isCompulsory;
@property (nonatomic,strong) NSArray *tests;
@property (nonatomic,strong) NSArray *answers;
@end

/**
 答案
 KH_KHID	客户ID
 ZD_ZDID	试题的主键
 ZM_ZMID	客户答案记录主键为空
 WY_WYID	项目ID
 ZM_XMZ 	选项的名称
 */
@interface TestAnswerEntity : NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *testId;
@property (nonatomic,strong) NSString *recordId;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *selecteName;
@end



/**
 其他联系人
 KH_KHMC	客户名称
 KH_KHDH	客户电话
 KH_ZJHM	证件号码
 */
@interface OtherConnectionerEntity : NSObject<ProtocolObjectJson>
@property (nonatomic,strong) NSString *customerName;
@property (nonatomic,strong) NSString *customerPhone;
@property (nonatomic,strong) NSString *certificate;
@end
