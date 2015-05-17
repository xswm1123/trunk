//
//  WDatePickerView.m
//  FDC
//
//  Created by NewDoone on 15/1/19.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "WDatePickerView.h"
@interface WDatePickerView ()
@property (nonatomic, strong) UILabel *lblWeekDay;
@property (nonatomic, strong) UIButton *btPrev;
@property (nonatomic, strong) UIButton *btNext;

@end


@implementation WDatePickerView

-(void)drawRect:(CGRect)rect{
    
    [self  configControl];
}
-(void)configControl{
    _lblWeekDay = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 100.0, 30.0)];
    //[_lblWeekDay setBackgroundColor:[UIColor redColor]];
    [_lblWeekDay setText:@"2015"];
    [_lblWeekDay setTextAlignment:NSTextAlignmentCenter];
    [_lblWeekDay setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
    [_lblWeekDay setTextColor:BAR_SEL_COLOR];
    [self addSubview:_lblWeekDay];
    
    //Create arrow next/previous
    _btPrev = [[UIButton alloc] initWithFrame:CGRectMake(4, _lblWeekDay.frame.origin.y+_lblWeekDay.frame.size.height/2-10, 20.0, 20.0)];
    [_btPrev setImage:[UIImage imageNamed:@"right_arrow_blue.png"] forState:UIControlStateNormal];
    _btPrev.contentMode = UIViewContentModeCenter;
    [_btPrev setTitleColor:BAR_SEL_COLOR forState:UIControlStateNormal];
    [_btPrev addTarget:self action:@selector(switchToDayPrev) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btPrev];
    
    _btNext = [[UIButton alloc] initWithFrame:CGRectMake(140.0, _lblWeekDay.frame.origin.y+_lblWeekDay.frame.size.height/2-10, 20.0, 20.0)];
    [_btNext setImage:[UIImage imageNamed:@"right_arrow_blue.png"] forState:UIControlStateNormal];
    _btNext.contentMode = UIViewContentModeCenter;
    [_btNext setTitleColor:BAR_SEL_COLOR forState:UIControlStateNormal];
    [_btNext addTarget:self action:@selector(switchToDayNext) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btNext];

}
- (void)switchToDayPrev {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [NSDateComponents new];
    
    //Set the offset
    [offsetComponents setYear:-1];
    NSDate *newDate = [gregorian dateByAddingComponents:offsetComponents toDate:[NSDate date] options:0];
    
//    //If newDate is in the past
//    if([newDate compare:[NSDate date]] == NSOrderedAscending) {
//        //Disable button previus day
//        [_btPrev setEnabled:NO];
//    }
    
    [self switchToDay:-1];
}
- (void)switchToDayNext {
    if(![_btPrev isEnabled]) [_btPrev setEnabled:YES];
    
    [self switchToDay:1];
}
- (void)switchToDay:(NSInteger)dayOffset {
    //Calculate and save the new date
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [NSDateComponents new];
    
    //Set the offset
    [offsetComponents setYear:dayOffset];
    
    NSDate *newDate = [gregorian dateByAddingComponents:offsetComponents toDate:[NSDate new] options:0];
    _selectedDate = newDate;
    [_lblWeekDay setText:[self stringFromDate:newDate withFormat:@"yyyy"]];
}
- (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:format];
    
    return [formatter stringFromDate:date];
}

@end
