//
//  CustomerBirthdayDetailViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerBirthdayDetailViewController.h"
#import "CustomerBirthdayDetailTableViewCell.h"
#import "CustomerMainManager.h"
#import "ConfigManage+Expand.h"

@interface CustomerBirthdayDetailViewController ()
@property(nonatomic,strong)NSMutableArray* phoneNumbers;
@property(nonatomic,strong)NSMutableArray* customerBirthdayInfos;
@end
static NSInteger pressBtnCounts;
@implementation CustomerBirthdayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lb_birthdayCount.text=self.infoCounts;
    self.tableView.delegate=self;
    self.tableView.allowsSelection=YES;
    self.tableView.allowsMultipleSelection=YES;
    [self initView];
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}
-(void)loadData{
    [Utils showLoading:@"正在加载数据..."];
    self.phoneNumbers=nil;
    self.phoneNumbers=[NSMutableArray array];
    self.customerBirthdayInfos=nil;
    self.customerBirthdayInfos=[NSMutableArray array];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager birthDayForCustomerWithObjectId:user.objectId UserId:user.userId success:^(id data, NSDictionary *userInfo) {
        NSLog(@"birthdayData===%@",data);
        NSArray* datas=(NSArray*)data;
        for (NSDictionary* entity in datas) {
            [self.customerBirthdayInfos addObject:entity];
//            [self.phoneNumbers addObject:@"KH_MOBILE"];
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
         [Utils hiddenLoading];
    }];

}
-(void)initView{
    CGRect frame=self.tableView.frame;
         frame=CGRectMake(0, self.btn_selectAll.frame.origin.y+self.btn_selectAll.frame.size.height+5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-frame.origin.y-self.navigationController.toolbar.frameHeight-64);
 
    self.tableView.frame=frame;
}

- (IBAction)selectAllAction:(id)sender {
    pressBtnCounts++;
    self.tableView.allowsSelection=YES;
    self.tableView.allowsMultipleSelection=YES;
    NSArray* cells=[self.tableView visibleCells];
    for (UITableViewCell* cell in cells) {
        cell.selected=YES;
        if (pressBtnCounts%2==0) {
            cell.selected=NO;
            self.tableView.allowsSelection=NO;
            self.tableView.allowsMultipleSelection=NO;
        }
    }
}
- (IBAction)sendGroupMessageAction:(id)sender {
    self.phoneNumbers=nil;
    self.phoneNumbers=[NSMutableArray array];
    NSArray* cells=[self.tableView visibleCells];
    for (CustomerBirthdayDetailTableViewCell* cell in cells) {
        if (cell.selected==YES) {
            [self.phoneNumbers addObject:cell.phoneNumber];
        }
    }
    if (self.phoneNumbers.count>0) {
         [TelephoneCenter requestSMSWithRecipients:self.phoneNumbers message:@""];
    }else{
        [Utils showAlert:@"请选择客户" title:@"温馨提示"];
    }
  
}
#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.customerBirthdayInfos.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID=@"cell";
    CustomerBirthdayDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomerBirthdayDetailTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
        cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
    }
    NSDictionary* dic=[self.customerBirthdayInfos objectAtIndex:indexPath.row];
    cell.userName.text=[dic objectForKey:@"KH_KHXM"];
    cell.birthDate.text=[dic objectForKey:@"KH_KHSR"];
    cell.payStatus.text=[dic objectForKey:@"HT_HTLX"];
    cell.mindLevel.text=[dic objectForKey:@"KH_YXCD"];
    cell.phoneNumber=[dic objectForKey:@"KH_MOBILE"];
    cell.sex=[dic objectForKey:@"KH_KHXB"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
@end
