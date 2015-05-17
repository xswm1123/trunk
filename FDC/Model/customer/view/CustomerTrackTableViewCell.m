//
//  CustomerTrackTableViewCell.m
//  FDC
//
//  Created by NewDoone on 15/1/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerTrackTableViewCell.h"
#import "TelephoneCenter.h"
#import <CommonSDK/CommonSDK.h>

@implementation CustomerTrackTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setSex:(NSString *)sex{
    _sex=sex;
    if ([sex isEqualToString:@"女"]) {
        self.iv_photo.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.iv_photo.image=[UIImage imageNamed:@"male.png"];
    }
}
- (IBAction)callAction:(id)sender {
    NSString* message=[NSString stringWithFormat:@"是否拨打%@",self.contactPhoneNumber];
    UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [al show];
}

- (IBAction)sendMessageAction:(id)sender {
    if(self.contactPhoneNumber != nil){
        [TelephoneCenter requestSMSWithRecipients:@[self.contactPhoneNumber] message:@"短信"];
    }else{
        [Utils showAlert:@"找不到联系方式" title:nil];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.contactPhoneNumber]]];
    }
}
@end
