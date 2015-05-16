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
@interface CustomerTrackViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf_searchContent;
@property(nonatomic,strong) NSMutableArray* customerInfos;
@property(nonatomic,strong) NSString* searchDate;

@end

@implementation CustomerTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self loadData];
    [self setTitle:@"跟踪"];
    self.tf_searchContent.delegate=self;
//    self.tableView.allowsSelection=NO;
    // Do any additional setup after loading the view from its nib.
}
-(void)loadData{
    [Utils showLoading:@"正在加载数据..."];
    self.customerInfos=nil;
    self.customerInfos=[NSMutableArray array];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager queryCustomerWithObjectId:user.objectId UserId:user.userId customerName:nil customerPhone:nil certificate:nil visitDate:nil visitWay:nil orderLevel:nil tradeState:nil success:^(id data, NSDictionary *userInfo) {
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
            [self chooseDate];
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
            [self searchAction:nil];
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
-(void)datePickerValueChanged:(UIDatePicker*)sender WithGesture:(UITapGestureRecognizer*)gesture
{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setDateFormat:@"YYYY-MM-dd"];
    self.searchDate=[frm stringFromDate:sender.date];
//    [self searchAction:nil];
}
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
            [manager queryCustomerWithObjectId:user.objectId UserId:user.userId customerName:name customerPhone:num certificate:nil visitDate:nil visitWay:nil orderLevel:nil tradeState:nil success:^(id data, NSDictionary *userInfo) {
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
            [manager queryCustomerWithObjectId:user.objectId UserId:user.userId customerName:nil customerPhone:nil certificate:nil visitDate:self.searchDate visitWay:nil orderLevel:nil tradeState:nil success:^(id data, NSDictionary *userInfo) {
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

@end
