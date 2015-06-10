//
//  CalculateViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/22.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CalculateViewController.h"
#import "LeveyPopListView.h"
#import "CustomerMainManager.h"

@interface CalculateViewController ()<LeveyPopListViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *houseNum;
@property (weak, nonatomic) IBOutlet UILabel *buildArea;
@property (weak, nonatomic) IBOutlet UILabel *areaInHouse;
@property (weak, nonatomic) IBOutlet UILabel *standardPrice;
@property (weak, nonatomic) IBOutlet UILabel *standardTotal;
@property (weak, nonatomic) IBOutlet UILabel *payType;
@property (weak, nonatomic) IBOutlet UITextField *discount;
@property (weak, nonatomic) IBOutlet UITextField *rentCount;
@property (weak, nonatomic) IBOutlet UITextField *secondRentCount;
@property (weak, nonatomic) IBOutlet UILabel *rentYears;
@property (weak, nonatomic) IBOutlet UILabel *rentPercent;
@property (nonatomic,strong) NSMutableArray * payTypes;
@property (nonatomic,strong) NSMutableArray * BNtypes;
@property (nonatomic,strong) NSMutableArray * rentYearsArr;
@property (nonatomic,strong) NSMutableArray* secondRentYearArr;
@property (nonatomic,strong) NSMutableArray* BNYears;
@property (nonatomic,strong) NSMutableArray * rentPercents;
@property (nonatomic,strong) NSMutableArray * secondRentPercents;
@property (nonatomic,strong) NSMutableArray* BNPercent;
@property (nonatomic,strong) NSMutableArray * totalRens;
@property (nonatomic,strong) NSMutableArray * totalPercents;
@property (nonatomic,strong) NSString* rentCountLabel;
@property (nonatomic,strong) NSString * rentYearLabel;
@property (nonatomic,strong) NSString* secondRentYearLabel;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UILabel *payStyle;
@property (weak, nonatomic) IBOutlet UILabel *sencondPayStyle;
@property (weak, nonatomic) IBOutlet UIButton *equalLoanBtn;
@property (weak, nonatomic) IBOutlet UIButton *equalAccountBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (nonatomic,strong) NSString* rentLoan;
@property(nonatomic,strong) NSString* secondRentLoan;
@property (nonatomic,assign) NSInteger index;
@property (weak, nonatomic) IBOutlet UILabel *secondLoanYear;
@property (weak, nonatomic) IBOutlet UIButton *sencondEqualLoanBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondequalAccountBtn;
@property (weak, nonatomic) IBOutlet UILabel *secondStandardRate;
@property (nonatomic,strong) UIPageControl* pageControl;
@property (nonatomic,strong) NSMutableArray * types_num;
@property (weak, nonatomic) IBOutlet UIScrollView *mianScrollView;
@property (weak, nonatomic) IBOutlet UIView *splitView;
@property (weak, nonatomic) IBOutlet UILabel *lb_innerArea;
@property (weak, nonatomic) IBOutlet UILabel *lb_houseTotal;

@property (weak, nonatomic) IBOutlet UIButton *button_selectType;
@property (weak, nonatomic) IBOutlet UILabel *lb_percentSymbol;
@property (weak, nonatomic) IBOutlet UIButton *button_autoCalculate;
@property (weak, nonatomic) IBOutlet UILabel *lb_wanyuan;
@property (weak, nonatomic) IBOutlet UIButton *button_selectLoanYear;
@property (weak, nonatomic) IBOutlet UIButton *button_selectLoanYear2;
@property (weak, nonatomic) IBOutlet UILabel *lb_wanyuan2;


@end

@implementation CalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self loadData];
    
}

