//
//  MyDatePicker.h
//  FDC
//
//  Created by NewDoone on 15/4/12.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyDatepickerDelegate <NSObject>

@optional

-(void)valuechange:(NSDate *)mydate;

@end

@interface MyDatePicker : UIControl<UIPickerViewDelegate,UIPickerViewDataSource>
{
    
    UIPickerView *kengdiepicker;
    
    // UIDatePicker *kengdiepicker;
    
    NSDate *minimumDate,*maximumDate;
    
    NSDate *date;
    
    NSArray *month;
    
    NSMutableArray *year;
    
    int thismonth,thisyear;
    
//    id<MyDatepickerDelegate> delegate;//设置委托变量
    
    // UIDatePicker *picker;
    
}
@property(nonatomic, retain) UIPickerView *kengdiepicker;

//@property(nonatomic, retain) UIDatePicker *kengdiepicker;

@property(nonatomic, retain) NSDate *minimumDate;

@property(nonatomic, retain) NSDate *maximumDate;

@property(nonatomic, retain) NSDate *date;

@property(nonatomic, retain) NSArray *month;

@property(nonatomic, retain) NSMutableArray *year;

@property(nonatomic, weak)id<MyDatepickerDelegate> delegate;

-(id)MyInit;

-(void)setdate:(NSDate *)mydate;
@end
