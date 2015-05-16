//
//  houseImageViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/20.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "houseImageViewController.h"
#import "AdminManager.h"

@interface houseImageViewController ()
@property (nonatomic,strong) NSMutableArray * images;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation houseImageViewController
-(NSMutableArray *)images{
    if (!_images) {
        _images=[NSMutableArray array];
    }
    return _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.images=nil;
    self.images=[NSMutableArray array];
    [self loadData];
}
-(void)loadData{
    [Utils showLoading:@"正在加载图片..."];
    UserEntity* user=[ConfigManage getLoginUser];
    AdminManager * manager=[[AdminManager alloc]init];
    [manager queryHouseImagesWithObjectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSArray* arr=(NSArray*)data;
        for (NSDictionary* dic in arr) {
            [self.images addObject:dic];
            NSLog(@"%@,%@,%@,%@",[dic objectForKey:@"HX_HXLB"],[dic objectForKey:@"HX_HXQM"],[dic objectForKey:@"HX_IMG"],[dic objectForKey:@"WY_WYMC"]);
        }
         [Utils hiddenLoading];
        [self loadImage];
       
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}

-(void)loadImage{
     [Utils showLoading:@"正在加载图片..."];
    CGFloat deviceWidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat imageWidth=(deviceWidth-30)/2;
    
    NSOperationQueue* myQueue=[[NSOperationQueue alloc]init];
    [myQueue setMaxConcurrentOperationCount:1];
    for (int i=0; i<self.images.count; i++) {
        UIImageView* iv=[[UIImageView alloc]initWithFrame:CGRectMake(10+i%2*(imageWidth+10),10+ i/2*(imageWidth+10), imageWidth, imageWidth)];
        iv.alpha=0;
        NSOperation* op=[NSBlockOperation blockOperationWithBlock:^{
            NSDictionary* dic=self.images[i];
            NSString* url=[NSString stringWithFormat:@"%@%@",URL_FOR_TOOLS,[dic objectForKey:@"HX_IMG"]];
            NSString* urlStr=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

            dispatch_async(dispatch_get_main_queue(), ^{
//                            NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
//                            UIImage * image=[UIImage imageWithData:data];
//                            iv.image=image;
//                NSLog(@"url:%@",urlStr);
                [iv setImageURLStr:urlStr placeholder:nil];
                [self.scrollView addSubview:iv];
                // 事件监听
                iv.tag = i;
                iv.userInteractionEnabled = YES;
                [iv addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)]];
                
                // 内容模式
                iv.clipsToBounds = YES;
                iv.contentMode = UIViewContentModeScaleAspectFill;
                
                
                [UIView animateWithDuration:1.0 animations:^{
                    iv.alpha=1;
                }];
            });
        }];
        [myQueue addOperation:op];
    }
      [Utils hiddenLoading];
    self.scrollView.contentSize=CGSizeMake(0, self.images.count/2*(imageWidth+10)+1);
}
- (void)tapImage:(UITapGestureRecognizer *)tap
{
    NSInteger count = self.images.count;
    // 1.封装图片数据
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++) {
        // 替换为中等尺寸图片
        //处理URL  这里的URL要根据接口来
        NSDictionary* dic=self.images[i];
        NSString* url=[NSString stringWithFormat:@"%@%@",URL_FOR_TOOLS,[dic objectForKey:@"HX_IMG"]];
        NSString* urlStr=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString:urlStr]; // 图片路径
        photo.srcImageView = self.scrollView.subviews[i]; // 来源于哪个UIImageView
        [photos addObject:photo];
    }
    // 2.显示相册
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    
    if ([tap.view isKindOfClass:[UIImageView class]]) {
        browser.currentPhotoIndex = tap.view.tag; // 弹出相册时显示的第一张图片是？
        browser.photos = photos; // 设置所有的图片
        NSMutableArray* titles=[NSMutableArray array];
        for (NSDictionary* dic in self.images) {
            [titles addObject:[dic objectForKey:@"HX_HXLB"]];
        }
        browser.imageTitles=titles;
        [browser show];
    }
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