-(void)initView{
    self.detailScrollView.bounces=NO;
    self.detailScrollView.showsHorizontalScrollIndicator=NO;
    self.detailScrollView.showsVerticalScrollIndicator=NO;
    self.detailScrollView.pagingEnabled=YES;
    self.detailScrollView.delegate=self;
    self.detailView.hidden=YES;
    self.detailView.frame=CGRectMake(20, 0, DEVICE_WIDTH, 200);
    self.secondView.hidden=YES;
    self.secondView.frame=CGRectMake(340, 0, DEVICE_WIDTH, 200);
    self.equalLoanBtn.selected=YES;
    self.sencondEqualLoanBtn.selected=YES;
    
    self.mianScrollView.frame=CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
    
    self.houseNum.frame=CGRectMake(DEVICE_WIDTH/4, 24, DEVICE_WIDTH/2, 22);
    
    self.splitView.frame=CGRectMake(0, 49, DEVICE_WIDTH, 1);
    self.areaInHouse.frame=CGRectMake(DEVICE_WIDTH-80, 62, 78, 21);
    self.standardTotal.frame=CGRectMake(DEVICE_WIDTH-80, 91, 78, 21);
    self.lb_innerArea.frame=CGRectMake(DEVICE_WIDTH-153, 62, 78, 21);
    self.lb_houseTotal.frame=CGRectMake(DEVICE_WIDTH-153, 91, 78, 21);
    self.payType.frame=CGRectMake(8, 120, DEVICE_WIDTH-16, 30);
    self.button_selectType.frame=CGRectMake(DEVICE_WIDTH-40, 124, 24, 24);
    self.lb_percentSymbol.frame=CGRectMake(DEVICE_WIDTH-57, 162, 18, 21);
    self.discount.frame=CGRectMake(86, 158, DEVICE_WIDTH-146, 30);
    self.detailScrollView.frame=CGRectMake(0, 191, DEVICE_WIDTH, 202);
    self.button_autoCalculate.frame=CGRectMake(DEVICE_WIDTH/4, 401, DEVICE_WIDTH/2, 30);
    self.detailScrollView.contentSize=CGSizeMake(DEVICE_WIDTH, 202);
    self.detailView.frame=CGRectMake(0, 0, DEVICE_WIDTH, 200);
    self.secondView.frame=CGRectMake(DEVICE_WIDTH, 0, DEVICE_WIDTH, 200);
    
    //detailView
    self.payStyle.frame=CGRectMake(DEVICE_WIDTH/4, 20, DEVICE_WIDTH/2, 21);
    self.equalAccountBtn.frame=CGRectMake(DEVICE_WIDTH-156, 50, 148, 30);
    self.lb_wanyuan.frame=CGRectMake(DEVICE_WIDTH-55, 92, 34, 21);
    self.rentCount.frame=CGRectMake(86, 88, DEVICE_WIDTH-142, 30);
    self.button_selectLoanYear.frame=CGRectMake(DEVICE_WIDTH-39, 129, 24, 24);
    self.rentYears.frame=CGRectMake(86, 123, DEVICE_WIDTH-94, 30);
    self.rentPercent.frame=CGRectMake(86, 162, DEVICE_WIDTH-94, 30);
    //secondView
    self.sencondPayStyle.frame=CGRectMake(DEVICE_WIDTH/4, 20, DEVICE_WIDTH/2, 21);
    self.secondequalAccountBtn.frame=CGRectMake(DEVICE_WIDTH-156, 50, 148, 30);
    self.lb_wanyuan2.frame=CGRectMake(DEVICE_WIDTH-55, 92, 34, 21);
    self.secondRentCount.frame=CGRectMake(86, 88, DEVICE_WIDTH-142, 30);
    self.button_selectLoanYear2.frame=CGRectMake(DEVICE_WIDTH-39, 129, 24, 24);
    self.secondLoanYear.frame=CGRectMake(86, 123, DEVICE_WIDTH-94, 30);
    self.secondStandardRate.frame=CGRectMake(86, 162, DEVICE_WIDTH-94, 30);
    if (DEVICE_HEIGHT>480) {
        self.mianScrollView.contentSize=CGSizeMake(DEVICE_WIDTH, DEVICE_HEIGHT);
    }else{
        self.mianScrollView.contentSize=CGSizeMake(DEVICE_WIDTH, self.button_autoCalculate.frame.origin.y+self.button_autoCalculate.frame.size.height+108);
    }
    
}

