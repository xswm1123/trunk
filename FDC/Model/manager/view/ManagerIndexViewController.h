//
//  ManagerIndexViewController.h
//  FDC
//
//  Created by NewDoone on 15/1/13.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <CommonSDK/CommonSDK.h>
#import "MCProgressBarView.h"
#import "FDCController.h"
#import "ConfigManage+Expand.h"
#import "UserManager.h"

@interface ManagerIndexViewController : FDCController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *buildingName;
@property (weak, nonatomic) IBOutlet UIButton *todayDateBtn;
@property (weak, nonatomic) IBOutlet UIButton *customBtn;
@property (weak, nonatomic) IBOutlet UILabel *fromDate;
@property (weak, nonatomic) IBOutlet UILabel *toDate;
@property (weak, nonatomic) IBOutlet UIView *mostSellView;
@property (weak, nonatomic) IBOutlet UIView *sellPlanView;
@property (nonatomic,strong) MCProgressBarView * forthSeasonView;
@property (nonatomic,strong) MCProgressBarView * thirdSeasonView;
@property (nonatomic,strong) MCProgressBarView * secondSeasonView;
@property (nonatomic,strong) MCProgressBarView * firstSeasonView;

@end
