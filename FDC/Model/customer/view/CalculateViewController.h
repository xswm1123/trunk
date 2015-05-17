//
//  CalculateViewController.h
//  FDC
//
//  Created by NewDoone on 15/3/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"
#import "CalculateDetailsViewController.h"
#import "CalculateTotalViewController.h"

@interface CalculateViewController : FDCController<UITextFieldDelegate,UIScrollViewDelegate>
@property(nonatomic,strong) NSDictionary * CalculateDic;
@property (nonatomic,strong) NSString* firstPay;
@end
