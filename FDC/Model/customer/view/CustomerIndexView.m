//
//  CustomerIndexView.m
//  FDC
//
//  Created by NewDoone on 15/1/21.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerIndexView.h"

@implementation CustomerIndexView


-(void)setFirstName:(NSString *)firstName SecondName:(NSString *)secondName ThirdName:(NSString *)thirdName ForthName:(NSString *)forthName AndFirstValue:(NSString *)firstValue SecondValue:(NSString *)secondValue ThirdValue:(NSString *)thirdValue ForthValue:(NSString *)forthValue{
    self.lb_firstName.text=firstName;
    self.lb_secondName.text=secondName;
    self.lb_thirdName.text=thirdName;
    self.lb_forthName.text=forthName;
    self.lb_firstValue.text=firstValue;
    self.lb_secondValue.text=secondValue;
    self.lb_thirdValue.text=thirdValue;
    self.lb_forthValue.text=forthValue;
}
-(void)drawRect:(CGRect)rect{
//    self.backgroundColor=[UIColor grayColor];
//    CGRect frame=CGRectZero;
//    frame.size=CGSizeMake(304, 150);
//    self.frame=frame;
    UIView* btnView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 304, 55)];
    btnView.backgroundColor=[UIColor colorWithRed:191/255.0 green:224/255.0 blue:239/255.0 alpha:1.0];
    UIButton* weekBtn=[[UIButton alloc]initWithFrame:CGRectMake(9, 8, 50, 40)];
    weekBtn.backgroundColor=[UIColor colorWithRed:247/255.0 green:207/255.0 blue:45/255.0 alpha:1.0];
    [weekBtn setTitle:@"本周" forState:UIControlStateNormal];
    
    [btnView addSubview:weekBtn];
    UIButton* customerBtn=[[UIButton alloc]initWithFrame:CGRectMake(69, 8, 50, 40)];
    customerBtn.backgroundColor=[UIColor colorWithRed:247/255.0 green:207/255.0 blue:45/255.0 alpha:1.0];
    [customerBtn setTitle:@"自定义" forState:UIControlStateNormal];
    [btnView addSubview:customerBtn];
    self.lb_fromDate=[[UILabel alloc]initWithFrame:CGRectMake(133, 18, 80, 21)];
    self.lb_fromDate.font=[UIFont systemFontOfSize:14.0];
    [btnView addSubview:self.lb_fromDate];
    self.lb_toDate=[[UILabel alloc]initWithFrame:CGRectMake(224, 18, 80, 21)];
    self.lb_toDate.font=[UIFont systemFontOfSize:14.0];
    [btnView addSubview:self.lb_toDate];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(210, 18, 10, 21)];
    label.font=[UIFont systemFontOfSize:14.0];
    label.text=@"-";
    [btnView addSubview:label];
    [self addSubview:btnView];
    //optionsLabels
    UIImageView* iv1=[[UIImageView alloc]initWithFrame:CGRectMake(20, 75, 26, 26)];
    iv1.image=[UIImage imageNamed:@"image_blue_circle.png"];
    UIImageView* iv2=[[UIImageView alloc]initWithFrame:CGRectMake(152, 75, 26, 26)];
    iv2.image=[UIImage imageNamed:@"image_blue_circle.png"];
    UIImageView* iv3=[[UIImageView alloc]initWithFrame:CGRectMake(20, 116, 26, 26)];
    iv3.image=[UIImage imageNamed:@"image_blue_circle.png"];
    UIImageView* iv4=[[UIImageView alloc]initWithFrame:CGRectMake(152, 116, 26, 26)];
    iv4.image=[UIImage imageNamed:@"image_blue_circle.png"];
    [self addSubview:iv1];
    [self addSubview:iv2];
    [self addSubview:iv3];
    [self addSubview:iv4];
    self.lb_firstName=[[UILabel alloc]initWithFrame:CGRectMake(46, 75, 70, 21)];
    self.lb_secondName=[[UILabel alloc]initWithFrame:CGRectMake(178, 75, 70, 21)];
    self.lb_thirdName=[[UILabel alloc]initWithFrame:CGRectMake(46, 116, 70, 21)];
    self.lb_forthName=[[UILabel alloc]initWithFrame:CGRectMake(178, 116, 70, 21)];
    [self addSubview:self.lb_firstName];
    [self addSubview:self.lb_secondName];
    [self addSubview:self.lb_thirdName];
    [self addSubview:self.lb_forthName];
    self.lb_firstValue=[[UILabel alloc]initWithFrame:CGRectMake(116, 75, 36, 21)];
    self.lb_secondValue=[[UILabel alloc]initWithFrame:CGRectMake(248, 75, 36, 21)];
    self.lb_thirdValue=[[UILabel alloc]initWithFrame:CGRectMake(116, 116, 36, 21)];
    self.lb_forthValue=[[UILabel alloc]initWithFrame:CGRectMake(248, 116, 36, 21)];
    [self addSubview:self.lb_firstValue];
    [self addSubview:self.lb_secondValue];
    [self addSubview:self.lb_thirdValue];
    [self addSubview:self.lb_forthValue];
    
    
}

@end
