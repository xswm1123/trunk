//
//  FDCNavigationController.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/13.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCNavigationController.h"
#import "FDCToolBar.h"
@interface FDCNavigationController(){
    dispatch_block_nav_toolbar_onclick blcokNavToolbarOnclick;
    dispatch_block_toolbar_onclick blcokToolbarOnclick;
    bool ifFirst;
}
@property (nonatomic,strong) FDCToolBar *fdcToolBar;
@property (nonatomic,strong) NSArray *arrayButtons;
@end

@implementation FDCNavigationController
-(void) viewDidLoad{
    [super viewDidLoad];
    [self setImageNavigationBarBg:[UIImage imageWithColor:[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1]] position:-1];
    [self setImageToolsBarBg:[UIImage imageWithColor:[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1]] position:-1];
    self.toolbarHidden = NO;
    _fdcToolBar = [FDCToolBar new];
    [self.fdcToolBar autoresizingMask_TBLRWH];
    self.fdcToolBar.frameSize = self.toolbar.frameSize;
    self.fdcToolBar.frameOrigin = CGPointMake(0, 0);
    [self.toolbar addSubview:self.fdcToolBar];
}

-(void) setToolButtons:(NSArray*) buttons{
    _arrayButtons = buttons;
    if (_fdcToolBar)[_fdcToolBar setButtons:buttons];
}

-(void) setDispatchBlockToolbarOnclick:(dispatch_block_nav_toolbar_onclick) block{
    blcokNavToolbarOnclick = block;
    __weak dispatch_block_nav_toolbar_onclick weakblock = blcokNavToolbarOnclick;
    __weak typeof(self) weakself = self;
    blcokToolbarOnclick = ^(int index) {
        UIViewController *vc = weakblock(index);
        [weakself setViewControllers:@[vc] animated:NO];
    };
    if (_fdcToolBar)[_fdcToolBar setDispatchBlockToolbarOnclick:blcokToolbarOnclick];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(ifFirst)return;
    ifFirst = YES;
    [self reloadToolsBar];
}
-(void) reloadToolsBar{
    if (_arrayButtons&&[_arrayButtons count])[self setToolButtons:_arrayButtons];
    if (blcokToolbarOnclick){
        [_fdcToolBar setDispatchBlockToolbarOnclick:blcokToolbarOnclick];
        blcokToolbarOnclick(0);
    }
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
}
@end
