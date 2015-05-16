//
//  TelephoneCenter.h
//  TelePhone
//
//  Created by wlpiaoyi on 14/12/31.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//

#define CALLSTATUS @"CALLSTATUS"
#define CALLID @"CALLID"
#define CALLNUMBER @"CALLNUMBER"

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
//默认是0 如果想要得到电话号码 就改成1
extern unsigned short TelephoneCallType;

typedef void (^dispatch_block_telephone_callcenter)(int type, NSDictionary *callInfo);
@interface TelephoneCenter : NSObject<MFMessageComposeViewControllerDelegate>
+(TelephoneCenter*) getSingelInstance;
//==>打电话，发短信
+(void) requestCallWithRecipient:(NSString*) recipient;
+(void) requestSMSWithRecipient:(NSString*) recipient;
+(void) requestSMSWithRecipients:(NSArray*) recipients message:(NSString*) message;
//<==
-(void) addBlock:(dispatch_block_telephone_callcenter) block;
-(void) removeBlock:(dispatch_block_telephone_callcenter) block;

@end
