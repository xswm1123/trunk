//
//  CustomerEntity.m
//  FDC
//
//  Created by wlpiaoyi on 15/2/6.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerEntity.h"
@implementation CustomerInfoEntity

+ (NSArray*) getJsonKeys{
    return@[@{JSON_PROPERTY:@"customerId",JSON_KEY:@"KH_KHID"},
    @{JSON_PROPERTY:@"customerNum",JSON_KEY:@"KH_KHBH"},
    @{JSON_PROPERTY:@"objectId",JSON_KEY:@"WY_WYID"},
    @{JSON_PROPERTY:@"objectName",JSON_KEY:@"WY_WYMC"},
    @{JSON_PROPERTY:@"customerName",JSON_KEY:@"KH_QRXM"},
    @{JSON_PROPERTY:@"customerPhone",JSON_KEY:@"KH_QRDH"},
    @{JSON_PROPERTY:@"customerCallShow",JSON_KEY:@"KH_LDXS"},
    @{JSON_PROPERTY:@"customerSex",JSON_KEY:@"KH_XB"},
    @{JSON_PROPERTY:@"customerName2",JSON_KEY:@"KH_KHXM"},
    @{JSON_PROPERTY:@"address",JSON_KEY:@"KH_LXDZ"},
    @{JSON_PROPERTY:@"sellerName",JSON_KEY:@"KH_XSY"},
    @{JSON_PROPERTY:@"sellerGroup",JSON_KEY:@"KH_XSZB"},
    @{JSON_PROPERTY:@"visitWay",JSON_KEY:@"KH_LFFS"},
    @{JSON_PROPERTY:@"visitDate",JSON_KEY:@"KH_LFRQ"},
            @{JSON_PROPERTY:@"mindLevel",JSON_KEY:@"KH_YXCD"},
            @{JSON_PROPERTY:@"tradeState",JSON_KEY:@"TRADESTATE"},
            @{JSON_PROPERTY:@"customerType",JSON_KEY:@"KH_KHLX"},
             @{JSON_PROPERTY:@"costomerLevel",JSON_KEY:@"KH_KHDJ"}];
}
@end

@implementation CustomerEntity
+ (NSArray*) getJsonKeys{
    
    return @[@{JSON_PROPERTY:@"customerId",JSON_KEY:@"KH_KHID"},
             @{JSON_PROPERTY:@"objectId",JSON_KEY:@"WY_WYID"},
             @{JSON_PROPERTY:@"objectName",JSON_KEY:@"WY_WYMC"},
             @{JSON_PROPERTY:@"objectSimpleName",JSON_KEY:@"WY_WYJC"},
             @{JSON_PROPERTY:@"customerName",JSON_KEY:@"KH_KHMC"},
             @{JSON_PROPERTY:@"customerPhone",JSON_KEY:@"KH_LXDH"},
             @{JSON_PROPERTY:@"address",JSON_KEY:@"KH_CYDZ"},
             @{JSON_PROPERTY:@"certificate",JSON_KEY:@"KH_ZJHM"},
             @{JSON_PROPERTY:@"customerBirthday",JSON_KEY:@"KH_KHSR"},
             @{JSON_PROPERTY:@"visitWay",JSON_KEY:@"LF_LFFS"},
             @{JSON_PROPERTY:@"customerType",JSON_KEY:@"KH_KHLX"},
             @{JSON_PROPERTY:@"customerLevel",JSON_KEY:@"KH_KHDJ"},
             @{JSON_PROPERTY:@"orderLevel",JSON_KEY:@"KH_YXCD"},
             @{JSON_PROPERTY:@"receptionPlace",JSON_KEY:@"KH_JDDD"},
             @{JSON_PROPERTY:@"nominaterId",JSON_KEY:@"TJR_KHID"},
             @{JSON_PROPERTY:@"nominaterName",JSON_KEY:@"TJR_KHMC"},
             @{JSON_PROPERTY:@"nominateObjectId",JSON_KEY:@"TJR_WYID"},
             @{JSON_PROPERTY:@"verificationerName",JSON_KEY:@"KH_KHMC"},
             @{JSON_PROPERTY:@"verificationerPhone",JSON_KEY:@"KH_KHDH"},
             @{JSON_PROPERTY:@"sex",JSON_KEY:@"KH_XB"},
             @{JSON_PROPERTY:@"summary",JSON_KEY:@"KH_BZ"},
             @{JSON_PROPERTY:@"sellerName",JSON_KEY:@"KH_XSY"},
             @{JSON_PROPERTY:@"sellerId",JSON_KEY:@"XSY_XSYID"},
             @{JSON_PROPERTY:@"sellerGroup",JSON_KEY:@"KH_XSZB"},
             @{JSON_PROPERTY:@"otherConnectionGroups",JSON_KEY:@"Linkers",JSON_PROPERTY_CLASS:[OtherConnectionerEntity class]},
             @{JSON_PROPERTY:@"questionarys",JSON_KEY:@"dcbxx",JSON_PROPERTY_CLASS:[QuestionaryEntity class]}];
}

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
@implementation QuestionaryEntity

