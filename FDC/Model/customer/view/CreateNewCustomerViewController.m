//
//  CreateNewCustomerViewController.m
//  FDC
//
//  Created by NewDoone on 15/2/2.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CreateNewCustomerViewController.h"
#import "LeveyPopListView.h"


@interface CreateNewCustomerViewController ()<LeveyPopListViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate,UIScrollViewDelegate>
{
    CustomerEntity* customer;
}
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *banner;
@property (nonatomic,strong) NSMutableArray* names;
@property (nonatomic,strong) NSMutableArray* numbers;
@property (nonatomic,strong) NSMutableArray* IDCards;
@property (nonatomic,assign) NSUInteger count;
@property (nonatomic,assign) NSUInteger phoneCount;
@property (nonatomic,assign) NSUInteger IDCount;
@property (nonatomic,strong) NSMutableArray* nameViews;
@property (nonatomic,strong) NSMutableArray* numberViews;
@property (nonatomic,strong) NSMutableArray* IDCardViews;
//数据填充
@property (nonatomic,strong) NSArray * sexs;
@property (nonatomic,strong) NSArray * callBackTypes;
@property (nonatomic,strong) NSArray * customerTypes;
@property (nonatomic,strong) NSArray * customerLevels;
@property (nonatomic,strong) NSArray * mindOfLevels;
@property (nonatomic,strong) NSArray * inertviewAddress;
@property (nonatomic) BOOL isMustField;
@property (nonatomic,strong) NSString* customerIdFrom;
@end

