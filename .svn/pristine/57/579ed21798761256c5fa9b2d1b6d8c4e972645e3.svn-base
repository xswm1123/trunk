//
//  FinanceViewController.m
//  FDC
//
//  Created by NewDoone on 15/2/26.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FinanceViewController.h"
#import "AdminManager.h"

@interface FinanceViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong)UIWebView* indexWeb;


@end

@implementation FinanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createWebView];
    [self setTitle:@"款项"];
    // Do any additional setup after loading the view from its nib.
}
-(void)createWebView{
    CGRect frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-self.navigationController.toolbar.frameHeight-64);

    
    self.indexWeb=[[UIWebView alloc]initWithFrame:frame];
    UserEntity* user=[ConfigManage getLoginUser];
    NSString* url=[NSString stringWithFormat:@"%@/kuanxiang.aspx?UserName=%@&UserPwd=%@",URL_MANAGER,user.userName,user.password];
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    [self.indexWeb loadRequest:request];
    [self.view addSubview:self.indexWeb];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [webView evaluateJavaScript:@"selectProject(record);" completionHandler:^(id ider, NSError * error) {
        
    }];
}
@end
