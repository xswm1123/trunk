//
//  TempOpenImageViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/23.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "TempOpenImageViewController.h"

@interface TempOpenImageViewController ()<NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TempOpenImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1
//    UIImage* image=[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageURL]]];
//    self.imageView.image=image;
    NSLog(@"URL==%@",self.imageURL);
    //2
//   [self.imageView setImageURLStr:self.imageURL placeholder:nil];
    NSOperationQueue* myQueue=[[NSOperationQueue alloc]init];
    [myQueue setMaxConcurrentOperationCount:1];
    self.imageView.alpha=0;
        NSOperation* op=[NSBlockOperation blockOperationWithBlock:^{
            NSString* str=[self.imageURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
            UIImage * image=[UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image=image;
                [UIView animateWithDuration:1.0 animations:^{
                    self.imageView.alpha=1;
                }];
            });
        }];
        [myQueue addOperation:op];
    //3
//    NSURL* url=[NSURL URLWithString:self.imageURL];
//    NSMutableURLRequest* request=[[NSMutableURLRequest alloc]initWithURL:url];
//    NSData* data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSString* info=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"info:%@",info);
//     UIImage * image=[UIImage imageWithData:data];
//     self.imageView.image=image;
    //4
   
//    NSURL* url=[NSURL URLWithString:self.imageURL];
//    NSMutableURLRequest* request=[NSMutableURLRequest requestWithURL:url];
//    NSURLSessionConfiguration* config=[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"myConfig"];
//    NSURLSession * session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[[NSOperationQueue alloc]init]];
//    NSURLSessionDownloadTask* task=[session downloadTaskWithRequest:request];
//    [task resume];
    
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    double progress=totalBytesWritten*1.0/totalBytesExpectedToWrite;
    NSLog(@"%lf",progress);
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSFileManager* fm=[NSFileManager defaultManager];
    [fm moveItemAtURL:location toURL:[NSURL fileURLWithPath:@"/Users/tarena/Desktop/12.jpg"] error:nil];
        UIImage* image=[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageURL]]];
        self.imageView.image=image;

}

@end
