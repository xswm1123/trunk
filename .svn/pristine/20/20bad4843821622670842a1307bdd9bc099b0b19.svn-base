//
//  SearchFilesViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/28.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "SearchFilesViewController.h"
#import "AdminManager.h"
#import "upLoadFilesViewController.h"

@interface SearchFilesViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf_searchField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray * houseNums;
@property (nonatomic,strong) NSString* customerName;
@end

@implementation SearchFilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tf_searchField.delegate=self;
    self.houseNums=nil;
    self.houseNums=[NSMutableArray array];
}
- (IBAction)searchAction:(id)sender {
//    if (![NSString isEnabled:self.tf_searchField.text]) {
//        [Utils showAlert:@"请输入搜索内容!" title:@"温馨提示"];
//    }else{
    [Utils showLoading:@"正在搜索..."];
        self.customerName=self.tf_searchField.text;
    AdminManager * manager=[[AdminManager alloc]init];
    [manager serachUpLoadFilesWithContactId:self.tf_searchField.text success:^(id data, NSDictionary *userInfo) {
        NSLog(@"data==%@",data);
        NSArray* arr=(NSArray*)data;
        for (NSDictionary* dic in arr) {
            [self.houseNums addObject:dic];
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
//    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.houseNums.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSDictionary* dic=[self.houseNums objectAtIndex:indexPath.row];
    cell.textLabel.text=[dic objectForKey:@"FW_FWBH"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (self.houseNums.count>0) {
        return @"点击房屋编号上传文件";
    }
    return @"暂无房屋编号，请搜索";
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* dic=[self.houseNums objectAtIndex:indexPath.row];
    upLoadFilesViewController* vc=[[upLoadFilesViewController alloc]init];
    vc.title=@"上传资料";
    vc.customerName=[dic objectForKey:@"FW_FWBH"];
    vc.info=dic;
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
