//
//  NSObject+Expand.h
//  CommonSDK
//
//  Created by wlpiaoyi on 15/1/12.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JSON_PROPERTY @"property"
#define JSON_KEY @"key"
#define JSON_PROPERTY_CLASS @"propertyClass"

@protocol ProtocolObjectJson<NSObject>
@required
+ (NSArray*) getJsonKeys;
@end

/**
 将实体转化成json格式
 */
@interface NSObject(Expand)
-(NSDictionary*) toInstanceJson;
+(instancetype) instanceWithJson:(NSDictionary*) json;
@end
