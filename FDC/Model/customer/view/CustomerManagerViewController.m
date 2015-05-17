//
//  CustomerManagerViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/29.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerManagerViewController.h"
#import "CustomerCheckViewController.h"
#import "CreateNewCustomerViewController.h"
#import "CustomerKeepController.h"

@interface CustomerManagerViewController ()

@end

@implementation CustomerManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view from its nib.
}
-(void)initView{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    label.text=@"验证";
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor clearColor];
    label.textColor=[UIColor whiteColor];
    [view addSubview:label];
    UIBarButtonItem* rightBtn=[[UIBarButtonItem alloc]initWithCustomView:view];
    
    self.navigationItem.rightBarButtonItem=rightBtn;
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showCheckVC)];
    [view addGestureRecognizer:tap];

}
-(void)showCheckVC{
    CustomerCheckViewController* vc=[[CustomerCheckViewController alloc]init];
    vc.title=@"客户验证";
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSString *)title{
    return @"客户";
}
- (IBAction)showNewCustomer:(id)sender {
    CreateNewCustomerViewController* vc=[[CreateNewCustomerViewController alloc]init];
    vc.title=@"新客户";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)showCustomerManager:(id)sender {
    [self goNextController:[[CustomerKeepController alloc] initWithNibName:@"CustomerKeepController" bundle:nil]];
}

@end
