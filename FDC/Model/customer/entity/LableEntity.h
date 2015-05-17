//
//  LableEntity.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
/**
 首页用的标签
 */
@interface LableEntity : NSObject <ProtocolObjectJson>
@property (nonatomic,strong) NSString *value;//标签值
@property (nonatomic,strong) NSString *name;//标签名称
@property (nonatomic,strong) NSString *memo;//备注
@property (nonatomic,strong) NSArray *subLables;//下级标签

@end
