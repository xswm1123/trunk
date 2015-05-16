//
//  SellStatisticsViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/16.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "SellStatisticsViewController.h"
#import "AdminManager.h"

@interface SellStatisticsViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong) UIView *visibleExampleView;
@property(nonatomic,strong)NSArray * views;
@property(nonatomic,strong)NYSegmentedControl *sellStatisticsControl;
@property(nonatomic,strong)NYSegmentedControl *feeStatisticsControl;
@property(nonatomic,strong)UILabel* projectName;
@property(nonatomic,strong)NSArray* projects;
@property(nonatomic,strong)UILabel* sourceHouses;
@property(nonatomic,strong)MCProgressBarView* proView;
@property(nonatomic,strong)UILabel* statisticsLabel;
@property(nonatomic,strong)NSArray* statisticsContents;
@property(nonatomic,strong)UIView * secondVisibleSegementControlView;
@property(nonatomic,strong)NYSegmentedControl* totalsControl;
@property(nonatomic,strong)NYSegmentedControl* detailsControl;
@property(nonatomic,strong)NSArray* secondSegViews;
@property(nonatomic,strong)UILabel* detailsViewProject;
@property(nonatomic,strong)NSArray* details_projects;
@property(nonatomic,strong)UILabel* lb_month_total;
@property(nonatomic,strong)NSArray* months_total;
@property(nonatomic,strong)UIWebView* indexWeb;
@end

@implementation SellStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initData];
//    [self createSegementView];
    [self createWebView];
    [self setTitle:@"销售"];
   
}
-(void)createWebView{
    CGRect frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-self.navigationController.toolbar.frameHeight-64);
    self.indexWeb=[[UIWebView alloc]initWithFrame:frame];
    UserEntity* user=[ConfigManage getLoginUser];
    NSString* url=[NSString stringWithFormat:@"%@/sale_stat.aspx?UserName=%@&UserPwd=%@",URL_MANAGER,user.userName,user.password];
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    [self.indexWeb loadRequest:request];
    [self.view addSubview:self.indexWeb];
}

