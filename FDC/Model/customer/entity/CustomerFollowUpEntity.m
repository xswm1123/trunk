//
//  CustomerFollowUpEntity.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/31.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerFollowUpEntity.h"

@implementation CustomerFollowUpEntity

+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"customerId",JSON_KEY:@"KH_KHID"},
             @{JSON_PROPERTY:@"visteDate",JSON_KEY:@"KH_ZJLXRQ"},
             @{JSON_PROPERTY:@"customerName",JSON_KEY:@"KH_QRXM"},
             @{JSON_PROPERTY:@"planFollowUpTime",JSON_KEY:@"KH_JHGZRQ"},
             @{JSON_PROPERTY:@"seller",JSON_KEY:@"KH_XSY"},
             @{JSON_PROPERTY:@"objectId",JSON_KEY:@"WY_WYID"},
             @{JSON_PROPERTY:@"objectName",JSON_KEY:@"WY_WYMC"},
             @{JSON_PROPERTY:@"phoneNum",JSON_KEY:@"KH_QRDH"},
             @{JSON_PROPERTY:@"customerLevel",JSON_KEY:@"KH_KHDJ"},
             @{JSON_PROPERTY:@"dealStatu",JSON_KEY:@"TradeState"},
             @{JSON_PROPERTY:@"followUpType",JSON_KEY:@"KH_GZFS"}];
}



@end
