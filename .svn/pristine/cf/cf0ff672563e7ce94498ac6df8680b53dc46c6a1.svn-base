//
//  CustomerTrackDetailViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerTrackDetailViewController.h"
#import "CustomerCallBackHistroyTableViewCell.h"
#import "CustomerCallBackReminderTableViewCell.h"
#import "ConfigManage+Expand.h"
#import "CustomerMainManager.h"
#import "CustomIOS7AlertView.h"



@interface CustomerTrackDetailViewController ()<CustomIOS7AlertViewDelegate>
{
    UIButton* manBtn;
    UIButton* woBtn;
    UILabel* callBackTime;
    UITextField* callBackTF;
    UIButton* smanBtn;
    UIButton* swoBtn;
}
@property(nonatomic,strong) NSDictionary* detailCustomerInfo;
@property(nonatomic,strong) NSMutableArray* callBacks;
@property(nonatomic,strong) NSMutableArray* callBackHistroys;
@property (weak, nonatomic) IBOutlet UIImageView *phoIV;
@property (nonatomic,strong) NSString* serachDate;

@end

@implementation CustomerTrackDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate* date=[NSDate new];
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setDateFormat:@"yyyy-MM-dd"];
    self.serachDate=[frm stringFromDate:date];
    
    
    self.callBacks=nil;
    self.callBacks=[NSMutableArray array];
    self.callBackHistroys=nil;
    self.callBackHistroys=[NSMutableArray array];
    [self initView];
    self.callBackTableView.allowsSelection=NO;
    if ([self.mark isEqualToString:@"index"]) {
        [self loadIndexData];
    }else{
    [self loadData];
    }
    self.phoIV.layer.cornerRadius=30;
    
    if ([self.customer.customerSex isEqualToString:@"女"]) {
        self.phoIV.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.phoIV.image=[UIImage imageNamed:@"male.png"];
    }
    
}
-(void)loadData{
    
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager followUpDetailForCustomerWithObjectId:user.objectId customerId:self.customer.customerId success:^(id data, NSDictionary *userInfo) {
        NSLog(@"data==%@",data);
        
        NSDictionary* dic=[data JSONValue];
        self.detailCustomerInfo=[dic objectForKey:@"ResultData"];
        self.userName.text=self.customer.customerName2;
        self.callBackType.text=self.customer.visitWay;
        self.firstInterviewTime.text=[self.detailCustomerInfo objectForKey:@"KH_LFRQ"];
        self.houseAddress.text=[self.detailCustomerInfo objectForKey:@"FW_FWBH"];
        self.payStatus.text=[self.detailCustomerInfo objectForKey:@"TRADESTATE"];
        self.lastTrackDate.text=[self.detailCustomerInfo objectForKey:@"KH_ZJLXRQ"];;
        self.callBackHistroys=[NSMutableArray arrayWithArray:[self.detailCustomerInfo objectForKey:@"GZ_GZHFARRY"]];
        self.callBacks=[NSMutableArray arrayWithArray:[self.detailCustomerInfo objectForKey:@"GZ_GZJHARRY"]];
        if ([[self.detailCustomerInfo objectForKey:@"KH_XB"] isEqualToString:@"女"]) {
            self.phoIV.image=[UIImage imageNamed:@"female.png"];
        }else{
             self.phoIV.image=[UIImage imageNamed:@"male.png"];
        }
        [self.callBackTableView reloadData];
        [self.callBackHistroyTableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}
-(void)loadIndexData{
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager followUpDetailForCustomerWithObjectId:user.objectId customerId:[self.dic_customer objectForKey:@"KH_KHID"] success:^(id data, NSDictionary *userInfo) {
        NSLog(@"data==%@",data);
        
        NSDictionary* dic=[data JSONValue];
        self.detailCustomerInfo=[dic objectForKey:@"ResultData"];
        self.userName.text=[self.dic_customer objectForKey:@"KH_QRXM"];
        self.callBackType.text=[self.dic_customer objectForKey:@"KH_GZFS"];
        self.firstInterviewTime.text=[self.detailCustomerInfo objectForKey:@"KH_LFRQ"];
        self.houseAddress.text=[self.detailCustomerInfo objectForKey:@"FW_FWBH"];
        self.payStatus.text=[self.detailCustomerInfo objectForKey:@"TRADESTATE"];
        self.lastTrackDate.text=[self.detailCustomerInfo objectForKey:@"KH_ZJLXRQ"];
        self.callBackHistroys=[NSMutableArray arrayWithArray:[self.detailCustomerInfo objectForKey:@"GZ_GZHFARRY"]];
        self.callBacks=[NSMutableArray arrayWithArray:[self.detailCustomerInfo objectForKey:@"GZ_GZJHARRY"]];
        if ([[self.dic_customer objectForKey:@"KH_XB"] isEqualToString:@"女"]) {
            self.phoIV.image=[UIImage imageNamed:@"female.png"];
        }else{
            self.phoIV.image=[UIImage imageNamed:@"male.png"];
        }
        [self.callBackTableView reloadData];
        [self.callBackHistroyTableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}
-(void)initView{
    CGRect callFrame=self.callBackHistroyTableView.frame;
    callFrame.size.height=180;
    self.callBackHistroyTableView.frame=callFrame;
    
    self.scrollView.frame=[UIScreen mainScreen].bounds;
    CGRect frame =self.scrollView.frame;
    frame.size.height=frame.size.height-self.navigationController.toolbar.frameHeight;
    self.scrollView.frame=frame;
    if ([UIScreen mainScreen].bounds.size.height>480.0) {
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.callBackHistroyTableView.frameY+self.callBackHistroyTableView.frameHeight+80);
    }else{
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.callBackHistroyTableView.frameY+self.callBackHistroyTableView.frameHeight*2-100);
    }
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator =NO;
    self.scrollView.bounces=NO;
}
- (IBAction)addTrackAction:(id)sender {
    
    [self showAlertView];
    
}
- (IBAction)addCallBackAction:(id)sender {
    [self showCallBackAlertView];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)showCallBackAlertView{
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.tag=101;
    al.parentView=self.view;
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    titleLabel.text=@"来访详情记录";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
    titleLabel.textColor=[UIColor whiteColor];
    [backGroundView addSubview:titleLabel];
    
    UILabel* start=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 60, 30)];
    start.text=@"回访内容";
    start.textAlignment=NSTextAlignmentLeft;
    start.textColor=[UIColor blackColor];
    start.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:start];
    
    callBackTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 50, 100, 30)];
    callBackTF.font=[UIFont systemFontOfSize:14.0];
    callBackTF.tag=105;
    callBackTF.returnKeyType=UIReturnKeyDone;
    callBackTF.delegate=self;
    callBackTF.placeholder=@"请输入内容";
    callBackTF.userInteractionEnabled=YES;
    callBackTF.backgroundColor=[UIColor whiteColor];
    [backGroundView addSubview:callBackTF];
    
    UILabel* end=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 60, 30)];
    end.text=@"回访方式";
    end.textAlignment=NSTextAlignmentLeft;
    end.textColor=[UIColor blackColor];
    end.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:end];
    
    UIView* vi=[[UIView alloc]initWithFrame:CGRectMake(80, 90, 100, 30)];
    vi.backgroundColor=[UIColor clearColor];
    smanBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [smanBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_unselected.png"] forState:UIControlStateNormal];
    [smanBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_selected.png"] forState:UIControlStateSelected];
    [smanBtn addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchUpInside];
    smanBtn.tag=12;
    [vi addSubview:smanBtn];
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(25, 0, 25, 30)];
    label.text=@"来电";
    label.font=[UIFont systemFontOfSize:12];
    [vi addSubview:label];
    swoBtn=[[UIButton alloc]initWithFrame:CGRectMake(55, 0, 24, 24)];
    [swoBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_unselected.png"] forState:UIControlStateNormal];
    [swoBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_selected.png"] forState:UIControlStateSelected];
    [swoBtn addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchUpInside];
    swoBtn.tag=13;
    [vi addSubview:swoBtn];
    UILabel * label2=[[UILabel alloc]initWithFrame:CGRectMake(80, 0, 25, 30)];
    label2.text=@"现场";
    label2.font=[UIFont systemFontOfSize:12];
    [vi addSubview:label2];
    [backGroundView addSubview:vi];
    al.containerView=backGroundView;
    NSArray* titles=@[@"取消",@"确定"];
    al.buttonTitles=titles;
    al.delegate=self;
    [al show];

}
-(void)showAlertView{
    NSLog(@"showAlertView");
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.tag=100;
    al.parentView=self.view;
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    titleLabel.text=@"跟踪计划";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
    titleLabel.textColor=[UIColor whiteColor];
    [backGroundView addSubview:titleLabel];
    
    UILabel* start=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 60, 30)];
    start.text=@"回访时间";
    start.textAlignment=NSTextAlignmentLeft;
    start.textColor=[UIColor blackColor];
    start.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:start];
    
    callBackTime=[[UILabel alloc]initWithFrame:CGRectMake(80, 50, 100, 30)];
    callBackTime.font=[UIFont systemFontOfSize:14.0];
    callBackTime.tag=100;
    callBackTime.text=self.serachDate;
    callBackTime.userInteractionEnabled=YES;
    callBackTime.backgroundColor=[UIColor lightGrayColor];
    UITapGestureRecognizer* start_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDate:)];
    [callBackTime addGestureRecognizer:start_tap];
    [backGroundView addSubview:callBackTime];
    
    UILabel* end=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 60, 30)];
    end.text=@"回访方式";
    end.textAlignment=NSTextAlignmentLeft;
    end.textColor=[UIColor blackColor];
    end.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:end];
    
    UIView* vi=[[UIView alloc]initWithFrame:CGRectMake(80, 90, 100, 30)];
    vi.backgroundColor=[UIColor clearColor];
    manBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [manBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_unselected.png"] forState:UIControlStateNormal];
    [manBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_selected.png"] forState:UIControlStateSelected];
    [manBtn addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchUpInside];
    manBtn.tag=10;
    [vi addSubview:manBtn];
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(25, 0, 25, 30)];
    label.text=@"来电";
    label.font=[UIFont systemFontOfSize:12];
    [vi addSubview:label];
    woBtn=[[UIButton alloc]initWithFrame:CGRectMake(55, 0, 24, 24)];
    [woBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_unselected.png"] forState:UIControlStateNormal];
    [woBtn setBackgroundImage:[UIImage imageNamed:@"button_muti_selected.png"] forState:UIControlStateSelected];
    [woBtn addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchUpInside];
    woBtn.tag=11;
    [vi addSubview:woBtn];
    UILabel * label2=[[UILabel alloc]initWithFrame:CGRectMake(80, 0, 25, 30)];
    label2.text=@"现场";
    label2.font=[UIFont systemFontOfSize:12];
    [vi addSubview:label2];
    [backGroundView addSubview:vi];
    al.containerView=backGroundView;
    NSArray* titles=@[@"取消",@"确定"];
    al.buttonTitles=titles;
    al.delegate=self;
    [al show];
}
-(void)chooseDate:(UITapGestureRecognizer*) gesture{
    UIDatePicker* dp=[[UIDatePicker alloc]initWithFrame:CGRectMake(-20, 40, [UIScreen mainScreen].bounds.size.width, 216)];
    dp.datePickerMode=UIDatePickerModeDate;
    if (IOS8_OR_LATER) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择时间\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSDateFormatter * frm=[[NSDateFormatter alloc]init];
            [frm setDateFormat:@"yyyy-MM-dd"];
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
        [sheet showFromToolbar:self.navigationController.toolbar];
    }
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    callBackTime.text=self.serachDate;
}
-(void)datePickerValueChanged:(UIDatePicker*)sender WithGesture:(UITapGestureRecognizer*)gesture
{
    NSDateFormatter * frm=[[NSDateFormatter alloc]init];
    [frm setDateFormat:@"YYYY-MM-dd"];
    self.serachDate=[frm stringFromDate:sender.date];
    //    [self searchAction:nil];
}

