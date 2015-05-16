//
//  QuestionnaireViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/21.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "QuestionnaireViewController.h"
#import "ConfigManage+Expand.h"
#import "CustomerMainManager.h"

@interface QuestionnaireViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segementControl;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong) UIPickerView* picker;
@property(nonatomic,strong) UIView * pickerHeaderView;
@property(nonatomic,strong) NSMutableArray* customerOptions;
@property(nonatomic,strong) UISegmentedControl * countControl;
@property(nonatomic,strong) NSMutableArray* houseInstrcs;
@property(nonatomic,strong) UIScrollView * houseSrcoll;
@property(nonatomic,strong) NSMutableArray* houseArr;
@property(nonatomic,strong) NSMutableArray* quArr;
@property (nonatomic,strong) NSMutableArray * quNameArr;
@property(nonatomic,strong) CustomIOS7AlertView* cusav;
@property (nonatomic,strong) NSMutableArray* backGroundViews;
@property (nonatomic,strong) UITextField* houseNumSerachTF;
@property (nonatomic,strong) UIButton* searchBtn;
@property (nonatomic) BOOL isBT;
@property (nonatomic,strong) NSMutableArray * mustBtns;
@property (nonatomic,strong) NSMutableArray* QBtns;
@property (nonatomic,strong) NSMutableDictionary* QAnwsers;
@property (nonatomic,strong) NSDictionary * submitDic;
@property(nonatomic,strong) NSMutableArray* anwsersArr;
@end

static BOOL canSubmit=NO;

@implementation QuestionnaireViewController
-(NSMutableArray *)houseArr{
    if (!_houseArr) {
        _houseArr=[NSMutableArray array];
    }
    return _houseArr;
}
-(NSMutableArray *)houseInstrcs{
    if (!_houseInstrcs) {
        _houseInstrcs=[NSMutableArray array];
    }
    return _houseInstrcs;
}
-(NSMutableArray *)customerOptions{
    if (!_customerOptions) {
        _customerOptions=[NSMutableArray array];
    }
    return _customerOptions;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.anwsersArr=nil;
    self.anwsersArr=[NSMutableArray array];
    
    self.segementControl.hidden=YES;
   
    self.quArr=nil;
  
    self.quNameArr=nil;
    self.quNameArr=[NSMutableArray array];
    self.backGroundViews=nil;
    self.backGroundViews=[NSMutableArray array];
    [self initSegmentControl];
    self.segementControl.selectedSegmentIndex=self.index;
    if (self.segementControl.selectedSegmentIndex==0) {
        self.bgView.hidden=YES;
        self.scrollView.hidden=YES;
    }
    if (self.segementControl.selectedSegmentIndex==1) {
        self.bgView.hidden=YES;
        self.scrollView.hidden=YES;
        [self initCountView];
        [self loadHouseData];
        [self createSearchBtn];
        self.houseNumSerachTF.hidden=YES;
        self.searchBtn.hidden=YES;
    }
    if (self.segementControl.selectedSegmentIndex==2) {
        self.bgView.hidden=NO;
        self.scrollView.hidden=NO;
         [self initView];
         [self loadData];
        UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        label.text=@"保存";
        label.textAlignment=NSTextAlignmentCenter;
        label.backgroundColor=[UIColor clearColor];
        label.textColor=[UIColor whiteColor];
        [view addSubview:label];
        UIBarButtonItem* rightBtn=[[UIBarButtonItem alloc]initWithCustomView:view];
        self.navigationItem.rightBarButtonItem=rightBtn;
        UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(save)];
        [view addGestureRecognizer:tap];
    }
   
