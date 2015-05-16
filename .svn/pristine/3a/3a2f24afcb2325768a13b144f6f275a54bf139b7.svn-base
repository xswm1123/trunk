//
//  VerifyIDCardNumberManagerTool.h
//  FDC
//
//  Created by NewDoone on 15/1/29.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerifyIDCardNumberManagerTool : NSObject
+ (BOOL)verifyIsNotEmpty:(NSString *)str;   //验证是否不为空

// + (BOOL)verifyText:(NSString *)text withRegex:(NSString *)regex;    //正则验证

 + (BOOL)verifyIDCardNumber:(NSString *)value; //验证身份证

// + (BOOL)verifyCardNumberWithSoldier:(NSString *)value;   //验证军官证或警官证

 + (BOOL)verifyIDCardHadAdult:(NSString *)card;  //验证身份证是否成年且小于100岁****这个方法中不做身份证校验，请确保传入的是正确身份证

// + (BOOL)verifyIDCardMoreThanPointDate:(NSString *)card withNumber:(NSInteger)number withAddTimeInterval:(NSTimeInterval)interval withDateType:(DateType)dateType; //验证身份证加上指定天数是否大于指定number的类型

// + (BOOL)verifyIDCardLessThanPointDate:(NSString *)card withNumber:(NSInteger)number withAddTimeInterval:(NSTimeInterval)interval withDateType:(DateType)dateType;  //验证身份证是否小于指定number的类型


 + (NSString *)getIDCardBirthday:(NSString *)card;   //得到身份证的生日****这个方法中不做身份证校验，请确保传入的是正确身份证
 + (NSInteger)getIDCardSex:(NSString *)card;   //得到身份证的性别（1男0女）****这个方法中不做身份证校验，请确保传入的是正确身份证

@end
