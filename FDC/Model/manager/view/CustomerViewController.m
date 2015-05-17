//
//  CustomerViewController.m
//  FDC
//
//  Created by NewDoone on 15/1/15.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerViewController.h"
#import "AdminManager.h"

@interface CustomerViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong) NSArray* reserachTables;
@property(nonatomic,strong) NSArray* reserachContents;
@property(nonatomic,strong) NSArray* projects;
@property(nonatomic,strong)UIWebView* indexWeb;
@end

@implementation CustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initView];
    // Do any additional setup after loading the view from its nib.
    self.title=@"客户";
    [self createWebView];
}
-(void)createWebView{
    CGRect frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-self.navigationController.toolbar.frameHeight-64);
    self.indexWeb=[[UIWebView alloc]initWithFrame:frame];
    
//    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"customer" ofType:@"html"];
//    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//    NSString *html = [NSString stringWithContentsOfFile:path encoding:enc error:nil];
//    [self.indexWeb loadHTMLString:html baseURL:baseURL];
    UserEntity* user=[ConfigManage getLoginUser];
    //"http://"+GlobalApplication.preference.getLoginProject()+":61/HWT.WEB/manager/customer.aspx?UserName="+username+"&UserPwd="+password
    NSString* url=[NSString stringWithFormat:@"%@/customer.aspx?UserName=%@&UserPwd=%@",URL_MANAGER,user.userName,user.password];
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    [self.indexWeb loadRequest:request];
    [self.view addSubview:self.indexWeb];
  
    
}

-(void)initView{
    self.title=@"客户";
    self.scrollView.frame=[UIScreen mainScreen].bounds;
    CGRect frame =self.scrollView.frame;
    frame.size.height=frame.size.height-self.navigationController.toolbar.frameHeight;
    self.scrollView.frame=frame;
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+100);
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator =NO;
    self.scrollView.bounces=NO;
    
    self.reserachTables=@[@"Table1",@"Table2",@"Table3",@"Table4",@"Table5",@"Table6"];
    self.reserachContents=@[@"content1",@"content2",@"content3",@"content4",@"content5",@"content6"];
    self.projects=@[@"project1",@"project2",@"project3",@"project4",@"project5"];
    
}
- (IBAction)chooseResarchTable:(id)sender {
    AdaptLeveyPopListView* lisv=[[AdaptLeveyPopListView alloc]initWithTitle:@"请选择" options: self.reserachTables];
    lisv.tag=100;
    lisv.delegate=self;
    [lisv showInView:self.view.window animated:YES];
}
- (IBAction)chooseProjectBtn:(id)sender {
    AdaptLeveyPopListView* lisv=[[AdaptLeveyPopListView alloc]initWithTitle:@"请选择" options: self.projects];
    lisv.tag=101;
    lisv.delegate=self;
    [lisv showInView:self.view.window animated:YES];
}
- (IBAction)chooseResearchContentBtn:(id)sender {
    AdaptLeveyPopListView* lisv=[[AdaptLeveyPopListView alloc]initWithTitle:@"请选择" options: self.reserachContents];
    lisv.tag=102;
    lisv.delegate=self;
    [lisv showInView:self.view.window animated:YES];
}
- (void)AdaptLeveyPopListView:(AdaptLeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex{
    if (popListView.tag==100) {
        self.resarchLabel.text=[self.reserachTables objectAtIndex:anIndex];
    }
    if (popListView.tag==101) {
        self.projectLabel.text=[self.projects objectAtIndex:anIndex];
    }
    
    if (popListView.tag==102) {
        self.resarchContentLabel.text=[self.reserachContents objectAtIndex:anIndex];
    }

}
-(void)drawCircleView{
//    CircleView * cv=[CircleView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

@end
//饼状图数据
@implementation CircleData

+(NSArray *)createData
{
    CircleData *data1 = [[CircleData alloc] init];
    data1.name = @"120平米";
    data1.color = [UIColor redColor];
    data1.value = 0.2;
    CircleData *data2 = [[CircleData alloc] init];
    data2.name = @"15平米";
    data2.color = [UIColor blueColor];
    data2.value = 0.3;
    CircleData *data3 = [[CircleData alloc] init];
    data3.name = @"135平米";
    data3.color = [UIColor grayColor];
    data3.value = 0.2;
    CircleData *data4 = [[CircleData alloc] init];
    data4.name = @"145平米";
    data4.color = [UIColor greenColor];
    data4.value = 0.1;
    CircleData *data5 = [[CircleData alloc] init];
    data5.name = @"150平米";
    data5.color = [UIColor yellowColor];
    data5.value = 0.2;
        return @[data1, data2, data3, data4,data5];
}
@end


//饼状图
@interface CircleView()

@property (nonatomic)CGFloat radius;

@property (nonatomic)CGFloat lineWidth;

@end

@implementation CircleView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (NSArray *)data
{
    if (!_data) {
        _data = [CircleData createData];
    }
    return _data;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    CGContextSaveGState(context);
    //
    CGSize viewSize = self.bounds.size;
    CGPoint centetr = CGPointMake(viewSize.width/2, viewSize.height/4);
    _radius = 100;
    _lineWidth = 4;
    CGFloat startAngle = 0;
    CGFloat endAngle = M_PI*2;
    //详细板的坐标位置
    CGFloat tempY = (centetr.y + self.radius)*1.1;
    CGFloat tempX = centetr.x  - self.radius;
    //信息框的大小
    CGSize inforSize = CGSizeMake(200, 20);
    for (int i = 0; i < self.data.count; i++) {
        //拿数据
        CircleData *data = self.data[i];
        endAngle = data.value * M_PI * 2 + startAngle;
        //
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centetr
                                                            radius:self.radius
                                                        startAngle:startAngle
                                                          endAngle:endAngle
                                                         clockwise:YES];
        startAngle = endAngle;
        //绘制详细板
        UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(tempX, tempY, 40, 20)];
        
        //绘制信息框
        //计算框的大小
        NSString *infor = [NSString stringWithFormat:@"%@占比例为%.2f%%",data.name, data.value*100];
        CGRect r = [infor boundingRectWithSize:inforSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:data.color} context:nil];
        r.origin.x = tempX + 60;
        r.origin.y = tempY;
        [infor drawInRect:r withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:data.color}];
        //计算y的增量
        tempY += 30;
        //填充和将路径关闭
        [path addLineToPoint:centetr];
        path.lineWidth = self.lineWidth;
        [data.color setFill];
        [path fill];
        [path2 fill];
        [path closePath];
    }
    
}


@end

