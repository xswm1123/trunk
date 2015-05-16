//
//  CalculateDetailsViewController.m
//  FDC
//
//  Created by NewDoone on 15/3/24.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CalculateDetailsViewController.h"

static NSString* cellId=@"cellDetails";
@interface CalculateDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalLoan;
@property (weak, nonatomic) IBOutlet UILabel *businessLoan;
@property (weak, nonatomic) IBOutlet UILabel *fundLoan;
@property (weak, nonatomic) IBOutlet UILabel *firstPay;
@property (weak, nonatomic) IBOutlet UILabel *payTimes;
@property (weak, nonatomic) IBOutlet UILabel *totalPay;
@property (weak, nonatomic) IBOutlet UILabel *rate;
@property(nonatomic,strong) NSArray* businessLoans;
@property(nonatomic,strong) NSArray* Loans;

@end

@implementation CalculateDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.firstPayCount.text=[NSString stringWithFormat:@"首付款:%@万",self.firstCount];
    UINib *nib = [UINib nibWithNibName:@"CalculateCellTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellId];
    [self initSegmentControl];
    [self createData];
    
}
-(void)initSegmentControl{
    self.segmentControl.tag=100;
    [self.segmentControl setBackgroundImage:[UIImage imageNamed:@"blue_unit.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segmentControl setBackgroundImage:[UIImage imageNamed:@"yellow_unit.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    self.segmentControl.frameHeight=40;
    self.segmentControl.layer.cornerRadius=0.0;
    self.segmentControl.tintColor=[UIColor whiteColor];
    NSDictionary* textAttribute = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    [self.segmentControl setTitleTextAttributes:textAttribute forState:UIControlStateSelected];
}
-(void)createData{
    self.segmentControl.selectedSegmentIndex=self.index;
    self.totalLoan.text=[self.calculateInfos objectForKey:@"ZDKJE"];
     self.businessLoan.text=[self.calculateInfos objectForKey:@"SDJE"];
     self.fundLoan.text=[self.calculateInfos objectForKey:@"GJJJE"];
     self.firstPay.text=[self.calculateInfos objectForKey:@"SFKJE"];
     self.payTimes.text=[self.calculateInfos objectForKey:@"QS"];
     self.totalPay.text=[self.calculateInfos objectForKey:@"ZHKJE"];
     self.rate.text=[self.calculateInfos objectForKey:@"LX"];
    if (self.segmentControl.selectedSegmentIndex==0) {
        NSArray* arr=[self.calculateInfos objectForKey:@"SJMX"];
        self.Loans=[arr objectAtIndex:0];
    }
    if (self.segmentControl.selectedSegmentIndex==1) {
        NSArray* arr=[self.calculateInfos objectForKey:@"SJMX"];
        self.Loans=[arr objectAtIndex:1];
    }
    [self.tableView reloadData];
}

- (IBAction)sementAction:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex==0) {
        NSArray* arr=[self.calculateInfos objectForKey:@"SJMX"];
        self.Loans=[arr objectAtIndex:0];
        [self.tableView reloadData];
    }
    if (sender.selectedSegmentIndex==1) {
        NSArray* arr=[self.calculateInfos objectForKey:@"SJMX"];
        self.Loans=[arr objectAtIndex:1];
        [self.tableView reloadData];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
#pragma dataresource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.Loans.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CalculateCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
        NSDictionary* dic=[self.Loans objectAtIndex:indexPath.row];
        cell.num.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"SJ_QC"]];
        cell.totalAndLoan.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"SJ_CHBX"]];
        cell.totalCount.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"SJ_CHBJ"]];
        cell.lastConut.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"SJ_SYBJ"]];
    return cell;
}

//-(void)viewWillDisappear:(BOOL)animated{
//     self.navigationController.toolbar.hidden=NO;
//}
//-(void)viewWillAppear:(BOOL)animated{
//    self.navigationController.toolbar.hidden=YES;
//}
@end
