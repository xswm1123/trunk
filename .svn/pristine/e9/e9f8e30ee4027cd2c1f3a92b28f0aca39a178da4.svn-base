//
//  TelephoneCenter.m
//  TelePhone
//
//  Created by wlpiaoyi on 14/12/31.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreTelephony/CTCall.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CoreTelephonyDefines.h>
#import <CommonSDK/RegexPredicate.h>
#import <CommonSDK/CommonSDK.h>
#import "TelephoneCenter.h"

unsigned short TelephoneCallType = 0;



void CTTelephonyCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior);
void CTTelephonyCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFStringRef name, const void *object);

CFNotificationCenterRef CTTelephonyCenterGetDefault(void); // 获得 TelephonyCenter (电话消息中心) 的引用
void CTCallDisconnect(CTCall *call); // 挂断电话
void CTCallAnswer(CTCall *call); // 接电话
int CTCallGetStatus(CTCall *call); // 获得电话状态　拨出电话时为３，有呼入电话时为４，挂断电话时为５
NSString *CTCallCopyAddress(void *, CTCall *call); //获得来电号码
int CTCallGetGetRowIDOfLastInsert(void); // 获得最近一条电话记录在电话记录数据库中的位置



static TelephoneCenter *xTelephoneCenter;
static id syn;
static NSString * phoneNumber;

@interface TelephoneCenter ()<UIAlertViewDelegate>{
    __block UIBackgroundTaskIdentifier backgroundTaskIdentifier;
    NSTimer *timerTelephone;
   
}
@property NSMutableArray *arrayBlock;
@property CTCallCenter *callCenter;

@end

@implementation TelephoneCenter
+(void) initialize{
    syn = [NSObject new];
}

+(TelephoneCenter*) getSingelInstance{
    @synchronized(syn){
        if (!xTelephoneCenter) {
            xTelephoneCenter = [[TelephoneCenter alloc] init];
            static dispatch_once_t oncToken;
            dispatch_once(&oncToken,^{
            });
        }
    }
    return xTelephoneCenter;
}
+(void) requestCallWithRecipient:(NSString*) recipients{
    if([self matchRecipient:recipients]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",recipients]]];
    }else{
        printf("格式不对");
    }
}
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex==1) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
//    }
//}
+(void) requestSMSWithRecipient:(NSString*) recipients{
    if([self matchRecipient:recipients]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:%@",recipients]]];
    }else{
        printf("格式不对");
    }
}
+(void)requestSMSWithRecipients:(NSArray*) recipients message:(NSString*) message{
    NSMutableArray *_recipients = [NSMutableArray new];
    for (NSString *recipient in recipients) {
        if ([self matchRecipient:recipient]) {
            [_recipients addObject:recipient];
        }
    }
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    if(picker == nil){
        [PYToast showWithText:@"无法构建短信模块！"];
        return;
    }
    picker.messageComposeDelegate = [self getSingelInstance];
    
    picker.body=message;
    picker.recipients = _recipients;
    UIViewController *vc = [Utils getCurrentController];
    [vc presentViewController:picker animated:YES completion:^{
        UINavigationController *bnc = [Utils getCurrentController].navigationController;
        if([bnc isKindOfClass:[BaseNavigationController class]]){
            ((BaseNavigationController*)bnc).flagCheckInterfaceOrientation = false;
        }
    }];
}

+(BOOL) matchRecipient:(NSString*) recipient {
    BOOL flag = false;
    flag = flag||[RegexPredicate matchHomePhone:recipient];
    flag = flag||[RegexPredicate matchMobliePhone:recipient];
    flag = flag||[RegexPredicate matchEmail:recipient];
    return flag;
}

