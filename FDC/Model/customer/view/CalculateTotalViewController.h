//
//  CalculateTotalViewController.h
//  FDC
//
//  Created by NewDoone on 15/4/1.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"

@interface CalculateTotalViewController : FDCController
@property (weak, nonatomic) IBOutlet UILabel *shouldPayCount;
@property (weak, nonatomic) IBOutlet UILabel *discount;
@property (weak, nonatomic) IBOutlet UILabel *acturllyPay;
@property (weak, nonatomic) IBOutlet UILabel *firstPay;
@property (nonatomic,strong) NSString* sholudPay;
@property (nonatomic,strong) NSString* discountCount;
@property (nonatomic,strong) NSString* actCount;
@property (nonatomic,strong) NSString* firstCount;
@end
