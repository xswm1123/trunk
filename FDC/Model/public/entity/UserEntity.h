//
//  UserEntity.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/16.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
@interface UserEntity : NSObject<ProtocolEntity,ProtocolObjectJson>
@property (nonatomic,strong) NSNumber *keyId;
@property (nonatomic,strong) NSString *logInfo;//用户的权限信息（如果值为false则登录失败）
@property (nonatomic,strong) NSString *sellGroup;//销售组
@property (nonatomic,strong) NSString *businessSimpleName;//物业简称
@property (nonatomic,strong) NSNumber *sellerId;//销售员ID
@property (nonatomic,strong) NSNumber *sellerNumber;//销售员编号
@property (nonatomic,strong) NSNumber *sellerSex;//销售员性别
@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *password;//用户密码
@property (nonatomic,strong) NSString *objectId;//项目ID
@property (nonatomic,strong) NSString *objectName;//默认项目名称
@property (nonatomic,strong) NSString *authority;//权限
@property (nonatomic,strong) NSArray *authorityInfoObjectGroup;//权限项目信息数组
@property (nonatomic,strong) NSString *logo;//图片路径
@property(nonatomic,strong) NSString * sellerName;
@end
