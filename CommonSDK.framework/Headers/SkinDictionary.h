//
//  SkinDictionary.h
//  Common
//
//  Created by wlpiaoyi on 14-10-27.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SkinDictionary : NSObject
+(void) setSkinZipPath:(NSString*) path;
+(NSString*) getSkinZipPath;
+(SkinDictionary*) getSingleInstance;
-(UIColor*) getSkinColor:(NSString*) key;
-(UIImage*) getSkinImage:(NSString*) key;
-(BOOL) setSkinImageView:(UIImageView*) imageView key:(NSString*) key;
@end
