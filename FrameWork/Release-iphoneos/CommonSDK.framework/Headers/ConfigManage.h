//
//  ConfigManage.h
//  sunsharp_epub
//
//  Created by wlpiaoyi on 14-6-29.
//  Copyright (c) 2014年 sunsharp. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface ConfigManage : NSObject
+(void) setConfigValue:(id) value Key:(NSString*) key;
+(id) getConfigValue:(NSString*) key;
+(void) removeConfigValue:(NSString*) key;
+(void) removeALL;
@end
