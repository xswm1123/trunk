//
//  UnPayTableViewCell.m
//  FDC
//
//  Created by NewDoone on 15/4/2.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "UnPayTableViewCell.h"
#import "TelephoneCenter.h"
#import <CommonSDK/CommonSDK.h>
#import "CustomerMainManager.h"

@implementation UnPayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setIsContact:(NSString *)isContact{
    _isContact=isContact;
    if ([isContact isEqualToString:@"是"]) {
        self.contactBtn.hidden=YES;
        self.contactIV.hidden=NO;
    }else{
        self.contactIV.hidden=YES;
        self.contactBtn.hidden=NO;
    }
}
-(void)setSex:(NSString *)sex{
    _sex=sex;
    if ([sex isEqualToString:@"女"]) {
        self.photoIV.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.photoIV.image=[UIImage imageNamed:@"male.png"];
    }
}
- (IBAction)changeStateAction:(id)sender {
    UserEntity* enti=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [Utils showLoading:@"正在请求数据..."];
    [manager optContactedStatusWithCompactId:self.contactId userId:enti.userId success:^(id data, NSDictionary *userInfo) {
        self.contactBtn.hidden=YES;
        self.contactIV.hidden=NO;
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];

}
- (IBAction)sendMessage:(id)sender {
    if(self.contactPhoneNumber != nil){
        [TelephoneCenter requestSMSWithRecipients:@[self.contactPhoneNumber] message:@""];
    }else{
        [Utils showAlert:@"找不到联系方式" title:nil];
    }

  
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.contactPhoneNumber]]];
    }
}
- (IBAction)callPhone:(id)sender {
    NSString* message=[NSString stringWithFormat:@"是否拨打%@",self.contactPhoneNumber];
    UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [al show];
}

@end
