//
//  UIView+convenience.h
//
//  Created by Tjeerd in 't Veen on 12/1/11.
//  Copyright (c) 2011 Vurig Media. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (Expand)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

// Setting these modifies the origin but not the size.
@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

-(CGPoint) getAbsoluteOrigin:(UIView*) superView;
-(BOOL) containsSubView:(UIView *)subView;
-(BOOL) containsSubViewOfClassType:(Class)clazz;
-(UITapGestureRecognizer*) addTarget:(id) target action:(SEL)action;

-(void)setCornerRadiusAndBorder:(CGFloat)radius BorderWidth:(CGFloat)width BorderColor:(UIColor *)color;
-(void) setShadowRadiusAndOffset:(CGFloat)radius shadowOpacity:(float) shadowOpacity shadowPath:(CGPathRef) shadowPath shadowColor:(CGColorRef)shadowColor;
-(UIImage*) drawView;


-(void) autoresizingMask_TB;
-(void) autoresizingMask_TLR;
-(void) autoresizingMask_TBLRH;
-(void) autoresizingMask_BW;
-(void) autoresizingMask_BLR;
-(void) autoresizingMask_TLRW;
-(void) autoresizingMask_TBLRWH;
-(void) autoresizingMask_TBRWH;
-(void) autoresizingMask_TBLH;
-(void) autoresizingMask_TBL;
-(void) autoresizingMask_TBH;
-(void) autoresizingMask_TBRH;
-(void) autoresizingMask_TBR;
-(void) autoresizingMask_LB;
-(void) autoresizingMask_LR;
-(void) autoresizingMask_BLRW;

@end
