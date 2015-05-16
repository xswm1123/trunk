//
//  ZipArchive.h
//  
//
//  Created by aish on 08-9-11.
//  acsolu@gmail.com
//  Copyright 2008  Inc. All rights reserved.
//
// History: 
//    09-11-2008 version 1.0    release
//    10-18-2009 version 1.1    support password protected zip files
//    10-21-2009 version 1.2    fix date bug



#include "minizip/zip.h"
#include "minizip/unzip.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//return -1 break , 0 normal , 1 continue,
typedef int (^CallBackCircelErgodicPath)(int index);
typedef int (^CallBackHandelUnziping)(NSString* strpath, BOOL isDirectory);
typedef void (^CallBackCircelHandelUnzipingBuffer)(int read,unsigned char* buffer);

@protocol ZipArchiveDelegate <NSObject>
@optional
-(void) ErrorMessage:(NSString*) msg;
-(BOOL) OverWriteOperation:(NSString*) file;
-(void) handelUnzipingBuffer:(unsigned char*) buffer;
@end


@interface ZipArchive : NSObject {
@private
	zipFile		_zipFile;
	unzFile		_unzFile;
	NSString * _zipPath;
	NSString*   _password;
    NSArray *_arrayPath;
    id _synarraypath;
    CallBackCircelHandelUnzipingBuffer callbackhub;
}

@property (nonatomic, retain) id<ZipArchiveDelegate> delegate;

-(BOOL) createZipFile:(NSString*) zipFile append:(int) append;
-(BOOL) createZipFile:(NSString*) zipFile password:(NSString*) password append:(int) append;
-(BOOL) addFileToZip:(NSData*) file newname:(NSString*) newname;
-(BOOL) closeZipFile;

-(BOOL) openUnzipFile:(NSString*) zipFile;
-(BOOL) openUnzipFile:(NSString*) zipFile password:(NSString*) password;
-(BOOL) unzipFileTo:(NSString*) path overWrite:(BOOL) overwrite;
/**
 获取zip文件内部数据
 */
-(NSData*) getUnzipFile:(NSString*) filePath;
/**
 返回所有的文件目录
 */
-(NSArray*) getAllUnzipPath;
/**
 设置所有的文件目录
 */
-(void) removeCaches;
/**
 遍历文件目录
 */
-(void) ergodicPath:(CallBackCircelErgodicPath) callBack  index:(const long) index;
-(void) setCallBackCircelHandelUnzipingBuffer:(CallBackCircelHandelUnzipingBuffer) callback;
-(BOOL) closeUnzipFile;
@end