#pragma initData
-(void)initData{
    self.projects=@[@"Building1",@"Building2",@"Building3",@"Building4",@"Building5",@"Building6",@"Building7",@"Building8"];
    self.statisticsContents=@[@"content1",@"content2",@"content3",@"content4",];
    self.details_projects=@[@"project1",@"project2",@"project3",@"project4",@"project5",];
    self.months_total=@[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月",];
}
#pragma configUI
-(void)createSegementView{
    //销售统计view
    UIView *sellStatisticsView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.visibleExampleView = sellStatisticsView;
    [self.view addSubview:sellStatisticsView];
    self.sellStatisticsControl = [[NYSegmentedControl alloc] initWithItems:@[@"销售统计", @"收费用统计"]];
    self.sellStatisticsControl.backgroundColor =[UIColor colorWithRed:77/255.0 green:167/255.0 blue:216/255.0 alpha:1.0f];
    self.sellStatisticsControl.segmentIndicatorBackgroundColor = [UIColor colorWithRed:247/255.0 green:208/255.0 blue:64/255.0 alpha:1.0f];
    self.sellStatisticsControl.segmentIndicatorInset = 0.0f;
    self.sellStatisticsControl.titleTextColor = [UIColor whiteColor];
    self.sellStatisticsControl.selectedTitleTextColor = [UIColor whiteColor];
    self.sellStatisticsControl.titleFont=[UIFont systemFontOfSize:16.0];
    self.sellStatisticsControl.cornerRadius=0.0f;
    self.sellStatisticsControl.borderWidth=0.0f;
    self.sellStatisticsControl.borderColor=[UIColor clearColor];
    self.sellStatisticsControl.frame=CGRectMake(20,10, self.view.bounds.size.width-40, 40);
    self.sellStatisticsControl.selectedSegmentIndex=0;
    [self.sellStatisticsControl addTarget:self action:@selector(segmentSelectedSell) forControlEvents:UIControlEventValueChanged];
    [sellStatisticsView addSubview:self.sellStatisticsControl];
    //控件布局
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(40, 70, 40, 26)];
    label.text=@"项目";
    label.font=[UIFont systemFontOfSize:15.0];
    
    self.projectName=[[UILabel alloc]initWithFrame:CGRectMake(120, 70, 160, 26)];
    self.projectName.backgroundColor=[UIColor whiteColor];
//    self.projectName.layer.borderColor=[UIColor grayColor].CGColor;
//    self.projectName.layer.borderWidth=2.0;
    self.projectName.text=@"Test";
    self.projectName.font=[UIFont systemFontOfSize:15.0];
    
    UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(250, 74, 26, 18)];
    [btn setBackgroundImage:[UIImage imageNamed:@"button_down_list.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(chooseProject) forControlEvents:UIControlEventTouchUpInside];
    //======================sourceHouse
    UILabel* houseLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 100, 60, 26)];
    houseLabel.text=@"总房源：";
    houseLabel.font=[UIFont systemFontOfSize:15.0];
    
    self.sourceHouses=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 50, 26)];
    self.sourceHouses.text=@"150套";
    self.sourceHouses.font=[UIFont systemFontOfSize:15.0];
    //=======progressView
    self.proView=[[MCProgressBarView alloc]initWithFrame:CGRectMake(40, 140, 240, 20) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"darkYelllow.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch]];
    self.proView.progress=0.6;
    //leftLabel
    self.proView.left_nameLabel.frame=CGRectMake(10, 2, 30, 16);
    self.proView.left_valueLabel.frame=CGRectMake(44, 2, 40, 16);
    //rightLabel
    self.proView.right_valueLabel.frame=CGRectMake(self.proView.frame.size.width-40, 2, 40, 16);
    self.proView.right_nameLabel.frame=CGRectMake(self.proView.frame.size.width-80, 2, 30, 16);
    
    [self.proView configLabelWithLeftName:@"已售:" leftValue:@"100套" rightName:@"未售:" rightValue:@"480套" labelFont: [UIFont systemFontOfSize:12] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
    //========blueLine
    UIView * blueLine=[[UIView alloc]initWithFrame:CGRectMake(0, 170, [UIScreen mainScreen].bounds.size.width, 1)];
    blueLine.backgroundColor=[UIColor colorWithRed:77/255.0 green:167/255.0 blue:216/255.0 alpha:1.0];
    //=========statisticsPopListView
    UILabel* statisticsLabelName=[[UILabel alloc]initWithFrame:CGRectMake(40, 180, 60, 26)];
    statisticsLabelName.text=@"销售统计";
    statisticsLabelName.font=[UIFont systemFontOfSize:15.0];
    
    self.statisticsLabel=[[UILabel alloc]initWithFrame:CGRectMake(120, 180, 160, 26)];
    self.statisticsLabel.text=@"金额统计";
    self.statisticsLabel.font=[UIFont systemFontOfSize:15.0];
    self.statisticsLabel.backgroundColor=[UIColor whiteColor];
    UIButton* staBtn=[[UIButton alloc]initWithFrame:CGRectMake(250, 184, 26, 18)];
    [staBtn setBackgroundImage:[UIImage imageNamed:@"button_down_list.png"] forState:UIControlStateNormal];
    [staBtn addTarget:self action:@selector(chooseStatistics) forControlEvents:UIControlEventTouchUpInside];
    
    
    [sellStatisticsView addSubview:label];
    [sellStatisticsView addSubview:self.projectName];
    [sellStatisticsView insertSubview:btn aboveSubview:self.projectName];
    [sellStatisticsView addSubview:houseLabel];
    [sellStatisticsView addSubview:self.sourceHouses];
    [sellStatisticsView addSubview:self.proView];
    [sellStatisticsView addSubview:blueLine];
    [sellStatisticsView addSubview:statisticsLabelName];
    [sellStatisticsView addSubview:self.statisticsLabel];
    [sellStatisticsView insertSubview:staBtn aboveSubview:self.statisticsLabel];
    
    
    //收费统计view
    UIView *feeStatisticsView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.feeStatisticsControl = [[NYSegmentedControl alloc] initWithItems:@[@"销售统计", @"收费用统计"]];
     self.feeStatisticsControl .backgroundColor =[UIColor colorWithRed:77/255.0 green:167/255.0 blue:216/255.0 alpha:1.0f];
     self.feeStatisticsControl .segmentIndicatorBackgroundColor =[UIColor colorWithRed:247/255.0 green:208/255.0 blue:64/255.0 alpha:1.0f] ;
     self.feeStatisticsControl .segmentIndicatorInset = 0.0f;
     self.feeStatisticsControl .titleTextColor = [UIColor whiteColor];
     self.feeStatisticsControl .selectedTitleTextColor = [UIColor whiteColor];
    self.feeStatisticsControl.titleFont=[UIFont systemFontOfSize:16.0];
     self.feeStatisticsControl .cornerRadius=0.0f;
     self.feeStatisticsControl .borderWidth=0.0f;
     self.feeStatisticsControl .borderColor=[UIColor clearColor];
    self.feeStatisticsControl.frame=CGRectMake(20,10, self.view.bounds.size.width-40, 40);
    self.feeStatisticsControl.selectedSegmentIndex=1;
    [self.feeStatisticsControl addTarget:self action:@selector(segmentSelectedFee) forControlEvents:UIControlEventValueChanged];
    [feeStatisticsView addSubview:self.feeStatisticsControl];

    //segementControl====嵌套一个segementControl
    //totalView
    UIView* totalsView=[[UIView alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height-60)];
    self.secondVisibleSegementControlView=totalsView;
    [feeStatisticsView addSubview:totalsView];
    self.totalsControl=[[NYSegmentedControl alloc]initWithItems:@[@"总计",@"明细"]];
    self.totalsControl.backgroundColor =[UIColor colorWithRed:77/255.0 green:167/255.0 blue:216/255.0 alpha:1.0f];
    self.totalsControl.segmentIndicatorBackgroundColor = [UIColor colorWithRed:247/255.0 green:208/255.0 blue:64/255.0 alpha:1.0f];
    self.totalsControl.segmentIndicatorInset = 0.0f;
    self.totalsControl.titleTextColor = [UIColor whiteColor];
    self.totalsControl.selectedTitleTextColor = [UIColor whiteColor];
    self.totalsControl.titleFont=[UIFont systemFontOfSize:15.0];
    self.totalsControl.cornerRadius=0.0f;
    self.totalsControl.borderWidth=0.0f;
    self.totalsControl.borderColor=[UIColor clearColor];
    self.totalsControl.frame=CGRectMake(100,5, self.view.bounds.size.width-200, 30);
    self.totalsControl.selectedSegmentIndex=0;
    [self.totalsControl addTarget:self action:@selector(segmentSelectedTotal) forControlEvents:UIControlEventValueChanged];
    [totalsView addSubview:self.totalsControl];
    //totalView添加子控件
    self.lb_month_total=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 60, 30)];
    self.lb_month_total.backgroundColor=[UIColor whiteColor];
    self.lb_month_total.text=@"1月";
    self.lb_month_total.font=[UIFont systemFontOfSize:15.0];
    
    UIButton* monthBtn=[[UIButton alloc]initWithFrame:CGRectMake(50, 58, 26, 18)];
    [monthBtn setBackgroundImage:[UIImage imageNamed:@"button_down_list.png"] forState:UIControlStateNormal];
    [monthBtn addTarget:self action:@selector(chooseTotalMonth) forControlEvents:UIControlEventTouchUpInside];
    
    WDatePickerView* wdate=[[WDatePickerView alloc]initWithFrame:CGRectMake(100, 50, 160, 30)];
    wdate.backgroundColor=[UIColor whiteColor];
    
    
    
    [totalsView addSubview:wdate];
    
    [totalsView addSubview: self.lb_month_total];
    [totalsView insertSubview:monthBtn aboveSubview:self.lb_month_total];
    //detailsView
    UIView *detailsView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height-60)];
    self.detailsControl = [[NYSegmentedControl alloc] initWithItems:@[@"总计", @"明细"]];
    self.detailsControl .backgroundColor =[UIColor colorWithRed:77/255.0 green:167/255.0 blue:216/255.0 alpha:1.0f];
    self.detailsControl .segmentIndicatorBackgroundColor =[UIColor colorWithRed:247/255.0 green:208/255.0 blue:64/255.0 alpha:1.0f] ;
    self.detailsControl .segmentIndicatorInset = 0.0f;
    self.detailsControl .titleTextColor = [UIColor whiteColor];
    self.detailsControl .selectedTitleTextColor = [UIColor whiteColor];
    self.detailsControl.titleFont=[UIFont systemFontOfSize:15.0];
    self.detailsControl .cornerRadius=0.0f;
    self.detailsControl .borderWidth=0.0f;
    self.detailsControl .borderColor=[UIColor clearColor];
    self.detailsControl.frame=CGRectMake(100,5, self.view.bounds.size.width-200, 30);
    self.detailsControl.selectedSegmentIndex=1;
    [self.detailsControl addTarget:self action:@selector(segmentSelectedDetails) forControlEvents:UIControlEventValueChanged];
    [detailsView addSubview:self.detailsControl];
    //detailsView添加子控件
    UILabel* detailsLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 50, 40, 26)];
    detailsLabel.text=@"项目";
    detailsLabel.font=[UIFont systemFontOfSize:15.0];
    
    self.detailsViewProject=[[UILabel alloc]initWithFrame:CGRectMake(80, 50, 200, 26)];
    self.detailsViewProject.backgroundColor=[UIColor whiteColor];
    //    self.projectName.layer.borderColor=[UIColor grayColor].CGColor;
    //    self.projectName.layer.borderWidth=2.0;
    self.detailsViewProject.text=@"Project";
    self.detailsViewProject.font=[UIFont systemFontOfSize:15.0];
    
    UIButton* detailsBtn=[[UIButton alloc]initWithFrame:CGRectMake(250, 54, 26, 18)];
    [detailsBtn setBackgroundImage:[UIImage imageNamed:@"button_down_list.png"] forState:UIControlStateNormal];
    [detailsBtn addTarget:self action:@selector(chooseDetailsProject) forControlEvents:UIControlEventTouchUpInside];
    [detailsView addSubview:detailsLabel];
    [detailsView addSubview:self.detailsViewProject];
    [detailsView insertSubview:detailsBtn aboveSubview:self.detailsViewProject];
    
    
    detailsView.hidden=YES;
    [feeStatisticsView addSubview:detailsView];
    self.secondSegViews=@[totalsView,detailsView];
    
    
    feeStatisticsView.hidden = YES;
    [self.view addSubview:feeStatisticsView];
    self.views=@[sellStatisticsView,feeStatisticsView];

}
#pragma segementSelect
- (void)segmentSelectedSell {
    UIView *sellView = self.views[self.sellStatisticsControl.selectedSegmentIndex];
    if (self.visibleExampleView == sellView) {
        return;
    }
    self.visibleExampleView.hidden = YES;
    sellView.hidden = NO;
    self.visibleExampleView = sellView;
    self.sellStatisticsControl.selectedSegmentIndex=0;
}
- (void)segmentSelectedFee {
    UIView *sellView = self.views[self.feeStatisticsControl.selectedSegmentIndex];
    if (self.visibleExampleView == sellView) {
        return;
    }
    self.visibleExampleView.hidden = YES;
    sellView.hidden = NO;
    self.visibleExampleView = sellView;
    self.feeStatisticsControl.selectedSegmentIndex=1;
}
-(void)segmentSelectedTotal{
    UIView* totalView=self.secondSegViews[self.totalsControl.selectedSegmentIndex];
    if (self.secondVisibleSegementControlView==totalView) {
        return;
    }
    self.secondVisibleSegementControlView.hidden=YES;
    totalView.hidden=NO;
    self.secondVisibleSegementControlView=totalView;
    self.totalsControl.selectedSegmentIndex=0;
}
-(void)segmentSelectedDetails{
    UIView* detailsView=self.secondSegViews[self.detailsControl.selectedSegmentIndex];
    if (self.secondVisibleSegementControlView==detailsView) {
        return;
    }
    self.secondVisibleSegementControlView.hidden=YES;
    detailsView.hidden=NO;
    self.secondVisibleSegementControlView=detailsView;
    self.detailsControl.selectedSegmentIndex=1;
}
#pragma adaptLeveyPoplistView
-(void)chooseProject{
    AdaptLeveyPopListView* list=[[AdaptLeveyPopListView alloc]initWithTitle:@"请选择" options:self.projects];
    list.delegate=self;
    list.tag=100;
    [list showInView:self.view.window animated:YES];
    
}
-(void)chooseStatistics{
    AdaptLeveyPopListView* list=[[AdaptLeveyPopListView alloc]initWithTitle:@"请选择" options:self.statisticsContents];
    list.delegate=self;
    list.tag=101;
    [list showInView:self.view.window animated:YES];
}
-(void)chooseDetailsProject{
    AdaptLeveyPopListView* list=[[AdaptLeveyPopListView alloc]initWithTitle:@"请选择" options:self.details_projects];
    list.delegate=self;
    list.tag=102;
    [list showInView:self.view.window animated:YES];
}
-(void)chooseTotalMonth{
    LeveyPopListView* list=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.months_total];
    list.delegate=self;
    list.tag=103;
    [list showInView:self.view.window animated:YES];
}
- (void)AdaptLeveyPopListView:(AdaptLeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex{
    if (popListView.tag==100) {
        self.projectName.text=[self.projects objectAtIndex:anIndex];
    }
    if (popListView.tag==101) {
        self.statisticsLabel.text=[self.statisticsContents objectAtIndex:anIndex];
    }
    if (popListView.tag==102) {
        self.detailsViewProject.text=[self.details_projects objectAtIndex:anIndex];
    }
   }
-(void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex{
    if (popListView.tag==103) {
        self.lb_month_total.text=[self.months_total objectAtIndex:anIndex];
    }

}
@end