@implementation CreateNewCustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
    [self loadData];
    if (self.customerId.length>0) {
        self.entity.customerId=self.customerId;
        [self loadBaseInfo];
    }
    if ([self.mark isEqualToString:@"基本信息"]) {
        [self loadBaseInfo];
    }
}
-(void)loadBaseInfo{
    [Utils showLoading:@"正在加载数据..."];
    __weak typeof(self) weakself = self;
    CustomerMainManager * manager=[[CustomerMainManager alloc]init];
    [manager queryBaseInfomationWithCustomerId:self.entity.customerId success:^(id data, NSDictionary *userInfo) {
        NSDictionary* dic=data;
        NSLog(@"dic:%@",dic);
        weakself.tf_userName.text=[dic objectForKey:@"KH_KHMC"];
        weakself.tf_phoneNumber.text=[dic objectForKey:@"KH_LXDH"];
        weakself.tf_IDNumber.text=[dic objectForKey:@"KH_ZJHM"];
        weakself.tf_address.text=[dic objectForKey:@"KH_CYDZ"];
        weakself.tf_customerBirthday.text=[dic objectForKey:@"KH_KHSR"];
        weakself.lb_callBackType.text=[dic objectForKey:@"LF_LFFS"];
        weakself.lb_customerType.text=[dic objectForKey:@"KH_KHLX"];
        weakself.lb_customerLevel.text=[dic objectForKey:@"KH_KHDJ"];
        weakself.lb_mindOfLevel.text=[dic objectForKey:@"KH_YXCD"];
        weakself.lb_inertviewAddress.text=[dic objectForKey:@"KH_MEETPLACE"];
        weakself.tf_commander.text=[dic objectForKey:@"TJR_KHMC"];
        weakself.customerIdFrom=[dic objectForKey:@"KH_KHID"];
        weakself.lb_sex.text=[dic objectForKey:@"KH_XB"];
        weakself.tf_summary.text=[dic objectForKey:@"KH_BZ"];
        NSArray* linkers=[dic objectForKey:@"Linkers"];
        for (NSDictionary* linkDic in linkers) {
            NSString* name=[linkDic objectForKey:@"KH_KHMC"];
            NSString* number=[linkDic objectForKey:@"KH_KHDH"];
            NSString* IDCard=[linkDic objectForKey:@"KH_ZJHM"];
            if (name.length>0) {
                [self addCustomerName:[linkDic objectForKey:@"KH_KHMC"]];
            }
            if (number.length>0) {
                 [self addCustomerPhoneNumber:[linkDic objectForKey:@"KH_KHDH"]];
            }
            if (IDCard.length>0) {
                 [self addCustomerIDCardNumber:[linkDic objectForKey:@"KH_ZJHM"]];
            }
        }
        
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}
-(BOOL)shouldAutorotate
{
    return NO;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}


-(void)initData{
    self.names=nil;
    self.names=[NSMutableArray array];
    self.numbers=nil;
    self.numbers=[NSMutableArray array];
    self.IDCards=nil;
    self.IDCards=[NSMutableArray array];
    self.nameViews=nil;
    self.nameViews=[NSMutableArray array];
    self.numberViews=nil;
    self.numberViews=[NSMutableArray array];
    self.IDCardViews=nil;
    self.IDCardViews=[NSMutableArray array];
    
    self.sexs=@[@"男",@"女"];
    self.callBackTypes=@[@"来电",@"来访"];
    self.customerTypes=@[@"个人客户",@"企业用户",@"普通客户",@"团购",@"入会",@"商铺"];
    self.customerLevels=@[@"首次客户",@"意向客户",@"准成交客户",@"成交客户",@"未成交客户"];
    self.mindOfLevels=@[@"无",@"弱",@"一般",@"强"];
    self.inertviewAddress=@[@"销售中心",@"房展会"];
    
    self.lb_sex.text=[self.sexs objectAtIndex:0];
    self.lb_callBackType.text=[self.callBackTypes objectAtIndex:0];
    self.lb_customerType.text=[self.customerTypes objectAtIndex:0];
    self.lb_customerLevel.text=[self.customerLevels objectAtIndex:0];
    self.lb_mindOfLevel.text=[self.mindOfLevels objectAtIndex:0];
    self.lb_inertviewAddress.text=[self.inertviewAddress objectAtIndex:0];
}
-(void)loadData{
      UserEntity* user=[ConfigManage getLoginUser];
    NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_LOGO ,user.logo]]];
    UIImage * image=[UIImage imageWithData:data];
    self.photo.image=image;
}
-(void)isMustToField{
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSString* vistWay=self.lb_callBackType.text;
    [manager findQuestionaryWithObjectId:user.objectId visitWay:vistWay custormerId:user.userId success:^(id data, NSDictionary *userInfo) {
        
        NSDictionary* dic=(NSDictionary*)data;
        NSLog(@"SFBT:%@",[dic objectForKey:@"BT_SFBT"]);
        if ([[dic objectForKey:@"BT_SFBT"] isEqualToString:@"是"]) {
            self.isMustField=YES;
        }else{
            self.isMustField=NO;
        }
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}
-(void)initView{
    self.banner.frame=CGRectMake(0, 0, DEVICE_WIDTH, 64);
    self.photoIV.center=CGPointMake(self.view.center.x, 64);
    
    
    self.nameView.frame=CGRectMake(0, 98,DEVICE_WIDTH, 55);
    self.phoneView.frame=CGRectMake(0, 161, DEVICE_WIDTH, 55);
    self.IDView.frame=CGRectMake(0, 224, DEVICE_WIDTH, 55);
    self.bigView.frame=CGRectMake(0, 287, DEVICE_WIDTH, 395);
    self.add_nameBtn.frame=CGRectMake(DEVICE_WIDTH-51, 9, 30, 30);
    self.add_numberBtn.frame=CGRectMake(DEVICE_WIDTH-51, 9, 30, 30);
    self.add_idBtn.frame=CGRectMake(DEVICE_WIDTH-51, 9, 30, 30);
    
    
    
    self.tf_userName.frame=CGRectMake(84, 8, DEVICE_WIDTH-138, 32);
    self.tf_phoneNumber.frame=CGRectMake(84, 8, DEVICE_WIDTH-138, 32);
    self.tf_IDNumber.frame=CGRectMake(84, 8, DEVICE_WIDTH-138, 32);
    
    
    self.tf_address.frame=CGRectMake(84, 6, DEVICE_WIDTH-92, 32);
     self.lb_sex.frame=CGRectMake(84, 42, DEVICE_WIDTH-92, 28);
     self.tf_customerBirthday.frame=CGRectMake(84, 74, DEVICE_WIDTH-92, 32);
     self.lb_callBackType.frame=CGRectMake(84, 110, DEVICE_WIDTH-92, 30);
     self.lb_customerType.frame=CGRectMake(84, 144, DEVICE_WIDTH-92, 30);
     self.lb_customerLevel.frame=CGRectMake(84, 178, DEVICE_WIDTH-92, 30);
     self.lb_mindOfLevel.frame=CGRectMake(84, 212, DEVICE_WIDTH-92, 30);
     self.lb_inertviewAddress.frame=CGRectMake(84, 246, DEVICE_WIDTH-92, 30);
     self.tf_commander.frame=CGRectMake(84, 280, DEVICE_WIDTH-92, 32);
     self.tf_summary.frame=CGRectMake(84, 316, DEVICE_WIDTH-92, 32);
    self.sexBtn.frame=CGRectMake(DEVICE_WIDTH-42, 43, 24, 24);
    self.callTypeBtn.frame=CGRectMake(DEVICE_WIDTH-42, 112, 24, 24);
    self.customerTypeBtn.frame=CGRectMake(DEVICE_WIDTH-42, 147, 24, 24);
    self.customerLevelBtn.frame=CGRectMake(DEVICE_WIDTH-42, 183, 24, 24);
    self.mindBtn.frame=CGRectMake(DEVICE_WIDTH-42, 217, 24, 24);
    self.addressBtn.frame=CGRectMake(DEVICE_WIDTH-42, 251, 24, 24);
    self.saveBtn.frame=CGRectMake(DEVICE_WIDTH/4, 359, DEVICE_WIDTH/2, 30);
    
    self.photoIV.layer.cornerRadius=30;
//    self.tf_userName.backgroundColor=[UIColor whiteColor];
//    self.tf_phoneNumber.backgroundColor=[UIColor whiteColor];
//    self.tf_IDNumber.backgroundColor=[UIColor whiteColor];
//    self.tf_customerBirthday.backgroundColor=[UIColor whiteColor];
//    self.tf_commander.backgroundColor=[UIColor whiteColor];
//    self.tf_address.backgroundColor=[UIColor whiteColor];
//    self.lb_callBackType.backgroundColor=[UIColor whiteColor];
//    self.lb_customerLevel.backgroundColor=[UIColor whiteColor];
//    self.lb_customerType.backgroundColor=[UIColor whiteColor];
//    self.lb_inertviewAddress.backgroundColor=[UIColor whiteColor];
//    self.lb_mindOfLevel.backgroundColor=[UIColor whiteColor];
//    self.tf_summary.backgroundColor=[UIColor whiteColor];
//    self.lb_sex.backgroundColor=[UIColor whiteColor];
    self.bigView.frame=CGRectMake(0, 287, DEVICE_WIDTH, 395);
    CGRect frame=self.bigView.frame;
    frame.origin.y=self.IDView.frame.origin.y+self.IDView.frame.size.height+10;
    
    self.bigView.frame=frame;
    
    self.scrollView.frame=[UIScreen mainScreen].bounds;
    frame =self.scrollView.frame;
    frame.size.height=frame.size.height-self.navigationController.toolbar.frameHeight;
    self.scrollView.frame=frame;
  
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.bigView.frameY+self.bigView.frameHeight+70);
   
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator =NO;
    self.scrollView.bounces=NO;
    
}

#pragma 添加多个姓名、电话、身份证
- (IBAction)addCustomerName:(id)sender {
    self.count++;
    UIView* view=[self createViewOnParentView:self.nameView];
    
    [self.nameViews addObject:view];
    
    CGRect viewFrame=CGRectZero;
    UITextField* tf=[self createTextFieldOnParentView:view];
    tf.delegate=self;
    tf.font=[UIFont systemFontOfSize:14.0];
    if ([sender isKindOfClass:[NSString class]]) {
        tf.text=sender;
    }
    [self.names addObject:tf];
    CGRect frame=view.frame;
    frame.origin.y= (self.tf_userName.frame.size.height+6)*self.count+8;
    view.frame=frame;

    UIButton* btn=[self createButtonOnParentView:view];
    btn.tag=1;

    viewFrame=self.nameView.frame;
    viewFrame.size.height=self.nameView.frame.size.height+self.tf_userName.frame.size.height+5;
    self.nameView.frame=viewFrame;
    
    viewFrame=self.phoneView.frame;
    viewFrame.origin.y=self.nameView.frame.origin.y+self.nameView.frame.size.height+5;
    self.phoneView.frame=viewFrame;
    
    viewFrame=self.IDView.frame;
    viewFrame.origin.y=self.phoneView.frame.origin.y+self.phoneView.frame.size.height+5;
    self.IDView.frame=viewFrame;
    
    viewFrame=self.bigView.frame;
    viewFrame.origin.y=self.IDView.frame.origin.y+self.IDView.frame.size.height+5;
    self.bigView.frame=viewFrame;
    
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.bigView.frameY+self.bigView.frameHeight+70+self.tf_userName.frame.size.height+5);
    

}

