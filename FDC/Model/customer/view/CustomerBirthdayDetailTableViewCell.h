//
//  CustomerBirthdayDetailTableViewCell.h
//  FDC
//
//  Created by NewDoone on 15/1/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerBirthdayDetailTableViewCell : UITableViewCell<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *payStatus;
@property (weak, nonatomic) IBOutlet UIImageView *photoIV;
@property (weak, nonatomic) IBOutlet UILabel *birthDate;
@property (weak, nonatomic) IBOutlet UILabel *mindLevel;
@property (nonatomic,strong) NSString* phoneNumber;
@property (nonatomic,strong) NSString* sex;
@end
