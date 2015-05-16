//
//  CustomerTrackDetailViewController.h
//  FDC
//
//  Created by NewDoone on 15/1/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"
#import "CustomerFollowUpEntity.h"
#import "CustomerFollowUpRvisitEntity.h"
#import "CustomerEntity.h"

@interface CustomerTrackDetailViewController : FDCController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *callBackType;
@property (weak, nonatomic) IBOutlet UILabel *firstInterviewTime;
@property (weak, nonatomic) IBOutlet UILabel *houseAddress;
@property (weak, nonatomic) IBOutlet UILabel *payStatus;
@property (weak, nonatomic) IBOutlet UITableView *callBackTableView;
@property (weak, nonatomic) IBOutlet UITableView *callBackHistroyTableView;
@property (weak, nonatomic) IBOutlet UILabel *lastTrackDate;

@property(nonatomic,strong) CustomerInfoEntity* customer;
@property(nonatomic,strong) NSDictionary* dic_customer;
@property(nonatomic,strong) NSString* mark;
@end
