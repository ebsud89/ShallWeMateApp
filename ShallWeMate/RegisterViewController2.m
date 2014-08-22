//
//  RegisterViewController2.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController2.h"
#import "RegisterViewController3.h"

@implementation RegisterViewController2

@synthesize maxBudgetLabel;
@synthesize maxDepositLabel;
@synthesize maxBudget;
@synthesize maxDeposit;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    
    return self;
}
- (void) viewDidLoad
{
    
    [super viewDidLoad];
    
    [self refreshMemberData];
    //navigation bar color
//    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
//    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

- (void) refreshMemberData
{
    
    
    /* 수요자측 데이터 (지하철역, 보증금, 월세) 뿌리기
     
     */
    if (_memberData.nearSubwayStation != nil) {
        self.subwaySearchBtn.titleLabel.text = _memberData.nearSubwayStation;
        NSLog(@"%@", self.subwaySearchBtn.titleLabel.text);
    }


    if (_memberData.securityCost != nil) {
        self.maxDepositLabel.text = _memberData.securityCost;
    }

    if (_memberData.monthlyRentCost != nil) {
        self.maxBudgetLabel.text = _memberData.monthlyRentCost;
    }
    
}

- (void)fillMemberData
{
    /* 기입한 정보 (지하철역, 보증금, 월세) 저장하기 */
    
    _memberData.nearSubwayStation = self.stationLabel.text;
    _memberData.securityCost = self.maxDepositLabel.text;
    _memberData.monthlyRentCost = self.maxBudgetLabel.text;
}

//- (IBAction)subwayStationSearchBtnClicked:(id)sender {
//    
//}

// subway delegate
- (void) didSelectedSubwayStation:(NSDictionary *) subwayDic
{
//    [self.subwaySearchBtn setBackgroundColor:[UIColor whiteColor]];
    self.memberData.subwayDic = subwayDic;
    self.subwaySearchBtn .hidden=TRUE;
//    self.stationImg.hidden=FALSE;
    self.stationLabel.text = [subwayDic objectForKey:@"전철역명"];
    UIImage* img = [UIImage imageNamed:@"o.png"];
    [self.stationImg setImage:img];
    
    
}
- (IBAction)nextButtonClicked:(id)sender {
    RegisterViewController3 *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"srchMateInfo"];
//    vc.memberData = self.memberData;
//    [self.view addSubview:vc.view];
    [self fillMemberData];
    /* 기입한 정보를 다음 뷰로 전달*/
    NSLog(@"r2=============");
    [_memberData printAll];
    vc.memberData = _memberData;
    [self.navigationController pushViewController: vc animated:YES];
}

- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


//- (void) viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//    NSLog(@"aaadsfjosdfjdosjlxnaofjoewjfnvj");
//    NSLog(@"%@", _memberData.subwayDic);
//    self.subwaySearchBtn.titleLabel.text = @"aaaa";
//    if (_memberData.subwayDic != nil) {
//        self.locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//        
//        self.locationLabel.text = [_memberData.subwayDic objectForKey:@"전철역명"];
//        
//        [self.view addSubview:self.locationLabel];
////        _memberData.subwayDic = subwayDic;
////        [self.location reloadInputViews];
//        
//        self.subwaySearchBtn.titleLabel.text = @"zadfioajsofjodjv";
//    }
//}


- (IBAction)budgetSlider:(id)sender {
    //label에 금액 띄우기
    int budget = maxBudget.value;
    [maxBudgetLabel setText:[NSString stringWithFormat:@"%d", budget]];
    
    //label 위치 변경
//    CGRect trackRect = [self.maxBudget trackRectForBounds:self.maxBudget.bounds];
//    CGRect thumbRect = [self.maxBudget thumbRectForBounds:self.maxBudget.bounds
//                                             trackRect:trackRect
//                                                 value:self.maxBudget.value];
//    
//    
//    maxBudgetLabel.center = CGPointMake(thumbRect.origin.x + self.maxBudget.frame.origin.x +16,  self.maxBudget.frame.origin.y - 6);
    
    maxBudgetLabel.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
}

- (IBAction)depositSlider:(id)sender {
    int deposit = maxDeposit.value;
    [maxDepositLabel setText:[NSString stringWithFormat:@"%d", deposit]];
    
    maxDepositLabel.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
    //label 위치 변경
//    CGRect trackRect = [self.maxDeposit trackRectForBounds:self.maxDeposit.bounds];
//    CGRect thumbRect = [self.maxDeposit thumbRectForBounds:self.maxDeposit.bounds
//                                                trackRect:trackRect
//                                                    value:self.maxDeposit.value];
//    
//    maxDepositLabel.center = CGPointMake(thumbRect.origin.x + self.maxDeposit.frame.origin.x + 10,  self.maxDeposit.frame.origin.y - 20);
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"searchSubway"]) {
        SWMSubwayViewController *vc = [segue destinationViewController];
        vc.delegate = self;
        
        [self.view endEditing:YES];
    } else if ([[segue identifier] isEqualToString:@"goNext"])
    {
        RegisterViewController3 *vc = [segue destinationViewController];
        
        /* 기입한 정보를 다음 뷰로 전달*/
        
        [self fillMemberData];
        
        vc.memberData = _memberData;
//        [self fillhouseData];
        
    }
    
    
}

@end
