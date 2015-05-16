//
//  CustomerKeepController.m
//  FDC
//
//  Created by wlpiaoyi on 15/2/28.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerKeepController.h"
#import "CustomerInfoCell.h"
#import "CustomerMainManager.h"
#import "CreateNewCustomerViewController.h"
#import "CustomerKeepDetailController.h"
#import "CustomIOS7AlertView.h"

static NSString *CellIdentifier = @"CustomerInfoCell";

static UIColor *colorYellowBg;
static UIColor *colorBuleBg;

@interface CustomerKeepController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,CustomIOS7AlertViewDelegate>{
    BOOL isFirstLoad;
}
@property (weak, nonatomic) IBOutlet UITextField *textFieldSearch;
@property (weak, nonatomic) IBOutlet UIButton *buttonSearch;
@property (weak, nonatomic) IBOutlet UITableView *tableViewData;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UIButton *buttonPach;
@property (weak, nonatomic) IBOutlet UIButton *buttonName;
@property (weak, nonatomic) IBOutlet UIButton *buttonPhone;
@property (strong, nonatomic) NSArray *arrayData;
@property (strong, nonatomic) NSMutableArray *arraySelectedData;
@property (strong, nonatomic) CustomerMainManager *manager;
@property (nonatomic,strong) NSString* serachDate;
@property (nonatomic,strong) NSString* startTime;
@property (nonatomic,strong) NSString* endTime;
@property (nonatomic,strong) UILabel* lb_startTime;
@property (nonatomic,strong) UILabel* lb_endTime;
@end

@implementation CustomerKeepController
+(void) initialize{
    colorBuleBg = [UIColor colorWithRed:0.302 green:0.655 blue:0.851 alpha:1];
    colorYellowBg = [UIColor colorWithRed:1.000 green:0.816 blue:0.251 alpha:1];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"客户维护"];
    self.textFieldSearch.delegate=self;
    self.manager = [CustomerMainManager new];
    self.tableViewData.delegate = self;
    self.tableViewData.dataSource = self;
    self.arraySelectedData = [NSMutableArray new];
    // Do any additional setup after loading the view from its nib.
    UINib *nib = [UINib nibWithNibName:CellIdentifier bundle:nil];
    [self.tableViewData registerNib:nib forCellReuseIdentifier:CellIdentifier];
    
    [_buttonSearch setBackgroundImage:[UIImage imageWithColor:colorBuleBg] forState:UIControlStateNormal];

    [_buttonPach setTitle:@"提 交" forState:UIControlStateSelected];
    [_buttonPach addTarget:self action:@selector(onclickReturns)];
    [_buttonPach setBackgroundImage:[UIImage imageWithColor:colorBuleBg] forState:UIControlStateNormal];
    
    [_buttonSearch addTarget:self action:@selector(onclickSearch)];
    [_buttonName setBackgroundImage:[UIImage imageWithColor:colorYellowBg] forState:UIControlStateSelected];
    [_buttonName setBackgroundImage:[UIImage imageWithColor:colorBuleBg] forState:UIControlStateNormal];
    [_buttonPhone setBackgroundImage:[UIImage imageWithColor:colorYellowBg] forState:UIControlStateSelected];
    [_buttonPhone setBackgroundImage:[UIImage imageWithColor:colorBuleBg] forState:UIControlStateNormal];
    [_buttonName setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_buttonName setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonPhone setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_buttonPhone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_textFieldSearch setCornerRadiusAndBorder:1 BorderWidth:1 BorderColor:[UIColor colorWithHexString:@"222222FF"]];
    [_buttonName addTarget:self action:@selector(onclickName)];
    [_buttonPhone addTarget: self action:@selector(onclickPhone)];
    [_buttonAdd addTarget:self action:@selector(onclickAddCustomer)];
    [self onclickName];
    __weak typeof(self) weakself = self;
    [super setSELShowKeyBoardStart:nil End:^(CGRect keyBoardFrame) {
        [[weakself.view viewWithTag:547] setHidden:NO];
    }];
    [super setSELHiddenKeyBoardBefore:nil End:^(CGRect keyBoardFrame) {
        [[weakself.view viewWithTag:547] setHidden:YES];
    }];
    [self.view removeGestureRecognizer:self.tapGestureRecognizer];
    [[weakself.view viewWithTag:547] setHidden:YES];
    [[weakself.view viewWithTag:547] addGestureRecognizer:self.tapGestureRecognizer];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate new];
    self.startTime=[frm stringFromDate:startDate];
    self.endTime=[frm stringFromDate:startDate];
    
}
-(void) onclickName{
    _buttonName.selected = YES;
    _buttonPhone.selected = NO;
    self.textFieldSearch.text=@"";
}
-(void) onclickPhone{
    _buttonPhone.selected = YES;
    _buttonName.selected = NO;
    self.textFieldSearch.text=@"";
    [self showAlertView];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(isFirstLoad == false){
        [self searchDataWithParam:nil endTime:nil index:0];
        isFirstLoad = true;
    }
}
-(void) onclickReturns{
    UserEntity* user=[ConfigManage getLoginUser];
    if(self.buttonPach.selected == false){
        self.buttonPach.selected = true;
        return;
    }
    
    if(![self.arraySelectedData count]){
        PopUpDialogVendorView *pv = [PopUpDialogVendorView alertWithMessage:@"请选择客户" title:@"提示" onclickBlock:^BOOL(PopUpDialogVendorView *dialogView, NSInteger buttonIndex) {
            switch (buttonIndex) {
                case 1:
                {
                    self.buttonPach.selected = false;
                }
                    break;
                    
                default:
                    break;
            }
            return true;
        } buttonNames:@"确定",@"取消",nil];
        [pv show];
        return;
    }
    NSString *value = @"";
    for (CustomerInfoEntity *entity in self.arraySelectedData) {
        if(entity != self.arraySelectedData.firstObject){
            value = [value stringByAppendingString:@","];
        }
        value = [value stringByAppendingString:entity.customerId];
        
    }
    NSLog(@"value===%@",value);
    self.buttonPach.selected = false;
    [self.arraySelectedData removeAllObjects];
    [Utils showLoading:@"正在请求..."];
    [self.manager customerCallVisitWithIds:value UserName: user.userName success:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        [PYToast showWithText:@"提交成功!"];
        [self searchDataWithParam:@"" endTime:@"" index:0];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        [PYToast showWithText:@"网络异常!"];
    }];
    
}
-(void) onclickSearch{
    NSString *param = self.textFieldSearch.text;
    int falg = _buttonName.selected;
    [self searchDataWithParam:param endTime:nil index:falg];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _buttonName.selected = YES;
    _buttonPhone.selected = NO;
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
            int falg = _buttonName.selected;
//            [self searchDataWithParam:[frm stringFromDate:dp.date] index:falg];
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
     int falg = _buttonName.selected;
    self.lb_startTime.text=self.startTime;
    self.lb_endTime.text=self.endTime;
    [self searchDataWithParam:self.startTime endTime:self.endTime index:falg];
    
}

- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
-(void) searchDataWithParam:(NSString*) param endTime:(NSString* ) endTime index:(int) index{
    NSString *name = @"";
    NSString *phone = @"";
    NSString* date=@"";
    switch (index) {
        case 1:{
            if ([self isPureInt:self.textFieldSearch.text]) {
                name=@"";
                phone=self.textFieldSearch.text;
            }else{
                name=self.textFieldSearch.text;
                phone=@"";
            }
        }
            break;
        case 0:
            date=param;
            break;
        default:
            break;
    }
    [Utils showLoading:@"正在加载数据..."];
    UserEntity* user=[ConfigManage getLoginUser];
    __weak typeof(self) weakself = self;
    [self.manager queryCustomerWithObjectId:user.objectId UserId:user.userId customerName:name customerPhone:phone certificate:nil visitDate:date endDate:endTime visitWay:nil orderLevel:nil tradeState:nil success:^(id data, NSDictionary *userInfo) {
        if(data&&[data isKindOfClass:[NSArray class]]){
            weakself.arrayData = data;
        }
        [Utils hiddenLoading];
        
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        
    }];
}
-(void) setArrayData:(NSArray *)arrayData{
    _arrayData = arrayData;
    [self.tableViewData reloadData];
}
-(void) onclickAddCustomer{
    CreateNewCustomerViewController *vc = [[CreateNewCustomerViewController alloc] initWithNibName:@"CreateNewCustomerViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomerInfoEntity *entity = [self.arrayData objectAtIndex:indexPath.row];
    if(self.buttonPach.selected == false){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        CustomerKeepDetailController *c =[[CustomerKeepDetailController alloc] initWithNibName:@"CustomerKeepDetailController" bundle:nil];
        c.entity = entity;
        [self goNextController:c];
        return;
    }
    if([self.arraySelectedData containsObject:entity]){
        return;
    }
    [self.arraySelectedData addObject:entity];
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.buttonPach.selected == false){
        return;
    }
    CustomerInfoEntity *entity = [self.arrayData objectAtIndex:indexPath.row];
    if([self.arraySelectedData containsObject:entity]){
        [self.arraySelectedData removeObject:entity];
    }
    
}


#pragma dataresource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomerInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    CustomerInfoEntity *entity = [self.arrayData objectAtIndex:indexPath.row];
    cell.entity = entity;
    cell.sex=entity.customerSex;
    return cell;
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
                
            }
            if (view.tag==200) {
                 self.lb_endTime.text=((UILabel*)view).text;
            }
        }
        self.textFieldSearch.text=[NSString stringWithFormat:@"%@--%@", self.lb_startTime.text,self.lb_endTime.text];
        [self searchDataWithParam:self.lb_startTime.text endTime:self.lb_endTime.text index:0];
        [self.tableViewData reloadData];
        [alertView close];
    }
    
}

@end