- (IBAction)addCustomerPhoneNumber:(id)sender {
    self.phoneCount++;
    UIView* view=[self createViewOnParentView:self.phoneView];
    
    [self.numberViews addObject:view];
    
    CGRect viewFrame=CGRectZero;
    UITextField* tf=[self createTextFieldOnParentView:view];
     tf.delegate=self;
    tf.font=[UIFont systemFontOfSize:14.0];
    if ([sender isKindOfClass:[NSString class]]) {
        tf.text=sender;
    }
    [self.numbers addObject:tf];
    CGRect frame=view.frame;
    frame.origin.y= (self.tf_phoneNumber.frame.size.height+6)*self.phoneCount+8;
    view.frame=frame;
    
    UIButton* btn=[self createButtonOnParentView:view];
    btn.tag=2;
    
    viewFrame=self.phoneView.frame;
    viewFrame.size.height=self.phoneView.frame.size.height+self.tf_phoneNumber.frame.size.height+5;
    self.phoneView.frame=viewFrame;

    viewFrame=self.IDView.frame;
    viewFrame.origin.y=self.phoneView.frame.origin.y+self.phoneView.frame.size.height+5;
    self.IDView.frame=viewFrame;
    
    viewFrame=self.bigView.frame;
    viewFrame.origin.y=self.IDView.frame.origin.y+self.IDView.frame.size.height+5;
    self.bigView.frame=viewFrame;
    
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.bigView.frameY+self.bigView.frameHeight+70+self.tf_phoneNumber.frame.size.height+5);
     [self updateViewConstraints];
}
- (IBAction)addCustomerIDCardNumber:(id)sender {
    self.IDCount++;
    UIView* view=[self createViewOnParentView:self.IDView];
    
    [self.IDCardViews addObject:view];
    
    CGRect viewFrame=CGRectZero;
    UITextField* tf=[self createTextFieldOnParentView:view];
     tf.delegate=self;
    tf.font=[UIFont systemFontOfSize:14.0];
    if ([sender isKindOfClass:[NSString class]]) {
          tf.text=sender;
    }
  
    [self.IDCards addObject:tf];
    
    CGRect frame=view.frame;
    frame.origin.y= (self.tf_IDNumber.frame.size.height+6)*self.IDCount+8;
    view.frame=frame;
    
    UIButton* btn=[self createButtonOnParentView:view];
    btn.tag=3;
    
    viewFrame=self.IDView.frame;
    viewFrame.size.height=self.IDView.frame.size.height+self.tf_IDNumber.frame.size.height+5;
    self.IDView.frame=viewFrame;
    
    
    viewFrame=self.bigView.frame;
    viewFrame.origin.y=self.IDView.frame.origin.y+self.IDView.frame.size.height+5;
    self.bigView.frame=viewFrame;
    
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.bigView.frameY+self.bigView.frameHeight+70+self.tf_IDNumber.frame.size.height+5);
//    [self.nameView updateConstraintsIfNeeded];
//    [self.phoneView updateConstraintsIfNeeded];
//    [self.IDView updateConstraintsIfNeeded];
//    [self.bigView updateConstraintsIfNeeded];
}
- (IBAction)showCallBackType:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.callBackTypes];
    view.delegate=self;
    view.tag=100;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)showCustomerType:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.customerTypes];
    view.delegate=self;
    view.tag=101;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)showCustomerLevel:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.customerLevels];
    view.delegate=self;
    view.tag=102;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)showMinderLevel:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.mindOfLevels];
    view.delegate=self;
    view.tag=103;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)showInterviewAddress:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.inertviewAddress];
    view.delegate=self;
    view.tag=104;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)showSex:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.sexs];
    view.delegate=self;
    view.tag=105;
    [view showInView:self.view.window animated:YES];
}

