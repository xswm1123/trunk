//
//  FDEntityManager.h
//  Common
//
//  Created by wlpiaoyi on 15/1/13.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDObject.h"

@interface FDEntityManager : NSObject

/**
 单例 默认的数据库
 */
+(instancetype) getSingleInstance;
/**
 单例 自定义的数据库
 */
+(instancetype) getSingleInstanceWithDBName:(NSString*) dbName;

/**
  根据数据库名初始化实例
 但数据库名为空时就是默认的名称
 */
-(id) initWithDBName:(NSString *) dbName;
/**
 返回当前的数据库
 */
-(id) getDatabase;

//==> 事务管理
-(BOOL) beginTransation;
-(int) commitTarnsation;
- (BOOL)rollbackTarnsation;
//<==


/**
 执行sql语句
 */
-(int) excuSql:(NSString*) sql Params:(NSArray*) params;
/**
 根据关键字提取实体
 */
-(id<ProtocolEntity>) find:(NSNumber*)  key Clazz:(Class<ProtocolEntity>) clazz;
/**
 新增实体
  @return keyId
 */
-(int) persist:(id<ProtocolEntity>) entity;
/**
 更新实体
 */
-(id<ProtocolEntity>) merge:(id<ProtocolEntity>) entity;
/**
 删除实体
 */
-(bool) remove:(id<ProtocolEntity>) entity;
/**
 查询实体
 @resultType Dictionary
 */
-(NSArray*) queryBySql:(NSString *) sql Params:(NSArray *)params;
/**
 查询实体
 @resultType Entity
 */
-(NSArray*) queryBySql:(NSString*) sql Clazz:(Class<ProtocolEntity>) clazz Params:(NSArray*) params;
/**
 检查table sql 并生成 反射的参数
 */
+(void) checkAllTables:(NSArray*) clazzs dbName:(NSString*) dbName;

@end
