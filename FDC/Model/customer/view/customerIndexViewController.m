//
//  customerIndexViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/20.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "customerIndexViewController.h"
#import "MyUpComingViewController.h"
#import "CustomerBirthdayDetailViewController.h"
#import "CLTree.h"
#import "CustomerMainManager.h"
#import "LableEntity.h"


@interface customerIndexViewController ()<UIActionSheetDelegate>
@property(nonatomic,strong)MCProgressBarView* finishedCount_houses;
@property(nonatomic,strong)MCProgressBarView* finishedCount_money;
@property(strong,nonatomic) NSMutableArray* dataArray; //保存全部数据的数组
@property(strong,nonatomic) NSArray *displayArray;   //保存要显示在界面上的数据的数组
@property(nonatomic,strong) NSArray * upComeInfos;
//注入数据
@property(nonatomic,strong) CLTreeView_LEVEL1_Model* upComingCount;
@property(nonatomic,strong)CLTreeView_LEVEL1_Model* customerCount;
@property(nonatomic,strong)CLTreeView_LEVEL1_Model* tradeDoneCount;
@property(nonatomic,strong)CLTreeView_LEVEL1_Model* financeCount;

@property(nonatomic,strong)CLTreeView_LEVEL2_Model*customerCount_2;
@property(nonatomic,strong)CLTreeView_LEVEL2_Model*tradeDoneCount_2;
@property(nonatomic,strong)CLTreeView_LEVEL2_Model*financeCount_2;
@property(nonatomic,strong) NSMutableArray* projectNames;
@property (nonatomic,strong) NSMutableArray* projectIds;
@property (nonatomic,strong) NSMutableArray* JCs;
@property(nonatomic,strong) UILabel* tempLb1;
@property(nonatomic,strong) UILabel* tempLb2;

@end

@implementation customerIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"首页"];
    [self checkUpdateState];
    self.photoIV.layer.cornerRadius=35;
    self.photoIV.clipsToBounds=YES;
    UIBarButtonItem*rightBar= [self createButtonItemLogout:@selector(logoutAction)];
    UIBarButtonItem*leftBar=[self createButtonItemSelecteObject:@selector(selectObejct)];
    self.navigationItem.rightBarButtonItem=rightBar;
    self.navigationItem.leftBarButtonItem=leftBar;
    [self initView];
    [self addTestData];//添加演示数据
    [self reloadDataForDisplayArray];//初始化将要显示的数据
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    NSString* start=[frm stringFromDate:startDate];
    NSString* end=[frm stringFromDate:endDate];
    [self loadDataWithStartDate:start andEndDate:end];
    [self loadMonthPlanDatas];
    NSLog(@"start=======:%@,end=========%@",startDate,endDate);
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
    //    self.projectName.text=[dic objectForKey:@"WY_WYMC"];
