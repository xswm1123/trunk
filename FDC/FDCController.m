//
//  FDCController.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/14.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"

//extern NSString *const URL_BASE_DATA = @"http://118.113.226.132:61/HWT.WEB";

UIImage *imageButtonSelectObject;
UIImage *imageButtonLogout;
UIImage *imageButtonBack;
#define PROJECT_NAME @"PROJECT_NAME"
#define CURRENTVERSION @"CURRENTVERSION"
static FDCController* _FDC;
@implementation FDCController
+(FDCController *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _FDC=[[FDCController alloc]init];
    });
    return _FDC;
    
}
-(void)setProjectName:(NSString *)projectName{
    if (!projectName) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:PROJECT_NAME];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:projectName forKey:PROJECT_NAME];
        }
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString *)projectName{
    return [[NSUserDefaults standardUserDefaults]stringForKey:PROJECT_NAME];
}
-(void)setCurrentVersion:(NSString *)currentVersion{
    if (!currentVersion) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:CURRENTVERSION];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:CURRENTVERSION];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];

}
-(NSString *)currentVersion{
    return  [[NSUserDefaults standardUserDefaults]stringForKey:CURRENTVERSION];
}
- (BOOL) shouldAutorotate
{
    return NO;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

+(void) initialize{
    
    imageButtonSelectObject = [UIImage imageNamed:@"button_select_object.png"];
    imageButtonSelectObject = [UIImage imageWithCGImage:[imageButtonSelectObject CGImage] scale:imageButtonSelectObject.size.height/20 orientation: UIImageOrientationUp];
    
    imageButtonLogout = [UIImage imageNamed:@"icon_logout.png"];
    imageButtonLogout = [UIImage imageWithCGImage:[imageButtonLogout CGImage] scale:imageButtonLogout.size.height/20 orientation: UIImageOrientationUp];
    
    imageButtonBack = [UIImage imageNamed:@"button_back.png"];
    imageButtonBack = [UIImage imageWithCGImage:[imageButtonBack CGImage] scale:imageButtonBack.size.height/20 orientation: UIImageOrientationUp];
}
-(void) viewDidLoad{
    [super viewDidLoad];
   
    
    
     self.navigationController.toolbar.hidden=NO;
    [self.view setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    [self setDeviceOrientation:UIDeviceOrientationPortrait];
    [self setSupportInterfaceOrientation:UIInterfaceOrientationMaskAllButUpsideDown];
}
-(void) setNavigationCenterItem{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    shadow.shadowOffset = CGSizeMake(0.5, 0.5);
    NSDictionary *navTitleArr = @{
                                  NSFontAttributeName:[UIFont systemFontOfSize:20],
                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                  NSShadowAttributeName:shadow,
                                  };
    [self.navigationController.navigationBar setTitleTextAttributes:navTitleArr];
}
-(void) setNavigationLeftItem{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationItem setLeftBarButtonItem:[self createButtonItemBack:@selector(backPreviousController)]];
    }
}

/**
 项目选择
 */
-(UIBarButtonItem*) createButtonItemSelecteObject:(SEL) action{
    return [self setButtonItemWithImage:imageButtonSelectObject action:action];
}
/**
 注销
 */
-(UIBarButtonItem*) createButtonItemLogout:(SEL) action{
    return [self setButtonItemWithImage:imageButtonLogout action:action];
}
/**
  退出
  */
-(UIBarButtonItem*) createButtonItemBack:(SEL) action{
    return [self setButtonItemWithImage:imageButtonBack action:action];
}
-(UIBarButtonItem*) setButtonItemWithImage:(UIImage*) image action:(SEL) action{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
    [buttonItem setTintColor:[UIColor whiteColor]];
    return buttonItem;
}
-(void) onclick{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
    
    
}
@end
