//
//  LableEntity.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "LableEntity.h"

@implementation LableEntity

+(instancetype) instanceWithJson:(NSDictionary *)json{
    LableEntity* lable = [super instanceWithJson:json];
    NSArray *subJsons = [json objectForKey:@"LstArry"];
    NSMutableArray *subLables = [NSMutableArray new];
    for (NSDictionary *subjson in subJsons) {
        LableEntity *sublable = [self instanceWithJson:subjson];
        [subLables addObject:sublable];
    }
    lable.subLables = [NSArray arrayWithArray:subLables];
    return lable;
}
-(NSDictionary*) toInstanceJson{
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super toInstanceJson]];
    NSMutableArray *subJsons = [NSMutableArray new];
    if (self.subLables&&[self.subLables count]) {
        for (LableEntity *subLable in self.subLables) {
            [subJsons addObject:[subLable toInstanceJson]];
        }
    }
    [json setObject:subJsons forKey:@"lstArry"];
    return json;
}

+ (NSArray*) getJsonKeys{
    return @[@{JSON_PROPERTY:@"value",JSON_KEY:@"ZD_ZDVAL"},
             @{JSON_PROPERTY:@"name",JSON_KEY:@"ZD_ZDMC"},
             @{JSON_PROPERTY:@"memo",JSON_KEY:@"Memo"}];
}
@end
