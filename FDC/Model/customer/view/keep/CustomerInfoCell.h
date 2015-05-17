//
//  CustomerInfoCell.h
//  FDC
//
//  Created by wlpiaoyi on 15/2/28.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerEntity.h"

@interface CustomerInfoCell : UITableViewCell<UIAlertViewDelegate>
@property (nonatomic,strong) CustomerInfoEntity *entity;
@property(nonatomic,strong) NSString* sex;
@end