+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"questionaryId",JSON_KEY:@"ZD_WJID"},
             @{JSON_PROPERTY:@"objectId",JSON_KEY:@"WY_WYID"},
             @{JSON_PROPERTY:@"objectName",JSON_KEY:@"WY_WYMC"},
             @{JSON_PROPERTY:@"questionaryName",JSON_KEY:@"ZD_WJMC"},
             @{JSON_PROPERTY:@"questionaryWay",JSON_KEY:@"ZD_LFFS"},
             @{JSON_PROPERTY:@"hasCompulsory",JSON_KEY:@"BT_SFBT"},
             @{JSON_PROPERTY:@"testQuestions",JSON_KEY:@"TC_WJST_ARRY",JSON_PROPERTY_CLASS:[TestQuestionEntity class]}];
}
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
@implementation TestQuestionEntity

+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"testId",JSON_KEY:@"ZD_ZDID"},
             @{JSON_PROPERTY:@"testName",JSON_KEY:@"ZD_XMMC"},
             @{JSON_PROPERTY:@"testType",JSON_KEY:@"ZD_XMLB"},
             @{JSON_PROPERTY:@"objectId",JSON_KEY:@"WY_WYID"},
             @{JSON_PROPERTY:@"questionNum",JSON_KEY:@"ZM_XH"},
             @{JSON_PROPERTY:@"isUsed",JSON_KEY:@"SFSY"},
             @{JSON_PROPERTY:@"isSelects",JSON_KEY:@"DUOXUAN"},
             @{JSON_PROPERTY:@"questionId",JSON_KEY:@"ZD_WJID"},
             @{JSON_PROPERTY:@"isCompulsory",JSON_KEY:@"ZD_ISNEED"},
             @{JSON_PROPERTY:@"answers",JSON_KEY:@"kH_KHDA",JSON_PROPERTY_CLASS:[TestAnswerEntity class]}];
}

@end


/**
 答案
 KH_KHID	客户ID
 ZD_ZDID	试题的主键
 ZM_ZMID	客户答案记录主键为空
 WY_WYID	项目ID
 ZM_XMZ 	选项的名称
 */
@implementation TestAnswerEntity

+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"customerId",JSON_KEY:@""},
             @{JSON_PROPERTY:@"testId",JSON_KEY:@""},
             @{JSON_PROPERTY:@"recordId",JSON_KEY:@""},
             @{JSON_PROPERTY:@"objectId",JSON_KEY:@""},
             @{JSON_PROPERTY:@"selecteName",JSON_KEY:@""}];
}
@end


/**
 其他联系人
 KH_KHMC	客户名称
 KH_KHDH	客户电话
 KH_ZJHM	证件号码
 */
@implementation OtherConnectionerEntity

+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"customerName",JSON_KEY:@"KH_KHMC"},
             @{JSON_PROPERTY:@"customerPhone",JSON_KEY:@"KH_KHDH"},
             @{JSON_PROPERTY:@"certificate",JSON_KEY:@"KH_ZJHM"}];
}


@end

