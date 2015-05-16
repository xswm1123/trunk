//
//  CustomerIndexTrackTableViewCell.m
//  FDC
//
//  Created by NewDoone on 15/4/3.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerIndexTrackTableViewCell.h"
#import "TelephoneCenter.h"
#import <CommonSDK/CommonSDK.h>

@implementation CustomerIndexTrackTableViewCell

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
        self.photoIV.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.photoIV.image=[UIImage imageNamed:@"male.png"];
    }
}
- (IBAction)sendMessage:(id)sender {
    if(self.phoneNumber.text!= nil){
        [TelephoneCenter requestSMSWithRecipients:@[self.phoneNumber.text] message:@""];
    }else{
        [Utils showAlert:@"找不到联系方式" title:nil];
    }

}
- (IBAction)callAction:(id)sender {
    NSString* message=[NSString stringWithFormat:@"是否拨打%@",self.phoneNumber.text];
    UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [al show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.phoneNumber.text]]];
    }
}
@end
