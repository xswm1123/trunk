//
//  CustomerIndexTrackViewController.m
//  FDC
//
//  Created by NewDoone on 15/4/3.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerIndexTrackViewController.h"
#import "CustomerMainManager.h"
#import "CustomerTrackTableViewCell.h"
#import "CustomerTrackDetailViewController.h"
#import "CustomerIndexTrackTableViewCell.h"

@interface CustomerIndexTrackViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray* customerInfos;
@end

@implementation CustomerIndexTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"跟踪待办"];
    [self loadData];
}

-(void)loadData{
    [Utils showLoading:@"正在加载数据..."];
    self.customerInfos=nil;
    self.customerInfos=[NSMutableArray array];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager followUpForCustomerWithName:nil visitDate:nil orderLevel:nil customerType:nil objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSLog(@"data==%@",data);
        NSArray* datas=(NSArray*)data;
        for (NSDictionary* entity in datas) {
            [self.customerInfos addObject:entity];
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
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
    CustomerIndexTrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomerIndexTrackTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
        cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
    }
    NSDictionary* entity=[self.customerInfos objectAtIndex:indexPath.row];
    cell.name.text=[entity objectForKey:@"KH_QRXM"];
//    cell.followType.text=[entity objectForKey:@"KH_GZFS"];
//    cell.followDtae.text=[entity objectForKey:@"KH_LFRQ"];
    cell.followType.text=[entity objectForKey:@"kh_JHGZFS"];
    cell.followDtae.text=[entity objectForKey:@"KH_JHGZRQ"];
    cell.phoneNumber.text=[entity objectForKey:@"KH_QRDH"];
    cell.sex=[entity objectForKey:@"KH_KHXB"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 114;
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
        NSDictionary* customer=[self.customerInfos objectAtIndex:indexPath.row];
        vc.dic_customer=customer;
        vc.mark=@"index";
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end


