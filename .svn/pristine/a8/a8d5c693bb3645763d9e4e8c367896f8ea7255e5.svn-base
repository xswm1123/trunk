//
//  RankingViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/18.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "RankingViewController.h"
#import "AdminManager.h"
#import "LeveyPopListView.h"

@interface RankingViewController ()
{
    long yearIndex;
    long monthIndex;
}

@property (nonatomic,strong) NSMutableArray* rankInfos;
@property (nonatomic,strong) NSMutableArray* rankInfos2;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *typeView;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (nonatomic,strong) NSMutableArray* rankTypes;
@property (nonatomic,strong) NSMutableArray* allInfos;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView2;
@property (weak, nonatomic) IBOutlet UIView *typeView2;
@property (weak, nonatomic) IBOutlet UILabel *type2;
@property (nonatomic,strong) NSArray* months;
@property (nonatomic,strong) NSMutableArray* years;
@property(nonatomic,strong) NSString* tempYear;
@property (nonatomic,strong) NSString* tempMonth;
@property (nonatomic,strong) NSString* showYear;
@property (nonatomic,strong) NSString* showMonth;
@end

@implementation RankingViewController
-(NSMutableArray *)rankInfos{
    if (!_rankInfos) {
        _rankInfos=[NSMutableArray array];
        
    }
    return _rankInfos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    NSDate *dateNow;
    dateNow=[NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:dateNow];
    long year=[comps year];
    long month=[comps month];
    yearIndex=year;
    monthIndex=month;
    NSString* yearDate=[NSString stringWithFormat:@"%ld",year];
    [self setTitle:[NSString stringWithFormat:@"排行榜%ld-%ld月",year,month]];
    NSString* monthDate=[NSString stringWithFormat:@"%ld",month];
    [self loadDataWithYear:yearDate Month:monthDate];
    self.showYear=yearDate;
    self.showMonth=monthDate;
    

}
-(void)initView{
    self.rankTypes=nil;
    self.rankTypes=[NSMutableArray array];
    self.allInfos=nil;
    self.allInfos=[NSMutableArray array];
    self.typeView.layer.borderWidth=1.0;
    self.typeView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.scrollView.backgroundColor=[UIColor lightGrayColor];
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.typeView2.layer.borderWidth=1.0;
    self.typeView2.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.scrollView2.backgroundColor=[UIColor lightGrayColor];
    self.scrollView2.showsHorizontalScrollIndicator=NO;
    self.scrollView2.showsVerticalScrollIndicator=NO;
    UIBarButtonItem*leftBar=[self createButtonItemSelecteObject:@selector(selectObejct)];
    self.navigationItem.rightBarButtonItem=leftBar;
    self.months=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    self.years=nil;
    self.years=[NSMutableArray array];
    for (int i=1950;i<2051;i++) {
        NSString* year=[NSString stringWithFormat:@"%d",i];
        [self.years addObject:year];
    }
}
-(void)selectObejct{
    self.tempMonth=@"";
    self.tempYear=@"";
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.parentView=self.view;
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    titleLabel.text=@"请选择时间";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
    titleLabel.textColor=[UIColor whiteColor];
    [backGroundView addSubview:titleLabel];
    
    UIPickerView* pv1=[[UIPickerView alloc]initWithFrame:CGRectMake(10, 0, 180, 100)];
    pv1.delegate=self;
//    NSString* year=[NSString stringWithFormat:@"%ld",yearIndex];
//    NSInteger index_year=[(NSArray*)self.years indexOfObject:year];
//    NSString* month=[NSString stringWithFormat:@"%ld",monthIndex];
//    NSInteger index_month=[self.months indexOfObject:month];
    NSInteger index_year=[(NSArray*)self.years indexOfObject:self.showYear];
    NSInteger index_month=[self.months indexOfObject:self.showMonth];
    [pv1 selectRow:index_year inComponent:0 animated:YES];
    [pv1 selectRow:index_month inComponent:1 animated:YES];
    [backGroundView addSubview:pv1];
    
    al.containerView=backGroundView;
    NSArray* titles=@[@"取消",@"确定"];
    al.buttonTitles=titles;
    al.delegate=self;
    [al show];
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component==0) {
        return self.years.count;
    }
    if (component==1) {
        return self.months.count;
    }
    return 0;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==0) {
        return [self.years objectAtIndex:row];
    }
    if (component==1) {
        return [self.months objectAtIndex:row];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
             self.tempYear=[self.years objectAtIndex:row];
    }
    if (component==1) {
            self.tempMonth=[self.months objectAtIndex:row];
    }
    
}
-(void)customIOS7dialogButtonTouchUpInside:(CustomIOS7AlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [alertView close];
    }
    if (buttonIndex==1) {
        if (![NSString isEnabled:self.tempYear]) {
           self.tempYear=[NSString stringWithFormat:@"%ld",yearIndex];
        }
        if (![NSString isEnabled:self.tempMonth]) {
            self.tempMonth=[NSString stringWithFormat:@"%ld",monthIndex];
        }
        [self loadDataWithYear:self.tempYear Month:self.tempMonth];
        [self setTitle:[NSString stringWithFormat:@"排行榜%@-%@月",self.tempYear,self.tempMonth]];
        self.showMonth=self.tempMonth;
        self.showYear=self.tempYear;
        [alertView close];
    }
}
-(void)loadDataWithYear:(NSString*)year Month:(NSString*) month{
    [Utils showLoading:@"正在加载数据..."];
    self.rankInfos2=nil;
    self.rankInfos2=[NSMutableArray array];
    self.rankInfos=nil;
    self.rankInfos=[NSMutableArray array];
    UserEntity* user=[ConfigManage getLoginUser];
    AdminManager* manager=[[AdminManager alloc]init];
    [manager queryRankingBySellersWithObjectId:user.objectId Year:year Month:month success:^(id data, NSDictionary *userInfo) {
        NSLog(@"rankData===%@",data);
        NSArray* arr=(NSArray*)data;
        NSDictionary* totalData=[arr firstObject];
        
        self.type.text=[totalData objectForKey:@"ZD_ZDMC"];
        
        
        NSDictionary* totalData2=[arr lastObject];
        self.type2.text=[totalData2 objectForKey:@"ZD_ZDMC"];
      
        
        
        NSArray* datas=[totalData objectForKey:@"LstArry"];
        for (NSDictionary* dic in datas) {
            NSLog(@"name:%@,value:%@",[dic objectForKey:@"ZD_ZDMC"],[dic objectForKey:@"ZD_ZDVAL"]);
            [self.rankInfos addObject:dic];
        }
        NSArray* datas2=[totalData2 objectForKey:@"LstArry"];
        for (NSDictionary* dic in datas2) {
            NSLog(@"name:%@,value:%@",[dic objectForKey:@"ZD_ZDMC"],[dic objectForKey:@"ZD_ZDVAL"]);
            [self.rankInfos2 addObject:dic];
        }
        if (self.rankInfos.count>0) {
            
            [self createScrollViewWithData:self.rankInfos];
//            self.typeView.hidden=NO;
//            self.scrollView.hidden=NO;
        }else{
//            self.typeView.hidden=YES;
//            self.scrollView.hidden=YES;
             self.type.text=@"暂无数据";
            [self createScrollViewWithData:self.rankInfos];
        }
        
        if (self.rankInfos2.count>0) {
           
            [self createScrollView2WithData:self.rankInfos2];
//            self.typeView2.hidden=NO;
//            self.scrollView2.hidden=NO;
        }else{
//            self.typeView2.hidden=YES;
//            self.scrollView2.hidden=YES;
             self.type2.text=@"暂无数据";
            [self createScrollView2WithData:self.rankInfos2];
        }
        
        NSArray* rank=(NSArray*)data;
        for (NSDictionary* rankDIc in rank) {
            NSString* type=[rankDIc objectForKey:@"ZD_ZDMC"];
            NSLog(@"type==%@",type);
            [self.rankTypes addObject:type];
            [self.allInfos addObject:rankDIc];
        }
//
        
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}
-(void)createScrollViewWithData:(NSMutableArray*) arr{
    for (UIView* view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    for (int i=0; i<arr.count; i++) {
        NSDictionary* dic=[arr objectAtIndex:i];
        UIView* vi=[[UIView alloc]init];
        vi.backgroundColor=[UIColor clearColor];
        vi.frame=CGRectMake(10+100*i, 10, 90, 100);
        UIImageView* imv=[[UIImageView alloc]initWithFrame:CGRectMake(25, 0, 40, 40)];
        imv.image=[UIImage imageNamed:@"paihangyognhu.png"];
        UILabel* name=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, 90, 30)];
        name.text=[dic objectForKey:@"ZD_ZDMC"];
        name.textAlignment=NSTextAlignmentCenter;
        UILabel* value=[[UILabel alloc]initWithFrame:CGRectMake(0, 70, 90, 30)];
        value.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"ZD_ZDVAL"]];
        value.textAlignment=NSTextAlignmentCenter;
        [vi addSubview:imv];
        [vi addSubview:name];
        [vi addSubview:value];
        [self.scrollView addSubview:vi];
    }
    self.scrollView.contentSize=CGSizeMake(10+arr.count*100, 120);
}
-(void)createScrollView2WithData:(NSMutableArray*) arr{
    for (UIView* view in self.scrollView2.subviews) {
        [view removeFromSuperview];
    }
    for (int i=0; i<arr.count; i++) {
        NSDictionary* dic=[arr objectAtIndex:i];
        UIView* vi=[[UIView alloc]init];
        vi.backgroundColor=[UIColor clearColor];
        vi.frame=CGRectMake(10+100*i, 10, 90, 100);
        UIImageView* imv=[[UIImageView alloc]initWithFrame:CGRectMake(25, 0, 40, 40)];
        imv.image=[UIImage imageNamed:@"paihangyognhu.png"];
        UILabel* name=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, 90, 30)];
        name.text=[dic objectForKey:@"ZD_ZDMC"];
        name.textAlignment=NSTextAlignmentCenter;
        UILabel* value=[[UILabel alloc]initWithFrame:CGRectMake(0, 70, 90, 30)];
        value.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"ZD_ZDVAL"]];
        value.textAlignment=NSTextAlignmentCenter;
        [vi addSubview:imv];
        [vi addSubview:name];
        [vi addSubview:value];
        [self.scrollView2 addSubview:vi];
    }
    self.scrollView2.contentSize=CGSizeMake(10+arr.count*100, 120);
}

@end
