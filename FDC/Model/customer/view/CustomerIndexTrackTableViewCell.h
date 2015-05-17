//
//  CustomerIndexTrackTableViewCell.h
//  FDC
//
//  Created by NewDoone on 15/4/3.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerIndexTrackTableViewCell : UITableViewCell<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoIV;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *followType;
@property (weak, nonatomic) IBOutlet UILabel *followDtae;
@property (nonatomic,strong) NSString* sex;
@end