- (IBAction)saveAction:(id)sender {
    
    if (self.customerId.length>0||[self.mark isEqualToString:@"基本信息"]) {
        if ([self isValiData]) {
            [Utils showLoading:@"正在提交..."];
            UserEntity*user=[ConfigManage getLoginUser];
            customer=[[CustomerEntity alloc]init];
            customer.customerId=self.entity.customerId;
            customer.certificate=self.tf_IDNumber.text;
            customer.customerName=self.tf_userName.text;
            customer.objectId=user.objectId;
            customer.objectName=user.objectName;
            customer.customerPhone=self.tf_phoneNumber.text;
            customer.address=self.tf_address.text;
            customer.customerBirthday=self.tf_customerBirthday.text;
            customer.customerType=self.lb_customerType.text;
            customer.customerLevel=self.lb_customerLevel.text;
            customer.orderLevel=self.lb_mindOfLevel.text;
            customer.receptionPlace=self.lb_inertviewAddress.text;
            customer.nominaterName=self.tf_commander.text;
            customer.summary=self.tf_summary.text;
            customer.visitWay=self.lb_callBackType.text;
            customer.sellerName=user.sellerName;
            customer.sellerId=[NSString stringWithFormat:@"%@",user.sellerId];
            customer.sellerGroup=user.sellGroup;
            customer.objectSimpleName=user.businessSimpleName;
            if ([NSString isEnabled:self.lb_sex.text]) {
                 customer.sex=self.lb_sex.text;
            }else{
                customer.sex=@"男";
            }
            customer.summary=self.tf_summary.text;
            customer.questionarys=nil;
            
            NSMutableArray* linkersArr=[NSMutableArray array];
            
            int result=self.names.count>self.numbers.count?(int)self.names.count:(int)self.numbers.count;
            int finalResult=result>self.IDCards.count?result:(int)self.IDCards.count;
            
            for (int i=0;i<finalResult;i++) {
                NSMutableDictionary* linkers=[NSMutableDictionary dictionary];
                if (self.names.count>=i+1) {
                    UITextField* name=self.names[i];
                    [linkers setObject:name.text forKey:@"KH_KHMC"];
                }else{
                    [linkers setObject:@"" forKey:@"KH_KHMC"];
                }
                
                if (self.numbers.count>=i+1) {
                    UITextField* number=self.numbers[i];
                    [linkers setObject:number.text forKey:@"KH_KHDH"];
                    NSLog(@"number:%@",number.text);
                }else{
                    [linkers setObject:@"" forKey:@"KH_KHDH"];
                }
                
                if (self.IDCards.count>=i+1) {
                     UITextField* IDCard=self.IDCards[i];
                    [linkers setObject:IDCard.text forKey:@"KH_ZJHM"];
                }else{
                    [linkers setObject:@"" forKey:@"KH_ZJHM"];
                }
                
                [linkersArr addObject:linkers];
            }
            customer.otherConnectionGroups=(NSArray*) linkersArr;
            NSDictionary* dic=[NSDictionary dictionary];
                CustomerMainManager* manager=[[CustomerMainManager alloc]init];
            [manager persistCustomer:customer Questionnaire:dic CustomerName:self.tf_userName.text CustomerPhone:self.tf_phoneNumber.text ModifyStatu:@"2" success:^(id data, NSDictionary *userInfo) {
                    NSLog(@"data===%@",data);
                    [PYToast showWithText:@"提交成功!"];
                    
                    [Utils hiddenLoading];
                 
                    [self.navigationController popViewControllerAnimated:YES];
                } faild:^(id data, NSDictionary *userInfo) {
                    NSLog(@"faildData===%@",data);
                    [Utils hiddenLoading];
                    [PYToast showWithText:@"提交失败!"];
                }];
        }
    }else if ([self isValiData]) {
        [Utils showLoading:@"正在提交..."];
        UserEntity*user=[ConfigManage getLoginUser];
        customer=[[CustomerEntity alloc]init];
        customer.customerId=@"";
        customer.certificate=self.tf_IDNumber.text;
        customer.customerName=self.tf_userName.text;
        customer.objectId=user.objectId;
        customer.objectName=user.objectName;
        customer.customerPhone=self.tf_phoneNumber.text;
        customer.address=self.tf_address.text;
        customer.customerBirthday=self.tf_customerBirthday.text;
        customer.customerType=self.lb_customerType.text;
        customer.customerLevel=self.lb_customerLevel.text;
        customer.orderLevel=self.lb_mindOfLevel.text;
        customer.receptionPlace=self.lb_inertviewAddress.text;
        customer.nominaterName=self.tf_commander.text;
         customer.summary=self.tf_summary.text;
        customer.visitWay=self.lb_callBackType.text;
        customer.sellerName=user.sellerName;
        customer.sellerId=[NSString stringWithFormat:@"%@",user.sellerId];
        customer.sellerGroup=user.sellGroup;
        customer.objectSimpleName=user.businessSimpleName;
        if ([NSString isEnabled:self.lb_sex.text]) {
            customer.sex=self.lb_sex.text;
        }else{
            customer.sex=@"男";
        }
        customer.summary=self.tf_summary.text;
        customer.questionarys=nil;
        
        NSMutableArray* linkersArr=[NSMutableArray array];
        int result=self.names.count>self.numbers.count?(int)self.names.count:(int)self.numbers.count;
        int finalResult=result>self.IDCards.count?result:(int)self.IDCards.count;
        
        for (int i=0;i<finalResult;i++) {
            NSMutableDictionary* linkers=[NSMutableDictionary dictionary];
            if (self.names.count>=i+1) {
                UITextField* name=self.names[i];
                [linkers setObject:name.text forKey:@"KH_KHMC"];
            }else{
                [linkers setObject:@"" forKey:@"KH_KHMC"];
            }
            
            if (self.numbers.count>=i+1) {
                UITextField* number=self.numbers[i];
                [linkers setObject:number.text forKey:@"KH_KHDH"];
            }else{
                [linkers setObject:@"" forKey:@"KH_KHDH"];
            }
            
            if (self.IDCards.count>=i+1) {
                UITextField* IDCard=self.IDCards[i];
                [linkers setObject:IDCard.text forKey:@"KH_ZJHM"];
            }else{
                [linkers setObject:@"" forKey:@"KH_ZJHM"];
            }
            
            [linkersArr addObject:linkers];
        }
        customer.otherConnectionGroups=(NSArray*) linkersArr;
//        QuestionaryEntity* qentity=[[QuestionaryEntity alloc]init];
        NSDictionary* dic_nil=[NSDictionary dictionary];
        //请求是否需要填写调查表
        CustomerMainManager* manager=[[CustomerMainManager alloc]init];
        NSString* vistWay=self.lb_callBackType.text;
        [manager findQuestionaryWithObjectId:user.objectId visitWay:vistWay custormerId:user.userId success:^(id data, NSDictionary *userInfo) {
            
            NSDictionary* dic=(NSDictionary*)data;
            NSLog(@"SFBT:%@",[dic objectForKey:@"BT_SFBT"]);
            if (![[dic objectForKey:@"BT_SFBT"] isEqualToString:@"是"]) {
                self.isMustField=NO;
                CustomerMainManager* manager=[[CustomerMainManager alloc]init];
                [manager persistCustomer:customer Questionnaire:dic_nil CustomerName:self.tf_userName.text CustomerPhone:self.tf_phoneNumber.text ModifyStatu:@"1" success:^(id data, NSDictionary *userInfo) {
                    NSLog(@"data===%@",data);
                    [PYToast showWithText:@"提交成功!"];
                    [Utils hiddenLoading];
                } faild:^(id data, NSDictionary *userInfo) {
                    NSLog(@"faildData===%@",data);
                    [Utils hiddenLoading];
                    [PYToast showWithText:@"提交失败!"];
                }];
            }else{
                self.isMustField=YES;
                UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"该客户需要填写调查表，是否前往？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [al show];
                [Utils hiddenLoading];
            }
        } faild:^(id data, NSDictionary *userInfo) {
            NSLog(@"faildData===%@",data);
            [Utils hiddenLoading];
            [PYToast showWithText:@"提交失败!"];
        }];
        ///
//        if (!self.isMustField) {
//            CustomerMainManager* manager=[[CustomerMainManager alloc]init];
//            [manager persistCustomer:customer Questionnaire:dic CustomerName:self.tf_userName.text CustomerPhone:self.tf_phoneNumber.text ModifyStatu:@"1" success:^(id data, NSDictionary *userInfo) {
//                NSLog(@"data===%@",data);
//                 [PYToast showWithText:@"提交成功!"];
//                [Utils hiddenLoading];
//            } faild:^(id data, NSDictionary *userInfo) {
//                NSLog(@"faildData===%@",data);
//                [Utils hiddenLoading];
//                [PYToast showWithText:@"提交失败!"];
//            }];
//
//        }else{
//            UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"该客户需要填写调查表，是否前往？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            [al show];
//            [Utils hiddenLoading];
//        }
        
        
           }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self showQueVC];
    }
}
-(void)showCustomerKeeperDetails{
    CustomerKeepDetailController * vc=[[CustomerKeepDetailController alloc]init];
    vc.title=@"客户维护";
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}
-(void)showQueVC{
    QuestionnaireViewController* vc=[[QuestionnaireViewController alloc]init];
    vc.title=@"调查表";
    vc.index=2;
    vc.mark=@"create";
    vc.customer=customer;
    [self.navigationController pushViewController:vc animated:YES];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        if ([NSString isEnabled:self.tf_IDNumber.text]&&self.tf_IDNumber.text.length>15) {
            NSRange range1=NSMakeRange(6, 4);
            NSRange range2=NSMakeRange(10, 2);
            NSRange range3=NSMakeRange(12, 2);
            self.tf_customerBirthday.text=[NSString stringWithFormat:@"%@-%@-%@",[self.tf_IDNumber.text substringWithRange:range1],[self.tf_IDNumber.text substringWithRange:range2],[self.tf_IDNumber.text substringWithRange:range3]];
        }
        return NO;
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField==self.tf_IDNumber) {
        if ([NSString isEnabled:self.tf_IDNumber.text]&&self.tf_IDNumber.text.length>15) {
            NSRange range1=NSMakeRange(6, 4);
            NSRange range2=NSMakeRange(10, 2);
            NSRange range3=NSMakeRange(12, 2);
            self.tf_customerBirthday.text=[NSString stringWithFormat:@"%@-%@-%@",[self.tf_IDNumber.text substringWithRange:range1],[self.tf_IDNumber.text substringWithRange:range2],[self.tf_IDNumber.text substringWithRange:range3]];
        }
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardDisappear:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardDisappear:(NSNotification *)notification
{
    if ([NSString isEnabled:self.tf_IDNumber.text]&&self.tf_IDNumber.text.length>15) {
        NSRange range=NSMakeRange(6, 8);
        self.tf_customerBirthday.text=[self.tf_IDNumber.text substringWithRange:range];
    }

}

-(BOOL)isValiData{
    if (!self.tf_userName.text.length>0) {
        [Utils showAlert:@"请输入用户名" title:@"提示"];
        return NO;
    }
    if ([NSString isEnabled:self.tf_IDNumber.text]) {
        if (self.tf_IDNumber.text.length>19||self.tf_IDNumber.text.length<15) {
            [Utils showAlert:@"请输入正确的身份证号！" title:@"提示"];
            return NO;
        }
    }
    return YES;
}

-(UITextField*)createTextFieldOnParentView:(UIView*)view{
    UITextField* tf=[[UITextField alloc]init];
    tf.frame=CGRectMake(84, 1, DEVICE_WIDTH-138, 32);
    tf.borderStyle=UITextBorderStyleNone;
    tf.backgroundColor=[UIColor whiteColor];
    [view addSubview:tf];
    return tf;
   
}
-(UIButton*)createButtonOnParentView:(UIView*)view{
    UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-51, 1, 30, 30)];
    [btn setBackgroundImage:[UIImage imageNamed:@"button_minus.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(removeTextFieldWithDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return btn;
}
-(UIView*)createViewOnParentView:(UIView*)view{
    UIView* backView=[[UIView alloc]initWithFrame:CGRectMake(0, 98,DEVICE_WIDTH, 32)];
    backView.backgroundColor=[UIColor clearColor];
    [view addSubview:backView];
    return backView;
}
-(void)removeTextFieldWithDeleteButton:(UIButton*)btn{
    [btn.superview removeFromSuperview];
    UIView* view=(UIView*)btn.superview;
    NSArray* subViews=view.subviews;
    if (btn.tag==1) {
        CGRect viewFrame=CGRectZero;
        viewFrame=self.nameView.frame;
        viewFrame.size.height=self.nameView.frame.size.height-self.tf_userName.frame.size.height-5;
        self.nameView.frame=viewFrame;
        
        viewFrame=self.phoneView.frame;
        viewFrame.origin.y=self.phoneView.frame.origin.y-self.tf_userName.frame.size.height-5;
        self.phoneView.frame=viewFrame;
        
        viewFrame=self.IDView.frame;
        viewFrame.origin.y=self.IDView.frame.origin.y-self.tf_userName.frame.size.height-5;
        self.IDView.frame=viewFrame;
        
        viewFrame=self.bigView.frame;
        viewFrame.origin.y=self.bigView.frame.origin.y-self.tf_userName.frame.size.height-5;
        self.bigView.frame=viewFrame;
        
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.bigView.frameY+self.bigView.frameHeight+70);
        [self.nameViews removeObject:btn.superview];
        for (id view in subViews) {
            if ([view isKindOfClass:[UITextField class]]) {
                [self.names removeObject:view];
            }
        }
        
        for (int i=0; i<self.nameViews.count; i++) {
            UIView * view=self.nameViews[i];
            CGRect viewFrame=CGRectZero;
            viewFrame=view.frame;
            viewFrame.origin.y=(self.tf_userName.frame.size.height+6)*(i+1)+8;
            [UIView animateWithDuration:0.3 animations:^{
                view.frame=viewFrame;
            } completion:^(BOOL finished) {
                
            }];
        }
         --self.count;
    }
    if (btn.tag==2) {
        CGRect viewFrame=CGRectZero;
        viewFrame=self.phoneView.frame;
        viewFrame.size.height=self.phoneView.frame.size.height-self.tf_phoneNumber.frame.size.height-5;
        self.phoneView.frame=viewFrame;
        
        viewFrame=self.IDView.frame;
        viewFrame.origin.y=self.IDView.frame.origin.y-self.tf_phoneNumber.frame.size.height-5;
        self.IDView.frame=viewFrame;
        
        viewFrame=self.bigView.frame;
        viewFrame.origin.y=self.bigView.frame.origin.y-self.tf_phoneNumber.frame.size.height-5;
        self.bigView.frame=viewFrame;

        
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.bigView.frameY+self.bigView.frameHeight+70);
        [self.numberViews removeObject:btn.superview];
        for (id view in subViews) {
            if ([view isKindOfClass:[UITextField class]]) {
                [self.numbers removeObject:view];
            }
        }
        
        
        for (int i=0; i<self.numberViews.count; i++) {
            UIView * view=self.numberViews[i];
            CGRect viewFrame=CGRectZero;
            viewFrame=view.frame;
            viewFrame.origin.y=(self.tf_phoneNumber.frame.size.height+6)*(i+1)+8;
            [UIView animateWithDuration:0.3 animations:^{
                view.frame=viewFrame;
            } completion:^(BOOL finished) {
                
            }];
        }
        --self.phoneCount;
    }
    if (btn.tag==3) {
        CGRect viewFrame=CGRectZero;
        viewFrame=self.IDView.frame;
        viewFrame.size.height=self.IDView.frame.size.height-self.tf_IDNumber.frame.size.height-5;
        self.IDView.frame=viewFrame;
        
        viewFrame=self.bigView.frame;
        viewFrame.origin.y=self.bigView.frame.origin.y-self.tf_IDNumber.frame.size.height-5;
        self.bigView.frame=viewFrame;
        
        
        self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.bigView.frameY+self.bigView.frameHeight+70);
        [self.IDCardViews removeObject:btn.superview];
        for (id view in subViews) {
            if ([view isKindOfClass:[UITextField class]]) {
                [self.IDCards removeObject:view];
            }
        }
        
        for (int i=0; i<self.IDCardViews.count; i++) {
            UIView * view=self.IDCardViews[i];
            CGRect viewFrame=CGRectZero;
            viewFrame=view.frame;
            viewFrame.origin.y=(self.tf_IDNumber.frame.size.height+6)*(i+1)+8;
            [UIView animateWithDuration:0.3 animations:^{
                view.frame=viewFrame;
            } completion:^(BOOL finished) {
                
            }];
        }
        --self.IDCount;
    }
}
#pragma levelPopViewDelegate
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex{
    if (popListView.tag==100) {
        self.lb_callBackType.text=[self.callBackTypes objectAtIndex:anIndex];
    }
    if (popListView.tag==101) {
        self.lb_customerType.text=[self.customerTypes objectAtIndex:anIndex];
    }

    if (popListView.tag==102) {
        self.lb_customerLevel.text=[self.customerLevels objectAtIndex:anIndex];
    }

    if (popListView.tag==103) {
        self.lb_mindOfLevel.text=[self.mindOfLevels objectAtIndex:anIndex];
    }

    if (popListView.tag==104) {
        self.lb_inertviewAddress.text=[self.inertviewAddress objectAtIndex:anIndex];
    }
    if (popListView.tag==105) {
        self.lb_sex.text=[self.sexs objectAtIndex:anIndex];
    }

}
@end
