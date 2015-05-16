//
//  ReflectClass.h
//  Common
//
//  Created by wlpiaoyi on 14-5-9.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface ReflectClass : NSObject
+(bool) setPropertyValue:(id)value selName:(NSString *) selName Target:(id) target;
+(id) getPropertyValue:(NSString*) selName Target:(id) target;
+(NSArray*) getAllPropertys:(Class) clazz;

+(NSString*) getVarName:(int) index clazz:(Class) clazz;
+(Class) getVarType:(NSString*) varName clazz:(Class) clazz;

+(objc_property_t) getProperty:(NSString*) propertName Target:(id) target;
+(SEL) getPropertySEL:(NSString*) propertyName Target: (id) target;
+(SEL) getMethodSEL:(NSString*) methodName Target:(id) target;

@end
