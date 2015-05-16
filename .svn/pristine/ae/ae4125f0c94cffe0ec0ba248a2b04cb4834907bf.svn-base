//
//  CustomerKeepDetailController.m
//  FDC
//
//  Created by wlpiaoyi on 15/3/9.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerKeepDetailController.h"
#import "TelephoneCenter.h"

@interface CustomerKeepDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *lableUserName;
@property (weak, nonatomic) IBOutlet UILabel *lableSex;
@property (weak, nonatomic) IBOutlet UILabel *lableByStatus;
@property (weak, nonatomic) IBOutlet UILabel *lableFirstTime;
@property (weak, nonatomic) IBOutlet UILabel *lableFollowUpTime;
@property (weak, nonatomic) IBOutlet UIButton *buttonMessage;
@property (weak, nonatomic) IBOutlet UIButton *buttonCall;
@property (weak, nonatomic) IBOutlet UIButton *buttonBaseInfo;
@property (weak, nonatomic) IBOutlet UIButton *buttonCheckPrice;
@property (weak, nonatomic) IBOutlet UIButton *buttonQuerstionary;
@property (weak, nonatomic) IBOutlet UILabel *mindLevel;
@property (weak, nonatomic) IBOutlet UILabel *tradeState;
@property (weak, nonatomic) IBOutlet UILabel *customerType;

@end

@implementation CustomerKeepDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"客户管理详情"];
    [_buttonBaseInfo setCornerRadiusAndBorder:2 BorderWidth:0 BorderColor:nil];
    [_buttonCheckPrice setCornerRadiusAndBorder:2 BorderWidth:0 BorderColor:nil];
    [_buttonQuerstionary setCornerRadiusAndBorder:2 BorderWidth:0 BorderColor:nil];
    [_buttonBaseInfo setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.302 green:0.655 blue:0.851 alpha:1]] forState:UIControlStateNormal];
    [_buttonCheckPrice setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.302 green:0.655 blue:0.851 alpha:1]] forState:UIControlStateNormal];
    [_buttonQuerstionary setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.302 green:0.655 blue:0.851 alpha:1]] forState:UIControlStateNormal];
    [_buttonBaseInfo addTarget:self action:@selector(onclickBaseInfo)];
    [_buttonCheckPrice addTarget:self action:@selector(onclickCheckPrice)];
    [_buttonQuerstionary addTarget:self action:@selector(onclickQuerstionary)];
    [_buttonCall addTarget:self action:@selector(onclickCall)];
    [_buttonMessage addTarget:self action:@selector(onclickMessage)];
//    _lableFollowUpTime.text = _entity.customerVisitDate;
    // Do any additional setup after loading the view from its nib.
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _lableUserName.text = _entity.customerName;
    _lableSex.text = _entity.customerSex;
    if ([_entity.customerSex isEqualToString:@"女"]) {
        self.photoIV.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.photoIV.image=[UIImage imageNamed:@"male.png"];
    }
    _lableFirstTime.text = _entity.visitWay;
    _lableFollowUpTime.text=_entity.visitDate;
    _mindLevel.text=_entity.mindLevel;
    _tradeState.text=_entity.tradeState;
    _customerType.text=_entity.customerType;
    int level = _entity.costomerLevel.intValue;
    for (int i=1; i<=5; i++) {
        BOOL value = level>=i;
        UIButton *b = (UIButton*)[self.view viewWithTag:25300+i];
        b.selected = value;
    }
}
-(void) onclickBaseInfo{
    CreateNewCustomerViewController* vc=[[CreateNewCustomerViewController alloc]init];
    vc.title=@"基本信息";
    if ([self.mark isEqualToString:@"新增"]) {
        
    }else{
          vc.mark=@"基本信息";
    }
  
    vc.entity=self.entity;
    vc.customerId=self.customerId;
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void) onclickCheckPrice{
    QuestionnaireViewController* vc=[[QuestionnaireViewController alloc]init];
    vc.title=@"制定算价";
    vc.index=1;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void) onclickQuerstionary{
    QuestionnaireViewController* vc=[[QuestionnaireViewController alloc]init];
    vc.title=@"调查表";
    vc.index=2;
    vc.customerInfo=self.entity;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) onclickCall{
    NSString* message=[NSString stringWithFormat:@"是否拨打%@",_entity.customerPhone];
    UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [al show];
}
-(void) onclickMessage{
    if(_entity.customerPhone != nil){
        [TelephoneCenter requestSMSWithRecipients:@[_entity.customerPhone] message:@"短信"];
    }else{
        [Utils showAlert:@"找不到联系方式" title:nil];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",_entity.customerPhone]]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
