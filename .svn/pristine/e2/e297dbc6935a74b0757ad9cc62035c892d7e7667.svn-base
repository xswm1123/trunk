//
//  CustomerViewController.h
//  FDC
//
//  Created by NewDoone on 15/1/15.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "FDCController.h"
#import "LeveyPopListView.h"
#import "AdaptLeveyPopListView.h"
#import <WebKit/WebKit.h>
@class CircleView;
@interface CustomerViewController : FDCController<AdaptLeveyPopListViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *resarchLabel;
@property (weak, nonatomic) IBOutlet UILabel *projectLabel;
@property (weak, nonatomic) IBOutlet UILabel *resarchContentLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;


@end
//饼状图
@interface CircleView : UIView

@property (nonatomic, strong)NSArray *data;

@end

@interface CircleData : NSObject
//饼图数据
@property (nonatomic, strong)NSString *name;

@property (nonatomic,strong) UIColor *color;

@property (nonatomic)CGFloat value;

+ (NSArray *)createData;

@end