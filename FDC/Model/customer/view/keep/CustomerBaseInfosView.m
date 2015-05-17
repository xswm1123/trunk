//
//  CustomerBaseInfosView.m
//  FDC
//
//  Created by wlpiaoyi on 15/3/10.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerBaseInfosView.h"

@implementation CustomerBaseInfosView{
    NSMutableArray *arraySubview;
}
-(id) init{
    if(self = [super init]){
        arraySubview = [NSMutableArray new];
        _lableName = [self createLableName];
        _lableName.text = @"标题";
        [self addDicView:1];
        [self addSubview:_lableName];
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        arraySubview = [NSMutableArray new];
        _lableName = [self createLableName];
        _lableName.text = @"标题";
        [self addDicView:1];
        [self addSubview:_lableName];
        [self setCornerRadiusAndBorder:1 BorderWidth:1 BorderColor:[UIColor whiteColor]];
    }
    return self;
}

-(void) onclickAddView:(id) sender{
    @synchronized(self){
        [self addDicView:0];
    }
}
-(void) onclickRemoveView:(id) sender{
    @synchronized(self){
        [self removeDicView:sender];
    }
}
-(UILabel*) createLableName{
    UILabel *l = [UILabel new];
    [l setParamTextColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight numberOfLines:1 font:[UIFont systemFontOfSize:18]];
    return l;
}

-(UIButton*) createButton:(int) type{
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.backgroundColor = [UIColor clearColor];
    switch (type) {
        case 1:{
            [b setImage:[UIImage imageNamed:@"button_add.png"] forState:UIControlStateNormal];
            [b addTarget:self action:@selector(onclickAddView:)];
        }
            break;
            
        default:{
            [b setImage:[UIImage imageNamed:@"button_minus.png"] forState:UIControlStateNormal];
            [b addTarget:self action:@selector(onclickRemoveView:)];
        }
            break;
    }
    [b setContentMode:UIViewContentModeScaleAspectFit];
    return b;
}
-(UITextField*) crectTextField{
    UITextField *tf = [UITextField new];
    tf.textColor = [UIColor blackColor];
    tf.textAlignment = NSTextAlignmentLeft;
    tf.backgroundColor = [UIColor whiteColor];
    [tf setCornerRadiusAndBorder:5 BorderWidth:1 BorderColor:[UIColor colorWithHexString:@"00000044"]];
    [tf setPlaceholder:@"请输入类容"];
    return tf;
}
-(NSArray*) arrayTextFields{
    NSMutableArray *array = [NSMutableArray new];
    for (NSDictionary *dic in arraySubview) {
        UITextField *tf = [dic objectForKey:@"textField"];
        if(tf == nil){
            break;
        }
        [array addObject:array];
    }
    return [NSArray arrayWithArray:array];
}

-(void) addDicView:(int) type{
    UITextField *tf = [self crectTextField];
    UIButton *b = [self createButton:type];
    [arraySubview addObject:@{@"button":b,@"textField":tf}];
    [self addSubview:tf];
    [self addSubview:b];
    self.frameHeight = [self checkViewAndReturnHeight];
}
-(void) removeDicView:(UIButton*) button{
    for (NSDictionary *dic in arraySubview) {
        UIButton *b = [dic objectForKey:@"button"];
        UITextField *tf = [dic objectForKey:@"textField"];
        if(b==button){
            [b removeFromSuperview];
            [tf removeFromSuperview];
            [arraySubview removeObject:dic];
            self.frameHeight = [self checkViewAndReturnHeight];
            break;
        }
    }
}

-(void) layoutSubviews{
    [super layoutSubviews];
    self.frameHeight = [self checkViewAndReturnHeight];
}
-(float) checkViewAndReturnHeight{
    _lableName.frameSize = CGSizeMake(60, 35);
    _lableName.frameOrigin = CGPointMake(0, 0);
    
    unsigned offx = 5;
    float height = 0;
    
    if(self.frameWidth - _lableName.frameWidth - offx<=0){
        self.frameWidth = _lableName.frameWidth + offx*4;
    }
    unsigned int index = 0;
    for (NSDictionary *dic in arraySubview) {
        UIButton* b = (UIButton*)[dic objectForKey:@"button"];
        UITextField* tf = (UITextField*)[dic objectForKey:@"textField"];
        if(b == nil && tf == nil){
            break;
        }
        
        b.frameSize = CGSizeMake(40, 40);
        b.frameY = b.frameHeight*index;
        b.frameX = self.frameWidth - b.frameWidth;
        
        tf.frameX = _lableName.frameX+_lableName.frameWidth+offx;
        if(tf.frameX <= 0){
            break;
        }
        tf.frameWidth = self.frameWidth-tf.frameX-b.frameWidth - offx*2;
        if(tf.frameWidth <= 0){
            break;
        }
        tf.frameY = b.frameY+5;
        tf.frameHeight = b.frameHeight-10;
        
        height = b.frameY+b.frameHeight;
        
        
        index++;
    }
    return height;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
