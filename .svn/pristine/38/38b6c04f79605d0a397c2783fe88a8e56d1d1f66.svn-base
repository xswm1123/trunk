//
//  ObserverListner.h
//  ShiShang
//
//  Created by wlpiaoyi on 14/12/19.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ObserverListner : NSObject
+(instancetype) getNewInstance;
@property (nonatomic,assign) id valueListner;
-(BOOL) mergeWithTarget:(id) target action:(SEL) action arguments:(NSArray*) arguments key:(NSString*) key;
-(void) removeWithKey:(NSString*) key;
@end
