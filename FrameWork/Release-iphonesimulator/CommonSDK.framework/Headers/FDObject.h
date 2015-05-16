//
//  FDObject.h
//  sdf
//
//  Created by wlpiaoyi on 14-3-25.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//

#define EM_MAP_ENTITY_TABLE @"ENITYTABLE"
#define EM_MAP_ENTITY_ENTITY @"ENITYENTITY"
#define EM_MAP_ENTITY_KEY @"ENITYKEY"
#define EM_MAP_ENTITY_COLUM @"ENITYCOLUM"
#define EM_MAP_ENTITY_COLUM_NAME @"ENTITYCOLUMNAME"
#define EM_MAP_ENTITY_COLUM_PROPERTY @"ENITYCOLUMPROPETY"
#define EM_MAP_ENTITY_COLUM_TYPE @"ENITYCOLUMTYPE"
#define EM_MAP_ENTITY_COLUM_RULE @"ENITYCOLUMRULE"

#import <Foundation/Foundation.h>

@protocol ProtocolEntity<NSObject>
@required
+ (NSArray*) getColums;
+ (NSString*) getKey;
+ (NSString*) getTable;
@end

typedef enum{
    DEFAULT,
    INTEGER,
    REAL,
    TEXT,
    BLOB
} Enum_EntityType;
@interface FDObject : NSObject
+(NSString*) getTableStructByTableName:(NSString*) tableName;
+(Enum_EntityType) getEnumEnity:(Class) entity typeName:(NSString*) name;
+(NSString*) getCreateSqlByEntity:(Class<ProtocolEntity>) entity;
+(NSString*) getInsertSqlByEnity:(Class<ProtocolEntity>) entity colums:(NSArray*) colums;
+(NSString*) getInsertSqlByEnity:(Class<ProtocolEntity>) entity;
+(NSString*) getUpdateSqlByEnity:(Class<ProtocolEntity>) entity;
+(NSString*) getFindeSqlByEnity:(Class<ProtocolEntity>) entity;
+(NSString*) getDeleteSqlByEnity:(Class<ProtocolEntity>) entity;
+(NSString*) getInsertSqlByEnityImpl:(id<ProtocolEntity>) entity;
+(NSString*) getAddColumSqlByEnity:(Class<ProtocolEntity>) entity addColum:(NSString*) addColum;
@end