//    [self loadData];
}
-(void)initPickerView{
    [self.picker removeFromSuperview];
    [self.pickerHeaderView removeFromSuperview];
    self.picker=nil;
    self.pickerHeaderView=nil;
    self.picker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-200, [UIScreen mainScreen].bounds.size.width, 216)];
    self.picker.dataSource=self;
    self.picker.delegate=self;
    self.picker.showsSelectionIndicator=YES;
    self.picker.backgroundColor=[UIColor whiteColor];
    UILabel* title=[[UILabel alloc]initWithFrame:CGRectMake(20, 0,120, 40)];
    title.text=@"请选择房屋:";
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-80, 3, 60, 35);
    [btn setTitle:@"前往算价" forState:UIControlStateNormal];
    btn.userInteractionEnabled=YES;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    btn.layer.borderColor=[UIColor whiteColor].CGColor;
    btn.layer.borderWidth=.5;
    [btn addTarget:self action:@selector(confirmHouseDetails)forControlEvents:UIControlEventTouchDown];
    self.pickerHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, self.picker.frame.origin.y-40, self.picker.frame.size.width, 40)];
    self.pickerHeaderView.backgroundColor=[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
    [self.pickerHeaderView addSubview:title];
    [self.pickerHeaderView addSubview:btn];
    self.pickerHeaderView.userInteractionEnabled=YES;
    [self.picker reloadAllComponents];
    [self.view.window addSubview:self.picker];
    [self.view.window addSubview:self.pickerHeaderView];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.picker removeFromSuperview];
    [self.pickerHeaderView removeFromSuperview];
}
-(void)loadData{
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    NSString* vistWay=@"来电";
    NSString* cusid;
    if (![self.mark isEqualToString:@"create"]) {
        cusid=self.customerInfo.customerId;
        vistWay=self.customerInfo.visitWay;
    }else{
        cusid=user.userId;
        vistWay=self.customer.visitWay;
    }
    [manager findQuestionaryWithObjectId:user.objectId visitWay:vistWay custormerId:cusid success:^(id data, NSDictionary *userInfo) {
        NSLog(@"quData===%@",data);
        NSDictionary* dic=(NSDictionary*)data;
        self.submitDic=[NSDictionary dictionary];
        self.submitDic=[dic mutableDeepCopy];
        
        
        NSLog(@"SFBT:%@",[dic objectForKey:@"BT_SFBT"]); //是否必填
        if ([[dic objectForKey:@"BT_SFBT"] isEqualToString:@"是"]) {
            self.isBT=YES;
        }
        NSArray* queArr=[dic objectForKey:@"TC_WJST_ARRY"];
        self.quArr=[NSMutableArray arrayWithArray:queArr];
        for ( NSDictionary* dics in queArr) {
            NSLog(@"试题名称:%@",[dics objectForKey:@"ZD_XMMC"]);
            NSArray* arr=[dics objectForKey:@"ST_ARRY"];
            for (NSDictionary* dic_st in arr) {
                NSLog(@"试题选项名称:%@",[dic_st objectForKey:@"ZM_XMZ"]);
            }
        }
        
        
    [self createQonScrollView];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
}
-(void)initSegmentControl{
    self.segementControl.tag=100;
    [self.segementControl setBackgroundImage:[UIImage imageNamed:@"blue_unit.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segementControl setBackgroundImage:[UIImage imageNamed:@"yellow_unit.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    self.segementControl.frameHeight=40;
    self.segementControl.layer.cornerRadius=0.0;
    self.segementControl.tintColor=[UIColor whiteColor];
    NSDictionary* textAttribute = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    [self.segementControl setTitleTextAttributes:textAttribute forState:UIControlStateSelected];
}
-(void)initView{
    CGRect frame;
    frame=self.view.frame;
    self.bgView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-frame.origin.y-5);
    self.scrollView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-frame.origin.y-54);
    self.scrollView.contentSize=self.bgView.frame.size;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator=NO;
}

-(void)initCountView{
    self.countControl=[[UISegmentedControl alloc]initWithItems:@[@"按户型",@"按房号"]];
    self.countControl.tag=101;
    self.countControl.frame=CGRectMake(20, self.view.frame.origin.y+15, [UIScreen mainScreen].bounds.size.width-40, 40);
    self.countControl.selectedSegmentIndex=0;
    [self.countControl setBackgroundImage:[UIImage imageNamed:@"blue_unit.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.countControl setBackgroundImage:[UIImage imageNamed:@"yellow_unit.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    self.countControl.frameHeight=40;
    self.countControl.layer.cornerRadius=0.0;
    self.countControl.tintColor=[UIColor whiteColor];
    NSDictionary* textAttribute = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    [self.countControl setTitleTextAttributes:textAttribute forState:UIControlStateSelected];
    [self.countControl addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.countControl];
    self.houseSrcoll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, self.countControl.frame.origin.y+self.countControl.frame.size.height+5, [UIScreen mainScreen].bounds.size.width, self.view.frame.size.height-(self.countControl.frame.origin.y+self.countControl.frame.size.height+5)-108)];
    self.houseSrcoll.showsHorizontalScrollIndicator=NO;
    self.houseSrcoll.showsVerticalScrollIndicator=NO;
    [self.view addSubview:self.houseSrcoll];
}
- (IBAction)segmentValueChanged:(UISegmentedControl *)sender {
    if (sender.tag==100) {
        if (sender.selectedSegmentIndex==0) {
            self.bgView.hidden=YES;
            self.countControl.hidden=YES;
            self.houseSrcoll.hidden=YES;
            
        }
        if (sender.selectedSegmentIndex==1) {
            self.bgView.hidden=YES;
            self.countControl.hidden=NO;
            self.houseSrcoll.hidden=NO;
        }
        if (sender.selectedSegmentIndex==2) {
            self.bgView.hidden=NO;
            self.scrollView.hidden=NO;
            [self initView];
            self.countControl.hidden=YES;
            self.houseSrcoll.hidden=YES;
        }
        
    }
    if (sender.tag==101) {
        if (sender.selectedSegmentIndex==0) {
            NSLog(@"按户型");
            [self loadHouseData];
            self.houseSrcoll.hidden=NO;
            self.houseNumSerachTF.hidden=YES;
            self.searchBtn.hidden=YES;
            [self.picker removeFromSuperview];
             [self.pickerHeaderView removeFromSuperview];
        }
        if (sender.selectedSegmentIndex==1) {
            NSLog(@"按房号");
            self.houseSrcoll.hidden=YES;
            self.houseNumSerachTF.hidden=NO;
            self.searchBtn.hidden=NO;
            [self.picker removeFromSuperview];
             [self.pickerHeaderView removeFromSuperview];
        }

    }

}
-(void)createSearchBtn{
    self.houseNumSerachTF=[[UITextField alloc]initWithFrame:CGRectMake(self.countControl.frame.origin.x, self.countControl.frame.origin.y+60, self.countControl.frame.size.width-70, 35)];
    self.houseNumSerachTF.placeholder=@"请输入房号查询";
    self.houseNumSerachTF.borderStyle=UITextBorderStyleRoundedRect;
    self.houseNumSerachTF.backgroundColor=[UIColor whiteColor];
    self.houseNumSerachTF.delegate=self;
    self.houseNumSerachTF.returnKeyType=UIReturnKeyDone;
    [self.view addSubview:self.houseNumSerachTF];
    self.searchBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.countControl.frame.origin.x+self.houseNumSerachTF.frame.size.width, self.houseNumSerachTF.frame.origin.y, 70, 35)];
    
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.searchBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.302 green:0.655 blue:0.851 alpha:1]] forState:UIControlStateNormal];
    [self.searchBtn setImage:[UIImage imageNamed:@"button_serach_unselected.png"] forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(showHouseDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchBtn];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)loadHouseData{
    [Utils showLoading:@"正在加载数据..."];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager queryHouseholderWithObjectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSLog(@"houseData===%@",data);
        NSArray* arr=(NSArray*)data;
        for (NSDictionary * dic in arr) {
            [self.houseInstrcs addObject:dic];
        }
        for (int i=0; i<arr.count; i++) {
            NSDictionary * dic=arr[i];
            CGFloat labelWith=([UIScreen mainScreen].bounds.size.width-60)/2;
            UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(20+i%2*(labelWith+20), 10+i/2*50, labelWith, 40)];
            label.text=[dic objectForKey:@"ZD_ZDVAL"];
            label.textAlignment=NSTextAlignmentCenter;
            label.font=[UIFont systemFontOfSize:14.0];
            label.backgroundColor=[UIColor whiteColor];
            
            UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showHouseDetail:)];
            label.tag=i;
