//
//  NSString+Convenience.h
//  AKSL-189-Msp
//
//  Created by qqpiaoyi on 13-11-12.
//  Copyright (c) 2013年 AKSL. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (Expand)
-(NSString *)filterHTML;
/**
 将字符串转换成日期
 */
-(NSDate*) dateFormateString:(NSString*) formatePattern;
/**
 当前字符串是否是以suffix结尾
 */
-(bool) stringEndWith:(NSString*) suffix;
/**
 当前字符串是否是以suffix开头
 */
-(bool) stringStartWith:(NSString*) suffix;
/**
 当前字符串对应字符最后出现的位置
 */
-(int) intLastIndexOf:(char) suffix;
/**
 当前字符串对应字符出现的位置
 */
-(int) intIndexOf:(int) index Suffix: (char) suffix;
-(NSString*) replaceAll:(NSString*) target Replcement:(NSString*) replcement;
/**
 判断字符串是否有效 "",nil,NO,NSNull
 */
+(bool) isEnabled:(id) target;
/**
 将Data转换成64位对应的字符串
 */
+(NSString*) base64forData:(NSData*)theData;
@end
