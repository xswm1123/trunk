//
//  Utils+Expand.m
//  FDC
//
//  Created by wlpiaoyi on 15/1/14.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "Utils+Expand.h"
#import "ConfigManage+Expand.h"
#import <CommonSDK/UIButton+Expand.h>
#import <CommonSDK/GDataXMLNode.h>
#import <CommonSDK/RegexPredicate.h>
#import "FDCNavigationController.h"
#import "SimpleViewController.h"

//manager_views
#import "ManagerIndexViewController.h"
#import "CustomerViewController.h"
#import "SellStatisticsViewController.h"
#import "ToolBoxViewController.h"
//customers_views
#import "customerIndexViewController.h"

UIColor *colorSelected;
UIColor *colorNormal;
UIFont *fontToolButton;

NSDictionary *dicAllButtons;
NSArray *arrayRoleMenus;
NSArray *currentButtons;

typedef void(^UTIOnlickBlock)(void);
@interface UIButtonTitleImage:UIButton{
@public
    NSString *dataId;
    NSString *clazzName;
    NSString *xib;
    NSString *order;
}
@end

@implementation Utils(Expand)
+(void) initialize{
    ;
    
    [self initParams];
    colorSelected = [UIColor colorWithRed:0.957 green:0.773 blue:0.122 alpha:1];
    colorNormal = [UIColor whiteColor];
    fontToolButton = [UIFont systemFontOfSize:14];
    [self relaodData];
}
+(void) relaodData{
    NSData *xmlData = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/Menu.xml",[[NSBundle mainBundle] resourcePath]]];
    GDataXMLDocument *rootDocument = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:nil];
    NSArray *children = rootDocument.rootElement.children;
    GDataXMLElement *dataElement;
    NSArray *menusElementArray = [NSMutableArray new];
    for (GDataXMLElement *element in children) {
        NSString *node = element.localName;
        if ([node isEqual:@"DATAS"]) {
            dataElement = element;
        }else if([node isEqual:@"MENUS"]){
            [((NSMutableArray*)menusElementArray) addObject:element];
        }
    }
    dicAllButtons = [self getAllButtonDic:dataElement];
    if (dicAllButtons) {
        arrayRoleMenus = [self getAllMenuDic:menusElementArray];
    }
}
+(NSArray*) getAllMenuDic:(NSArray*) menusElementArray{
    NSMutableArray *_arrayRoleMenus = [NSMutableArray new];
    for (GDataXMLElement *element in menusElementArray) {
        NSMutableDictionary *menusDci = [NSMutableDictionary new];
        NSString *authority = [element attributeForName:@"authority"].stringValue;
        if (![NSString isEnabled:authority]) {
            continue;
        }
        [menusDci setObject:authority forKey:@"authority"];
        [_arrayRoleMenus addObject:menusDci];
        for (GDataXMLElement *menuElement in element.children) {
            NSString *dataId = [menuElement attributeForName:@"dataId"].stringValue;
            NSString *xib = [menuElement attributeForName:@"xib"].stringValue;
            NSString *clazz = [menuElement attributeForName:@"clazz"].stringValue;
            NSString *order = [menuElement attributeForName:@"order"].stringValue;
            
            if (![NSString isEnabled:dataId]) {
                continue;
            }
            if (![NSString isEnabled:order]) {
                order = dataId;
            }
            
            NSMutableDictionary *dicMenu = [NSMutableDictionary new];
            [dicMenu setObject:dataId forKey:@"dataId"];
            [dicMenu setObject:order forKey:@"order"];
            if ([NSString isEnabled:xib]) {
                [dicMenu setObject:xib forKey:@"xib"];
            }else if ([NSString isEnabled:clazz]) {
                [dicMenu setObject:clazz forKey:@"clazz"];
            }else{
                continue;
            }
            [menusDci setObject:dicMenu forKey:dataId];
        }
    }
    return _arrayRoleMenus;
}
+(NSDictionary*) getAllButtonDic:(GDataXMLElement*) dataElement{
    if (!dataElement||![dataElement.children count]) {
        return nil;
    }
    NSMutableDictionary *buttonsDic = [NSMutableDictionary new];
    for (GDataXMLElement *element in dataElement.children) {
        NSString *node = element.localName;
        if ([node isEqual:@"DATA"]) {
            GDataXMLNode *idNode = [element attributeForName:@"id"];
            GDataXMLNode *titleNode = [element attributeForName:@"title"];
            GDataXMLNode *nomalImageNode = [element attributeForName:@"normalImage"];
            GDataXMLNode *selectedImageNode = [element attributeForName:@"selectedImage"];
            UIButtonTitleImage *button = [self createToolButtonWithNormalImage:[UIImage imageNamed:nomalImageNode.stringValue] highlightImage:nil selectedImage:[UIImage imageNamed:selectedImageNode.stringValue] title:titleNode.stringValue];
            [buttonsDic setObject:button forKey:idNode.stringValue];
        }
    }
    return buttonsDic;
}
+(NSArray*) getMenuButtonByRole{
    [self relaodData];
    
    if (!arrayRoleMenus||![arrayRoleMenus count])return nil;
    
    NSString *authority = [ConfigManage getLoginUser].authority;
    if([NSString isEnabled:authority]&&![authority isEqualToString:@"全部"]){
        authority = @"customer";
    }else{
        authority = @"admin";
    }
    NSDictionary *currentMenus;
    for (NSDictionary *menusDic in arrayRoleMenus) {
        NSString *_authority = [menusDic objectForKey:@"authority"];
        if (![NSString isEnabled:_authority]) {
            continue;
        }
        if ([_authority isEqualToString:authority]) {
            currentMenus = menusDic;
            break;
        }else if([_authority isEqualToString:@"admin"]&&!currentMenus){
            currentMenus = menusDic;
        }
    }
    if (!currentMenus) {
        return nil;
    };
    NSArray *buttonArray = [NSMutableArray new];
    for (NSString *key in currentMenus.allKeys) {
        if ([RegexPredicate matchInteger:key]) {
            UIButtonTitleImage *button = [dicAllButtons objectForKey:key];
            if (!button) {
                continue;
            }
            NSDictionary *dic = [currentMenus objectForKey:key];
            button->clazzName = [dic objectForKey:@"clazz"];
            button->xib = [dic objectForKey:@"xib"];
            button->dataId = [dic objectForKey:@"dataId"];
            button->order = [dic objectForKey:@"order"];
            [(NSMutableArray*)buttonArray addObject:button];
        }
    }
    buttonArray = [buttonArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        UIButtonTitleImage *buttonI = obj1;
        UIButtonTitleImage *buttonII = obj2;
        NSComparisonResult result = [buttonI->order compare:buttonII->order];
        return result;
    }];
    return buttonArray;
}
+(UIViewController*) createMenuController:(int) index{
    UIButtonTitleImage *button = [currentButtons objectAtIndex:index];
    UIViewController *menuController = nil;
    if([NSString isEnabled:button->xib]){
        NSString *clazz = nil;
        if ([NSString isEnabled:button->clazzName]) {
            clazz = button->clazzName;
        } else {
            clazz = button->xib;
        }
        Class objClass = NSClassFromString(clazz);
        
        menuController = [objClass alloc];
        if ([menuController respondsToSelector:@selector(initWithNibName:bundle:)]) {
            menuController = [menuController initWithNibName:button->xib bundle:nil];
        }else{
            menuController = nil;
        }
    }else if ([NSString isEnabled:button->clazzName]) {
        Class objClass = NSClassFromString(button->clazzName);
        if (objClass) {
            menuController = [[objClass alloc] init];
        }
    }
    return menuController;
}
+(UIWindow*) setRootControlerForSell:(UIViewController*) rootController{
    [Utils setDispatchBlockCreateNavigation:^UINavigationController *(UIViewController *controller) {
        FDCNavigationController *nav = [[FDCNavigationController alloc] initWithRootViewController:controller];
        currentButtons = [self getMenuButtonByRole];
        [nav setToolButtons:currentButtons];
        [nav setDispatchBlockToolbarOnclick:^UIViewController *(int index) {
            UIViewController *vc = [self createMenuController:index];
            if (!vc) {
                vc = [SimpleViewController new];
            }
            return vc;
        }];
        return nav;
    }];
    return [Utils setRootController:rootController];
}