-(void)loadData{
    self.types_num=nil;
    self.types_num=[NSMutableArray array];
    
    self.payTypes=nil;
    self.payTypes=[NSMutableArray array];
    
    self.BNtypes=nil;
    self.BNtypes=[NSMutableArray array];
    
    self.BNYears=nil;
    self.BNYears=[NSMutableArray array];
    
    self.BNPercent=nil;
    self.BNPercent=[NSMutableArray array];
    
    self.rentYearsArr=nil;
    self.rentYearsArr=[NSMutableArray array];
    
    self.rentPercents=nil;
    self.rentPercents=[NSMutableArray array];
    
    self.totalRens=nil;
    self.totalRens=[NSMutableArray array];
    
    self.totalPercents=nil;
    self.totalPercents=[NSMutableArray array];
    self.houseNum.text=[NSString stringWithFormat:@"%@",[self.CalculateDic objectForKey:@"FW_FWBH"]];
    self.buildArea.text=[NSString stringWithFormat:@"%@㎡",[self.CalculateDic objectForKey:@"FW_TNMJ"]];
    self.areaInHouse.text=[NSString stringWithFormat:@"%@㎡",[self.CalculateDic objectForKey:@"FW_XSMJ"]];
    self.standardPrice.text=[NSString stringWithFormat:@"%@元",[self.CalculateDic objectForKey:@"FW_FWDJ"]];
    self.standardTotal.text=[NSString stringWithFormat:@"%@元",[self.CalculateDic objectForKey:@"FW_FWZJ"]];
    
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    //获取贷款类别信息
    
    [manager queryPayLoanTypesWithObjectId:user.objectId success:^(id data, NSDictionary *userInfo) {
        NSLog(@"data:%@",data);
        NSArray* arr=(NSArray*)data;
        for (NSDictionary* dic in arr) {
            [self.BNtypes addObject:dic];
            NSString* type=[dic objectForKey:@"ZD_ZDVAL"];
            NSString* num=[dic objectForKey:@"ZD_ZDMC"];
            [self.payTypes addObject:type];
            [self.types_num addObject:num];
        }
        self.payType.text=[self.payTypes objectAtIndex:0];
    } faild:^(id data, NSDictionary *userInfo) {
        
    }];
    
    
}
- (IBAction)equalLoan:(id)sender {
    UIButton * btn=sender;
    btn.selected=YES;
    self.equalAccountBtn.selected=NO;
}
- (IBAction)equalAccount:(id)sender {
    UIButton * btn=sender;
    btn.selected=YES;
    self.equalLoanBtn.selected=NO;
}
- (IBAction)secondEqualLoan:(UIButton *)sender {
    sender.selected=YES;
    self.secondequalAccountBtn.selected=NO;
}
- (IBAction)secondEqualAccount:(UIButton *)sender {
    sender.selected=YES;
    self.sencondEqualLoanBtn.selected=NO;
}
- (IBAction)selectRentPercent:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.rentPercents];
    view.delegate=self;
    view.tag=102;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)selectSecondRentYears:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.secondRentYearArr];
    view.delegate=self;
    view.tag=103;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)selectRentYears:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.rentYearsArr];
    view.delegate=self;
    view.tag=101;
    [view showInView:self.view.window animated:YES];
}
- (IBAction)selectPayType:(id)sender {
    LeveyPopListView* view=[[LeveyPopListView alloc]initWithTitle:@"请选择" options:self.payTypes];
    view.delegate=self;
    view.tag=100;
    [view showInView:self.view.window animated:YES];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}
