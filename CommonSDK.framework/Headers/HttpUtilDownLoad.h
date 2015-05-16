//
//  HttpUtilDownLoad.h
//  Common
//
//  Created by wlpiaoyi on 14-10-18.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import "HttpUtil.h"

@interface HttpUtilDownLoad : NSObject<NSURLSessionDelegate,NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate,HttpUtilDownLoadDelegate>

@end
