//
//  AppDelegate.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/9.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "AppDelegate.h"
#import <CommonSDK/CommonSDK.h>
#import "SimpleViewController.h"
#import "Utils+Expand.h"
#import "FDCNavigationController.h"
#import "ManagerIndexViewController.h"
#import "UserManager.h"
#import "LoginController.h"

@interface AppDelegate () <UISplitViewControllerDelegate,UIAlertViewDelegate>
@property (nonatomic,strong) NSString* updateUrl;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    globalRotateHasVoice = false;
//    [self checkUpdateState];
    self.window =  [Utils setRootController:[LoginController new]];

    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    return YES;
}
-(void)checkUpdateState{
    NSString *key = (NSString *)kCFBundleVersionKey;
//    //取出上次使用的版本号
//    NSString *lastVersionCode = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //加载程序中的info.plist
    NSString *currentVersionCode = [NSBundle mainBundle].infoDictionary[key];
    NSLog(@"currentVersionCode:%@",currentVersionCode);
    
    UserManager* manager=[[UserManager alloc]init];
    [manager checkUpdateStateWithVersion:currentVersionCode success:^(id data, NSDictionary *userInfo) {
        NSLog(@"versionData:%@",data);
        if (data) {
            self.updateUrl=(NSString*)data;
            UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"更新提示" message:@"当前版本过低，需要更新!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [al show];
        }
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        
    }
    if (buttonIndex==1) {
        NSString* url=[NSString stringWithFormat:@"itms-services://?action=download-manifest&url=%@",self.updateUrl];
        NSLog(@"url====%@",url);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        [self exitApplication];

    }
}
// 退出程序
- (void)exitApplication
{
    UIWindow *window =  [UIApplication sharedApplication].delegate.window;
    [UIView animateWithDuration:0.5f animations:^
     {
         window.alpha = 0;
         window.frame = CGRectMake(CGRectGetWidth(window.frame)/2,CGRectGetHeight(window.frame)/2,1, 1);
     }
                     completion:^(BOOL finished)
     {
         exit(0);
     }];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window

{
    
    return (UIInterfaceOrientationMaskPortrait);
    
}

void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // Internal error reporting
}

@end