-(id) init{
    if (self=[super init]) {
        self.arrayBlock = [NSMutableArray new];
        backgroundTaskIdentifier = UIBackgroundTaskInvalid;
        [self excuteBackgroundLisenter];
    }
    return self;
}
-(void) addLisenter{
    switch (TelephoneCallType) {
        case 1:{
            CTTelephonyCenterAddObserver(CTTelephonyCenterGetDefault(), NULL, &callbackTelephone, CFSTR("kCTCallStatusChangeNotification"), NULL, CFNotificationSuspensionBehaviorHold);
        }
            break;
            
        default:{
            _callCenter = [[CTCallCenter alloc] init];
            [_callCenter setCallEventHandler:^(CTCall *call) {
                [[TelephoneCenter getSingelInstance] statusChangeForCall:call];
            }];
        }
            break;
    }
}
-(void) excuteBackgroundLisenter{
    if (backgroundTaskIdentifier != UIBackgroundTaskInvalid) {
        return;
    }
    UIDevice* device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)]){
        backgroundSupported = device.multitaskingSupported;
    }
    UIApplication *application = [UIApplication sharedApplication];
    backgroundTaskIdentifier = [application beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (backgroundTaskIdentifier != UIBackgroundTaskInvalid) {
                [self endBackgroundTask];
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        timerTelephone = [NSTimer scheduledTimerWithTimeInterval:60*60*24*365 target:self selector:@selector(addLisenter) userInfo:nil repeats:YES];
        [timerTelephone fire];
        [[[NSThread alloc] initWithTarget:self selector:@selector(backgroundTimeRemainCheck) object:nil] start];
        [[NSRunLoop currentRunLoop] addTimer:timerTelephone forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (backgroundTaskIdentifier != UIBackgroundTaskInvalid) {
                [self endBackgroundTask];
            }
        });
    });
}
static bool flagBackgroundTimeRemainCheck;
-(void) backgroundTimeRemainCheck{
    while (true) {
        double time = [[UIApplication sharedApplication] backgroundTimeRemaining];
        if (time<10) {
            flagBackgroundTimeRemainCheck = true;
            [self endBackgroundTask];
            [self scheduleAlarmForDate:[NSDate date]];
        }else if(time>=INT16_MAX&&flagBackgroundTimeRemainCheck){
            flagBackgroundTimeRemainCheck = false;
            [self excuteBackgroundLisenter];
            break;
        }
        NSLog(@"%f",time);
        [NSThread sleepForTimeInterval:1];
        
    }
}

static void callbackTelephone(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfoCF) {
    NSString *nameArg = (__bridge NSString *)name;
    if ([nameArg isEqualToString:@"kCTCallStatusChangeNotification"]) {
        NSDictionary *userInfo = (__bridge NSDictionary *)userInfoCF;
        CTCall *call = (CTCall *)[userInfo objectForKey:@"kCTCall"];
        [[TelephoneCenter getSingelInstance] statusChangeForCall:call];
    }
}



-(void) statusChangeForCall:(CTCall*) call{
    for (dispatch_block_telephone_callcenter block in [TelephoneCenter getSingelInstance].arrayBlock) {
        switch (TelephoneCallType) {
            case 1:{
                NSString *callNumber = CTCallCopyAddress(NULL, call); //来电号码
                int callState = CTCallGetStatus(call);
                block(TelephoneCallType,@{CALLSTATUS:[NSNumber numberWithInt:callState],CALLNUMBER:callNumber});
            }
                break;
                
            default:{
                NSString *callState = call.callState;
                NSString *callId = call.callID;
                block(TelephoneCallType,@{CALLSTATUS:callState,CALLID:callId});
            }
                break;
        }
    }
}


-(void) addBlock:(dispatch_block_telephone_callcenter) block{
    @synchronized(self.arrayBlock){
        [self.arrayBlock addObject:block];
    }
}
-(void) removeBlock:(dispatch_block_telephone_callcenter) block{
    @synchronized(self.arrayBlock){
        [self.arrayBlock removeObject:block];
    }
}
-(void) endBackgroundTask{
    if (backgroundTaskIdentifier) {
        @synchronized(self){
            if (backgroundTaskIdentifier != UIBackgroundTaskInvalid) {
                [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskIdentifier];
            }
            if (timerTelephone&&[timerTelephone isValid]) {
                [timerTelephone invalidate];
            }
        }
        backgroundTaskIdentifier = UIBackgroundTaskInvalid;
        timerTelephone = nil;
    }
}

#pragma delegate <MFMessageComposeViewControllerDelegate>
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result)
    {
        case MessageComposeResultCancelled:
            printf("Result: SMS sending canceled");
            break;
        case MessageComposeResultSent:
            printf("Result: SMS sent");
            break;
        case MessageComposeResultFailed:
            [Utils showAlert:@"短信发送失败" title:nil];
            break;
        default:
            printf("Result: SMS not sent");
            break;
    }
    [controller dismissViewControllerAnimated:NO completion:^{
        
        if([[Utils getCurrentController].navigationController isKindOfClass:[BaseNavigationController class]]){
            ((BaseNavigationController*)[Utils getCurrentController].navigationController).flagCheckInterfaceOrientation = true;
        }
    }];
}
//后台弹出UILocalNotification:
- (void)scheduleAlarmForDate:(NSDate*)theDate{
    //theDate延迟多长时间弹出
    UIApplication* app = [UIApplication sharedApplication];
    NSArray* oldNotifications = [app scheduledLocalNotifications];
    // Clear out the old notification before scheduling a new one.
    if ([oldNotifications count] > 0)
        [app cancelAllLocalNotifications];
    // Create a new notification.
    UILocalNotification* alarm = [[UILocalNotification alloc] init];
    if (alarm)
    {
        alarm.fireDate = theDate;
        alarm.timeZone = [NSTimeZone defaultTimeZone];
        alarm.repeatInterval = 0;
        alarm.soundName = @"alarmsound.caf";
        alarm.alertBody = @"后台监听暂停!";
        [app scheduleLocalNotification:alarm];
    }
}

@end
