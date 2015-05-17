//
//  CustomerBirthdayEntity.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerBirthdayEntity.h"

@implementation CustomerBirthdayEntity

+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"customerId",JSON_KEY:@"KH_KHID"},
             @{JSON_PROPERTY:@"name",JSON_KEY:@"KH_KHXM"},
             @{JSON_PROPERTY:@"sex",JSON_KEY:@"KH_KHXB"},
             @{JSON_PROPERTY:@"age",JSON_KEY:@"KH_KHNL"},
             @{JSON_PROPERTY:@"birthDay",JSON_KEY:@"KH_KHSR"},
             @{JSON_PROPERTY:@"phoneNum",JSON_KEY:@"KH_LXDH"},
             @{JSON_PROPERTY:@"mobileNum",JSON_KEY:@"KH_MOBILE"},
             @{JSON_PROPERTY:@"sellerId",JSON_KEY:@"KH_XSYID"},
             @{JSON_PROPERTY:@"sellerName",JSON_KEY:@"KH_XSYMC"},
             @{JSON_PROPERTY:@"houseNum",JSON_KEY:@"FW_FWBH"},
             @{JSON_PROPERTY:@"buildingName",JSON_KEY:@"LZ_LZMC"},
             @{JSON_PROPERTY:@"objectId",JSON_KEY:@"WY_WYID"},
             @{JSON_PROPERTY:@"objectName",JSON_KEY:@"WY_WYMC"}];
}
@end
