//
//  CustomerVerificationEntity.m
//  FDC
//
//  Created by wlpiaoyi on 15/2/10.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerVerificationEntity.h"

@implementation CustomerVerificationEntity
+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"customerId",JSON_KEY:@"KH_KHID"},
             @{JSON_PROPERTY:@"customerNum",JSON_KEY:@"KH_KHBH"},
             @{JSON_PROPERTY:@"objectId",JSON_KEY:@"WY_WYID"},
             @{JSON_PROPERTY:@"objectName",JSON_KEY:@"WY_WYMC"},
             @{JSON_PROPERTY:@"customerName",JSON_KEY:@"KH_QRXM"},
             @{JSON_PROPERTY:@"customerPhone",JSON_KEY:@"KH_QRDH"},
             @{JSON_PROPERTY:@"customerCID",JSON_KEY:@"KH_LDXS"},
             @{JSON_PROPERTY:@"customerSex",JSON_KEY:@"KH_XB"},
             @{JSON_PROPERTY:@"customerName2",JSON_KEY:@"KH_KHXM"},
             @{JSON_PROPERTY:@"connectionAddress",JSON_KEY:@"KH_LXDZ"},
             @{JSON_PROPERTY:@"sellerName",JSON_KEY:@"KH_XSY"},
             @{JSON_PROPERTY:@"sellerGroup",JSON_KEY:@"KH_XSZB"},
             @{JSON_PROPERTY:@"customerVisitWay",JSON_KEY:@"KH_LFFS"},
             @{JSON_PROPERTY:@"customerVisitDate",JSON_KEY:@"KH_LFRQ"},
             @{JSON_PROPERTY:@"customerLevel",JSON_KEY:@"KH_KHDJ"}];
}

@end