//            [label addTarget:self action:@selector(showHouseDetail:)];
            [label addGestureRecognizer:tap];
            label.userInteractionEnabled=YES;
            [self.houseSrcoll addSubview:label];
            
            if (i==arr.count-1) {
                if ((i+1)%2==0) {
                    self.houseSrcoll.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 10+i/2*50);
                }else{
                     self.houseSrcoll.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 10+(i/2+1)*50);
                }
                
            }
            
        }
        
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}
-(void)showHouseDetail:(UITapGestureRecognizer*) gesture{
    self.houseArr=nil;
    [Utils showLoading:@"正在加载数据..."];
    UILabel* label=(UILabel*)gesture.view;
    NSDictionary * dic=[self.houseInstrcs objectAtIndex:label.tag];
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager queryHouseInfoWithObjectId:user.objectId householderId:[dic objectForKey:@"ZD_ZDMC"] houseNum:@"" biuldId:@"" unitId:@"" floorNum:@"" buildType:@"FW" success:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        NSArray* arr_1=(NSArray*)data;
        NSDictionary* dic_1=[arr_1 firstObject];
        NSArray* arr_2=[dic_1 objectForKey:@"LstArry"];
        for (NSDictionary* dicArr in arr_2) {
            [self.houseArr addObject:dicArr];
        }
        if (self.houseArr.count>0) {
            [self initPickerView];
        }else{
            [Utils showAlert:@"暂无房屋信息!" title:@"温馨提示"];
            [self.pickerHeaderView removeFromSuperview];
            [self.picker removeFromSuperview];
        }
       
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}
-(void)showHouseDetail{
    if (![NSString isEnabled:self.houseNumSerachTF.text]) {
        [Utils showAlert:@"请输入搜索内容" title:@"温馨提示"];
    }else{
    self.houseArr=nil;
    
    [Utils showLoading:@"正在加载数据..."];
    
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager queryHouseInfoWithObjectId:user.objectId householderId:nil houseNum:self.houseNumSerachTF.text biuldId:@"" unitId:@"" floorNum:@"" buildType:@"FW" success:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
        NSArray* arr_1=(NSArray*)data;
        NSDictionary* dic_1=[arr_1 firstObject];
        NSArray* arr_2=[dic_1 objectForKey:@"LstArry"];
        for (NSDictionary* dicArr in arr_2) {
            [self.houseArr addObject:dicArr];
        }
        if (self.houseArr.count>0) {
            [self initPickerView];
        }else{
            [Utils showAlert:@"暂无房屋信息!" title:@"温馨提示"];
        }
        self.houseNumSerachTF.text=@"";
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
    }
}
-(void)confirmHouseDetails{
    [Utils showLoading:@"处理中..."];
    [self.picker removeFromSuperview];
    [self.pickerHeaderView removeFromSuperview];
    NSInteger row=[self.picker selectedRowInComponent:0];
    NSDictionary* dic=[self.houseArr objectAtIndex:row];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    [manager queryByHouseID:[dic objectForKey:@"ZD_ZDMC"] success:^(id data, NSDictionary *userInfo) {
        NSLog(@"算价信息:%@",data);
        NSDictionary * dic=(NSDictionary*)data;
        CalculateViewController * vc=[[CalculateViewController alloc]init];
        vc.title=@"定制算价";
        vc.CalculateDic=dic;
        [self.navigationController pushViewController:vc animated:YES];
        
        [Utils hiddenLoading];
    } faild:^(id data, NSDictionary *userInfo) {
        [Utils hiddenLoading];
    }];
}
#pragma UIPickerView----Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.houseArr.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return [UIScreen mainScreen].bounds.size.width;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSDictionary* dic=[self.houseArr objectAtIndex:row];
    NSString* title=[dic objectForKey:@"ZD_ZDVAL"];
    return title;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"GGGGGGG");
    
}
-(void)createQonScrollView{
    self.mustBtns=nil;
    self.mustBtns=[NSMutableArray array];
    self.QBtns=nil;
    self.QBtns=[NSMutableArray array];
    self.QAnwsers=nil;
    self.QAnwsers=[NSMutableDictionary dictionary];
    CGFloat screenWidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat bWidth=(screenWidth-60)/2;
    for (int i=0;  i<[self.quArr count]; i++) {
        UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(20+i%2*(bWidth+20), 20+i/2*(bWidth+20), bWidth, bWidth)];
        [btn setBackgroundImage:[UIImage imageNamed:@"blue_unit.png"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"yellow_unit.png"] forState:UIControlStateSelected];
        btn.tag=i;
        UIImageView* image=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, bWidth-40, bWidth-50)];
        image.image=[UIImage imageNamed:@"image_customerQU.png"];
        [btn addSubview:image];
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, bWidth-30, bWidth, 30)];
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:13.0];
        NSDictionary* dic=[self.quArr objectAtIndex:i];
        NSArray* options=[dic objectForKey:@"ST_ARRY"];
        for (int i=0; i<options.count; i++) {
            NSDictionary* option=[options objectAtIndex:i];
            if ([[option objectForKey:@"SF_SFXZ"] isEqualToString:@"是"]) {
                btn.selected=YES;
                }
            }

        //======================================
        NSString* title=[dic objectForKey:@"ZD_XMMC"];
        label.text=title;
        [btn addSubview:label];
        [btn addTarget:self action:@selector(customerSpeciAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        [self.QBtns addObject:btn];
        if (self.isBT) {
            UIImageView* imv=[[UIImageView alloc]initWithFrame:CGRectMake(0, bWidth-50, 20, 20)];
            imv.image=[UIImage imageNamed:@"bitian.png"];
            imv.tag=i;
            [btn addSubview:imv];
            [self.mustBtns addObject:imv];
        }
    }
}
- (void)customerSpeciAction:(UIButton*)sender {
    
    self.cusav=[[CustomIOS7AlertView alloc]init];
    self.cusav.parentView=self.view;
    UIView* backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 280, 200)];
    backView.backgroundColor=[UIColor whiteColor];
        UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 40)];
        NSDictionary* dic=[self.quArr objectAtIndex:sender.tag];
        NSString* title=[dic objectForKey:@"ZD_XMMC"];
        titleLabel.text=title;
        titleLabel.textAlignment=NSTextAlignmentCenter;
        titleLabel.backgroundColor=[UIColor colorWithRed:0.396 green:0.788 blue:0.996 alpha:1];
        titleLabel.textColor=[UIColor whiteColor];
        [backView addSubview:titleLabel];
        NSArray* options=[dic objectForKey:@"ST_ARRY"];
        int index=0;
    
    UIScrollView* scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 280, 200)];
    scroll.showsHorizontalScrollIndicator=NO;
    scroll.showsVerticalScrollIndicator=NO;
    [backView insertSubview:scroll belowSubview:titleLabel];
    scroll.contentSize=CGSizeMake(280, 40*(options.count/3+2));
        NSMutableArray* subMArr=[NSMutableArray array];
        for (int i=0; i<options.count; i++) {
            NSMutableDictionary* answer=[NSMutableDictionary dictionary];
             NSDictionary* option=[options objectAtIndex:i];
            UIView* vi=[[UIView alloc]initWithFrame:CGRectMake(10+i%3*90, 50+i/3*40, 90, 30)];
            vi.backgroundColor=[UIColor clearColor];
            vi.tag=i+10;
            UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
            [btn setBackgroundImage:[UIImage imageNamed:@"button_muti_unselected.png"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"button_muti_selected.png"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=vi.tag;
            [vi addSubview:btn];
            UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(28, 0, 60, 30)];
            label.text=[option objectForKey:@"ZM_XMZ"];
            
            
            NSArray* keys=self.QAnwsers.allKeys;
           
            BOOL isHave=NO;
            for (NSString* str in keys) {
                if ([str isEqualToString:title]) {
                    isHave=YES;
                }
            }
            if (isHave) {
                NSString* st=[self.QAnwsers objectForKey:title];
                NSArray* valuesArr=[st componentsSeparatedByString:@","];
                for (NSString* valueStr in valuesArr) {
                    if ([label.text isEqualToString:valueStr]) {
                        btn.selected=YES;
                    }
                }
                
            }else{
                if ([[option objectForKey:@"SF_SFXZ"] isEqualToString:@"是"]) {
                    btn.selected=YES;
                    index=i;
                    NSDictionary* dic=[self.quArr objectAtIndex:sender.tag];
                    NSArray* options=[dic objectForKey:@"ST_ARRY"];
                    NSDictionary* option=[options objectAtIndex:i];
                   
                    if ([self.mark isEqualToString:@"create"]) {
                        [answer setObject:self.customer.customerPhone forKey:@"KH_KHDH"];
                        [answer setObject:self.customer.customerId forKey:@"KH_KHID"];
                        [answer setObject:self.customer.customerName forKey:@"KH_KHMC"];
                    }else{
                        [answer setObject:self.customerInfo.customerPhone forKey:@"KH_KHDH"];
                        [answer setObject:self.customerInfo.customerId forKey:@"KH_KHID"];
                        [answer setObject:self.customerInfo.customerName forKey:@"KH_KHMC"];
                    }
                    [answer setObject:[option objectForKey:@"WY_WYID"] forKey:@"WY_WYID"];
                    [answer setObject:[option objectForKey:@"ZD_ZDID"] forKey:@"ZD_ZDID"];
                    [answer setObject:[option objectForKey:@"ZM_XMZ"] forKey:@"ZM_XMZ"];
                    [answer setObject:[option objectForKey:@"ZM_ZMID"] forKey:@"ZM_ZMID"];
                    NSArray* subArr=[self.submitDic objectForKey:@"TC_WJST_ARRY"];
                    NSMutableDictionary* subDic=[subArr objectAtIndex:sender.tag];
                    [subMArr addObject:answer];
                    [subDic removeObjectForKey:@"KH_KHDA"];
                    [subDic setObject:subMArr forKey:@"KH_KHDA"];
                    canSubmit=YES;
                    UIButton* btnQ=[self.QBtns objectAtIndex:sender.tag];
                    btnQ.selected=YES;
                }
            }
            label.font=[UIFont systemFontOfSize:10];
            [vi addSubview:label];
            [scroll addSubview:vi];
        }
    [self.customerOptions addObject:backView];
    self.cusav.containerView=backView;
    NSArray* titles=@[@"关闭",@"保存"];
    self.cusav.buttonTitles=titles;
    self.cusav.delegate=self;
    self.cusav.tag=sender.tag;
    [self.cusav show];

}

