//
//  ViewAutolayoutCenter.h
//  Common
//
//  Created by wlpiaoyi on 15/1/5.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#define  DisableConstrainsValueMAX  CGFLOAT_MAX/2
#define  DisableConstrainsValueMIN  -DisableConstrainsValueMAX

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewAutolayoutCenter : NSObject
/**
 删除相关的约束
 */
+(void) removeConstraints:(UIView*) subView;
/**
 新增关系约束
 */
+(void) persistConstraintRelation:(UIView*) subView margins:(UIEdgeInsets) margins toItems:(NSDictionary*) toItems;
/**
 新增大小约束
 */
+(void) persistConstraintSize:(UIView*) subView;
/*
 新增布局约束
 */
+(void) persistConstraintCenter:(UIView*) subView;
@end
