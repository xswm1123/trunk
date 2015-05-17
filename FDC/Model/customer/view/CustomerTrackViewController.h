//
//  CustomerTrackViewController.h
//  FDC
//
//  Created by NewDoone on 15/1/23.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"

@interface CustomerTrackViewController : FDCController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segementControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
