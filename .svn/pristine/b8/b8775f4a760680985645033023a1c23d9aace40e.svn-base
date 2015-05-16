//
//  MyDatePicker.m
//  FDC
//
//  Created by NewDoone on 15/4/12.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "MyDatePicker.h"

@implementation MyDatePicker
@synthesize kengdiepicker;

@synthesize minimumDate;

@synthesize maximumDate;

@synthesize date;

@synthesize month;

@synthesize year;

@synthesize delegate;
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if(component==0){
        
        return [self.month count];
        
    }
    
    if(component==1){
        
        return [self.year count];
        
    }else{
        
        return 0;
        
    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSDateFormatter *timeformatter=[[NSDateFormatter alloc]init];
    
    [timeformatter setDateFormat:@"yyyy"];
    
    int minyear=[[timeformatter stringFromDate:self.minimumDate]intValue]-1950;
    
    int maxyear=[[timeformatter stringFromDate:self.maximumDate]intValue]-1950;
    
    [timeformatter setDateFormat:@"MM"];
    
    int thisyears=[[timeformatter stringFromDate:self.date]intValue]-1950;
    
    int minmonth=[[timeformatter stringFromDate:self.minimumDate]intValue];
    
    int maxmonth=[[timeformatter stringFromDate:self.maximumDate]intValue];
    
    // if(minyear<=thisyear<=maxyear){
    
    if(component==1){
        
        thisyear=row;
        
        if(thisyears>maxyear||thisyears<minyear){
            
            if(thisyear>maxyear){
                
                self.date=self.maximumDate;
                
                //月份颜色
                
                for(int i=0;i<12;i++){
                    
                    if(maxmonth>i){
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }else{
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }
                    
                }
                
                //年颜色
                
                for(int i=0;i<100;i++){
                    
                    if(i>maxyear){
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }else{
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }
                    
                }
                
            }else if(thisyear<minyear){
                
                self.date=self.minimumDate;
                
                for(int i=0;i<12;i++){
                    
                    if(minmonth-2<i){
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }else{
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }
                    
                }
                
                for(int i=0;i<100;i++){
                    
                    if(i<minyear){
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }else{
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }
                    
                }
                
            }
            
        }
        
        if(minyear<thisyear&&thisyear<maxyear){
            
            for(int i=0;i<12;i++){
                
                UILabel *label=[self.month objectAtIndex:i];
                
                label.textColor=[UIColor darkTextColor];
                
            }
            
            for(int i=0;i<100;i++){
                
                if(i<minyear||i>maxyear){
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }else{
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }
                
            }
            
        }
        
        if(minyear==thisyear){
            
            for(int i=0;i<12;i++){
                
                if(minmonth-2<i){
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }else{
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }
                
            }
            
            for(int i=0;i<100;i++){
                
                if(i<minyear||i>maxyear){
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }else{
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }
                
            }
            
        }
        
        if(maxyear==thisyear){
            
            for(int i=0;i<12;i++){
                
                if(maxmonth>i){
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }else{
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }
                
            }
            
            for(int i=0;i<100;i++){
                
                if(i<minyear||i>maxyear){
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }else{
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }
                
            }
            
        }
        
    }
    
    if(component==0){
        
        thismonth=row+1;
        
    }
    
    //   }
    
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    
    [dateformatter setDateFormat:@"yyyy-MM"];
    
    NSString *time=[[NSString alloc]init];
    
    time=[NSString stringWithFormat:@"%d-%d",thisyear+1950,thismonth];
    
    self.date=[dateformatter dateFromString:time];
    
    [self.delegate valuechange:self.date];
    
    [self.kengdiepicker reloadInputViews];
    
}

