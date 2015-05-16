//
//  MyUpComingViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "MyUpComingViewController.h"
#import "CustomerBirthdayDetailViewController.h"
#import "CustomerTrackViewController.h"
#import "SiginOverTimeViewController.h"
#import "CustomerMainManager.h"
#import "UserEntity.h"
#import "ConfigManage+Expand.h"
#import "CustomerBirthdayEntity.h"
#import "SignOverdueEntity.h"

@interface MyUpComingViewController ()
@property(nonatomic,strong) NSMutableArray* birthdayInfos;
@property(nonatomic,strong) NSMutableArray* trackInfos;
@property(nonatomic,strong) NSMutableArray* signOverInfos;
@property(nonatomic,strong) NSMutableArray* unPayInfos;
@property(nonatomic,strong) NSMutableArray* willOnInfos;
@end

@implementation MyUpComingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDatas];
    [self addTapActionOnViews];
    self.upComingCount.text=self.totalCount;
//    [self loadData];
    // Do any additional setup after loading the view from its nib.
}
-(void)initDatas{
    self.birthdayInfos=nil;
    self.birthdayInfos=[NSMutableArray array];
    self.trackInfos=nil;
    self.trackInfos=[NSMutableArray array];
    self.signOverInfos=nil;
    self.signOverInfos=[NSMutableArray array];
    self.unPayInfos=nil;
    self.unPayInfos=[NSMutableArray array];
    self.willOnInfos=nil;
    self.willOnInfos=[NSMutableArray array];
    LableEntity* lb =[self.upComeInfos objectAtIndex:0];
    self.lb_birthdayCount.text=lb.value;
    lb =[self.upComeInfos objectAtIndex:1];
    self.lb_trackCount.text=lb.value;
    lb =[self.upComeInfos objectAtIndex:2];
    self.lb_siginCount.text=lb.value;
    lb =[self.upComeInfos objectAtIndex:3];
    self.lb_unPayCount.text=lb.value;
    lb =[self.upComeInfos objectAtIndex:4];
    self.lb_willOnTimeCount.text=lb.value;
}
-(void)addTapActionOnViews{
    UITapGestureRecognizer* tap_birthday=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToCustomerBirthday)];
    UITapGestureRecognizer* tap_track=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToTrackDetails)];
    UITapGestureRecognizer* tap_sigin=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToSignDetails)];
    UITapGestureRecognizer* tap_unpay=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToUnPayDetails)];
    UITapGestureRecognizer* tap_willontime=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToWillOnTimeDetails)];
    [self.customerBirthdayView addGestureRecognizer:tap_birthday];
    [self.customerTrackView addGestureRecognizer:tap_track];
    [self.overTimeSiginView addGestureRecognizer:tap_sigin];
    [self.unPayView addGestureRecognizer:tap_unpay];
    [self.willOnTimeView addGestureRecognizer:tap_willontime];
}
-(void)goToCustomerBirthday{
    NSLog(@"goToCustomerBirthday");
    CustomerBirthdayDetailViewController* vc=[[CustomerBirthdayDetailViewController alloc]init];
    vc.title=@"客户生日";
    vc.infoCounts=self.lb_birthdayCount.text;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)goToTrackDetails{
    NSLog(@"goToTrackDetails");
    CustomerIndexTrackViewController* vc=[[CustomerIndexTrackViewController alloc]init];
    vc.title=@"客户跟踪";
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)goToSignDetails{
    SiginOverTimeViewController* vc=[[SiginOverTimeViewController alloc]init];
    vc.title=@"签约逾期";
    vc.mark=@"签约逾期";
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"goToSignDetails");
}
-(void)goToUnPayDetails{
    SiginOverTimeViewController* vc=[[SiginOverTimeViewController alloc]init];
    vc.title=@"到期未付";
    vc.mark=@"到期未付";
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"goToUnPayDetails");
}
-(void)goToWillOnTimeDetails{
    SiginOverTimeViewController* vc=[[SiginOverTimeViewController alloc]init];
    vc.title=@"即将到期";
    vc.mark=@"即将到期";
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"goToWillOnTimeDetails");
}
- (IBAction)birthdayAction:(id)sender {
    [self goToCustomerBirthday];
}
- (IBAction)trackAction:(id)sender {
    [self goToTrackDetails];
}
- (IBAction)siginAction:(id)sender {
    [self goToSignDetails];
}
- (IBAction)unPayAction:(id)sender {
    [self goToUnPayDetails];
}
- (IBAction)onTimeAction:(id)sender {
    [self goToWillOnTimeDetails];
}
-(void)loadData{
   
    //客户生日
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager birthDayForCustomerWithObjectId:user.objectId UserId:user.userId success:^(id data, NSDictionary *userInfo) {
        NSLog(@"birthdayData===%@",data);
        NSArray* datas=(NSArray*)data;
        for (CustomerBirthdayEntity* entity in datas) {
            [self.birthdayInfos addObject:entity];
        }
        
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];

    
}
@end
