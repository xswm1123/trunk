//
//  RichLeveyPopListView.h
//  xsgj
//
//  Created by linw on 14/11/17.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol RichLeveyPopListViewDelegate;
@interface RichLeveyPopListView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<RichLeveyPopListViewDelegate> delegate;
@property (copy, nonatomic) void(^handlerBlock)(NSInteger anIndex);
@property (nonatomic,strong) UIButton *btnOK;
@property (nonatomic,strong) UIButton *btnNO;

// The options is a NSArray, contain some NSDictionaries, the NSDictionary contain 2 keys, one is "img", another is "text".
- (id)initWithTitle:(NSString *)aTitle options:(NSArray *)aOptions;
- (id)initWithTitle:(NSString *)aTitle
            options:(NSArray *)aOptions
            handler:(void (^)(NSInteger))aHandlerBlock;

// If animated is YES, PopListView will be appeared with FadeIn effect.
- (void)showInView:(UIView *)aView animated:(BOOL)animated;
- (void)fadeOut;
@end

@protocol RichLeveyPopListViewDelegate <NSObject>
- (void)RichLeveyPopListView:(RichLeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex;
@optional
- (void)RichLeveyPopListViewDidCancel;
-(void)RichLeveyPopListViewClickOK:(NSArray*)res;
-(void)RichLeveyPopListViewClickNO;
@end