-(BOOL)isValidata{
    
    if ([self.payType.text isEqualToString:@"组合金贷款"]) {
        if (![NSString isEnabled:self.rentCount.text]) {
            [Utils showAlert:@"请输入银行贷款金额" title:@"温馨提示"];
            return NO;
        }
        if ([self.rentYears.text isEqualToString:@"请选择贷款年限"]) {
            [Utils showAlert:@"请选择银行贷款年限" title:@"温馨提示"];
            return NO;
        }
        
        if (![NSString isEnabled:self.secondRentCount.text]) {
            [Utils showAlert:@"请输入公积金贷款金额" title:@"温馨提示"];
            return NO;
        }
        if ([self.secondLoanYear.text isEqualToString:@"请选择贷款年限"]) {
            [Utils showAlert:@"请选择公积金贷款年限" title:@"温馨提示"];
            return NO;
        }
    }
    if (![NSString isEnabled:self.rentCount.text]) {
        [Utils showAlert:@"请输入贷款金额" title:@"温馨提示"];
        return NO;
    }
    if ([self.rentYears.text isEqualToString:@"请选择贷款年限"]) {
        [Utils showAlert:@"请选择贷款年限" title:@"温馨提示"];
        return NO;
    }
    
    
      return YES;
}
- (IBAction)autoCalculate:(id)sender {
    UserEntity* user=[ConfigManage getLoginUser];
    CustomerMainManager* manager=[[CustomerMainManager alloc]init];
    if ([self.payType.text isEqualToString:@"请选择付款方式"]) {
        [Utils showAlert:@"请选择付款方式" title:@"温馨提示"];
       
    }else{

    if (self.detailView.hidden==YES) {
        
            CalculateTotalViewController* vc=[[CalculateTotalViewController alloc]init];
            vc.title=@"算价总计";
            vc.sholudPay=[NSString stringWithFormat:@"%.2f",[[self.CalculateDic objectForKey:@"FW_FWZJ"] floatValue]/10000.0 ];
        if ([NSString isEnabled:self.discount.text]) {
              vc.discountCount=self.discount.text;
            vc.actCount=[NSString stringWithFormat:@"%.2f",[[self.CalculateDic objectForKey:@"FW_FWZJ"] floatValue]/10000.0*([self.discount.text floatValue]/100.0) ];
            vc.firstCount=[NSString stringWithFormat:@"%.2f",[[self.CalculateDic objectForKey:@"FW_FWZJ"] floatValue]/10000.0*([self.discount.text floatValue]/100.0)-[self.rentCount.text floatValue]];
        }else{
        vc.discountCount=@"100.0";
        vc.actCount=[NSString stringWithFormat:@"%.2f",[[self.CalculateDic objectForKey:@"FW_FWZJ"] floatValue]/10000.0 ];
            vc.firstCount=@"0";
        }
            [self.navigationController pushViewController:vc animated:YES];
  
    }else{
        if ([self isValidata]) {
            NSString* discount;
            if ([NSString isEnabled:self.discount.text]) {
                CGFloat count=[self.discount.text floatValue]/100.0;
                discount=[NSString stringWithFormat:@"%f",count];
            }else{
                discount=@"1.0";
            }
            NSString* total;
            if ([NSString isEnabled:[self.CalculateDic objectForKey:@"FW_FWZJ"]]) {
                total=[self.CalculateDic objectForKey:@"FW_FWZJ"];
            }else{
                total=@"0";
            }
            if (![self.payType.text isEqualToString:@"组合金贷款"]) {
            NSString*style;
            NSString* businessCount;
            NSString* businessYear;
            NSString* businessLoan;
            NSString* fundCount;
            NSString* fundYear;
            NSString* fundLoan;
            if ([self.equalLoanBtn isSelected]) {
                style=@"等额本息";
            }
            if ([self.equalAccountBtn isSelected]) {
                style=@"等额本金";
            }
            if ([self.payStyle.text isEqualToString:@"银行贷款"]) {
                businessCount=self.rentCount.text;
                businessYear=self.rentYearLabel;
                businessLoan=self.rentLoan ;
                fundCount=@"0";
                fundYear=@"0";
                fundLoan=@"0";
                self.index=0;
            }
            if ([self.payStyle.text isEqualToString:@"公积金贷款"]) {
                businessCount=@"0";
                businessYear=@"0";
                businessLoan=@"0";
                fundCount=self.rentCount.text;
                fundYear=self.rentYearLabel;
                fundLoan=self.rentLoan ;
                self.index=1;
            }
               
            [manager caculateWithUserId:user.userId HouseId:[self.CalculateDic objectForKey:@"FW_FWID"] LoanRates: businessLoan FundRates:fundLoan FundLoanRates:style BuisnessLoanCount:businessCount BuisnessLoadYear:businessYear FundCount:fundCount FundYear:fundYear MatchPrincipal:style Discount:discount TotalCount:total success:^(id data, NSDictionary *userInfo) {
                NSLog(@"data:%@",data);
                NSDictionary* arr=(NSDictionary*)data;
                CalculateDetailsViewController* vc=[[CalculateDetailsViewController alloc]init];
                vc.title=@"算价详情";
                vc.calculateInfos=arr;
                vc.index=self.index;
//                if ([NSString isEnabled:self.discount.text]) {
//                   
//                    
//                    vc.firstCount=[NSString stringWithFormat:@"%.2f",[[self.CalculateDic objectForKey:@"FW_FWZJ"] floatValue]/10000.0*([self.discount.text floatValue]/100.0)-[self.rentCount.text floatValue]];
//                }else{
//                    vc.firstCount=[NSString stringWithFormat:@"%.2f",[[self.CalculateDic objectForKey:@"FW_FWZJ"] floatValue]/10000.0-[self.rentCount.text floatValue]];
//                }
                [self.navigationController pushViewController:vc animated:YES];
            } faild:^(id data, NSDictionary *userInfo) {
                
            }];
            }else{
                 NSString*loanStyle;
                NSString* fundStyle;
                if ([self.equalLoanBtn isSelected]) {
                    loanStyle=@"等额本息";
                }
                if ([self.equalAccountBtn isSelected]) {
                    loanStyle=@"等额本金";
                }
                if ([self.sencondEqualLoanBtn isSelected]) {
                    fundStyle=@"等额本息";
                }
                if ([self.secondequalAccountBtn isSelected]) {
                    fundStyle=@"等额本金";
                }
                
                [manager caculateWithUserId:user.userId HouseId:[self.CalculateDic objectForKey:@"FW_FWID"] LoanRates: self.rentLoan FundRates:self.secondRentLoan FundLoanRates:fundStyle BuisnessLoanCount:self.rentCount.text BuisnessLoadYear:self.rentYearLabel FundCount:self.secondRentCount.text FundYear:self.secondRentYearLabel MatchPrincipal:loanStyle Discount:discount TotalCount:total success:^(id data, NSDictionary *userInfo) {
                    NSLog(@"data:%@",data);
                    NSDictionary* arr=(NSDictionary*)data;
                    CalculateDetailsViewController* vc=[[CalculateDetailsViewController alloc]init];
                    vc.title=@"算价详情";
                    vc.calculateInfos=arr;
                    vc.index=self.index;
//                    vc.firstCount=[NSString stringWithFormat:@"%.2f",[[self.CalculateDic objectForKey:@"FW_FWZJ"] floatValue]/10000.0*([self.discount.text floatValue]/100.0)-[self.rentCount.text floatValue]];
                    [self.navigationController pushViewController:vc animated:YES];
                } faild:^(id data, NSDictionary *userInfo) {
                    
                }];
                
            }
        }
    }
    
    }
}

