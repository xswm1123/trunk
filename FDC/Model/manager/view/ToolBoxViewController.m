//
//  ToolBoxViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/20.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "ToolBoxViewController.h"
#import "upLoadFilesViewController.h"
#import "houseImageViewController.h"
#import "SearchFilesViewController.h"

@interface ToolBoxViewController ()<UIGestureRecognizerDelegate,MFMessageComposeViewControllerDelegate>

@end

@implementation ToolBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self addTapOnViews];
    [self setTitle:@"工具箱"];
}
//-(BOOL)shouldAutorotate
//{
//    return NO;
//}
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscape;
//}
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationPortrait;
//}
-(void)initView{
    
    self.upLoadFilesView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.upLoadFilesView.layer.borderWidth=0.8;
    self.sendGroupMessageView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.sendGroupMessageView.layer.borderWidth=0.8;
    self.houseImageView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.houseImageView.layer.borderWidth=0.8;
    self.marketingView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.marketingView.layer.borderWidth=0.8;
    self.sellInfoView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.sellInfoView.layer.borderWidth=0.8;
    self.rankingView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.rankingView.layer.borderWidth=0.8;
}
-(void)addTapOnViews{
    //addTargetOnBtns
    [self.uploadBtn addTarget:self action:@selector(goToUpload) forControlEvents:UIControlEventTouchUpInside];
    [self.sendMessageBtn addTarget:self action:@selector(goToMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.houseImageBtn addTarget:self action:@selector(goToHouse) forControlEvents:UIControlEventTouchUpInside];
    [self.marketBtn addTarget:self action:@selector(goToMarket) forControlEvents:UIControlEventTouchUpInside];
    [self.sellInfoBtn addTarget:self action:@selector(goToSellInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.rankBtn addTarget:self action:@selector(goToRanking) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer* tap_upload=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToUpload)];
     UITapGestureRecognizer* tap_sendMessage=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToMessage)];
     UITapGestureRecognizer* tap_houseImage=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToHouse)];
     UITapGestureRecognizer* tap_market=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToMarket)];
     UITapGestureRecognizer* tap_sellInfo=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToSellInfo)];
     UITapGestureRecognizer* tap_ranking=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToRanking)];
    [self.upLoadFilesView addGestureRecognizer:tap_upload];
     [self.sendGroupMessageView addGestureRecognizer:tap_sendMessage];
     [self.houseImageView addGestureRecognizer:tap_houseImage];
     [self.marketingView addGestureRecognizer:tap_market];
     [self.sellInfoView addGestureRecognizer:tap_sellInfo];
     [self.rankingView addGestureRecognizer:tap_ranking];
}
-(void)goToUpload{
    SearchFilesViewController* vc=[[SearchFilesViewController alloc]init];
    vc.title=@"资料搜索";
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"goToUpload");
}
-(void)goToMessage{
    NSLog(@"goToMessage");
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://18780052973"]];
////    [self sendSMS:@"test" recipientList:@[@"18780052973",@"18780052927"]];
     [TelephoneCenter requestSMSWithRecipients:@[] message:@""];
}
-(void)goToHouse{
    houseImageViewController* vc=[[houseImageViewController alloc]init];
    vc.title=@"户型图";
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"goToHouse");
}
-(void)goToMarket{
    NSLog(@"goToMarket");
    MarketingViewController* vc=[[MarketingViewController alloc]init];
    vc.title=@"营销活动";
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)goToSellInfo{
    NSLog(@"goToSellInfo");
    SellInfosViewController* vc=[[SellInfosViewController alloc]init];
    vc.title=@"销售百科";
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)goToRanking{
    NSLog(@"goToRanking");
    RankingViewController* vc=[[RankingViewController alloc]init];
    vc.title=@"排行榜";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
    
    if([MFMessageComposeViewController canSendText])
        
    {
        
        controller.body = bodyOfMessage;
        
        controller.recipients = recipients;
        
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
//        [self presentModalViewController:controller animated:YES];
//            [self.navigationController pushViewController:controller animated:YES];
//        [self goNextController:controller];
        
    }   

}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
        else if (result == MessageComposeResultSent)
            NSLog(@"Message sent");
            else
                NSLog(@"Message failed");
}
@end
