//
//  CustomerBirthdayDetailViewController.h
//  FDC
//
//  Created by NewDoone on 15/1/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"

@interface CustomerBirthdayDetailViewController : FDCController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lb_birthdayCount;
@property (weak, nonatomic) IBOutlet UIButton *btn_selectAll;
@property (weak, nonatomic) IBOutlet UIButton *btn_sendGroupMessage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSString * infoCounts;
@end