-(void)changeState:(UIButton*)btn{
    if (btn.tag==10) {
        manBtn.selected=YES;
        woBtn.selected=NO;
    }
    if (btn.tag==11){
        manBtn.selected=NO;
        woBtn.selected=YES;
    }
    
    if (btn.tag==12) {
        smanBtn.selected=YES;
        swoBtn.selected=NO;
    }
    if (btn.tag==13)
    {
        smanBtn.selected=NO;
        swoBtn.selected=YES;
    }
}
-(void)customIOS7dialogButtonTouchUpInside:(CustomIOS7AlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==100) {
        if (buttonIndex==0) {
            [alertView close];
        }else{
            if ([NSString isEnabled:callBackTime.text]&&(manBtn.selected==YES||woBtn.selected==YES)) {
                NSString* type;
                if (manBtn.selected==YES) {
                    type=@"来电";
                }
                if (woBtn.selected==YES) {
                    type=@"现场";
                }
                if (![self.mark isEqualToString:@"index"]) {
                    UserEntity* user=[ConfigManage getLoginUser];
                    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
                    [manager addTrackPlanWithObjectId:user.objectId CustomerId:self.customer.customerId  TrackDate:callBackTime.text TrackWay:type IsOn:@"生效" success:^(id data, NSDictionary *userInfo) {
                        [self loadData];
                        NSLog(@"addData=====%@",data);
                    } faild:^(id data, NSDictionary *userInfo) {
                        
                    }];

                }else{
                    UserEntity* user=[ConfigManage getLoginUser];
                    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
                    [manager addTrackPlanWithObjectId:user.objectId CustomerId:[self.dic_customer objectForKey:@"KH_KHID"]  TrackDate:callBackTime.text TrackWay:type IsOn:@"生效" success:^(id data, NSDictionary *userInfo) {
                        [self loadIndexData];
                        NSLog(@"addData=====%@",data);
                    } faild:^(id data, NSDictionary *userInfo) {
                        
                    }];
                }
                
                
                [alertView close];
            }else{
                [Utils showAlert:@"请检查时间和回访方式!" title:@"温馨提示"];
            }
        }

    }
    if (alertView.tag==101) {
        if (buttonIndex==0) {
            [alertView close];
        }else{
        if ([NSString isEnabled:callBackTF.text]&&(smanBtn.selected==YES||swoBtn.selected==YES)) {
            NSString* type;
            if (smanBtn.selected==YES) {
                type=@"来电";
            }
            if (swoBtn.selected==YES) {
                type=@"现场";
            }
            if (![self.mark isEqualToString:@"index"]) {
                CustomerMainManager* manager=[[CustomerMainManager alloc]init];
                [manager addCallBackPlanWithCustomerId:self.customer.customerId  CallType:type Content:callBackTF.text Name:@"" Summary:@"" success:^(id data, NSDictionary *userInfo) {
                    [self loadData];
                } faild:^(id data, NSDictionary *userInfo) {
                    
                }];
            }else{
                CustomerMainManager* manager=[[CustomerMainManager alloc]init];
                [manager addCallBackPlanWithCustomerId:[self.dic_customer objectForKey:@"KH_KHID"]  CallType:type Content:callBackTF.text Name:@"" Summary:@"" success:^(id data, NSDictionary *userInfo) {
                    [self loadIndexData];
                } faild:^(id data, NSDictionary *userInfo) {
                    
                }];
            }
            
            
            [alertView close];
        }else{
            [Utils showAlert:@"请检查内容和回访方式!" title:@"温馨提示"];
        }
        }
    }
    if (alertView.tag==200) {
        [alertView close];
    }
}
#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.callBackTableView) {
        return self.callBacks.count;
    }
    return self.callBackHistroys.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* callBackID=@"callBackID";
    static NSString* callBackHisID=@"callBackHisID";
    if (tableView==self.callBackTableView) {
        CustomerCallBackReminderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:callBackID];
        if (cell == nil)
        {
            [tableView registerNib:[UINib nibWithNibName:@"CustomerCallBackReminderTableViewCell" bundle:nil] forCellReuseIdentifier:callBackID];
            cell=[tableView dequeueReusableCellWithIdentifier:callBackID];
        }
        NSDictionary * entity=[self.callBacks objectAtIndex:indexPath.row];
        
        cell.date.text=[entity objectForKey:@"KH_JHGZRQ"];
        cell.callType.text=[entity objectForKey:@"KH_GZFS"];
        cell.customerId=self.customer.customerId;
        [cell.deleteBtn addTarget:self action:@selector(deleteList:) forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"date==%@",[entity objectForKey:@"KH_LFRQ"]);
        return cell;
    }
    else{
        CustomerCallBackHistroyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:callBackHisID];
        if (cell == nil)
        {
            [tableView registerNib:[UINib nibWithNibName:@"CustomerCallBackHistroyTableViewCell" bundle:nil] forCellReuseIdentifier:callBackHisID];
            cell=[tableView dequeueReusableCellWithIdentifier:callBackHisID];
        }
        NSDictionary * entity=[self.callBackHistroys objectAtIndex:indexPath.row];

        NSString*date=[entity objectForKey:@"KG_LFRQ"];
        NSString* callType=[entity objectForKey:@"KG_LFFS"];
        cell.date.text=date;
        cell.callType.text=callType;
        
        return cell;
    }
