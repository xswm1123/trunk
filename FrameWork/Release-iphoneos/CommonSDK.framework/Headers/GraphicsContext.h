//
//  SimpleGraphicsContext.h
//  Common
//
//  Created by wlpiaoyi on 14-9-29.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//

#import "Common.h"

@interface GraphicsContext : NSObject
/**
 虚线、直线
 */
+(void) drawLineDash:(CGContextRef)context StartPoint:(CGPoint) startPoint EndPoint:(CGPoint) endPoint LineColor:(CGColorRef) lineColor LineWidth:(int) lineWidth  Lengths:(const CGFloat[]) lengths Count:(size_t) count;
/**
 多边形
 */
+(void) drawPolygon:(CGContextRef) context Points:(const CGPoint[]) points PointsLength:(int) pointsLength FillColor:(CGColorRef) fillColor StrokeColor:(CGColorRef) strokeColor LineWidth:(int) lineWidth;
/**
 矩形
 */
+(void) drawRectangle:(CGContextRef) context Point:(CGPoint) point FillColor:(CGColorRef) fillColor StrokeColor:(CGColorRef) strokeColor LineWidth:(int) lineWidth Width:(CGFloat) width Height:(CGFloat) height;
/**
 比例圈
 */
+(void) drawCircle:(CGContextRef) context  Point:(CGPoint) point FillColor:(CGColorRef) fillColor StrokeColor:(CGColorRef) strokeColor LineWidth:(CGFloat) lineWidth StartDegrees:(int) startDegrees EndDegrees:(int) endDegrees Radius:(int) radius;
/**
 椭圆、正圆
 */
+(void) drawEllipse:(CGContextRef) context Rect:(CGRect) rect FillColor:(CGColorRef) fillColor StrokeColor:(CGColorRef) strokeColor LineWidth:(CGFloat) lineWidth;
/**
 文字
 */
+(void) drawText:(CGContextRef) context Text:(NSString*) text Font:(UIFont*) textFont Point:(CGPoint) textPoint TextColor:(UIColor*) textColor;

+(void) drawColors:(CGContextRef) context location:(CGRect) location startColor:(UIColor*) startColor endColor:(UIColor*) endColor;
//==>将画布转换成图片
+(CGContextRef) drawImageStart:(CGRect) rect fillColor:(CGColorRef) fillcolor;
+(UIImage*) drawImgeEnd:(CGContextRef) context;
//<==
@end
