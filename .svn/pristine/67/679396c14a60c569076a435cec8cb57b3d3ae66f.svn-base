//
//  SiginOverTimeViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/28.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "SiginOverTimeViewController.h"
#import "SiginOverTimeTableViewCell.h"
#import "ConfigManage+Expand.h"
#import "CustomerMainManager.h"
#import "SignOverdueEntity.h"

@interface SiginOverTimeViewController ()
@property(nonatomic,strong) NSMutableArray* isContact;
@property(nonatomic,strong) NSMutableArray* isNotContact;
@end

@implementation SiginOverTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segementControl.selectedSegmentIndex=1;
    self.signInfos=nil;
    self.signInfos=[NSMutableArray array];
    [self initView];
    if ([self.mark isEqualToString:@"签约逾期"]) {
         [self loadOverData];
        
    }
    if ([self.mark isEqualToString:@"到期未付"]) {
        [self loadUnPayData];
    }
    if ([self.mark isEqualToString:@"即将到期"]) {
        [self loadWillOnData];
    }
    
}
-(void)loadOptionsData{
    self.isContact=nil;
    self.isContact=[NSMutableArray array];
    self.isNotContact=nil;
    self.isNotContact=[NSMutableArray array];
    if (self.segementControl.selectedSegmentIndex==0) {
        [self.tableView reloadData];
    }
    if (self.segementControl.selectedSegmentIndex==1) {
        for (SignOverdueEntity* entity in self.signInfos) {
            if (![entity.isConnection isEqualToString:@"是"]) {
                [self.isNotContact addObject:entity];
            }
        }
        [self.tableView reloadData];
    }
    
    if (self.segementControl.selectedSegmentIndex==2) {
        
        for (SignOverdueEntity* entity in self.signInfos) {
            if ([entity.isConnection isEqualToString:@"是"]) {
                [self.isContact addObject:entity];
            }
        }
        [self.tableView reloadData];
    }
}
- (IBAction)loadOptionsData:(id)sender {
    self.isContact=nil;
    self.isContact=[NSMutableArray array];
    self.isNotContact=nil;
    self.isNotContact=[NSMutableArray array];
    if (self.segementControl.selectedSegmentIndex==0) {
         [self.tableView reloadData];
    }
    if (self.segementControl.selectedSegmentIndex==1) {
        for (SignOverdueEntity* entity in self.signInfos) {
            if (![entity.isConnection isEqualToString:@"是"]) {
                [self.isNotContact addObject:entity];
            }
        }
        [self.tableView reloadData];
    }

    if (self.segementControl.selectedSegmentIndex==2) {
        
        for (SignOverdueEntity* entity in self.signInfos) {
            if ([entity.isConnection isEqualToString:@"是"]) {
                [self.isContact addObject:entity];
            }
        }
        [self.tableView reloadData];
    }
}
-(void)loadOverData{
    [Utils showLoading:@"正在加载数据..."];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
//    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    NSString* start=[frm stringFromDate:startDate];
    NSString* end=[frm stringFromDate:endDate];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager singedOverdueForCustomer:user.userId objectId:user.objectId startTime:start endTime:end success:^(id data, NSDictionary *userInfo) {
        NSLog(@"OverData=%@",data);
        NSArray* arr=(NSArray*)data;
        for (SignOverdueEntity* entiy in arr) {
            [self.signInfos addObject:entiy];
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
        [self loadOptionsData];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}
-(void)loadUnPayData{
    [Utils showLoading:@"正在加载数据..."];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    //    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    NSString* start=[frm stringFromDate:startDate];
    NSString* end=[frm stringFromDate:endDate];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager unPayForCustomer:user.userId objectId:user.objectId startTime:start endTime:end success:^(id data, NSDictionary *userInfo) {
        NSLog(@"unPayData=%@",data);
        NSArray* arr=(NSArray*)data;
        for (SignOverdueEntity* entiy in arr) {
            [self.signInfos addObject:entiy];
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
        [self loadOptionsData];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];

}
-(void)loadWillOnData{
    [Utils showLoading:@"正在加载数据..."];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    //    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    NSString* start=[frm stringFromDate:startDate];
    NSString* end=[frm stringFromDate:endDate];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager willOnTimeForCustomer:user.userId objectId:user.objectId startTime:start endTime:end success:^(id data, NSDictionary *userInfo) {
        NSLog(@"willOnData=%@",data);
        NSArray* arr=(NSArray*)data;
        for (SignOverdueEntity* entiy in arr) {
            [self.signInfos addObject:entiy];
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
        [self loadOptionsData];
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

    CGRect frame=self.tableView.frame;
    frame.size.height=[UIScreen mainScreen].bounds.size.height-frame.origin.y-108;
    self.tableView.frame=frame;
}
#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.segementControl.selectedSegmentIndex==0) {
        return self.signInfos.count;
    }
    if (self.segementControl.selectedSegmentIndex==1) {
        return self.isNotContact.count;
    }
    if (self.segementControl.selectedSegmentIndex==2) {
        return self.isContact.count;
    }
    return 0;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID=@"cell";
    if ([self.mark isEqualToString:@"签约逾期"]) {
        SiginOverTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil)
        {
            [tableView registerNib:[UINib nibWithNibName:@"SiginOverTimeTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
            cell=[tableView dequeueReusableCellWithIdentifier:cellID];
            
        }
        SignOverdueEntity* entity;
        if (self.segementControl.selectedSegmentIndex==0) {
            entity=[self.signInfos objectAtIndex:indexPath.row];
        }
        if (self.segementControl.selectedSegmentIndex==1) {
            entity=[self.isNotContact objectAtIndex:indexPath.row];
        }
        if (self.segementControl.selectedSegmentIndex==2) {
            entity=[self.isContact objectAtIndex:indexPath.row];
        }
        
        cell.userName.text=entity.customerName;
        cell.phoneNumber.text=entity.houseNum;
        cell.lastTrackDate.text=entity.signPlanDate;
        cell.contactId=entity.contactId;
        cell.contactPhoneNumber=entity.signPhone;
        cell.sex=entity.customerSex;
        cell.isContact=entity.isConnection;
        return cell;

    }
    if ([self.mark isEqualToString:@"到期未付"]) {
        UnPayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil)
        {
            [tableView registerNib:[UINib nibWithNibName:@"UnPayTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
            cell=[tableView dequeueReusableCellWithIdentifier:cellID];
            
        }
        SignOverdueEntity* entity;
        if (self.segementControl.selectedSegmentIndex==0) {
            entity=[self.signInfos objectAtIndex:indexPath.row];
        }
        if (self.segementControl.selectedSegmentIndex==1) {
            entity=[self.isNotContact objectAtIndex:indexPath.row];
        }
        if (self.segementControl.selectedSegmentIndex==2) {
            entity=[self.isContact objectAtIndex:indexPath.row];
        }
        
        cell.name.text=entity.customerName;
        cell.houseNum.text=entity.houseNum;
        cell.payType.text=entity.payType;
        cell.moneyCount.text=entity.moneyCount;
        cell.date.text=entity.signSubscriptionDate;
        cell.contactId=entity.contactId;
        cell.contactPhoneNumber=entity.signPhone;
        cell.sex=entity.customerSex;
        cell.isContact=entity.isConnection;
        return cell;

    }
    if ([self.mark isEqualToString:@"即将到期"]) {
        UnPayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil)
        {
            [tableView registerNib:[UINib nibWithNibName:@"UnPayTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
            cell=[tableView dequeueReusableCellWithIdentifier:cellID];
            
        }
        SignOverdueEntity* entity;
        if (self.segementControl.selectedSegmentIndex==0) {
            entity=[self.signInfos objectAtIndex:indexPath.row];
        }
        if (self.segementControl.selectedSegmentIndex==1) {
            entity=[self.isNotContact objectAtIndex:indexPath.row];
        }
        if (self.segementControl.selectedSegmentIndex==2) {
            entity=[self.isContact objectAtIndex:indexPath.row];
        }
        
        cell.name.text=entity.customerName;
        cell.houseNum.text=entity.houseNum;
        cell.payType.text=entity.payType;
        cell.moneyCount.text=entity.moneyCount;
        cell.date.text=entity.signSubscriptionDate;
        cell.contactId=entity.contactId;
        cell.contactPhoneNumber=entity.signPhone;
        cell.sex=entity.customerSex;
        cell.isContact=entity.isConnection;
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![self.mark isEqualToString:@"签约逾期"]) {
        return 200;
    }
    return 120;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

@end