-(void)save{
    BOOL isReady=YES;
    for (UIButton* bts in self.QBtns) {
        if (!bts.selected) {
            isReady=NO;
        }
    }
    if (isReady) {
        canSubmit=YES;
    }else{
         canSubmit=NO;
    }

    if (canSubmit) {
        [Utils showLoading:@"正在提交..."];
        NSString* statu;
        UserEntity*user=[ConfigManage getLoginUser];
        CustomerEntity* customer1=[[CustomerEntity alloc]init];
        customer1.customerId=self.customerInfo.customerId;
        customer1.customerName=self.customerInfo.customerName;
        customer1.objectId=user.objectId;
        customer1.objectName=user.objectName;
        customer1.customerPhone=self.customerInfo.customerPhone;
        customer1.address=self.customerInfo.address;
        customer1.customerBirthday=@"";
        customer1.customerType=@"";
        customer1.customerLevel=@"";
        customer1.orderLevel=@"";
        customer1.receptionPlace=@"";
        customer1.nominaterName=@"";
        customer1.questionarys=nil;
        customer1.otherConnectionGroups=nil;
        customer1.sellerName=user.sellerName;
        customer1.sellerId=[NSString stringWithFormat:@"%@",user.sellerId];
        customer1.sellerGroup=user.sellGroup;
        //    QuestionaryEntity* qentity=[[QuestionaryEntity alloc]init];
        if ([self.mark isEqualToString:@"create"]) {
            customer1=self.customer;
            statu=@"1";
        }else{
            statu=@"3";
        }
        //整理提交的调查表，置空试题数组，添加客户答案
        NSArray* subArr=[self.submitDic objectForKey:@"TC_WJST_ARRY"];
        for ( NSMutableDictionary* dics in subArr) {
            NSArray* arr=[dics objectForKey:@"ST_ARRY"];
            arr=@[];
            [dics removeObjectForKey:@"ST_ARRY"];
            [dics setObject:arr forKey:@"ST_ARRY"];
        }
        NSLog(@"self.submitDic:%@",self.submitDic);
        NSLog(@"customer:%@",[customer1 toInstanceJson]);
        CustomerMainManager* manager=[[CustomerMainManager alloc]init];
        [manager persistCustomer:customer1 Questionnaire:self.submitDic CustomerName:customer1.customerName CustomerPhone:customer1.customerPhone ModifyStatu:statu success:^(id data, NSDictionary *userInfo) {
            NSLog(@"data===%@",data);
            NSLog(@"userInfo:%@",userInfo);
            [PYToast showWithText:@"提交成功!"];
            [Utils hiddenLoading];
            if ([self.mark isEqualToString:@"create"]) {
                CustomerKeepDetailController *c =[[CustomerKeepDetailController alloc] initWithNibName:@"CustomerKeepDetailController" bundle:nil];
                CustomerInfoEntity* entity=[[CustomerInfoEntity alloc]init];
                entity.customerName=customer1.customerName;
                entity.customerSex=customer1.sex;
                entity.visitWay=customer1.visitWay;
                entity.visitDate=@"";
                entity.mindLevel=customer1.customerLevel;
                entity.tradeState=@"";
                entity.customerType=customer1.customerType;
                c.entity = entity;
                c.mark=@"新增";
                c.customerId=(NSString*)data;
                [self goNextController:c];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
            }
        } faild:^(id data, NSDictionary *userInfo) {
            NSLog(@"faildData===%@",data);
            [Utils hiddenLoading];
            [PYToast showWithText:@"提交失败!"];
        }];

    }else{
        UIAlertView* al=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"调查表有未填项，请填写完整!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [al show];
    }
}


