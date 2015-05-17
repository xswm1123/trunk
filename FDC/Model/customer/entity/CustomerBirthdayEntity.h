//
//  CustomerBirthdayEntity.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
/**
 k客户生日信息
 KH_KHID	客户ID
 KH_KHXM	客户姓名
 KH_KHXB	客户性别
 KH_KHNL	客户年龄
 KH_LXDH	客户联系电话
 KH_MOBILE	客户移动电话
 KH_XSYID	销售员ID
 KH_XSYMC	销售员名称
 FW_FWBH	房屋编号
 LZ_LZMC	楼座名称
 WY_WYID	项目ID
 WY_WYMC	项目名称
 KH_KHSR	客户生日
 */
@interface CustomerBirthdayEntity : NSObject <ProtocolObjectJson>
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *sex;
@property (nonatomic,strong) NSString *age;
@property (nonatomic,strong) NSString *birthDay;
@property (nonatomic,strong) NSString *phoneNum;
@property (nonatomic,strong) NSString *mobileNum;
@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *sellerName;
@property (nonatomic,strong) NSString *houseNum;
@property (nonatomic,strong) NSString *buildingName;
@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *objectName;
@end
