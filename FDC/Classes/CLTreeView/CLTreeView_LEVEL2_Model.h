//
//  CLTreeView_LEVEL2_Model.h
//  CLTreeView
//
//  Created by 钟由 on 14-9-9.
//  Copyright (c) 2014年 flywarrior24@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLTreeView_LEVEL2_Model : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *signture;
@property (strong,nonatomic) NSString *headImgPath;//本地图片名,若不为空则优先于远程图片加载
@property (strong,nonatomic) NSURL *headImgUrl;//远程图片链接
//=======
@property (strong, nonatomic)  NSString *dateFrom;
@property (strong, nonatomic)  NSString *dateTo;
@property (strong, nonatomic)  NSString *firstLb;
@property (strong, nonatomic)  NSString *secondLb;
@property (strong, nonatomic)  NSString *thirdLb;
@property (strong, nonatomic)  NSString *forthLb;
@property (strong, nonatomic)  NSString *firstLbCount;
@property (strong, nonatomic)  NSString *secondLbCount;
@property (strong, nonatomic)  NSString *thirdLbCount;
@property (strong, nonatomic)  NSString *forthLbCount;
@end


