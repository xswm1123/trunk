//
//  ManagerIndexViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/13.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "ManagerIndexViewController.h"
#import "AdminManager.h"
#import "ConfigManage+Expand.h"
#import "UserEntity.h"
#import "CustomIOS7AlertView.h"
#import "LoginController.h"

@interface ManagerIndexViewController ()<CustomIOS7AlertViewDelegate,LeveyPopListViewDelegate>
@property(nonatomic,strong) NSMutableArray* projectNames;
@property (nonatomic,strong) NSMutableArray* projectIds;
@property (nonatomic,strong) NSMutableArray* JCs;
@property (weak, nonatomic) IBOutlet UIView *detailsView;
@property (nonatomic,strong) MCProgressBarView * phoneIn;
@property (nonatomic,strong) MCProgressBarView * visit;
@property (nonatomic,strong) MCProgressBarView * sureBuy;
@property (nonatomic,strong) MCProgressBarView * contactBuy;
@property (nonatomic,strong) MCProgressBarView * sureCount;
@property (nonatomic,strong) MCProgressBarView * contactCount;
@property (nonatomic,strong) MCProgressBarView * shouldPay;
@property (nonatomic,strong) MCProgressBarView * accturllyPay;

@property (weak, nonatomic) IBOutlet UILabel *houseNo1;
@property (weak, nonatomic) IBOutlet UILabel *houseNo2;
@property (weak, nonatomic) IBOutlet UILabel *houseNo3;
@property (weak, nonatomic) IBOutlet UILabel *houseNo1Name;
@property (weak, nonatomic) IBOutlet UILabel *houseNo2Name;
@property (weak, nonatomic) IBOutlet UILabel *houseNo3Name;

@property(nonatomic,strong) UILabel* tempLb1;
@property(nonatomic,strong) UILabel* tempLb2;
@property (weak, nonatomic) IBOutlet UIView *houseNumSubView;
@property (weak, nonatomic) IBOutlet UILabel *lb_noData;
@property (nonatomic,strong) NSString* updateUrl;
@property (weak, nonatomic) IBOutlet UIView *firstView_mostSell;
@property (weak, nonatomic) IBOutlet UIView *secondView_mostSell;
@property (weak, nonatomic) IBOutlet UIView *thirdView_mostSell;



@end

@implementation ManagerIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self checkUpdateState];
    /*
     hiddenCaculateView
     */
    self.lb_noData.hidden=YES;
    self.firstView_mostSell.hidden=YES;
    self.secondView_mostSell.hidden=YES;
    self.thirdView_mostSell.hidden=YES;
    /*
        hiddenEnd
     */
    
    self.photoView.layer.cornerRadius=35;
    self.photoView.clipsToBounds=YES;
    UIBarButtonItem*rightBar= [self createButtonItemLogout:@selector(logoutAction)];
    UIBarButtonItem*leftBar=[self createButtonItemSelecteObject:@selector(selectObejct)];
    self.navigationItem.rightBarButtonItem=rightBar;
    self.navigationItem.leftBarButtonItem=leftBar;
    
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate new];
//    NSDate* endDate=[NSDate getLastDayOfWeek];
    NSString* start=[frm stringFromDate:startDate];
//    NSString* end=[frm stringFromDate:endDate];
    self.fromDate.text=start;
    self.toDate.text=start;
    [self loadDataWithStartDate:start EndDate:start];
}

