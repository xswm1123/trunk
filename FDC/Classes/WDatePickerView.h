//
//  WDatePickerView.h
//  FDC
//
//  Created by NewDoone on 15/1/19.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BAR_SEL_COLOR [UIColor colorWithRed:76.0f/255.0f green:172.0f/255.0f blue:239.0f/255.0f alpha:0.8]
@protocol WDatePickerViewDelegate;

@interface WDatePickerView : UIView
@property (nonatomic, weak) id <WDatePickerViewDelegate>delegate;
@property (nonatomic, strong, readonly) NSDate *selectedDate;
@end
