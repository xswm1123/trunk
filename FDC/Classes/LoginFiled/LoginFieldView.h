//
//  LoginFieldView.h
//  FDC
//
//  Created by wlpiaoyi on 15/1/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginFieldView : UIView
-(void) setTitle:(NSString*) title  placeholder:(NSString*) placeholder;
-(void) setFiledValue:(NSString*) filedValue;
-(void) setSecureTextEntry:(BOOL) flag;
-(NSString*) filedValue;
@end
