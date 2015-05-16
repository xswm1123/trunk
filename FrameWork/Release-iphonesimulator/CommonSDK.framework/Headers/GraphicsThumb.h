//
//  GraphicsThumb.h
//  ShiShang
//
//  Created by wlpiaoyi on 14-11-5.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//



#import "GraphicsLayer.h"

@interface GraphicsThumb : NSObject
+(GraphicsThumb*) GraphicsThumbWithView:(UIView*) view CallBackGraphicsLayerDraw:(CallBackGraphicsLayerDraw) callback;
-(void) executDisplay:(id) userInfo;
//#pragma mark - Touch Events
//- (void)moveThumbToPosition:(double)angle;
@end
