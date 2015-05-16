//
//  TempOpenDocmentViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/24.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "TempOpenDocmentViewController.h"

@interface TempOpenDocmentViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation TempOpenDocmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebView];
}
-(void)loadWebView{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSDictionary* dic=[self.files objectAtIndex:self.fileIndex];
    NSString* fileName=[dic objectForKey:@"ZD_ZDMC"];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSURL * url=[NSURL fileURLWithPath:filePath];
    NSLog(@"SanBoxPath:%@",filePath);
    NSData* data=[NSData dataWithContentsOfFile:filePath];
    NSString* body=[[NSString alloc]initWithData:data encoding:enc];
    
    [self.webView loadHTMLString:body baseURL:nil];
       
}

@end