-(void)checkUpdateState{
    NSString *key = (NSString *)kCFBundleVersionKey;
    //    //取出上次使用的版本号
    //    NSString *lastVersionCode = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //加载程序中的info.plist
    NSString *currentVersionCode = [NSBundle mainBundle].infoDictionary[key];
    NSLog(@"currentVersionCode:%@",currentVersionCode);
    
    UserManager* manager=[[UserManager alloc]init];
    [manager checkUpdateStateWithVersion:currentVersionCode success:^(id data, NSDictionary *userInfo) {
        NSLog(@"versionData:%@",data);
        self.updateUrl=(NSString*)data;
        if (self.updateUrl.length>0) {
//            self.updateUrl=(NSString*)data;
            UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"更新提示" message:@"当前版本过低，需要更新!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            al.tag=199;
            [al show];
        }
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}

// 退出程序
- (void)exitApplication
{
    UIWindow *window =  [UIApplication sharedApplication].delegate.window;
    [UIView animateWithDuration:0.5f animations:^
     {
         window.alpha = 0;
         window.frame = CGRectMake(CGRectGetWidth(window.frame)/2,CGRectGetHeight(window.frame)/2,1, 1);
     }
                     completion:^(BOOL finished)
     {
         exit(0);
     }];
}

-(void)logoutAction{
    UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"确定要注销此账号？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    al.tag=90;
    [al show];
}

-(void)selectObejct{
    self.projectNames=nil;
    self.projectNames=[NSMutableArray array];
    self.projectIds=nil;
    self.projectIds=[NSMutableArray array];
    self.JCs=nil;
    self.JCs=[NSMutableArray array];
    UserEntity* user=[ConfigManage getLoginUser];
    NSArray* arr=user.authorityInfoObjectGroup;
    for (NSDictionary* dics in arr) {
        [self.projectNames addObject:[dics objectForKey:@"WY_WYMC"]];
        [self.projectIds addObject:[dics objectForKey:@"WY_WYID"]];
        [self.JCs addObject:@"WY_WYJC"];
    }
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择项目名称" options:self.projectNames];
    view.delegate=self;
    [view showInView:self.view.window animated:YES];
}
-(void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex{
    self.buildingName.text=[self.projectNames objectAtIndex:anIndex];
    UserEntity* user=[ConfigManage getLoginUser];
    user.objectName=[self.projectNames objectAtIndex:anIndex];
    user.objectId=[self.projectIds objectAtIndex:anIndex];
    user.businessSimpleName=[self.JCs objectAtIndex:anIndex];
    [ConfigManage setLoginUser:user];
//    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
//    [frm setDateFormat:@"yyyy-MM-dd"];
//    NSDate* startDate=[NSDate new];
//    NSString* start=[frm stringFromDate:startDate];
//    self.fromDate.text=start;
//    self.toDate.text=start;
    [self loadDataWithStartDate:self.fromDate.text EndDate:self.toDate.text];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==90) {
        if (buttonIndex==1) {
            LoginController* vc=[[LoginController alloc]init];
            vc.mark=@"logout";
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
    }
    
    if (alertView.tag==199) {
        if (buttonIndex==0) {
            
        }
        if (buttonIndex==1) {
            NSString* url=[NSString stringWithFormat:@"itms-services://?action=download-manifest&url=%@",self.updateUrl];
            NSLog(@"url====%@",url);
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
            [self exitApplication];
            
        }

    }
}
-(void)initView{
    UserEntity* user=[ConfigManage getLoginUser];
    self.userName.text=user.sellerName;
    self.buildingName.text=user.objectName;
    self.title=@"首页";
    self.scrollView.frame=[UIScreen mainScreen].bounds;
    CGRect frame =self.scrollView.frame;
    frame.size.height=frame.size.height-self.navigationController.toolbar.frameHeight;
    self.scrollView.frame=frame;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator =NO;
    self.scrollView.bounces=NO;
    self.detailsView.frame=CGRectMake(8, 236, [UIScreen mainScreen].bounds.size.width-16, 200);
    //view

    
    self.sellPlanView.frame=CGRectMake(8, self.mostSellView.frame.origin.y+self.mostSellView.frame.size.height+20, [UIScreen mainScreen].bounds.size.width-16, 180);
    //detailsView
//     CGFloat detailViewWith=self.sellPlanView.frame.size.width;
    self.phoneIn=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 5, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.phoneIn.progress=1;
    self.phoneIn.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
    self.phoneIn.right_valueLabel.frame=CGRectMake(self.phoneIn.frame.size.width-110, 0, 100, 30);
    self.phoneIn.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.phoneIn configLabelWithLeftName:@"来电" leftValue:nil rightName:nil rightValue:@"0个" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.phoneIn];
    
    self.visit=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 40, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.visit.progress=1;
    self.visit.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
    self.visit.right_valueLabel.frame=CGRectMake(self.visit.frame.size.width-110, 0, 100, 30);
    self.visit.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.visit configLabelWithLeftName:@"来访" leftValue:nil rightName:nil rightValue:@"0个" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.visit];
    
    self.sureBuy=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 75, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.sureBuy.progress=1;
    self.sureBuy.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
    self.sureBuy.right_valueLabel.frame=CGRectMake(self.sureBuy.frame.size.width-110, 0, 100, 30);
    self.sureBuy.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.sureBuy configLabelWithLeftName:@"认购" leftValue:nil rightName:nil rightValue:@"0套" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.sureBuy];
    
    self.contactBuy=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 110, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.contactBuy.progress=1;
    self.contactBuy.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
    self.contactBuy.right_valueLabel.frame=CGRectMake(self.contactBuy.frame.size.width-110, 0, 100, 30);
    self.contactBuy.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.contactBuy configLabelWithLeftName:@"契约" leftValue:nil rightName:nil rightValue:@"0套" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.contactBuy];
    
    self.sureCount=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 145, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.sureCount.progress=1;
    self.sureCount.left_nameLabel.frame=CGRectMake(10, 0, 80, 30);
    self.sureCount.right_valueLabel.frame=CGRectMake(self.sureCount.frame.size.width-110, 0, 100, 30);
    self.sureCount.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.sureCount configLabelWithLeftName:@"认购金额" leftValue:nil rightName:nil rightValue:@"0万元" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.sureCount];

    self.contactCount=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 180, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.contactCount.progress=1;
    self.contactCount.left_nameLabel.frame=CGRectMake(10, 0, 80, 30);
    self.contactCount.right_valueLabel.frame=CGRectMake(self.contactCount.frame.size.width-110, 0, 100, 30);
    self.contactCount.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.contactCount configLabelWithLeftName:@"契约金额" leftValue:nil rightName:nil rightValue:@"0万元" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.contactCount];
    
    self.shouldPay=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 215, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.shouldPay.progress=1;
    self.shouldPay.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
    self.shouldPay.right_valueLabel.frame=CGRectMake(self.shouldPay.frame.size.width-90, 0, 80, 30);
    self.shouldPay.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.shouldPay configLabelWithLeftName:@"应收款" leftValue:nil rightName:nil rightValue:@"0万元" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.shouldPay];
    
    self.accturllyPay=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 250, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.accturllyPay.progress=1;
    self.accturllyPay.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
    self.accturllyPay.right_valueLabel.frame=CGRectMake(self.accturllyPay.frame.size.width-110, 0, 100, 30);
    self.accturllyPay.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.accturllyPay configLabelWithLeftName:@"实收款" leftValue:nil rightName:nil rightValue:@"0万元" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
    [self.detailsView addSubview:self.accturllyPay];
    /**
     *  销售计划
     */
    //PlanProView
    
    self.firstSeasonView=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 45, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.firstSeasonView.progress=1;
    //leftLabel
    self.firstSeasonView.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