//    self.objectId=[dic objectForKey:@"WY_WYID"];
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
    self.lb_buildingName.text=[self.projectNames objectAtIndex:anIndex];
    UserEntity* user=[ConfigManage getLoginUser];
    user.objectName=[self.projectNames objectAtIndex:anIndex];
    user.objectId=[self.projectIds objectAtIndex:anIndex];
    user.businessSimpleName=[self.JCs objectAtIndex:anIndex];
    [ConfigManage setLoginUser:user];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    NSString* indexStart=[frm stringFromDate:startDate];
    NSString* indexEnd=[frm stringFromDate:endDate];
    NSString* start=self.tempLb1.text;
    NSString* end=self.tempLb2.text;
    if ([NSString isEnabled:start]&&[NSString isEnabled:end]) {
//        [self loadDataWithStartDate:start andEndDate:end];
        [self checkThisWeekDataWithStartDate:self.customerCount_2.dateFrom endDate:self.customerCount_2.dateTo];
        [self checkThisWeekDataWithIndex1WithStartDate:self.tradeDoneCount_2.dateFrom endDate:self.tradeDoneCount_2.dateTo];
        [self checkThisWeekDataWithIndex2WithStartDate:self.financeCount_2.dateFrom endDate:self.financeCount_2.dateTo];
    }else{
        [self loadDataWithStartDate:indexStart andEndDate:indexEnd];
    }
    [self loadMonthPlanDatas];
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
-(void)loadDataWithStartDate:(NSString*) start andEndDate:(NSString*) end{
    [Utils showLoading:@"正在加载数据..."];
    UserEntity* user=[ConfigManage getLoginUser];
    self.lb_userName.text=user.sellerName;
    self.lb_buildingName.text=user.objectName;
    NSLog(@"logoUrl=%@",[NSString stringWithFormat:@"http://%@/HWT.WEB/%@",[FDCController shareInstance].projectName,user.logo]);
    NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/HWT.WEB/%@",[FDCController shareInstance].projectName,user.logo]]];
    UIImage * image=[UIImage imageWithData:data];
    self.photoIV.image=image;
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
        NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[NSLocale currentLocale]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[frm dateFromString:start];
    NSDate* endDate=[frm dateFromString:end];
    
    if ([start isEqualToString:@"week"]) {
        startDate=[NSDate getFirstDayOfWeek];
        endDate=[NSDate getLastDayOfWeek];
            self.customerCount_2.dateFrom=[frm stringFromDate:startDate];
            self.tradeDoneCount_2.dateFrom=[frm stringFromDate:startDate];
            self.financeCount_2.dateFrom=[frm stringFromDate:startDate];
            self.customerCount_2.dateTo=[frm stringFromDate:endDate];
            self.tradeDoneCount_2.dateTo=[frm stringFromDate:endDate];
            self.financeCount_2.dateTo=[frm stringFromDate:endDate];
    }
    [manager mainForCustomerWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
                        NSLog(@"name===%@,value===%@",label.name,label.value);
                self.customerCount.sonCnt=label.value;
                self.customerCount.name=label.name;
                LableEntity* subLabel1=[subs objectAtIndex:0];
                self.customerCount_2.firstLb=subLabel1.name;
                self.customerCount_2.firstLbCount=subLabel1.value;
                
                LableEntity* subLabel2=[subs objectAtIndex:1];
                self.customerCount_2.secondLb=subLabel2.name;
                self.customerCount_2.secondLbCount=subLabel2.value;
                
                LableEntity* subLabel3=[subs objectAtIndex:2];
                self.customerCount_2.thirdLb=subLabel3.name;
                self.customerCount_2.thirdLbCount=subLabel3.value;
                LableEntity* subLabel4=[subs objectAtIndex:3];
                self.customerCount_2.forthLb=subLabel4.name;
                self.customerCount_2.forthLbCount=subLabel4.value;
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils showAlert:@"请求数据失败!" title:@"提示"];
    }];
    [manager upComingCountWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
            NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSLog(@"name===%@,value===%@",label.name,label.value);
            self.upComingCount.name=label.name;
                self.upComingCount.sonCnt=label.value;
                self.upComeInfos=label.subLables;
        }
         [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
    [manager tradeDoneCountWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
         NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
             NSLog(@"name===%@,value===%@",label.name,label.value);
           
                self.tradeDoneCount.name=label.name;
                self.tradeDoneCount.sonCnt=label.value;
                
                LableEntity* subLabel1=[subs objectAtIndex:0];
                self.tradeDoneCount_2.firstLb=subLabel1.name;
                self.tradeDoneCount_2.firstLbCount=subLabel1.value;
                
                LableEntity* subLabel2=[subs objectAtIndex:1];
                self.tradeDoneCount_2.secondLb=subLabel2.name;
                self.tradeDoneCount_2.secondLbCount=subLabel2.value;
                
                LableEntity* subLabel3=[subs objectAtIndex:2];
                self.tradeDoneCount_2.thirdLb=subLabel3.name;
                self.tradeDoneCount_2.thirdLbCount=subLabel3.value;
                LableEntity* subLabel4=[subs objectAtIndex:3];
                self.tradeDoneCount_2.forthLb=subLabel4.name;
                self.tradeDoneCount_2.forthLbCount=subLabel4.value;
            
    }

        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
    
    [manager  financeCountWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
            NSLog(@"name===%@,value===%@",label.name,label.value);
            
                self.financeCount.sonCnt=label.value;
                    self.financeCount.name=label.name;
                
                LableEntity* subLabel1=[subs objectAtIndex:0];
                self.financeCount_2.firstLb=subLabel1.name;
                self.financeCount_2.firstLbCount=subLabel1.value;
                
                LableEntity* subLabel2=[subs objectAtIndex:1];
                self.financeCount_2.secondLb=subLabel2.name;
                self.financeCount_2.secondLbCount=subLabel2.value;
                
                LableEntity* subLabel3=[subs objectAtIndex:2];
                self.financeCount_2.thirdLb=subLabel3.name;
                self.financeCount_2.thirdLbCount=subLabel3.value;
                LableEntity* subLabel4=[subs objectAtIndex:3];
                self.financeCount_2.forthLb=subLabel4.name;
                self.financeCount_2.forthLbCount=subLabel4.value;
                
            
        }
        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
    
}
-(void)loadMonthPlanDatas{
    [Utils showLoading:@"正在加载数据..."];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager queryMonthPlansForSellersWithObjectId:user.objectId UserId:user.userId success:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        NSLog(@"MonthData:%@",data);
        NSArray * arr=(NSArray*)data;
        NSDictionary * dic=[arr firstObject];
        NSLog(@"name:%@,value:%@",[dic objectForKey:@"ZD_ZDMC"],[dic objectForKey:@"ZD_ZDVAL"]);
        NSArray* datas=[dic objectForKey:@"LstArry"];
        for (NSDictionary* values in datas) {
            NSLog(@"name:%@,value:%@",[values objectForKey:@"ZD_ZDMC"],[values objectForKey:@"ZD_ZDVAL"]);
        }
        NSDictionary* sureDone=[datas objectAtIndex:1];
        NSDictionary* planDone=[datas objectAtIndex:0];
        NSDictionary *percent=[datas objectAtIndex:2];
        
        self.donePercentLabel.text=[NSString stringWithFormat:@"完成%@",[percent objectForKey:@"ZD_ZDVAL"]];
        [self.finishedCount_houses configLabelWithLeftName:@"实际销售金额" leftValue:nil rightName:nil rightValue:[sureDone objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
        
         [self.finishedCount_money configLabelWithLeftName:@"计划销售金额" leftValue:nil rightName:nil rightValue:[planDone objectForKey:@"ZD_ZDVAL"] labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
            self.finishedCount_money.progress=1;
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}
-(void)initView{
    self.scrollView.frame=[UIScreen mainScreen].bounds;
    CGRect frame =self.scrollView.frame;
    frame.size.height=frame.size.height-self.navigationController.toolbar.frameHeight;
    self.scrollView.frame=frame;
    if ([UIScreen mainScreen].bounds.size.height>480.0) {
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.sellPlanView.frameY+self.sellPlanView.frameHeight*2);
    }else{
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.sellPlanView.frameY+self.sellPlanView.frameHeight*2+80);
    }
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator =NO;
    self.scrollView.bounces=NO;
    //progressView
    self.donePercentLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, DEVICE_WIDTH, 20)];
    self.donePercentLabel.text=[NSString stringWithFormat:@"完成0%%"];
    [self.sellPlanView addSubview:self.donePercentLabel];
    self.finishedCount_houses=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 60, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"darkYelllow.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.finishedCount_houses.progress=1.0;
    //leftLabel
    self.finishedCount_houses.left_nameLabel.frame=CGRectMake(10, 0, 100, 30);
    self.finishedCount_houses.right_valueLabel.frame=CGRectMake(self.finishedCount_houses.frame.size.width-160, 0, 150, 30);
    self.finishedCount_houses.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.finishedCount_houses configLabelWithLeftName:@"实际销售金额" leftValue:nil rightName:nil rightValue:@"0万" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
    [self.sellPlanView addSubview:self.finishedCount_houses];
    //==========================
    self.finishedCount_money=[[MCProgressBarView alloc]initWithFrame:CGRectMake(10, 100, DEVICE_WIDTH-20, 30) backgroundImage:[[UIImage imageNamed:@"darkGray.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ] foregroundImage:[[UIImage imageNamed:@"darkBlue.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    self.finishedCount_money.progress=0.0;
    //leftLabel
    self.finishedCount_money.left_nameLabel.frame=CGRectMake(10, 0, 100, 30);
    //rightLabel
    self.finishedCount_money.right_valueLabel.frame=CGRectMake(self.finishedCount_money.frame.size.width-160, 0, 150, 30);
    self.finishedCount_money.right_valueLabel.textAlignment=NSTextAlignmentRight;
    [self.finishedCount_money configLabelWithLeftName:@"计划销售金额" leftValue:nil rightName:nil rightValue:@"0万" labelFont: [UIFont systemFontOfSize:16] LlabelTextColor:[UIColor blackColor] RlabelTextColor:[UIColor blackColor]];
    [self.sellPlanView addSubview:self.finishedCount_money];

}
-(void)showUpComingWorkDetails{
    MyUpComingViewController* vc=[[MyUpComingViewController alloc]init];
    vc.totalCount=self.upComingCount.sonCnt;
    vc.title=@"待办事宜";
    vc.upComeInfos=self.upComeInfos;
    [self.navigationController pushViewController:vc animated:YES];

}
-(void) addTestData{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    NSString* start=[frm stringFromDate:startDate];
    NSString* end=[frm stringFromDate:endDate];
    
    
    CLTreeViewNode *node3 = [[CLTreeViewNode alloc]init];
    node3.nodeLevel = 0;//根层cell
    node3.type = 1;//type 1的cell
    node3.sonNodes = nil;
    node3.isExpanded = FALSE;//关闭状态
    self.upComingCount =[[CLTreeView_LEVEL1_Model alloc]init];
     self.upComingCount.name = @"待办事宜:";
     self.upComingCount.sonCnt = @"0";
     self.upComingCount.headImgPath=@"image_upcomingwork.png";
     self.upComingCount.arrowPath=@"right_arrow_blue.png";
    node3.nodeData =  self.upComingCount;
    
    CLTreeViewNode *node4 = [[CLTreeViewNode alloc]init];
    node4.nodeLevel = 0;
    node4.type = 1;
    node4.sonNodes = nil;
    node4.isExpanded = FALSE;
    self.customerCount=[[CLTreeView_LEVEL1_Model alloc]init];
    self.customerCount.name = @"客户：";
    self.customerCount.sonCnt = @"0";
    self.customerCount.headImgPath=@"image_customer_icon.png";
    self.customerCount.arrowPath=@"button_arrow_down.png";
    node4.nodeData = self.customerCount;
    
    
    CLTreeViewNode *nodeDone = [[CLTreeViewNode alloc]init];
    nodeDone.nodeLevel = 0;
    nodeDone.type = 1;
    nodeDone.sonNodes = nil;
    nodeDone.isExpanded = FALSE;
    self.tradeDoneCount =[[CLTreeView_LEVEL1_Model alloc]init];
    self.tradeDoneCount.name = @"成交：";
    self.tradeDoneCount.sonCnt = @"0";
    self.tradeDoneCount.headImgPath=@"image_deal.png";
    self.tradeDoneCount.arrowPath=@"button_arrow_down.png";
    nodeDone.nodeData = self.tradeDoneCount;
    
    CLTreeViewNode *nodeCount = [[CLTreeViewNode alloc]init];
    nodeCount.nodeLevel = 0;
    nodeCount.type = 1;
    nodeCount.sonNodes = nil;
    nodeCount.isExpanded = FALSE;
    self.financeCount =[[CLTreeView_LEVEL1_Model alloc]init];
    self.financeCount.name = @"款项：";
    self.financeCount.sonCnt = @"0";
    self.financeCount.headImgPath=@"image_funds.png";
    self.financeCount.arrowPath=@"button_arrow_down.png";
    nodeCount.nodeData = self.financeCount;
    
    
    
    
    CLTreeViewNode *node5 = [[CLTreeViewNode alloc]init];
    node5.nodeLevel = 1;//第一层节点
    node5.type = 2;//type 2的cell
    node5.sonNodes = nil;
    node5.isExpanded = FALSE;
    self.customerCount_2=[[CLTreeView_LEVEL2_Model alloc]init];
    self.customerCount_2.dateFrom=start;
    self.customerCount_2.dateTo=end;
    self.customerCount_2.firstLb=@"来电客户";
    self.customerCount_2.secondLb=@"来访客户";
    self.customerCount_2.thirdLb=@"来电转来访率";
    self.customerCount_2.forthLb=@"来访转成交率";
    self.customerCount_2.firstLbCount=@"0%";
    self.customerCount_2.secondLbCount=@"0%";
    self.customerCount_2.thirdLbCount=@"0";
    self.customerCount_2.forthLbCount=@"0";
    node5.nodeData = self.customerCount_2;
    
    CLTreeViewNode *node6 = [[CLTreeViewNode alloc]init];
    node6.nodeLevel = 1;
    node6.type = 2;
    node6.sonNodes = nil;
    node6.isExpanded = FALSE;
    self.tradeDoneCount_2 =[[CLTreeView_LEVEL2_Model alloc]init];
    self.tradeDoneCount_2 .dateFrom=start;
    self.tradeDoneCount_2 .dateTo=end;
    self.tradeDoneCount_2 .firstLb=@"认购未转";
    self.tradeDoneCount_2 .secondLb=@"总签约";
    self.tradeDoneCount_2 .thirdLb=@"转签率";
    self.tradeDoneCount_2 .forthLb=@"已备案数";
    self.tradeDoneCount_2 .firstLbCount=@"0";
    self.tradeDoneCount_2 .secondLbCount=@"0";
    self.tradeDoneCount_2 .thirdLbCount=@"0%";
    self.tradeDoneCount_2 .forthLbCount=@"0%";
    node6.nodeData = self.tradeDoneCount_2 ;
    
    CLTreeViewNode *node7 = [[CLTreeViewNode alloc]init];
    node7.nodeLevel = 1;
    node7.type = 2;
    node7.sonNodes = nil;
    node7.isExpanded = FALSE;
    self.financeCount_2 =[[CLTreeView_LEVEL2_Model alloc]init];
    self.financeCount_2.dateFrom=start;
    self.financeCount_2.dateTo=end;
    self.financeCount_2.firstLb=@"成交";
    self.financeCount_2.secondLb=@"成交";
    self.financeCount_2.thirdLb=@"成交";
    self.financeCount_2.forthLb=@"成交";
    self.financeCount_2.firstLbCount=@"0";
    self.financeCount_2.secondLbCount=@"0";
    self.financeCount_2.thirdLbCount=@"0%";
    self.financeCount_2.forthLbCount=@"0%";
    node7.nodeData = self.financeCount_2;
    
    
    node3.sonNodes = [NSMutableArray arrayWithObjects:nil];//插入子节点
    node4.sonNodes = [NSMutableArray arrayWithObjects:node5,nil];
    nodeDone.sonNodes=[NSMutableArray arrayWithObjects:node6, nil];
    nodeCount.sonNodes=[NSMutableArray arrayWithObjects:node7, nil];
    
    _dataArray = [NSMutableArray arrayWithObjects:node3,node4, nodeDone,nodeCount,nil];//插入到元数据数组
}

#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _displayArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"level0cell";
    static NSString *indentifier1 = @"level1cell";
    static NSString *indentifier2 = @"level2cell";
    CLTreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    
    if(node.type == 0){//类型为0的cell
        CLTreeView_LEVEL0_Cell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Level0_Cell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        [self loadDataForTreeViewCell:cell with:node index:indexPath.row];//重新给cell装载数据
        [cell setNeedsDisplay]; //重新描绘cell
        return cell;
    }
    else if(node.type == 1){//类型为1的cell
        CLTreeView_LEVEL1_Cell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier1];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Level1_Cell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        [self loadDataForTreeViewCell:cell with:node index:indexPath.row];
        [cell setNeedsDisplay];
        return cell;
    }
    else{//类型为2的cell
        CLTreeView_LEVEL2_Cell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier2];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Level2_Cell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        [self loadDataForTreeViewCell:cell with:node index:indexPath.row];
        [cell setNeedsDisplay];
        return cell;
    }
}
-(void) loadDataForTreeViewCell:(UITableViewCell*)cell with:(CLTreeViewNode*)node index:(NSInteger)index{
    if(node.type == 0){
        CLTreeView_LEVEL0_Model *nodeData = node.nodeData;
        ((CLTreeView_LEVEL0_Cell*)cell).name.text = nodeData.name;
        if(nodeData.headImgPath != nil){
            //本地图片
            [((CLTreeView_LEVEL0_Cell*)cell).imageView setImage:[UIImage imageNamed:nodeData.headImgPath]];
        }
        else if (nodeData.headImgUrl != nil){
            //加载图片，这里是同步操作。建议使用SDWebImage异步加载图片
            [((CLTreeView_LEVEL0_Cell*)cell).imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:nodeData.headImgUrl]]];
        }
    }
    
    else if(node.type == 1){
        CLTreeView_LEVEL1_Model *nodeData = node.nodeData;
        ((CLTreeView_LEVEL1_Cell*)cell).name.text = nodeData.name;
        ((CLTreeView_LEVEL1_Cell*)cell).sonCount.text = nodeData.sonCnt;
        
        if(nodeData.headImgPath != nil){
            //本地图片
            [((CLTreeView_LEVEL1_Cell*)cell).icon setImage:[UIImage imageNamed:nodeData.headImgPath]];
             [((CLTreeView_LEVEL1_Cell*)cell).arrowView setImage:[UIImage imageNamed:nodeData.arrowPath]];
        }
        else if (nodeData.headImgUrl != nil){
            //加载图片，这里是同步操作。建议使用SDWebImage异步加载图片
            [((CLTreeView_LEVEL1_Cell*)cell).icon setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:nodeData.headImgUrl]]];
        }
    }
    
    else{
        CLTreeView_LEVEL2_Model *nodeData = node.nodeData;
        ((CLTreeView_LEVEL2_Cell*)cell).name.text = nodeData.name;
        ((CLTreeView_LEVEL2_Cell*)cell).dateFrom.text = nodeData.dateFrom;
        ((CLTreeView_LEVEL2_Cell*)cell).dateTo.text = nodeData.dateTo;
        ((CLTreeView_LEVEL2_Cell*)cell).firstLb.text = nodeData.firstLb;
        ((CLTreeView_LEVEL2_Cell*)cell).secondLb.text = nodeData.secondLb;
        ((CLTreeView_LEVEL2_Cell*)cell).thirdLb.text = nodeData.thirdLb;
        ((CLTreeView_LEVEL2_Cell*)cell).forthLb.text = nodeData.forthLb;
        ((CLTreeView_LEVEL2_Cell*)cell).firstLbCount.text = nodeData.firstLbCount;
        ((CLTreeView_LEVEL2_Cell*)cell).secondLbCount.text = nodeData.secondLbCount;
        ((CLTreeView_LEVEL2_Cell*)cell).thirdLbCount.text = nodeData.thirdLbCount;
        ((CLTreeView_LEVEL2_Cell*)cell).forthLbCount.text = nodeData.forthLbCount;
        ((CLTreeView_LEVEL2_Cell*)cell).signture.text = nodeData.signture;
        /**
         *  分离时间
         */
        if (index==2) {
            [((CLTreeView_LEVEL2_Cell*)cell).todayBtn removeTarget:self action:@selector(checkThisWeekDataWithIndex1) forControlEvents:UIControlEventTouchUpInside];
             [((CLTreeView_LEVEL2_Cell*)cell).todayBtn removeTarget:self action:@selector(checkThisWeekDataWithIndex2) forControlEvents:UIControlEventTouchUpInside];
            [((CLTreeView_LEVEL2_Cell*)cell).todayBtn addTarget:self action:@selector(checkThisWeekData)];
        }
        if (index==3) {
             [((CLTreeView_LEVEL2_Cell*)cell).todayBtn removeTarget:self action:@selector(checkThisWeekData) forControlEvents:UIControlEventTouchUpInside];
             [((CLTreeView_LEVEL2_Cell*)cell).todayBtn removeTarget:self action:@selector(checkThisWeekDataWithIndex2) forControlEvents:UIControlEventTouchUpInside];
            [((CLTreeView_LEVEL2_Cell*)cell).todayBtn addTarget:self action:@selector(checkThisWeekDataWithIndex1)];
        }
        if (index==4) {
             [((CLTreeView_LEVEL2_Cell*)cell).todayBtn removeTarget:self action:@selector(checkThisWeekData) forControlEvents:UIControlEventTouchUpInside];
             [((CLTreeView_LEVEL2_Cell*)cell).todayBtn removeTarget:self action:@selector(checkThisWeekDataWithIndex1) forControlEvents:UIControlEventTouchUpInside];
            [((CLTreeView_LEVEL2_Cell*)cell).todayBtn addTarget:self action:@selector(checkThisWeekDataWithIndex2)];
        }
//        [((CLTreeView_LEVEL2_Cell*)cell).todayBtn addTarget:self action:@selector(checkThisWeekData)];
//        [((CLTreeView_LEVEL2_Cell*)cell).customerBtn addTarget:self action:@selector(showAlertView)];
        if (index==2) {
//            [((CLTreeView_LEVEL2_Cell*)cell).customerBtn addTarget:self action:@selector(showAlertView)];
            
             [((CLTreeView_LEVEL2_Cell*)cell).customerBtn removeTarget:self action:@selector(showAlertViewWithIndex1) forControlEvents:UIControlEventTouchUpInside];
             [((CLTreeView_LEVEL2_Cell*)cell).customerBtn removeTarget:self action:@selector(showAlertViewWithIndex2) forControlEvents:UIControlEventTouchUpInside];
            [((CLTreeView_LEVEL2_Cell*)cell).customerBtn addTarget:self action:@selector(showAlertView) forControlEvents:UIControlEventTouchUpInside];
        }
        if (index==3) {
            [((CLTreeView_LEVEL2_Cell*)cell).customerBtn removeTarget:self action:@selector(showAlertView) forControlEvents:UIControlEventTouchUpInside];
           
            [((CLTreeView_LEVEL2_Cell*)cell).customerBtn removeTarget:self action:@selector(showAlertViewWithIndex2) forControlEvents:UIControlEventTouchUpInside];
            
             [((CLTreeView_LEVEL2_Cell*)cell).customerBtn addTarget:self action:@selector(showAlertViewWithIndex1) forControlEvents:UIControlEventTouchUpInside];
        }
        if (index==4) {
            [((CLTreeView_LEVEL2_Cell*)cell).customerBtn removeTarget:self action:@selector(showAlertView) forControlEvents:UIControlEventTouchUpInside];
            [((CLTreeView_LEVEL2_Cell*)cell).customerBtn removeTarget:self action:@selector(showAlertViewWithIndex1) forControlEvents:UIControlEventTouchUpInside];
            [((CLTreeView_LEVEL2_Cell*)cell).customerBtn addTarget:self action:@selector(showAlertViewWithIndex2) forControlEvents:UIControlEventTouchUpInside];
        }
        if(nodeData.headImgPath != nil){
            //本地图片
            [((CLTreeView_LEVEL2_Cell*)cell).headImg setImage:[UIImage imageNamed:nodeData.headImgPath]];
        }
        else if (nodeData.headImgUrl != nil){
            //加载图片，这里是同步操作。建议使用SDWebImage异步加载图片
            [((CLTreeView_LEVEL2_Cell*)cell).headImg setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:nodeData.headImgUrl]]];
        }
    }
}
-(void)checkThisWeekData{
//    [self loadDataWithStartDate:@"week" andEndDate:@"week"];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[NSLocale currentLocale]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    self.customerCount_2.dateFrom=[frm stringFromDate:startDate];
    self.customerCount_2.dateTo=[frm stringFromDate:endDate];
    [manager mainForCustomerWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
            NSLog(@"name===%@,value===%@",label.name,label.value);
            self.customerCount.sonCnt=label.value;
            self.customerCount.name=label.name;
            LableEntity* subLabel1=[subs objectAtIndex:0];
            self.customerCount_2.firstLb=subLabel1.name;
            self.customerCount_2.firstLbCount=subLabel1.value;
            
            LableEntity* subLabel2=[subs objectAtIndex:1];
            self.customerCount_2.secondLb=subLabel2.name;
            self.customerCount_2.secondLbCount=subLabel2.value;
            
            LableEntity* subLabel3=[subs objectAtIndex:2];
            self.customerCount_2.thirdLb=subLabel3.name;
            self.customerCount_2.thirdLbCount=subLabel3.value;
            LableEntity* subLabel4=[subs objectAtIndex:3];
            self.customerCount_2.forthLb=subLabel4.name;
            self.customerCount_2.forthLbCount=subLabel4.value;
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils showAlert:@"请求数据失败!" title:@"提示"];
    }];

}
-(void)checkThisWeekDataWithStartDate:(NSString*) start endDate:(NSString*)end{
    //    [self loadDataWithStartDate:@"week" andEndDate:@"week"];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[NSLocale currentLocale]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[frm dateFromString:start];
    NSDate* endDate=[frm dateFromString:end];
    self.customerCount_2.dateFrom=[frm stringFromDate:startDate];
    self.customerCount_2.dateTo=[frm stringFromDate:endDate];
    [manager mainForCustomerWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
            NSLog(@"name===%@,value===%@",label.name,label.value);
            self.customerCount.sonCnt=label.value;
            self.customerCount.name=label.name;
            LableEntity* subLabel1=[subs objectAtIndex:0];
            self.customerCount_2.firstLb=subLabel1.name;
            self.customerCount_2.firstLbCount=subLabel1.value;
            
            LableEntity* subLabel2=[subs objectAtIndex:1];
            self.customerCount_2.secondLb=subLabel2.name;
            self.customerCount_2.secondLbCount=subLabel2.value;
            
            LableEntity* subLabel3=[subs objectAtIndex:2];
            self.customerCount_2.thirdLb=subLabel3.name;
            self.customerCount_2.thirdLbCount=subLabel3.value;
            LableEntity* subLabel4=[subs objectAtIndex:3];
            self.customerCount_2.forthLb=subLabel4.name;
            self.customerCount_2.forthLbCount=subLabel4.value;
        }
        [self.tableView reloadData];
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils showAlert:@"请求数据失败!" title:@"提示"];
    }];
    
}
-(void)checkThisWeekDataWithIndex1{
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[NSLocale currentLocale]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    self.tradeDoneCount_2.dateFrom=[frm stringFromDate:startDate];
    self.tradeDoneCount_2.dateTo=[frm stringFromDate:endDate];
    [manager tradeDoneCountWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
            NSLog(@"name===%@,value===%@",label.name,label.value);
            
            self.tradeDoneCount.name=label.name;
            self.tradeDoneCount.sonCnt=label.value;
            
            LableEntity* subLabel1=[subs objectAtIndex:0];
            self.tradeDoneCount_2.firstLb=subLabel1.name;
            self.tradeDoneCount_2.firstLbCount=subLabel1.value;
            
            LableEntity* subLabel2=[subs objectAtIndex:1];
            self.tradeDoneCount_2.secondLb=subLabel2.name;
            self.tradeDoneCount_2.secondLbCount=subLabel2.value;
            
            LableEntity* subLabel3=[subs objectAtIndex:2];
            self.tradeDoneCount_2.thirdLb=subLabel3.name;
            self.tradeDoneCount_2.thirdLbCount=subLabel3.value;
            LableEntity* subLabel4=[subs objectAtIndex:3];
            self.tradeDoneCount_2.forthLb=subLabel4.name;
            self.tradeDoneCount_2.forthLbCount=subLabel4.value;
            
        }
        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];

}
-(void)checkThisWeekDataWithIndex1WithStartDate:(NSString*) start endDate:(NSString*)end{
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[NSLocale currentLocale]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[frm dateFromString:start];
    NSDate* endDate=[frm dateFromString:end];
    self.tradeDoneCount_2.dateFrom=[frm stringFromDate:startDate];
    self.tradeDoneCount_2.dateTo=[frm stringFromDate:endDate];
    [manager tradeDoneCountWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
            NSLog(@"name===%@,value===%@",label.name,label.value);
            
            self.tradeDoneCount.name=label.name;
            self.tradeDoneCount.sonCnt=label.value;
            
            LableEntity* subLabel1=[subs objectAtIndex:0];
            self.tradeDoneCount_2.firstLb=subLabel1.name;
            self.tradeDoneCount_2.firstLbCount=subLabel1.value;
            
            LableEntity* subLabel2=[subs objectAtIndex:1];
            self.tradeDoneCount_2.secondLb=subLabel2.name;
            self.tradeDoneCount_2.secondLbCount=subLabel2.value;
            
            LableEntity* subLabel3=[subs objectAtIndex:2];
            self.tradeDoneCount_2.thirdLb=subLabel3.name;
            self.tradeDoneCount_2.thirdLbCount=subLabel3.value;
            LableEntity* subLabel4=[subs objectAtIndex:3];
            self.tradeDoneCount_2.forthLb=subLabel4.name;
            self.tradeDoneCount_2.forthLbCount=subLabel4.value;
            
        }
        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
    
}
-(void)checkThisWeekDataWithIndex2{
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[NSLocale currentLocale]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[NSDate getFirstDayOfWeek];
    NSDate* endDate=[NSDate getLastDayOfWeek];
    self.financeCount_2.dateFrom=[frm stringFromDate:startDate];
    self.financeCount_2.dateTo=[frm stringFromDate:endDate];
    [manager  financeCountWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
            NSLog(@"name===%@,value===%@",label.name,label.value);
            
            self.financeCount.sonCnt=label.value;
            self.financeCount.name=label.name;
            
            LableEntity* subLabel1=[subs objectAtIndex:0];
            self.financeCount_2.firstLb=subLabel1.name;
            self.financeCount_2.firstLbCount=subLabel1.value;
            
            LableEntity* subLabel2=[subs objectAtIndex:1];
            self.financeCount_2.secondLb=subLabel2.name;
            self.financeCount_2.secondLbCount=subLabel2.value;
            
            LableEntity* subLabel3=[subs objectAtIndex:2];
            self.financeCount_2.thirdLb=subLabel3.name;
            self.financeCount_2.thirdLbCount=subLabel3.value;
            LableEntity* subLabel4=[subs objectAtIndex:3];
            self.financeCount_2.forthLb=subLabel4.name;
            self.financeCount_2.forthLbCount=subLabel4.value;
            
            
        }
        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];

}
-(void)checkThisWeekDataWithIndex2WithStartDate:(NSString*) start endDate:(NSString*)end{
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[NSLocale currentLocale]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    NSDate* startDate=[frm dateFromString:start];
    NSDate* endDate=[frm dateFromString:end];
    self.financeCount_2.dateFrom=[frm stringFromDate:startDate];
    self.financeCount_2.dateTo=[frm stringFromDate:endDate];
    [manager  financeCountWithStartTime:startDate endTime:endDate objectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (LableEntity* label in arr) {
            NSArray* subs=label.subLables;
            NSLog(@"name===%@,value===%@",label.name,label.value);
            
            self.financeCount.sonCnt=label.value;
            self.financeCount.name=label.name;
            
            LableEntity* subLabel1=[subs objectAtIndex:0];
            self.financeCount_2.firstLb=subLabel1.name;
            self.financeCount_2.firstLbCount=subLabel1.value;
            
            LableEntity* subLabel2=[subs objectAtIndex:1];
            self.financeCount_2.secondLb=subLabel2.name;
            self.financeCount_2.secondLbCount=subLabel2.value;
            
            LableEntity* subLabel3=[subs objectAtIndex:2];
            self.financeCount_2.thirdLb=subLabel3.name;
            self.financeCount_2.thirdLbCount=subLabel3.value;
            LableEntity* subLabel4=[subs objectAtIndex:3];
            self.financeCount_2.forthLb=subLabel4.name;
            self.financeCount_2.forthLbCount=subLabel4.value;
            
            
        }
        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
    
}
-(void)showAlertView{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.tag=1000;
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
    startTF.text=self.customerCount_2.dateFrom;
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
    endTF.text=self.customerCount_2.dateTo;
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
-(void)showAlertViewWithIndex1{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.tag=1001;
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
    startTF.text=self.customerCount_2.dateFrom;
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
    endTF.text=self.customerCount_2.dateTo;
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
-(void)showAlertViewWithIndex2{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [frm setDateFormat:@"yyyy-MM-dd"];
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.tag=1002;
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
    startTF.text=self.customerCount_2.dateFrom;
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
    endTF.text=self.customerCount_2.dateTo;
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
    [frm setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
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
            NSDateFormatter * frm=[[NSDateFormatter alloc]init];
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
                if (alertView.tag==1000) {
                     self.customerCount_2.dateFrom=((UILabel*)view).text;
                }
                if (alertView.tag==1001) {
                    self.tradeDoneCount_2.dateFrom=((UILabel*)view).text;
                }
                if (alertView.tag==1002) {
                    self.financeCount_2.dateFrom=((UILabel*)view).text;
                }
                }
            if (view.tag==200) {
                if (alertView.tag==1000) {
                    self.customerCount_2.dateTo=((UILabel*)view).text;
                    [self checkThisWeekDataWithStartDate:self.customerCount_2.dateFrom endDate:self.customerCount_2.dateTo];
                }
                if (alertView.tag==1001) {
                     self.tradeDoneCount_2.dateTo=((UILabel*)view).text;
                    [self checkThisWeekDataWithIndex1WithStartDate: self.tradeDoneCount_2.dateFrom endDate: self.tradeDoneCount_2.dateTo];
                }
                if (alertView.tag==1002) {
                    self.financeCount_2.dateTo=((UILabel*)view).text;
                    [self checkThisWeekDataWithIndex2WithStartDate: self.financeCount_2.dateFrom endDate: self.financeCount_2.dateTo];
                }
            }
        }
        /**
         *  这里需要重新改造
         */
//        [self loadDataWithStartDate: self.customerCount_2.dateFrom andEndDate:self.customerCount_2.dateTo];
        [self.tableView reloadData];
        [alertView close];
        
    }

}

/*---------------------------------------
 处理cell选中事件，需要自定义的部分
 --------------------------------------- */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CLTreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    [self reloadDataForDisplayArrayChangeAt:indexPath.row];//修改cell的状态(关闭或打开)
    if(node.type == 2){
        //处理叶子节点选中，此处需要自定义
    }
    else{
        CLTreeView_LEVEL0_Cell *cell = (CLTreeView_LEVEL0_Cell*)[tableView cellForRowAtIndexPath:indexPath];
        if(cell.node.isExpanded ){
            [self rotateArrow:cell with:M_PI_2];
        }
        else{
            [self rotateArrow:cell with:0];
        }
    }
    CLTreeView_LEVEL1_Model* model=node.nodeData;
    if ([model.name isEqualToString:self.upComingCount.name]) {
        [self showUpComingWorkDetails];
    }
    
}

