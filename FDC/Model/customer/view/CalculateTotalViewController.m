//
//  CalculateTotalViewController.m
//  FDC
//
//  Created by NewDoone on 15/4/1.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CalculateTotalViewController.h"

@interface CalculateTotalViewController ()

@end

@implementation CalculateTotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shouldPayCount.text=self.sholudPay;
    self.discount.text=self.discountCount;
    self.acturllyPay.text=self.actCount;
    self.firstPay.text=[NSString stringWithFormat:@"%@万",self.firstCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
