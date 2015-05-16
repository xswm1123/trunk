//
//  GraphicsLayer.h
//  ShiShang
//
//  Created by wlpiaoyi on 14-11-5.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^CallBackGraphicsLayerDraw)(CGContextRef ctx,id userInfo);

@interface GraphicsLayer : CALayer
@property (nonatomic,strong) id userInfo;
-(void) setCallBackGraphicsLayerDraw:(CallBackGraphicsLayerDraw)callback;
@end