//        return cell;
}
-(void)deleteList:(id)sender{
    NSString* date;
    NSString* type;
    UIButton* btn=sender;
    UIView* cellContentView=(UIView*)btn.superview;
    NSArray* arr=cellContentView.subviews;
    for (id view in arr) {
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel* label=view;
            if (label.tag==1) {
                date=label.text;
            }
            if (label.tag==2) {
                type=label.text;
            }

        }
    }
    if (![self.mark isEqualToString:@"index"]) {
        UserEntity* user=[ConfigManage getLoginUser];
        CustomerMainManager* manager=[[CustomerMainManager alloc]init];
        [manager addTrackPlanWithObjectId:user.objectId CustomerId:self.customer.customerId  TrackDate:date TrackWay:type IsOn:@"失效" success:^(id data, NSDictionary *userInfo) {
            [self loadData];
            
        } faild:^(id data, NSDictionary *userInfo) {
            
        }];
    }else{
        UserEntity* user=[ConfigManage getLoginUser];
        CustomerMainManager* manager=[[CustomerMainManager alloc]init];
        [manager addTrackPlanWithObjectId:user.objectId CustomerId:[self.dic_customer objectForKey:@"KH_KHID"]   TrackDate:date TrackWay:type IsOn:@"失效" success:^(id data, NSDictionary *userInfo) {
           [self loadIndexData];
            
        } faild:^(id data, NSDictionary *userInfo) {
            
        }];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isKindOfClass:[self.callBackHistroyTableView class]]) {
        NSDictionary * entity=[self.callBackHistroys objectAtIndex:indexPath.row];
        NSString*date=[entity objectForKey:@"KG_LFRQ"];
        NSString* callType=[entity objectForKey:@"KG_LFFS"];
        NSString* title=[entity objectForKey:@"KG_LFNR"];
        [self createAlertViewWithDate:date Type:callType Title:title];
    }
}
-(void)createAlertViewWithDate:(NSString*)date Type:(NSString*) type Title:(NSString*)title{
    UIView* backGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    backGroundView.backgroundColor=[UIColor whiteColor];
    CustomIOS7AlertView* al=[[CustomIOS7AlertView alloc]init];
    al.tag=200;
    al.parentView=self.view;
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    titleLabel.text=@"来访详情记录";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
    titleLabel.textColor=[UIColor whiteColor];
    [backGroundView addSubview:titleLabel];
    
    UILabel* start=[[UILabel alloc]initWithFrame:CGRectMake(10, 40, 80, 30)];
    start.text=@"跟踪方式:";
    start.textAlignment=NSTextAlignmentLeft;
    start.textColor=[UIColor blackColor];
    start.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:start];
    
    UILabel* typeLabel=[[UILabel alloc]initWithFrame:CGRectMake(90, 40, 100, 30)];
    typeLabel.font=[UIFont systemFontOfSize:14.0];
    typeLabel.tag=100;
    typeLabel.text=type;
    [backGroundView addSubview:typeLabel];
    
    UILabel* end=[[UILabel alloc]initWithFrame:CGRectMake(10, 80, 80, 30)];
    end.text=@"跟踪日期:";
    end.textAlignment=NSTextAlignmentLeft;
    end.textColor=[UIColor blackColor];
    end.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:end];
    
    UILabel* callTitle=[[UILabel alloc]initWithFrame:CGRectMake(90, 80, 100, 30)];
    callTitle.text=date;
    callTitle.textAlignment=NSTextAlignmentLeft;
    callTitle.textColor=[UIColor blackColor];
    callTitle.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:callTitle];
    UILabel* content=[[UILabel alloc]initWithFrame:CGRectMake(10, 120, 80, 30)];
    content.text=@"跟踪主题:";
    content.textAlignment=NSTextAlignmentLeft;
    content.textColor=[UIColor blackColor];
    content.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:content];
    UILabel* contentTitle=[[UILabel alloc]initWithFrame:CGRectMake(70, 120, 120, 60)];
    contentTitle.text=title;
    contentTitle.contentMode=UIViewContentModeTop;
    contentTitle.layer.borderColor=[UIColor lightGrayColor].CGColor;
    contentTitle.layer.borderWidth=1.0;
    contentTitle.numberOfLines=0;
    contentTitle.textAlignment=NSTextAlignmentLeft;
    contentTitle.textColor=[UIColor blackColor];
    contentTitle.font=[UIFont systemFontOfSize:14.0];
    [backGroundView addSubview:contentTitle];
    
    al.containerView=backGroundView;
    NSArray* titles=@[@"确定"];
    al.buttonTitles=titles;
    al.delegate=self;
    [al show];

}


@end