-(void)willMoveToWindow:(UIWindow *)newWindow{
    
    NSDateFormatter *timeformatter=[[NSDateFormatter alloc]init];
    
    [timeformatter setDateFormat:@"yyyy"];
    
    int minyear=[[timeformatter stringFromDate:self.minimumDate]intValue]-1950;
    
    int maxyear=[[timeformatter stringFromDate:self.maximumDate]intValue]-1950;
    
    [timeformatter setDateFormat:@"MM"];
    
    int thisyears=[[timeformatter stringFromDate:self.date]intValue]-1950;
    
    int minmonth=[[timeformatter stringFromDate:self.minimumDate]intValue];
    
    int maxmonth=[[timeformatter stringFromDate:self.maximumDate]intValue];
    
    if(minyear<=thisyear<=maxyear){
        
        if(thisyears>maxyear||thisyears<minyear){
            
            if(thisyears>maxyear){
                
                self.date=self.maximumDate;
                
                //月份颜色
                
                for(int i=0;i<12;i++){
                    
                    if(maxmonth>i){
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }else{
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }
                    
                }
                
                //年颜色
                
                for(int i=0;i<100;i++){
                    
                    if(i>maxyear){
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }else{
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }
                    
                }
                
            }else if(thisyear<minyear){
                
                self.date=self.minimumDate;
                
                for(int i=0;i<12;i++){
                    
                    if(minmonth-2<i){
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }else{
                        
                        UILabel *label=[self.month objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }
                    
                }
                
                for(int i=0;i<100;i++){
                    
                    if(i<minyear){
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor grayColor];
                        
                    }else{
                        
                        UILabel *label=[self.year objectAtIndex:i];
                        
                        label.textColor=[UIColor darkTextColor];
                        
                    }
                    
                }
                
            }
            
        }
        
        if(minyear<thisyear&&thisyear<maxyear){
            
            for(int i=0;i<12;i++){
                
                UILabel *label=[self.month objectAtIndex:i];
                
                label.textColor=[UIColor darkTextColor];
                
            }
            
            for(int i=0;i<100;i++){
                
                if(i<minyear||i>maxyear){
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }else{
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }
                
            }
            
        }
        
        if(minyear==thisyear){
            
            for(int i=0;i<12;i++){
                
                if(minmonth-2<i){
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }else{
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }
                
            }
            
            for(int i=0;i<100;i++){
                
                if(i<minyear||i>maxyear){
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }else{
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }
                
            }
            
        }
        
        if(maxyear==thisyear){
            
            for(int i=0;i<12;i++){
                
                if(maxmonth>i){
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }else{
                    
                    UILabel *label=[self.month objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }
                
            }
            
            for(int i=0;i<100;i++){
                
                if(i<minyear||i>maxyear){
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor grayColor];
                    
                }else{
                    
                    UILabel *label=[self.year objectAtIndex:i];
                    
                    label.textColor=[UIColor darkTextColor];
                    
                }
                
            }
            
        }
        
    }
    
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    NSDateFormatter *timeformatter=[[NSDateFormatter alloc]init];
    
    [timeformatter setDateFormat:@"yyyy"];
    
    int minyear=[[timeformatter stringFromDate:self.minimumDate]intValue]-1950;
    
    int maxyear=[[timeformatter stringFromDate:self.maximumDate]intValue]-1950;
    
    [timeformatter setDateFormat:@"MM"];
    
    if(component==0){
        
        if(0<=row<[self.month count]){
            
            UILabel *label=[self.month objectAtIndex:row];
            
            [label setFrame:CGRectMake(10, 0, 150, 30)];
            
            [label setBackgroundColor:[UIColor clearColor]];
            
            [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
            
            return label;
            
        }
        
    }
    
    if(component==1){
        
        if(0<=row&&row<[self.year count]){
            
            UILabel *label=[self.year objectAtIndex:row];
            
            [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
            
            [label setFrame:CGRectMake(10, 0, 150, 30)];
            
            if(minyear<=row&&row<=maxyear){
                
                label.textColor=[UIColor darkTextColor];
                
            }else{
                
                label.textColor=[UIColor grayColor];
                
            }
            
            //  [myview addSubview:label];
            
            return label;
            
        }
        
    }
    
    return nil;
    
}

-(void)setdate:(NSDate *)mydate{
    
    self.date=mydate;
    
    NSDateFormatter *timeformatter=[[NSDateFormatter alloc]init];
    
    [timeformatter setDateFormat:@"yyyy"];
    
    thisyear=[[timeformatter stringFromDate:self.date]intValue]-1950;
    
    [timeformatter setDateFormat:@"MM"];
    
    thismonth=[[timeformatter stringFromDate:self.date] intValue];
    
    
    
    [self.kengdiepicker selectRow:thisyear inComponent:1 animated:YES];
    
    [self.kengdiepicker selectRow:thismonth-1 inComponent:0 animated:YES];
    
}

-(id)MyInit{
    
    id sender=[super init];
    
    if(self.month==nil){
        
        UILabel *Januarylabel=[[UILabel alloc]init];
        
        Januarylabel.tag=1; 
        
        Januarylabel.text=@" 1月";
        
        
        
        UILabel *Februarylabel=[[UILabel alloc]init];
        
        Februarylabel.text=@" 2月";
        
        Februarylabel.tag=2;
        
        
        
        UILabel *Marchlabel=[[UILabel alloc]init];
        
        Marchlabel.tag=3;
        
        Marchlabel.text=@" 3月";
        
        
        
        UILabel *Aprillabel=[[UILabel alloc]init];
        
        Aprillabel.tag=4;
        
        Aprillabel.text=@" 4月";
        
        
        
        UILabel *Maylabel=[[UILabel alloc]init];
        
        Maylabel.tag=5;
        
        Maylabel.text=@" 5月";
        
        
        
        UILabel *Junelabel=[[UILabel alloc]init];
        
        Junelabel.tag=6;
        
        Junelabel.text=@" 6月";
        
        
        
        UILabel *Julylabel=[[UILabel alloc]init];
        
        Julylabel.tag=7;
        
        Julylabel.text=@" 7月";
        
        
        
        UILabel *Augustlabel=[[UILabel alloc]init];
        
        Augustlabel.tag=8; 
        
        Augustlabel.text=@" 8月";
        
        
        
        UILabel *Septemberlabel=[[UILabel alloc]init];
        
        Septemberlabel.tag=9;
        
        Septemberlabel.text=@" 9月";
        
        
        
        UILabel *Ocoberlabel=[[UILabel alloc]init];
        
        Ocoberlabel.tag=10;
        
        Ocoberlabel.text=@" 10月";
        
        
        
        UILabel *Novemberlabel=[[UILabel alloc]init];
        
        Novemberlabel.tag=11;
        
        Novemberlabel.text=@" 11月";
        
        
        
        UILabel *Decemberlabel=[[UILabel alloc]init];
        
        Decemberlabel.tag=12;
        
        Decemberlabel.text=@" 12月";
        
        
        
        self.month=[[NSArray alloc]initWithObjects:Januarylabel,Februarylabel,Marchlabel,Aprillabel,Maylabel,Junelabel,Julylabel,Augustlabel,Septemberlabel,Ocoberlabel,Novemberlabel,Decemberlabel, nil];
        
        //    self.month=[[NSArray alloc]initWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"Ocober",@"November",@"December", nil];
        
    }
    
    if(self.year==nil){
        
        self.year=[[NSMutableArray alloc]init];
        
        for(int i=1950;i<2051;i++){
            
            UILabel *label=[[UILabel alloc]init];
            
            label.text=[NSString stringWithFormat:@" %d",i];
            
            label.backgroundColor=[UIColor clearColor];
            
            [self.year addObject:label];
        }
        
    } 
    
    if(self.date==nil){
        
        self.date=[[NSDate alloc]init];
        
    }
    
    if(self.kengdiepicker==nil){
        
        self.kengdiepicker=[[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 216.0)];
        
    }
    
    self.kengdiepicker.delegate=self;
    
    self.kengdiepicker.showsSelectionIndicator=YES;
    
    if(self.minimumDate==nil){
        
        self.minimumDate=[[NSDate alloc]init];
        
    }
    
    if(self.maximumDate==nil){
        
        self.maximumDate=[[NSDate alloc]init];
        
    }
    
    NSDate *inittime=[[NSDate alloc]init];
    
    self.date=inittime;
    
    NSDateFormatter *timeformatter=[[NSDateFormatter alloc]init];
    
    [timeformatter setDateFormat:@"yyyy"];
    
    thisyear=[[timeformatter stringFromDate:self.date]intValue]-1950;
    
    [timeformatter setDateFormat:@"MM"];
    
    thismonth=[[timeformatter stringFromDate:self.date] intValue];
    
    
    [self.kengdiepicker selectRow:thisyear inComponent:1 animated:YES];
    
    [self.kengdiepicker selectRow:thismonth-1 inComponent:0 animated:YES];
    
    NSLog(@"thisyear:%d,thismonth:%d",thisyear,thismonth);    
    
    [self setFrame:CGRectMake(0.0, [UIScreen mainScreen].bounds.size.height-300, 320.0, 216.0)];
    
    [self addSubview:self.kengdiepicker];
    
    [self bringSubviewToFront:kengdiepicker];
    
    self.backgroundColor=[UIColor whiteColor];
    
    self.autoresizesSubviews=YES;
    
    return sender;
    
}

@end
