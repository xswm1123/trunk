//  AsyncImageView.m
//  Created by erwin on 11/05/12.

/*

	Copyright (c) 2012 eMaza Mobile. All rights reserved.

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


/*

	Setting the imageUrl or imageId properties will immediately start the 
	download or fetch the cached image from the file system.
	
	Set the imageId property if you already have it. Otherwise, setting the
	imageUrl property will attempt to generate the imageId from the url, 
	for caching purposes.


	If using this class in a resuable cell, such as UICollectionViewCell or UITableViewCell,
	it is highly recommended to set imageUrl to nil in -prepareForReuse:

	- (void)prepareForReuse {
		[super prepareForReuse];
		picView.imageUrl = nil;
	}
	
		>> Special thanks to Illya Busigin (illyabusigin) and Jason Pepas (cellularmitosis)
		for this and other great tweaks.
	
	Note that setting imageUrl to nil signals that the view is being used in a reusable cell, 
	and so will not use iOS image caching (file system cache still works though).
 

	AsyncImageView can process both full static urls to images,
	or query urls to retrieve images based on an image id parameter.
	
	If the url is a query of the form:
	
		http://domain.com/api/getImage?userid=abc&arbritraryidkey=123
		
	them specifying the imageIdKey property (to "arbritraryidkey" in this example) 
	will enable caching of the image to the file system.
	
	If imageIdKey is not set, the image will be downloaded upon every request.
	
	But wait! If the parameter name happens to be "imageId", and imageIdKey is not set,
	then that will still cache the image. Convention over configuration, as it were.
	
	And yet, go head and change the defaultImageIdKey #define below to set your own convention.
	Sigh.

*/




#define defaultImageIdKey		@"imageId"


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum {
	AsyncImageSizeThumbnail	= 1,
	AsyncImageSizeRegular		= 2,
	AsyncImageSizeLarge		= 3
} enumAsyncImageSize;


typedef void (^CallBackReturnImageSize)(CGSize size);
typedef UIImage* (^CallBackReturnImageData)(NSMutableData *imageData);
@interface AsyncImageView : UIImageView <NSURLConnectionDelegate> {
@private CallBackReturnImageSize ris;
    CallBackReturnImageData rid;
}

@property (nonatomic, strong) NSString	*imageId;//文件名称
@property (nonatomic, strong) NSString	*imageUrl;//文件路径
@property (nonatomic, strong) NSString	*imageIdKey;//

@property (nonatomic, assign) int		imageSize;//图片数据大小
@property (nonatomic, assign) bool      ifshowErroAlert;//是否显示URL错误警告
@property (nonatomic, assign) bool      isIgnoreCacheFile;//是否忽略读取和存储本地文件
@property  CGSize sizeEstimate;//估计图片大小
-(void) returnImageSize:(CallBackReturnImageSize) ris;
-(void) returnImageData:(CallBackReturnImageData) rid;
@end
