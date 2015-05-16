//
//  upLoadFilesViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/20.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "upLoadFilesViewController.h"
#import "AdminManager.h"

@interface upLoadFilesViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UILabel *houseNum;
@property(nonatomic,strong) ImageFileInfo* imageInfo;
@property(nonatomic,strong) UIImage * image;
@end

@implementation ImageFileInfo

-(id)initWithImage:(UIImage *)image{
    NSDate *now = [NSDate new];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyMMddHHmmss"];
    self = [super init];
    if (self) {
        if (image) {
            _name = @"file";
            _mimeType = @"image/jpg";
            _image = image;
            _fileData = UIImageJPEGRepresentation(image, 1.0);
            if (_fileData == nil)
            {
                _fileData = UIImagePNGRepresentation(image);
                _fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:now]];
                _mimeType = @"image/png";
            }
            else
            {
                _fileName = [NSString stringWithFormat:@"%@.jpg",[formatter stringFromDate:now]];
            }
            self.filesize = _fileData.length;
        }
    }
    return self;
}

@end

@implementation upLoadFilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    self.houseNum.text=[self.info objectForKey:@"FW_FWBH"];
    NSLog(@"name=%@",self.customerName);
}
-(void)initView{
    self.cameraView.layer.cornerRadius=12.0;
    self.cameraView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.cameraView.layer.borderWidth=0.5;
    self.cameraView.clipsToBounds=YES;
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    label.text=@"上传";
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor clearColor];
    label.textColor=[UIColor whiteColor];
    [view addSubview:label];
    view.userInteractionEnabled=YES;
    UIBarButtonItem* rightBtn=[[UIBarButtonItem alloc]initWithCustomView:view];
    
    self.navigationItem.rightBarButtonItem=rightBtn;
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(upLoadFiles)];
    [view addGestureRecognizer:tap];
}
- (BOOL) shouldAutorotate
{
    return NO;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

-(void)upLoadFiles{
    self.navigationItem.rightBarButtonItem.enabled=NO;
    [Utils showLoading:@"正在上传文件..."];
    if ([self isHaveImage]) {
         ImageFileInfo* info=[[ImageFileInfo alloc]initWithImage:self.image];
//        NSDate *now = [NSDate new];
//        NSDateFormatter *formatter = [NSDateFormatter new];
//        [formatter setDateFormat:@"yyMMddHHmmss"];
        NSString *fileName = [NSString stringWithFormat:@"IMG_%@",info.fileName];
//        UIImage* testImage=[self scaleImage:self.image toScale:1.0];
       
        NSData* testData=info.fileData;
//        NSString* byte=[testData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        NSString* byte=[testData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
        NSLog(@"byte:%@",byte);
//               NSString* byte=@"MTAwLjAwJSA2MjMzOA0KICAwLjI3JSA2MjE2OQ0KICAwLjQ1JSA2MjA2MCAgMjAxNC0wNS0wNA0KICAyLjQ0JSA2MDgxNyAgMjAxNC0wNS0wNQ==";
//        NSString* byte=[[NSString alloc]initWithData:testData encoding:NSUTF8StringEncoding];
//        NSLog(@"testData:%@",testData);
//        NSData* Udata=[self replaceNoUtf8:testData];
//        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
//        NSString *rawString=[[NSString alloc]initWithData:testData encoding:NSUTF8StringEncoding];
        
        AdminManager* manager=[[AdminManager alloc]init];
        NSLog(@"KH_KHID:%@,KH_KHMC:%@,FJ_FJMC:%@",[self.info objectForKey:@"KH_KHID"],self.customerName,fileName);
        
        [manager filesUpLoadWithBityes:byte CustomerId:[self.info objectForKey:@"KH_KHID"] CustomerName:self.customerName FileName:fileName success:^(id data, NSDictionary *userInfo) {
            [Utils hiddenLoading];
            NSLog(@"data:%@",data);
            NSLog(@"userInfo:%@",userInfo);
            [Utils showAlert:@"上传成功！" title:@"温馨提示"];
            self.navigationItem.rightBarButtonItem.enabled=YES;
        } faild:^(id data, NSDictionary *userInfo) {
            [Utils hiddenLoading];
            [Utils showAlert:@"上传失败!" title:@"温馨提示"];
            self.navigationItem.rightBarButtonItem.enabled=YES;
        }];

    }else{
        [Utils showAlert:@"请先拍照或选择一张照片!" title:@"温馨提示"];
        self.navigationItem.rightBarButtonItem.enabled=YES;
    }
    
}
//替换非utf8字符
//注意：如果是三字节utf-8，第二字节错误，则先替换第一字节内容(认为此字节误码为三字节utf8的头)，然后判断剩下的两个字节是否非法；
- (NSData *)replaceNoUtf8:(NSData *)data
{
    char aa[] = {'A','A','A','A','A','A'};                      //utf8最多6个字符，当前方法未使用
    NSMutableData *md = [NSMutableData dataWithData:data];
    int loc = 0;
    while(loc < [md length])
    {
        char buffer;
        if (loc==[md length]) {
            break;
        }
        [md getBytes:&buffer range:NSMakeRange(loc, 1)];
        if((buffer & 0x80) == 0)
        {
            loc++;
            if (loc==[md length]) {
                break;
            }
            continue;
        }
        else if((buffer & 0xE0) == 0xC0)
        {
            loc++;
            if (loc==[md length]) {
                break;
            }
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                if (loc==[md length]) {
                    break;
                }
                continue;
            }
            loc--;
            if (loc==[md length]) {
                break;
            }
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            if (loc==[md length]) {
                break;
            }
            continue;
        }
        else if((buffer & 0xF0) == 0xE0)
        {
            loc++;
            if (loc==[md length]) {
                break;
            }
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                if (loc==[md length]) {
                    break;
                }
                [md getBytes:&buffer range:NSMakeRange(loc, 1)];
                if((buffer & 0xC0) == 0x80)
                {
                    loc++;
                    if (loc==[md length]) {
                        break;
                    }
                    continue;
                }
                loc--;
            }
            loc--;
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            if (loc==[md length]) {
                break;
            }
            continue;
        }
        else
        {
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            if (loc==[md length]) {
                break;
            }
            continue;
        }
    }
    return md;
}
- (NSString *)hexStringFromData:(NSData *)myD{
    
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    NSLog(@"%@",hexStr);
    
    return hexStr;
}
-(BOOL)isHaveImage{
    if (self.photo.image) {
        return YES;
    }
    return NO;
}

- (IBAction)takePhotoAction:(id)sender {
    UIActionSheet* as=[[UIActionSheet alloc]initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相机选择", nil];
    [as showInView:self.view.window];
    
    

}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    if (buttonIndex==1) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.photo.image=image;
    self.image=image;
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
