//
//  CustomerCheckViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/29.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerCheckViewController.h"
#import "VerifyIDCardNumberManagerTool.h"
#import "CustomerCheckTableViewCell.h"
#import "ConfigManage+Expand.h" 
#import "CustomerMainManager.h"
@interface CustomerCheckViewController ()<UIAlertViewDelegate>
{
    UserEntity* cellUser;
}
@property(nonatomic,strong)NSMutableArray* customers;
@property (weak, nonatomic) IBOutlet UIButton *checkBtn;
@property(nonatomic,strong) NSString* objectId;
@end

@implementation CustomerCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
    // Do any additional setup after loading the view from its nib.
}
-(NSMutableArray *)customers{
    if (!_customers) {
        _customers=[NSMutableArray array];
    }
    return _customers;
}
-(void)loadData{
    [Utils showLoading:@"正在验证..."];
    self.customers=nil;
    self.customers=[NSMutableArray array];
//    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager verificationForCustomerWithObjectId:self.objectId customerName:self.tf_customerName.text customerPhone:self.tf_customerPhoneNumber.text certificate:self.tf_customerID.text success:^(id data, NSDictionary *userInfo) {
        NSLog(@"data===%@",data);
        [Utils hiddenLoading];
        NSArray* arr=(NSArray*)data;
        if (arr.count>0) {
            for (CustomerVerificationEntity* customer in arr) {
                [self.customers addObject:customer];
            }
            [self.tableView reloadData];
        }else{
             [Utils showAlert:@"暂无数据" title:@"温馨提示"];
        }
         self.checkBtn.enabled=YES;
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        [Utils showAlert:@"暂无数据" title:@"温馨提示"];
         self.checkBtn.enabled=YES;
    }];
     
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==100) {
        if (buttonIndex==0) {
            [self.tableView reloadData];
        }
    }
}
-(void)initView{
    CGRect frame=self.tableView.frame;
    frame.size.height=[UIScreen mainScreen].bounds.size.height-self.tf_customerID.frame.size.height-self.tf_customerID.frame.origin.y-104;
    self.tableView.frame=frame;
}
-(void)initData{
    self.projectNames=nil;
    self.projectNames=[NSMutableArray array];
    UserEntity* user=[ConfigManage getLoginUser];
    NSArray* arr=user.authorityInfoObjectGroup;
    NSDictionary* dic=[arr firstObject];
    self.projectName.text=[dic objectForKey:@"WY_WYMC"];
    self.objectId=[dic objectForKey:@"WY_WYID"];
    for (NSDictionary* dics in arr) {
        [self.projectNames addObject:[dics objectForKey:@"WY_WYMC"]];
    }
}
- (IBAction)checkCustomerIDNumber:(id)sender {
    
    if (!([NSString isEnabled:self.tf_customerName.text]||[NSString isEnabled:self.tf_customerPhoneNumber.text]||[NSString isEnabled:self.tf_customerID.text])) {
        UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"提示" message:@"姓名、号码、身份证至少填一个" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [al show];
    }else{
        self.checkBtn.enabled=NO;
        [self loadData];
    }
}
- (IBAction)showProjetNameList:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.projectNames];
    view.delegate=self;
    [view showInView:self.view.window animated:YES];
    
}
#pragma popListViewDelegate
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex{
    self.projectName.text=[self.projectNames objectAtIndex:anIndex];
    UserEntity* user=[ConfigManage getLoginUser];
    NSArray* arr=user.authorityInfoObjectGroup;
    NSDictionary* dic=[arr objectAtIndex:anIndex];
    self.objectId=[dic objectForKey:@"WY_WYID"];
}
#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.customers.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID=@"cell";
    CustomerCheckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomerCheckTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
        cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
    }
    if (self.customers.count>0) {
        CustomerVerificationEntity* customer=[self.customers objectAtIndex:indexPath.row];
        cell.userName.text=customer.customerName;
        cell.firstDate.text=customer.customerVisitDate;
        cell.callBackType.text=customer.customerVisitWay;
        cell.sellerName.text=customer.sellerName;
        cell.sex=customer.customerSex;
        cell.groupType.text=customer.sellerGroup;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

@end
