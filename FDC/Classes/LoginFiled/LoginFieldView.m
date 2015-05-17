//
//  LoginFieldView.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "LoginFieldView.h"
#import <CommonSDK/CommonSDK.h>

@implementation LoginFieldView{
@private
    UILabel *lableTitle;
    UITextField *textFieldValue;
}
-(id) init{
    if (self = [super init]) {
        [self initParam];
    }
    return self;
}
-(void) initParam{
    lableTitle = [[UILabel alloc] init];
    [lableTitle setParamTextColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 font:[UIFont systemFontOfSize:18]];
    textFieldValue = [[UITextField alloc]init];
    [textFieldValue setPlaceholder:@"请输入类容"];
    [textFieldValue setTextColor:[UIColor blackColor]];
    [textFieldValue setTextAlignment:NSTextAlignmentCenter];
    [textFieldValue setFont:[UIFont systemFontOfSize:18]];
    [textFieldValue setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textFieldValue setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self addSubview:lableTitle];
    [self addSubview:textFieldValue];
    [textFieldValue setCornerRadiusAndBorder:5 BorderWidth:0 BorderColor:nil];
    [textFieldValue setBackgroundColor:[UIColor colorWithRed:0.694 green:0.859 blue:0.937 alpha:1]];
    lableTitle.frameSize = CGSizeMake(40, DisableConstrainsValueMAX);
    [ViewAutolayoutCenter persistConstraintSize:lableTitle];
    [ViewAutolayoutCenter persistConstraintRelation:lableTitle margins:UIEdgeInsetsMake(0, 0, 0, DisableConstrainsValueMAX) toItems:nil];
    [ViewAutolayoutCenter persistConstraintRelation:textFieldValue margins:UIEdgeInsetsMake(0, 5, 0, 0) toItems:@{@"left":lableTitle}];
}

-(void) setSecureTextEntry:(BOOL) flag{
    [textFieldValue setSecureTextEntry:flag];
}

-(void) setTitle:(NSString*) title  placeholder:(NSString*) placeholder{
    if (title) {
        lableTitle.text = title;
    }
    if (placeholder) {
        textFieldValue.placeholder = placeholder;
    }
}
-(void) setFiledValue:(NSString*) filedValue{
    textFieldValue.text = filedValue;
}
-(NSString*) filedValue{
    return textFieldValue.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
