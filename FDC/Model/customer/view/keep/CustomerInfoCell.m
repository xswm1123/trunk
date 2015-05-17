//
//  CustomerInfoCell.m
//  FDC
//
//  Created by wlpiaoyi on 15/2/28.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerInfoCell.h"
#import "TelephoneCenter.h"
#import <CommonSDK/CommonSDK.h>
@interface CustomerInfoCell()
    @property (nonatomic) IBOutlet AsyncImageView *imageHead;
    @property (nonatomic) IBOutlet UILabel *lableName;
    @property (nonatomic) IBOutlet UILabel *lableReVisitType;
    @property (nonatomic) IBOutlet UIButton *buttonCall;
    @property (nonatomic) IBOutlet UIButton *buttonMessage;
    @property (nonatomic) IBOutlet UILabel *lableDate;
@property (weak, nonatomic) IBOutlet UIImageView *photoIV;
@end

@implementation CustomerInfoCell{
}
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
    }
    return self;
}
-(void)setSex:(NSString *)sex{
    _sex=sex;
    if ([sex isEqualToString:@"女"]) {
        self.photoIV.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.photoIV.image=[UIImage imageNamed:@"male.png"];
    }
}
-(void) setEntity:(CustomerInfoEntity *) entity{
    _entity = entity;
    _lableName.text = _entity.customerName;
    _lableReVisitType.text = _entity.visitWay;
    _lableDate.text = _entity.visitDate;
    if([NSString isEnabled:_entity.visitDate]){
        [[self.contentView viewWithTag:231] setHidden:YES];
    }else{
        [[self.contentView viewWithTag:231] setHidden:NO];
    }
}
- (void)awakeFromNib {
    [[self.contentView viewWithTag:231] setCornerRadiusAndBorder:3 BorderWidth:1 BorderColor:[UIColor colorWithString:@"00000000"]];
    [_buttonCall addTarget:self action:@selector(onclickCall)];
    [_buttonMessage addTarget:self action:@selector(onclickMessage)];
    [[self.contentView viewWithTag:456] setCornerRadiusAndBorder:1 BorderWidth:1 BorderColor:[UIColor colorWithHexString:@"DDDDDDFF"]];
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor clearColor];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:1.000 green:0.914 blue:0.651 alpha:1]]];
//    [view addSubview:imageView];
//    imageView.frameX = DisableConstrainsValueMAX;
//    imageView.frameY = 0;
//    imageView.frameWidth = DisableConstrainsValueMAX;
//    imageView.frameHeight = 103;
//    [ViewAutolayoutCenter persistConstraintRelation:imageView margins:UIEdgeInsetsMake(DisableConstrainsValueMAX, 0, DisableConstrainsValueMAX, 0) toItems:nil];
//    [ViewAutolayoutCenter persistConstraintCenter:imageView];
//    [ViewAutolayoutCenter persistConstraintSize:imageView];
//    [self setSelectedBackgroundView:view];
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