-(void)changeState:(UIButton*)btn{
    if (btn.tag%2==0) {
        btn.selected=YES;
        btn.tag++;
    }else{
        btn.selected=NO;
        btn.tag=0;
    }
    
}
- (void)customIOS7dialogButtonTouchUpInside:(CustomIOS7AlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
        if (buttonIndex==0) {
            [self.cusav close];
        }
        if (buttonIndex==1) {
            BOOL flag=NO;
            int index = 0;
            UIView* view=alertView.containerView;
            NSArray* arr=view.subviews;
            NSArray* arr_2;
            for (id iv in arr) {
                if ([iv isKindOfClass:[UIScrollView class]]) {
                    UIView* v=(UIView*)iv;
                    arr_2=v.subviews;
                }
            }
            NSString* value=@"";
            NSString* key=@"";
           
            NSMutableArray* subMArr=[NSMutableArray array];
            for (UIView* bv in arr_2) {
                 NSMutableDictionary* answer=[NSMutableDictionary dictionary];
                if (bv.tag>=10) {
                    NSArray* su=bv.subviews;
                    for (id vi in su) {
                        if ([vi isKindOfClass:[UIButton class]]) {
                            UIButton* btn=(UIButton*)vi;
                            if ([btn isSelected]) {
                                flag=YES;
                                index=bv.tag-10;
                                NSDictionary* dic=[self.quArr objectAtIndex:alertView.tag];
                                NSArray* options=[dic objectForKey:@"ST_ARRY"];
                                NSDictionary* option=[options objectAtIndex:index];
                                NSLog(@"index:%d",index);
                                key=[dic objectForKey:@"ZD_XMMC"];
                                if ([value isEqualToString:@""]) {
                                     value=[value stringByAppendingString:[option objectForKey:@"ZM_XMZ"]];
                                }else{
                                    value=[value stringByAppendingString:[NSString stringWithFormat:@",%@",[option objectForKey:@"ZM_XMZ"]]];
                                }
                                
                                if ([self.mark isEqualToString:@"create"]) {
                                    [answer setObject:self.customer.customerPhone forKey:@"KH_KHDH"];
                                    [answer setObject:self.customer.customerId forKey:@"KH_KHID"];
                                    [answer setObject:self.customer.customerName forKey:@"KH_KHMC"];
                                }else{
                                    [answer setObject:self.customerInfo.customerPhone forKey:@"KH_KHDH"];
                                    [answer setObject:self.customerInfo.customerId forKey:@"KH_KHID"];
                                    [answer setObject:self.customerInfo.customerName forKey:@"KH_KHMC"];
                                }
                                [answer setObject:[option objectForKey:@"WY_WYID"] forKey:@"WY_WYID"];
                                [answer setObject:[option objectForKey:@"ZD_ZDID"] forKey:@"ZD_ZDID"];
                                [answer setObject:[option objectForKey:@"ZM_ZMID"] forKey:@"ZM_ZMID"];
                                [answer setObject:[option objectForKey:@"ZM_XMZ"] forKey:@"ZM_XMZ"];
                                NSArray* subArr=[self.submitDic objectForKey:@"TC_WJST_ARRY"];
                                NSMutableDictionary* subDic=[subArr objectAtIndex:alertView.tag];
                                [subMArr addObject:answer];
                                [subDic removeObjectForKey:@"KH_KHDA"];
                                [subDic setObject:subMArr forKey:@"KH_KHDA"];
                                NSLog(@"mutableDic:%@",self.submitDic);
                            }
                        }
                    }
                }
            }
            [self.QAnwsers setObject:value forKey:key];
            if (flag) {
                UIButton* btn=[self.QBtns objectAtIndex:alertView.tag];
                btn.selected=YES;
                UIImageView* iv=[self.mustBtns objectAtIndex:alertView.tag];
                 iv.image=[UIImage imageNamed:@"bitian2.png"];
                [alertView close];
            }else{
                [Utils showAlert:@"请选择试题选项!" title:@"温馨提示"];
            }
        }
}
@end
