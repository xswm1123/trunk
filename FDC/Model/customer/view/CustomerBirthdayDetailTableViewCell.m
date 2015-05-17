//
//  CustomerBirthdayDetailTableViewCell.m
//  FDC
//
//  Created by NewDoone on 15/1/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerBirthdayDetailTableViewCell.h"
#import "TelephoneCenter.h"
#import <CommonSDK/CommonSDK.h>

@implementation CustomerBirthdayDetailTableViewCell

- (void)awakeFromNib {
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}
-(void)setSex:(NSString *)sex{
    _sex=sex;
    if ([sex isEqualToString:@"女"]) {
        self.photoIV.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.photoIV.image=[UIImage imageNamed:@"male.png"];
    }
}
- (IBAction)telephoneCallAction:(id)sender {
    NSString* message=[NSString stringWithFormat:@"是否拨打%@",self.phoneNumber];
    UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [al show];
}
- (IBAction)sendMessageAction:(id)sender {
    if(self.phoneNumber != nil){
        [TelephoneCenter requestSMSWithRecipients:@[self.phoneNumber] message:@""];
    }else{
        [Utils showAlert:@"找不到联系方式" title:nil];
    }

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.phoneNumber]]];
    }
}
//-(void)configBtnStars{
//    for (UIButton* btn in self.btn_stars) {
//        btn.imageView.image=[UIImage imageNamed:@"image_star_unselected.png"];
//        [btn addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//}
//-(void)changeImage:(UIButton*)btn{
//    for (UIButton* btn in self.btn_stars) {
//        btn.imageView.image=[UIImage imageNamed:@"image_star_unselected.png"];
//    }
//    NSUInteger index=[self.btn_stars indexOfObject:btn];
//    for (int i=0; i<index; i++) {
//        UIButton* button=[self.btn_stars objectAtIndex:i];
//        button.imageView.image=[UIImage imageNamed:@"image_star_selected.png"];
//    }
//}
//-(void)configStarsByIndex:(NSUInteger)index{
//    for (UIButton* btn in self.btn_stars) {
//        btn.imageView.image=[UIImage imageNamed:@"image_star_unselected.png"];
//    }
//    for (int i=0; i<index; i++) {
//        UIButton* button=[self.btn_stars objectAtIndex:i];
//        button.imageView.image=[UIImage imageNamed:@"image_star_selected.png"];
//    }
//
//}
@end
