//
//  upLoadFilesViewController.h
//  FDC
//
//  Created by NewDoone on 15/1/20.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"
#import "NSData+Base64.h"

@interface upLoadFilesViewController : FDCController
@property (weak, nonatomic) IBOutlet UIView *cameraView;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property(nonatomic,strong) NSString * customerName;
@property(nonatomic,strong) NSDictionary* info;
@end
@interface ImageFileInfo : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *fileName;
@property(nonatomic,strong) NSString *mimeType;
@property(nonatomic,assign) long long filesize;
@property(nonatomic,strong) NSData *fileData;
@property(nonatomic,strong) UIImage *image;

-(id)initWithImage:(UIImage *)image;

@end