/*---------------------------------------
 旋转箭头图标
 --------------------------------------- */
-(void) rotateArrow:(CLTreeView_LEVEL0_Cell*) cell with:(double)degree{
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        cell.arrowView.layer.transform = CATransform3DMakeRotation(degree, 0, 0, 1);
    } completion:NULL];
}

/*---------------------------------------
 初始化将要显示的cell的数据
 --------------------------------------- */
-(void) reloadDataForDisplayArray{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (CLTreeViewNode *node in _dataArray) {
        [tmp addObject:node];
        if(node.isExpanded){
            for(CLTreeViewNode *node2 in node.sonNodes){
                [tmp addObject:node2];
                if(node2.isExpanded){
                    for(CLTreeViewNode *node3 in node2.sonNodes){
                        [tmp addObject:node3];
                    }
                }
            }
        }
    }
    _displayArray = [NSArray arrayWithArray:tmp];
    [self.tableView reloadData];
}

/*---------------------------------------
 修改cell的状态(关闭或打开)
 --------------------------------------- */
-(void) reloadDataForDisplayArrayChangeAt:(NSInteger)row{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    NSInteger cnt=0;
    for (CLTreeViewNode *node in _dataArray) {
        [tmp addObject:node];
        if(cnt == row){
            node.isExpanded = !node.isExpanded;
        }
        ++cnt;
        if(node.isExpanded){
            for(CLTreeViewNode *node2 in node.sonNodes){
                [tmp addObject:node2];
                if(cnt == row){
                    node2.isExpanded = !node2.isExpanded;
                }
                ++cnt;
                if(node2.isExpanded){
                    for(CLTreeViewNode *node3 in node2.sonNodes){
                        [tmp addObject:node3];
                        ++cnt;
                    }
                }
            }
        }
    }
    _displayArray = [NSArray arrayWithArray:tmp];
    [self.tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 CLTreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    if (node.type==2) {
        return 185;
    }else{
        return 50;
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
@end
