//
//  SiginOverTimeTableViewCell.h
//  FDC
//
//  Created by NewDoone on 15/1/28.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiginOverTimeTableViewCell : UITableViewCell<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoIV;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *lastTrackDate;
@property (nonatomic,strong) NSString* contactId;
@property (nonatomic,strong) NSString* contactPhoneNumber;
@property (nonatomic,strong) NSString* sex;
@property (nonatomic,strong) NSString* isContact;
@property (weak, nonatomic) IBOutlet UIImageView *contactIV;
@property (weak, nonatomic) IBOutlet UIButton *contactBtn;
@end
