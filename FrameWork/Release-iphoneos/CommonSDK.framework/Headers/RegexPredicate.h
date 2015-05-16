//
//  RegexPredicate.h
//  Common
//
//  Created by wlpiaoyi on 14/12/31.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.===
//

#define REGEX_HOMEHONE @"^((\\d{2,4}\\-){0,1}\\d{7,9})"
#define REGEX_MOBILEPHONE @"^(\\+(\\d{2})){0,1}((13)|(14)|(15)|(18)|(17))\\d{9}$"
#define REGEX_INTEGER @"^\\d{1,}$"
#define REGEX_FLOAT @"^\\d{1,}\\.{1}\\d{1,}$"
#define REGEX_EMAIL @"^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$"


#import <Foundation/Foundation.h>

/**
 正则表达式
 */
@interface RegexPredicate : NSObject
/**
 整数
 */
+(BOOL) matchInteger:(NSString*) arg;
/**
 小数
 */
+(BOOL) matchFloat:(NSString*) arg;
/**
 手机号码
 */
+(BOOL) matchMobliePhone:(NSString*) arg;
/**
 座机号码
 */
+(BOOL) matchHomePhone:(NSString*) arg;
/**
 邮箱
 */
+(BOOL) matchEmail:(NSString*) arg;

@end