//    self.forthSeasonView.left_valueLabel.frame=CGRectMake(74, 2, 30, 20);
    //rightLabel
    self.firstSeasonView.right_valueLabel.frame=CGRectMake(self.firstSeasonView.frame.size.width-160, 0, 150, 30);
//    self.forthSeasonView.right_nameLabel.frame=CGRectMake(self.forthSeasonView.frame.size.width-70, 2, 30, 16);
    self.firstSeasonView.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.firstSeasonView configLabelWithLeftName:@"一季度" leftValue:nil rightName:nil rightValue:@"0万" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
    [self.sellPlanView addSubview:self.firstSeasonView];
    //=====
    self.secondSeasonView=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 85, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.secondSeasonView.progress=1;
    //leftLabel
    self.secondSeasonView.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
//    self.thirdSeasonView.left_valueLabel.frame=CGRectMake(74, 2, 30, 16);
    //rightLabel
    self.secondSeasonView.right_valueLabel.frame=CGRectMake(self.secondSeasonView.frame.size.width-160, 0, 150, 30);
//    self.thirdSeasonView.right_nameLabel.frame=CGRectMake(self.thirdSeasonView.frame.size.width-70, 2, 30, 16);
    self.secondSeasonView.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.secondSeasonView configLabelWithLeftName:@"二季度" leftValue:nil rightName:nil rightValue:@"0万" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
    [self.sellPlanView addSubview:self.secondSeasonView];
    //=====
    self.thirdSeasonView=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 125,  DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.thirdSeasonView.progress=1;
    //leftLabel
    self.thirdSeasonView.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
