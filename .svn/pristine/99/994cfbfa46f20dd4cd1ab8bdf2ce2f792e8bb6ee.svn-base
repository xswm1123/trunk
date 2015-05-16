//
//  CustomerTrackViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/23.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerTrackViewController.h"
#import "CustomerTrackTableViewCell.h"
#import "CustomerTrackDetailViewController.h"
#import "CustomerMainManager.h"
#import "ConfigManage+Expand.h"
#import "CustomerFollowUpEntity.h"
#import "CustomIOS7AlertView.h"
@interface CustomerTrackViewController ()<UITextFieldDelegate,CustomIOS7AlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf_searchContent;
@property(nonatomic,strong) NSMutableArray* customerInfos;
@property(nonatomic,strong) NSString* searchDate;
@property (nonatomic,strong) NSString* startTime;
@property (nonatomic,strong) NSString* endTime;
@property (nonatomic,strong) UILabel* lb_startTime;
@property (nonatomic,strong) UILabel* lb_endTime;
@end

@implementation CustomerTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self loadData];
    [self setTitle:@"跟踪"];
    self.tf_searchContent.delegate=self;
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate new];
    self.startTime=[frm stringFromDate:startDate];
    self.endTime=[frm stringFromDate:startDate];
//    self.tableView.allowsSelection=NO;
    // Do any additional setup after loading the view from its nib.
}
-(void)loadData{
    [Utils showLoading:@"正在加载数据..."];
    self.customerInfos=nil;
    self.customerInfos=[NSMutableArray array];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager queryCustomerWithObjectId:user.objectId UserId:user.userId customerName:nil customerPhone:nil certificate:nil visitDate:nil endDate:nil visitWay:nil orderLevel:nil tradeState:nil success:^(id data, NSDictionary *userInfo) {
        if(data&&[data isKindOfClass:[NSArray class]]){
            NSArray* datas=(NSArray*)data;
            for (CustomerInfoEntity* entity in datas) {
                [self.customerInfos addObject:entity];
            }
            [self.tableView reloadData];
        }
        [Utils hiddenLoading];
        
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        
    }];
}
-(void)initView{
    [self.segementControl setBackgroundImage:[UIImage imageNamed:@"blue_unit.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segementControl setBackgroundImage:[UIImage imageNamed:@"yellow_unit.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    self.segementControl.frameHeight=40;
    self.segementControl.layer.cornerRadius=0.0;
    self.segementControl.tintColor=[UIColor whiteColor];
    NSDictionary* textAttribute = @{NSForegroundColorAttributeName:[UIColor blackColor]};
     [self.segementControl setTitleTextAttributes:textAttribute forState:UIControlStateSelected];
    //config TableView
    
        CGRect frame=CGRectZero;
        frame=CGRectMake(0, self.tf_searchContent.frame.origin.y+self.tf_searchContent.frame.size.height+10, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-self.tf_searchContent.frame.origin.y-10-self.tf_searchContent.frame.size.height-64-self.navigationController.toolbar.frameHeight);
        
        self.tableView.frame=frame;

    
}

- (IBAction)showOptionRank:(id)sender {
//    NSLog(@"showOptionRank");
    switch (self.segementControl.selectedSegmentIndex ) {
        case 0:
            NSLog(@"name");
            self.tf_searchContent.placeholder=@"请输入客户姓名";
            self.tf_searchContent.text=@"";
            break;
            case 1:
            self.tf_searchContent.placeholder=@"请选择时间";
            self.tf_searchContent.text=@"";
            [self showAlertView];
            break;
            default:
            break;
    }
}
-(void)chooseDate{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate new];
    
    UIDatePicker* dp=[[UIDatePicker alloc]initWithFrame:CGRectMake(-20, 40, [UIScreen mainScreen].bounds.size.width, 216)];
    dp.datePickerMode=UIDatePickerModeDate;
    dp.date=startDate;
    
    if (IOS8_OR_LATER) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择时间\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSDateFormatter * frm=[[NSDateFormatter alloc]init];
            [frm setDateFormat:@"YYYY-MM-dd"];
            self.searchDate=[frm stringFromDate:dp.date];
//            [self searchAction:nil];
        }];
        [alertController.view addSubview:dp];
        [alertController addAction:cancleAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:[NSString stringWithFormat:@"请选择时间\n\n\n\n\n\n\n\n\n\n\n\n"] delegate:self cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [dp addTarget:self action:@selector(datePickerValueChanged:WithGesture:) forControlEvents:UIControlEventValueChanged];
        [sheet addSubview:dp];
        [sheet showFromToolbar:self.navigationController.toolbar];
    }
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self searchAction:nil];
}
//-(void)datePickerValueChanged:(UIDatePicker*)sender WithGesture:(UITapGestureRecognizer*)gesture
//{
//    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
//    [frm setDateFormat:@"YYYY-MM-dd"];
//    self.searchDate=[frm stringFromDate:sender.date];
////    [self searchAction:nil];
//}
- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (IBAction)searchAction:(id)sender {
    self.customerInfos=nil;
    self.customerInfos=[NSMutableArray array];
    
    if ([NSString isEnabled:self.tf_searchContent]) {
        [Utils showLoading:@"正在搜索..."];
        if (self.segementControl.selectedSegmentIndex==0) {
            self.customerInfos=nil;
            self.customerInfos=[NSMutableArray array];
            UserEntity* user=[ConfigManage getLoginUser];
            CustomerMainManager* manager=[[CustomerMainManager alloc]init];
            NSString* name;
            NSString* num;
            name=self.tf_searchContent.text;
            num=self.tf_searchContent.text;
            [manager queryCustomerWithObjectId:user.objectId UserId:user.userId customerName:name customerPhone:num certificate:nil visitDate:nil endDate:nil visitWay:nil orderLevel:nil tradeState:nil success:^(id data, NSDictionary *userInfo) {
                if(data&&[data isKindOfClass:[NSArray class]]){
                    NSArray* datas=(NSArray*)data;
                    for (CustomerInfoEntity* entity in datas) {
                        [self.customerInfos addObject:entity];
                    }
                    [self.tableView reloadData];
                }
                [Utils hiddenLoading];
                
            } faild:^(id data, NSDictionary *userInfo) {
                [Utils hiddenLoading];
                
            }];

        }
        if (self.segementControl.selectedSegmentIndex==1) {
             [Utils showLoading:@"正在搜索..."];
            self.customerInfos=nil;
            self.customerInfos=[NSMutableArray array];
            UserEntity* user=[ConfigManage getLoginUser];
            CustomerMainManager* manager=[[CustomerMainManager alloc]init];
            //
            [manager queryCustomerWithObjectId:user.objectId UserId:user.userId customerName:nil customerPhone:nil certificate:nil visitDate:self.startTime endDate:self.endTime visitWay:nil orderLevel:nil tradeState:nil success:^(id data, NSDictionary *userInfo) {
                if(data&&[data isKindOfClass:[NSArray class]]){
                    NSArray* datas=(NSArray*)data;
                    for (CustomerInfoEntity* entity in datas) {
                        [self.customerInfos addObject:entity];
                    }
                    [self.tableView reloadData];
                }
                [Utils hiddenLoading];
                
            } faild:^(id data, NSDictionary *userInfo) {
                [Utils hiddenLoading];
                
            }];
        }

        
    }else{
        [Utils showAlert:@"请输入搜索条件" title:@"温馨提示"];
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.segementControl.selectedSegmentIndex=0;
}
#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.customerInfos.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID=@"cell";
    CustomerTrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomerTrackTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
        cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
    }
    CustomerInfoEntity* entity=[self.customerInfos objectAtIndex:indexPath.row];
        cell.lb_userName.text=entity.customerName2;
        cell.lb_callBackType.text=entity.visitWay;
        cell.lb_lastTime.text=entity.visitDate;
        cell.contactPhoneNumber=entity.customerPhone;
    cell.sex=entity.customerSex;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomerTrackDetailViewController* vc=[[CustomerTrackDetailViewController alloc]init];
    vc.title=@"客户跟踪";
    if (self.customerInfos.count>0) {
        CustomerInfoEntity* customer=[self.customerInfos objectAtIndex:indexPath.row];
        NSLog(@"ID===%@",customer.customerId);
        vc.customer=customer;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)showAlertView{
    NSLog(@"showAlertView");
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
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
    
    UILabel* start=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 60, 30)];
    start.text=@"开始时间";
    start.textAlignment=NSTextAlignmentLeft;
    start.textColor=[UIColor blackColor];
    start.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:start];
    
    
    self.lb_startTime=[[UILabel alloc]initWithFrame:CGRectMake(80, 50, 100, 30)];
    self.lb_startTime.font=[UIFont systemFontOfSize:14.0];
    self.lb_startTime.tag=100;
    self.lb_startTime.text=self.startTime;
    self.lb_startTime.userInteractionEnabled=YES;
    self.lb_startTime.backgroundColor=[UIColor lightGrayColor];
    UITapGestureRecognizer* start_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDate:)];
    [self.lb_startTime addGestureRecognizer:start_tap];
    [backGroundView addSubview:self.lb_startTime];
    
    
    UILabel* end=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 60, 30)];
    end.text=@"结束时间";
    end.textAlignment=NSTextAlignmentLeft;
    end.textColor=[UIColor blackColor];
    end.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:end];
    
    self.lb_endTime=[[UILabel alloc]initWithFrame:CGRectMake(80, 90, 100, 30)];
    self.lb_endTime.tag=200;
    self.lb_endTime.text=self.endTime;
    self.lb_endTime.font=[UIFont systemFontOfSize:14.0];
    self.lb_endTime.userInteractionEnabled=YES;
    self.lb_endTime.backgroundColor=[UIColor lightGrayColor];
    UITapGestureRecognizer* end_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDate:)];
    [self.lb_endTime addGestureRecognizer:end_tap];
    [backGroundView addSubview:self.lb_endTime];
    
    
    al.containerView=backGroundView;
    NSArray* titles=@[@"关闭",@"查询"];
    al.buttonTitles=titles;
    al.delegate=self;
    [al show];
}
-(void)chooseDate:(UITapGestureRecognizer*) gesture{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    UIDatePicker* dp=[[UIDatePicker alloc]initWithFrame:CGRectMake(-20, 40, [UIScreen mainScreen].bounds.size.width, 216)];
    dp.datePickerMode=UIDatePickerModeDate;
    if (gesture.view.tag==100) {
        UILabel* lab=(UILabel*)gesture.view;
        dp.date=[frm dateFromString:lab.text];
    }
    if (gesture.view.tag==200) {
        UILabel* lab=(UILabel*)gesture.view;
        dp.date=[frm dateFromString:lab.text];
    }
    
    if (IOS8_OR_LATER) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择时间\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSDateFormatter * frm=[[NSDateFormatter alloc]init];
            [frm setDateFormat:@"YYYY-MM-dd"];
            if (gesture.view.tag==100) {
                
                ((UILabel*)gesture.view).text=[frm stringFromDate:dp.date];
            }
            if (gesture.view.tag==200) {
                ((UILabel*)gesture.view).text=[frm stringFromDate:dp.date];
            }
        }];
        [alertController.view addSubview:dp];
        [alertController addAction:cancleAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:[NSString stringWithFormat:@"请选择时间\n\n\n\n\n\n\n\n\n\n\n\n"] delegate:self cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [dp addTarget:self action:@selector(datePickerValueChanged:WithGesture:) forControlEvents:UIControlEventValueChanged];
        [sheet addSubview:dp];
        if (gesture.view.tag==100) {
            
            dp.minuteInterval=1;
        }
        if (gesture.view.tag==200) {
            dp.minuteInterval=2;
        }
        
        [sheet showFromToolbar:self.navigationController.toolbar];
    }
    
}
-(void)datePickerValueChanged:(UIDatePicker*)sender WithGesture:(UITapGestureRecognizer*)gesture
{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setDateFormat:@"YYYY-MM-dd"];
    if (sender.minuteInterval==1) {
        self.startTime=[frm stringFromDate:sender.date];
    }
    if (sender.minuteInterval==2) {
        self.endTime=[frm stringFromDate:sender.date];
    }
}
- (void)customIOS7dialogButtonTouchUpInside:(CustomIOS7AlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        [alertView close];
    }
    if (buttonIndex==1) {
        
        NSArray* arr=alertView.containerView.subviews;
        for (UIView *view in arr) {
            if (view.tag==100) {
                self.lb_startTime.text=((UILabel*)view).text;
                self.startTime=self.lb_startTime.text;
            
            }
            if (view.tag==200) {
                self.lb_endTime.text=((UILabel*)view).text;
                self.endTime=self.lb_endTime.text;
            }
        }
        self.tf_searchContent.text=[NSString stringWithFormat:@"%@--%@", self.lb_startTime.text,self.lb_endTime.text];
        [self searchAction:nil];
        [self.tableView reloadData];
        [alertView close];
    }
    
}

@end
