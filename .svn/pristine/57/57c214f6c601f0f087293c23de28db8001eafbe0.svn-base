//
//  MarketingViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/18.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "MarketingViewController.h"

@interface MarketingViewController ()<UITableViewDataSource,UITableViewDelegate,UIDocumentInteractionControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray * files;
@property (nonatomic,strong) NSMutableArray * images;
@property (nonatomic,strong) NSString * qvcURL;
@property (nonatomic,assign) NSInteger fileIndex;
@property (nonatomic,strong) UIDocumentInteractionController* docVC;
@end

@implementation MarketingViewController
-(NSMutableArray *)images{
    if (!_images) {
        _images=[NSMutableArray array];
    }
    return _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.files=nil;
    self.files=[NSMutableArray array];
    [self loadData];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
}
//-(BOOL)shouldAutorotate
//{
//    return YES;
//}
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscape;
//}
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationLandscapeRight;
//}
-(void)loadData{
    
    //    UserEntity* user=[ConfigManage getLoginUser];
    AdminManager * manager=[[AdminManager alloc]init];
    [manager queryMarketAndWikiWithFilesType:@"yxhd" success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (NSDictionary* dic in arr) {
            [self.files addObject:dic];
        }
        [self.tableView reloadData];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}
#pragma tableViewDegelate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.files.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID=@"cell";
    SellInfosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"SellInfosTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
        cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
    }
    NSDictionary* dic=[self.files objectAtIndex:indexPath.row];
    cell.fileName.text=[dic objectForKey:@"ZD_ZDMC"];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"营销活动";
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [Utils showLoading:@"正在打开文件..." ];
    NSDictionary* dic=[self.files objectAtIndex:indexPath.row];
    NSString* urlStr=[dic objectForKey:@"ZD_ZDVAL"];
    NSString* URL=[NSString stringWithFormat:@"%@%@",URL_FOR_TOOLS,urlStr];
    if ([urlStr hasSuffix:@"jpg"]) {
        TempOpenImageViewController* vc=[[TempOpenImageViewController alloc]init];
        vc.title=[dic objectForKey:@"ZD_ZDMC"];
        vc.imageURL=URL;
        [Utils hiddenLoading];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
//        QLPreviewController* qvc=[[QLPreviewController alloc]init];
//        qvc.dataSource=self;
//        qvc.title=[dic objectForKey:@"ZD_ZDMC"];
//        [qvc setCurrentPreviewItemIndex:0];
//        self.qvcURL=URL;
//        [self.navigationController pushViewController:qvc animated:YES];
//        TempOpenDocmentViewController* dvc=[[TempOpenDocmentViewController alloc]init];
//        dvc.title=[dic objectForKey:@"ZD_ZDMC"];;
//        dvc.documentURL=URL;
//        [self.navigationController pushViewController:dvc animated:YES];
        NSString* str=[URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSMutableURLRequest* request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str]];
        NSURLSessionConfiguration* config=[NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession * session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[[NSOperationQueue alloc]init]];
        NSURLSessionDownloadTask* task=[session downloadTaskWithRequest:request];
        [task resume];
        self.fileIndex=indexPath.row;
    }
    
}
#pragma <QLPreviewControllerDataSource>
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
//    return self.files.count;
    return 1;
}
- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
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
    [body writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"body:%@",body);
    
    return url;
}
#pragma NSURLSession
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    double progress=totalBytesWritten*1.0/totalBytesExpectedToWrite;
    NSLog(@"%lf",progress);
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
   
    NSFileManager* fm=[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSDictionary* dic=[self.files objectAtIndex:self.fileIndex];
    NSString* fileName=[dic objectForKey:@"ZD_ZDMC"];
    
    NSString* docPath=[NSString stringWithFormat:@"%@/%@",path,fileName];
    NSLog(@"docPath:%@",docPath);
    [fm moveItemAtURL:location toURL:[NSURL fileURLWithPath:docPath] error:nil];
    [self showQLVC];
//    self.docVC=[UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:docPath]];
//    self.docVC.delegate=self;
//    [self.docVC presentPreviewAnimated:YES];
//    [self.docVC presentOpenInMenuFromRect:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-300, [UIScreen mainScreen].bounds.size.width, 300) inView:self.view animated:YES];
//    [self.docVC presentOptionsMenuFromRect:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-300, [UIScreen mainScreen].bounds.size.width, 300) inView:self.view animated:YES];
    
}
-(UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return self;
}

-(void)showQLVC{
            NSDictionary* dic=[self.files objectAtIndex:self.fileIndex];
            QLPreviewController* qvc=[[QLPreviewController alloc]init];
            qvc.dataSource=self;
            qvc.title=[dic objectForKey:@"ZD_ZDMC"];
            [qvc setCurrentPreviewItemIndex:0];
            [self goNextController:qvc];
      [Utils hiddenLoading];
}
@end
