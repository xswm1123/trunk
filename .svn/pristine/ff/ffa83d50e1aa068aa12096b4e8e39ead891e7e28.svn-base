//
//  SellInfosViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/18.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "SellInfosViewController.h"
#import "AdminManager.h"
#import "SellInfosTableViewCell.h"

@interface SellInfosViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray * files;
@end

@implementation SellInfosViewController
-(NSMutableArray *)images{
    if (!_files) {
        _files=[NSMutableArray array];
    }
    return _files;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.files=nil;
    self.files=[NSMutableArray array];
    [self loadData];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
}
-(void)loadData{
   
//    UserEntity* user=[ConfigManage getLoginUser];
    AdminManager * manager=[[AdminManager alloc]init];
    [manager queryMarketAndWikiWithFilesType:@"xsbk" success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (NSDictionary* dic in arr) {
            [self.files addObject:dic];
        }
        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}
#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
       return self.files.count;
   
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID=@"cell";
    SellInfosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"SellInfosTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
        cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
    }
    NSDictionary* dic=[self.files objectAtIndex:indexPath.row];
    cell.fileName.text=[dic objectForKey:@"ZD_ZDMC"];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"销售百科";
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* dic=[self.files objectAtIndex:indexPath.row];
    NSString* urlStr=[dic objectForKey:@"ZD_ZDVAL"];
    NSString* URL=[NSString stringWithFormat:@"%@%@",URL_FOR_TOOLS,urlStr];
    if ([urlStr hasSuffix:@"jpg"]) {
        TempOpenImageViewController* vc=[[TempOpenImageViewController alloc]init];
        vc.title=[dic objectForKey:@"ZD_ZDMC"];
        vc.imageURL=URL;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
@end