#pragma LeveyPopListViewDelegate
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex{
    
    if (popListView.tag==100) {
        
        self.rentCount.text=@"";
        self.rentYears.text=@"请选择贷款年限";
        self.rentPercent.text=@"基准利率";
        self.secondRentCount.text=@"";
        self.secondLoanYear.text=@"请选择贷款年限";
        self.secondStandardRate.text=@"基准利率";
        
        NSDictionary* dic=[self.BNtypes objectAtIndex:anIndex];
        
        self.payType.text=[self.payTypes objectAtIndex:anIndex];
        NSString* num=[self.types_num objectAtIndex:anIndex];
        
        if ([num isEqualToString:@"00"]) {
            self.detailView.hidden=YES;
            self.secondView.hidden=YES;
            [_pageControl removeFromSuperview];
        }else if([num isEqualToString:@"01"]||[num isEqualToString:@"02"]){
            
            self.detailView.hidden=NO;
            self.secondView.hidden=YES;
            self.payStyle.text=self.payType.text;
            self.detailView.frameSize=CGSizeMake(DEVICE_WIDTH,self.detailScrollView.frameSize.height);
            self.detailScrollView.contentSize=CGSizeMake(DEVICE_WIDTH, self.detailView.frame.size.height);
            [_pageControl removeFromSuperview];
        }else{
            self.detailView.hidden=NO;
            self.secondView.hidden=NO;
            self.payStyle.text=@"银行贷款";
            self.sencondPayStyle.text=@"公积金贷款";
//            self.secondView.frame=CGRectMake(DEVICE_WIDTH, self.detailView.frame.origin.y, self.detailView.frame.size.width, self.detailView.frame.size.height);
            self.detailScrollView.contentSize=CGSizeMake(DEVICE_WIDTH*2, self.detailView.frame.size.height);
            _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 375, [UIScreen mainScreen].bounds.size.width, 25)];
            _pageControl.currentPage=0;
            _pageControl.numberOfPages=2;
            _pageControl.currentPageIndicatorTintColor=[UIColor yellowColor];
            _pageControl.pageIndicatorTintColor=[UIColor whiteColor];
            [self.view insertSubview:_pageControl aboveSubview:self.detailScrollView];
        }
        NSString* type;
        if ([num isEqualToString:@"03"]) {
           
                type=@"01";
                CustomerMainManager* manager=[[CustomerMainManager alloc]init];
                [manager queryLoanRatesWithLoanTypeId:type success:^(id data, NSDictionary *userInfo) {
                    NSLog(@"data===%@",data);
                    self.rentYearsArr=nil;
                    self.rentYearsArr=[NSMutableArray array];
                    self.rentPercents=nil;
                    self.rentPercents=[NSMutableArray array];
                    for (NSDictionary* dic in (NSArray*)data) {
                        
                        [self.BNPercent addObject:dic];
                        [self.rentYearsArr addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_NX"]]];
                        [self.rentPercents addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_NLV"]]];
                        [self.totalRens addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_BXZE"]]];
                        [self.totalPercents addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_ZLX"]]];
                    }
                } faild:^(id data, NSDictionary *userInfo) {
                    
                }];
            
            
                type=@"02";
                CustomerMainManager* manager2=[[CustomerMainManager alloc]init];
                [manager2 queryLoanRatesWithLoanTypeId:type success:^(id data, NSDictionary *userInfo) {
                    NSLog(@"data===%@",data);
                    self.secondRentYearArr=nil;
                    self.secondRentYearArr=[NSMutableArray array];
                    self.secondRentPercents=nil;
                    self.secondRentPercents=[NSMutableArray array];
                    for (NSDictionary* dic in (NSArray*)data) {
                        
                        [self.BNPercent addObject:dic];
                        [self.secondRentYearArr addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_NX"]]];
                        [self.secondRentPercents addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_NLV"]]];
                        [self.totalRens addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_BXZE"]]];
                        [self.totalPercents addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_ZLX"]]];
                    }
                } faild:^(id data, NSDictionary *userInfo) {
                    
                }];
            
        }else{
            type=[dic objectForKey:@"ZD_ZDMC"];
            CustomerMainManager* manager=[[CustomerMainManager alloc]init];
            [manager queryLoanRatesWithLoanTypeId:type success:^(id data, NSDictionary *userInfo) {
                NSLog(@"data===%@",data);
                self.rentYearsArr=nil;
                self.rentYearsArr=[NSMutableArray array];
                self.rentPercents=nil;
                self.rentPercents=[NSMutableArray array];
                for (NSDictionary* dic in (NSArray*)data) {
                    
                    [self.BNPercent addObject:dic];
                    [self.rentYearsArr addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_NX"]]];
                    [self.rentPercents addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_NLV"]]];
                    [self.totalRens addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_BXZE"]]];
                    [self.totalPercents addObject:[NSString stringWithFormat:@"%@",[dic objectForKey:@"DK_ZLX"]]];
                }
            } faild:^(id data, NSDictionary *userInfo) {
                
            }];
        }
        
        
        
    }
    if (popListView.tag==101) {
        self.rentYears.text=[NSString stringWithFormat:@"%@年",[self.rentYearsArr objectAtIndex:anIndex]];
        self.rentYearLabel=[NSString stringWithFormat:@"%@",[self.rentYearsArr objectAtIndex:anIndex]];
        self.rentPercent.text=[NSString stringWithFormat:@"%@%%",[self.rentPercents objectAtIndex:anIndex]];
        self.rentLoan=[self.rentPercents objectAtIndex:anIndex];
    }

    if (popListView.tag==103) {
        self.secondLoanYear.text=[NSString stringWithFormat:@"%@年",[self.secondRentYearArr objectAtIndex:anIndex]];
        self.secondRentYearLabel=[NSString stringWithFormat:@"%@",[self.secondRentYearArr objectAtIndex:anIndex]];
        self.secondStandardRate.text=[NSString stringWithFormat:@"%@%%",[self.secondRentPercents objectAtIndex:anIndex]];
        self.secondRentLoan=[self.secondRentPercents objectAtIndex:anIndex];
    }

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset=scrollView.contentOffset;
    _pageControl.currentPage=(offset.x/(DEVICE_WIDTH/2)+1)/2;
}
@end
