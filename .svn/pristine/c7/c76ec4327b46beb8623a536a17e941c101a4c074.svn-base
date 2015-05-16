//
//  SimpleViewController.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/11.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "SimpleViewController.h"

@interface SimpleViewController ()
@property (nonatomic,strong) UIButton *showPopUp;
@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setCornerRadiusAndBorder:5 BorderWidth:5 BorderColor:[UIColor greenColor]];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    _showPopUp = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_showPopUp];
    [self setTitle:@"test"];
    _showPopUp.frameX = -50;
    _showPopUp.frameY = -100;
    _showPopUp.frameWidth = 80;
    _showPopUp.frameHeight = 30;
    [_showPopUp addTarget:self action:@selector(onclickShowPopUp)];
    [_showPopUp setTitle:@"弹出框" forState:UIControlStateNormal];
    [_showPopUp setBackgroundColor:[UIColor greenColor]];
    [_showPopUp setCornerRadiusAndBorder:1 BorderWidth:1 BorderColor:[UIColor redColor]];
    [ViewAutolayoutCenter persistConstraintCenter:_showPopUp];
//    [ViewAutolayoutCenter persistConstraintRelation:_showPopUp margins:UIEdgeInsetsMake(50, 10, DisableConstrainsValueMAX, DisableConstrainsValueMAX) toItems:nil];
    [ViewAutolayoutCenter persistConstraintSize:_showPopUp];
    // Do any additional setup after loading the view.
}

-(void) onclickShowPopUp{
    PopUpDialogVendorView *pd =[PopUpDialogVendorView alertWithMessage:@"test" title:@"test" onclickBlock:^BOOL(PopUpDialogVendorView *dialogView, NSInteger buttonIndex) {
        switch (buttonIndex) {
            case 0:
            {
                SimpleViewController *vc = [SimpleViewController new];
                [self goNextController:vc];
                NSLog(@"确定");
            }
                break;
            case 1:
            {
                NSLog(@"取消");
            }
                break;
                
            default:{
            }
                break;
        }
        return true;
    } buttonNames:@"确定",@"取消",nil];
    [pd show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
