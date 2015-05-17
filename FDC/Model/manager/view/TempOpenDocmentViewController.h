//
//  TempOpenDocmentViewController.h
//  FDC
//
//  Created by NewDoone on 15/3/24.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"

@interface TempOpenDocmentViewController : FDCController
@property(nonatomic,strong) NSString* documentURL;
@property(nonatomic,assign) NSInteger fileIndex;
@property(nonatomic,strong) NSMutableArray* files;
@end
