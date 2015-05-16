//
//  SimplePickerView.h
//  Common
//
//  Created by wlpiaoyi on 14/12/3.
//  Copyright (c) 2014年 wlpiaoyi. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol SimplePickerViewDelegate;


/**
 滚动选择器
 */
@interface SimplePickerView : UIView<UITableViewDataSource,UITableViewDelegate>
/**
 事件操作的协议
*/
 @property (nonatomic,assign) id<SimplePickerViewDelegate> delegate;
/**
 滑动完成后选择Cell
 */
@property (nonatomic) BOOL selectedWhenScroll;

/**
 目标的放大率 >0
*/
 @property (nonatomic) float mutipleValue;
/**
 选种背景
 */
@property (nonatomic,strong) UIColor *cellSelectedBgColor;
/**
 未选中的背景
 */
@property (nonatomic,strong) NSArray *cellUnSelectedBgColors;
/**
 跳转到指定的行
 */
@property (nonatomic) NSInteger rowSkip;
-(void) setRowSkip:(NSInteger)rowSkip animated:(BOOL) animated;
/**
 重载数据
 */
-(void) reloadData;
@end


@protocol SimplePickerViewDelegate<NSObject>
@required
-(UIView*) pickerGetCell:(SimplePickerView*) Picker;
-(NSInteger) PickerNumberOfRows:(SimplePickerView*) Picker;
-(void) picker:(SimplePickerView*) Picker setCell:(UIView*) setcell row:(NSInteger) row;
@optional
-(CGFloat) picker:(SimplePickerView*) Picker heightForRowAtIndex:(NSInteger) row;
-(void) pickerCellDidSelected:(NSInteger) row;
-(void) pickerCellDidCheck:(UIView*) cell;
-(void) pickerCellDidUnCheck:(UIView*) cell;
@end