//    self.secondSeasonView.left_valueLabel.frame=CGRectMake(74, 2, 30, 16);
    //rightLabel
    self.thirdSeasonView.right_valueLabel.frame=CGRectMake(self.thirdSeasonView.frame.size.width-160, 0, 150, 30);
//    self.secondSeasonView.right_nameLabel.frame=CGRectMake(self.secondSeasonView.frame.size.width-70, 2, 30, 16);
    self.thirdSeasonView.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.thirdSeasonView configLabelWithLeftName:@"三季度" leftValue:nil rightName:nil rightValue:@"0万" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
    [self.sellPlanView addSubview:self.thirdSeasonView];
    //====
    self.forthSeasonView=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 165, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"rectCircle.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.forthSeasonView.progress=1;
    //leftLabel
    self.forthSeasonView.left_nameLabel.frame=CGRectMake(10, 0, 60, 30);
//    self.forthSeasonView.left_valueLabel.frame=CGRectMake(74, 2, 30, 16);
    //rightLabel
    self.forthSeasonView.right_valueLabel.frame=CGRectMake(self.forthSeasonView.frame.size.width-160, 0, 150, 30);
//    self.forthSeasonView.right_nameLabel.frame=CGRectMake(self.forthSeasonView.frame.size.width-70, 2, 30, 16);
    self.forthSeasonView.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.forthSeasonView configLabelWithLeftName:@"四季度" leftValue:nil rightName:nil rightValue:@"0万" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
    [self.sellPlanView addSubview:self.forthSeasonView];
    //config ScrollView ContentSize
    self.scrollView.contentSize=CGSizeMake(DEVICE_WIDTH, self.sellPlanView.frameY+self.sellPlanView.frameHeight+80);
    
}
-(void)loadDataWithStartDate:(NSString*) start EndDate:(NSString*) end{
    
    [Utils showLoading:@"正在加载数据..."];
    AdminManager* manager=[[AdminManager alloc]init];
    UserEntity* user=[ConfigManage getLoginUser];
    NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/HWT.WEB/%@",[FDCController shareInstance].projectName,user.logo]]];
    UIImage * image=[UIImage imageWithData:data];
    self.photoView.image=image;
    
    [manager queryManagerMainInfoWithObjectId:user.objectId UserId:user.userId startTime:start endTime:end success:^(id data, NSDictionary *userInfo) {
        NSArray* datas=(NSArray*)data;
        NSLog(@"datas:%@",datas);
        if (datas.count>0) {
        NSDictionary* customer=[datas objectAtIndex:0];
        NSArray* customers=[customer objectForKey:@"LstArry"];
            if (customers.count>0) {
        // 来电  来访
        NSDictionary* phoneComeIn=[customers objectAtIndex:0];
        [self.phoneIn configLabelWithLeftName:[phoneComeIn objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[phoneComeIn objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
                if (customers.count>=2) {
        NSDictionary* interView=[customers objectAtIndex:1];
         [self.visit configLabelWithLeftName:[interView objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[interView objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
        //认购 签约
                    if (customers.count>=3) {
        NSDictionary* sureBuy=[customers objectAtIndex:2];
        [self.sureBuy configLabelWithLeftName:[sureBuy objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[sureBuy objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
                        if (customers.count>=4) {
        NSDictionary* sign=[customers objectAtIndex:3];
        [self.contactBuy configLabelWithLeftName:[sign objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[sign objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
        //认购签约 金额
                            if (customers.count>=5) {
        NSDictionary* sureBuyCount=[customers objectAtIndex:4];
                                [self.sureCount configLabelWithLeftName:[sureBuyCount objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[sureBuyCount objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
                                if (customers.count>=6) {
        NSDictionary* signCount=[customers objectAtIndex:5];
        [self.contactCount configLabelWithLeftName:[signCount objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[signCount objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
             //实收  应收
                                    if (customers.count>=7) {
        NSDictionary* realCount=[customers objectAtIndex:6];
                                         [self.shouldPay configLabelWithLeftName:[realCount objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[realCount objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
                                        if (customers.count>=8) {
        NSDictionary* shouldCount=[customers objectAtIndex:7];
        [self.accturllyPay configLabelWithLeftName:[shouldCount objectForKey:@"ZD_ZDMC"] leftValue:nil rightName:nil rightValue:[shouldCount objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor whiteColor] RlabelTextColor:[UIColor whiteColor]];
                                             }//end >=8
                                        }//end >=7
                                    }//end >=6
                                }//end >=5
                            }//end >=4
                    }//end >=3
                }//end >=2
                }//end >0
               //畅销户型  空数据暂时1！！！！！！！！！
        NSDictionary* house=[datas objectAtIndex:1];
        NSArray* arr1=[house objectForKey:@"LstArry"];
        if (arr1.count>0) {
            self.houseNumSubView.hidden=NO;
            self.lb_noData.hidden=YES;
            self.firstView_mostSell.hidden=NO;
            NSDictionary* houseNo1=[arr1 objectAtIndex:0];
            self.houseNo1.text=[houseNo1 objectForKey:@"ZD_ZDVAL"];
            self.houseNo1Name.text=[houseNo1 objectForKey:@"ZD_ZDMC"];
            if (arr1.count>1) {
                self.secondView_mostSell.hidden=NO;
                NSDictionary* houseNo2=[arr1 objectAtIndex:1];
                self.houseNo2.text=[houseNo2 objectForKey:@"ZD_ZDVAL"];
                self.houseNo2Name.text=[houseNo2 objectForKey:@"ZD_ZDMC"];
            }
            if (arr1.count>2) {
                self.thirdView_mostSell.hidden=NO;
                NSDictionary* houseNo3=[arr1 objectAtIndex:2];
                self.houseNo3.text=[houseNo3 objectForKey:@"ZD_ZDVAL"];
                self.houseNo3Name.text=[houseNo3 objectForKey:@"ZD_ZDMC"];
            }
           
           
        }else{
                self.houseNumSubView.hidden=YES;
             self.lb_noData.hidden=NO;
        }
   
        NSDictionary* house2=[datas objectAtIndex:2];
        NSArray* arr2=[house2 objectForKey:@"LstArry"];
        if (arr2.count>0) {
        }
        
        
        //计划
        NSDictionary* plan=[datas objectAtIndex:3];
        NSArray* plans=[plan objectForKey:@"LstArry"];

        if (plans.count>0) {
            if (plans.count>3) {
            //四季度
            NSDictionary* four=[plans objectAtIndex:3];
            NSString* value_four=[four objectForKey:@"ZD_ZDVAL"];
            NSString* name_four=[four objectForKey:@"ZD_ZDMC"];
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:value_four];
                NSRange markRange=[value_four rangeOfString:@"|"];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,markRange.location)];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:markRange];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(markRange.location+1,value_four.length-1-markRange.location)];
                
                
            [self.forthSeasonView RconfigLabelWithLeftName:name_four leftValue:nil rightName:nil rightValue:str labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
                }// end >3
            if (plans.count>2) {
                //三季度
                NSDictionary* three=[plans objectAtIndex:2];
                NSString* value_three=[three objectForKey:@"ZD_ZDVAL"];
                NSString* name_three=[three objectForKey:@"ZD_ZDMC"];
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:value_three];
                NSRange markRange=[value_three rangeOfString:@"|"];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,markRange.location)];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:markRange];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(markRange.location+1,value_three.length-1-markRange.location)];
                [self.thirdSeasonView RconfigLabelWithLeftName:name_three leftValue:nil rightName:nil rightValue:str labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
            }// end>2
            if (plans.count>1) {
                //二季度
                NSDictionary* two=[plans objectAtIndex:1];
                NSString* value_two=[two objectForKey:@"ZD_ZDVAL"];
                NSString* name_two=[two objectForKey:@"ZD_ZDMC"];
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:value_two];
                NSRange markRange=[value_two rangeOfString:@"|"];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,markRange.location)];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:markRange];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(markRange.location+1,value_two.length-1-markRange.location)];
                
                [self.secondSeasonView RconfigLabelWithLeftName:name_two leftValue:nil rightName:nil rightValue:str labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
            }// end>1
            //一季度
            NSDictionary* one=[plans objectAtIndex:0];
            NSString* value_one=[one objectForKey:@"ZD_ZDVAL"];
            NSString* name_one=[one objectForKey:@"ZD_ZDMC"];
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:value_one];
            NSRange markRange=[value_one rangeOfString:@"|"];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,markRange.location)];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:markRange];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(markRange.location+1,value_one.length-1-markRange.location)];
            
            [self.firstSeasonView RconfigLabelWithLeftName:name_one leftValue:nil rightName:nil rightValue:str labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
        }//end plans.count>0
                }//end datas.count>0
            
               [Utils hiddenLoading];
        
    } faild:^(id data, NSDictionary *userInfo) {
         [Utils hiddenLoading];
    }];
    

}

- (IBAction)queryTodayData:(id)sender {
    NSDate* endDate=[NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: endDate];
    NSDate *localeDate = [endDate  dateByAddingTimeInterval: interval];
    
    NSDateFormatter *frm=[[NSDateFormatter alloc]init];
    NSLocale *mylocal=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [frm setLocale:mylocal];
    [frm setDateFormat:@"YYYY-MM-dd"];
    NSString* end=[frm stringFromDate:localeDate];
    [self loadDataWithStartDate:end EndDate:end];
    self.fromDate.text=[frm stringFromDate:localeDate];
    self.toDate.text=[frm stringFromDate:localeDate];
}
- (IBAction)queryWeekData:(id)sender {
    [self showAlertView];
}
-(void)showAlertView{
    NSLog(@"showAlertView");
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.parentView=self.view;
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    titleLabel.text=@"请选择时间";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
    titleLabel.textColor=[UIColor whiteColor];
    [backGroundView addSubview:titleLabel];
    
    UILabel* start=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 60, 30)];
    start.text=@"开始时间";
    start.textAlignment=NSTextAlignmentLeft;
    start.textColor=[UIColor blackColor];
    start.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:start];
    
    UILabel* startTF=[[UILabel alloc]initWithFrame:CGRectMake(80, 50, 100, 30)];
    startTF.font=[UIFont systemFontOfSize:14.0];
    startTF.tag=100;
    startTF.text=self.fromDate.text;
    startTF.userInteractionEnabled=YES;
    startTF.backgroundColor=[UIColor lightGrayColor];
    UITapGestureRecognizer* start_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDate:)];
    [startTF addGestureRecognizer:start_tap];
    [backGroundView addSubview:startTF];
    self.tempLb1=startTF;
    
    UILabel* end=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 60, 30)];
    end.text=@"结束时间";
    end.textAlignment=NSTextAlignmentLeft;
    end.textColor=[UIColor blackColor];
    end.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:end];
    
    UILabel* endTF=[[UILabel alloc]initWithFrame:CGRectMake(80, 90, 100, 30)];
    endTF.tag=200;
    endTF.text=self.toDate.text;
    endTF.font=[UIFont systemFontOfSize:14.0];
    endTF.userInteractionEnabled=YES;
    endTF.backgroundColor=[UIColor lightGrayColor];
    UITapGestureRecognizer* end_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDate:)];
    [endTF addGestureRecognizer:end_tap];
    [backGroundView addSubview:endTF];
    self.tempLb2=endTF;
    
    al.containerView=backGroundView;
    NSArray* titles=@[@"关闭",@"查询"];
    al.buttonTitles=titles;
    al.delegate=self;
    [al show];
}
-(void)chooseDate:(UITapGestureRecognizer*) gesture{
     NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setDateFormat:@"yyyy-MM-dd"];
    UIDatePicker* dp=[[UIDatePicker alloc]initWithFrame:CGRectMake(-20, 40, [UIScreen mainScreen].bounds.size.width, 216)];
    dp.datePickerMode=UIDatePickerModeDate;
    
    if (gesture.view.tag==100) {
        UILabel* lab=(UILabel*)gesture.view;
        dp.date=[frm dateFromString:lab.text];
    }
    if (gesture.view.tag==200) {
        UILabel* lab=(UILabel*)gesture.view;
        dp.date=[frm dateFromString:lab.text];
    }
    if (IOS8_OR_LATER) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择时间\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [frm setDateFormat:@"YYYY-MM-dd"];
            if (gesture.view.tag==100) {
                
                ((UILabel*)gesture.view).text=[frm stringFromDate:dp.date];
            }
            if (gesture.view.tag==200) {
                ((UILabel*)gesture.view).text=[frm stringFromDate:dp.date];
            }
        }];
        [alertController.view addSubview:dp];
        [alertController addAction:cancleAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:[NSString stringWithFormat:@"请选择时间\n\n\n\n\n\n\n\n\n\n\n\n"] delegate:self cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [dp addTarget:self action:@selector(datePickerValueChanged:WithGesture:) forControlEvents:UIControlEventValueChanged];
        [sheet addSubview:dp];
        if (gesture.view.tag==100) {
            
            dp.minuteInterval=1;
        }
        if (gesture.view.tag==200) {
            dp.minuteInterval=2;
        }
        
        [sheet showFromToolbar:self.navigationController.toolbar];
    }
    
}
-(void)datePickerValueChanged:(UIDatePicker*)sender WithGesture:(UITapGestureRecognizer*)gesture
{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setDateFormat:@"YYYY-MM-dd"];
    if (sender.minuteInterval==1) {
        self.tempLb1.text=[frm stringFromDate:sender.date];
    }
    if (sender.minuteInterval==2) {
        self.tempLb2.text=[frm stringFromDate:sender.date];
    }

}
- (void)customIOS7dialogButtonTouchUpInside:(CustomIOS7AlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        [alertView close];
    }
    if (buttonIndex==1) {
        
        NSArray* arr=alertView.containerView.subviews;
        for (UIView *view in arr) {
            if (view.tag==100) {
                self.fromDate.text=((UILabel*)view).text;
            }
            if (view.tag==200) {
             self.toDate.text =((UILabel*)view).text;
            }
        }
        [self loadDataWithStartDate:self.fromDate.text EndDate:self.toDate.text ];
        [alertView close];
    }
    
}

@end