+(UIButtonTitleImage*) createToolButtonWithNormalImage:(UIImage*) normalImage highlightImage:(UIImage*) highlightImage selectedImage:(UIImage*) selecteImage title:(NSString*) title{
    UIButtonTitleImage *b = [UIButtonTitleImage buttonWithType:UIButtonTypeCustom];
    [b.titleLabel setFont:[UIFont systemFontOfSize:12]];
    if (normalImage) {
        [b setTitle:title image:[self checkButtonImage:normalImage] forState:UIControlStateNormal];
    }
    if (highlightImage) {
        [b setTitle:title image:[self checkButtonImage:highlightImage] forState:UIControlStateHighlighted];
    }
    if (selecteImage) {
        [b setTitle:title image:[self checkButtonImage:selecteImage] forState:UIControlStateSelected];
    }
    [b setContentMode:UIViewContentModeScaleAspectFit];
    return b;
}
+(void) setButton:(UIButton*) button title:(NSString*) title  state:(UIControlState) state{
    [button setTitle:title forState:state];
    [button.titleLabel setFont:fontToolButton];
    switch (state) {
        case UIControlStateSelected:{
            [button setTitleColor:colorSelected forState:state];
        }
            break;
            
        default:{
            [button setTitleColor:colorNormal forState:state];
        }
            break;
    }
    
}
+(UIImage*) checkButtonImage:(UIImage*) image{
    return [UIImage imageWithCGImage:[image CGImage] scale:image.size.height/10 orientation: UIImageOrientationUp];
}
@end

@implementation UIButtonTitleImage

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
-(CGRect) contentRectForBounds:(CGRect)bounds{
    CGRect rect = bounds;
    rect.size.width = bounds.size.width*2;
    rect.origin.x = -bounds.size.width/2;
    return rect;
}

@end

