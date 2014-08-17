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
@synthesize houseData;

@synthesize maxBudgetLabel;
@synthesize maxDepositLabel;
@synthesize maxBudget;
@synthesize maxDeposit;
@synthesize locationLabel;
@synthesize location;

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
    
    [self refreshHouseData];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

- (void) refreshHouseData
{
    
    
    /* 수요자측 데이터 (지하철역, 보증금, 월세) 뿌리기
     
     */
    
    
    //    if (_houseData.title != nil) {
    //        self.houseTitleTextField.text = _houseData.title;
    //    }
    //
    //    if (_houseData.transportation != nil) {
    //        self.subwaySearchBtn.titleLabel.text = _houseData.nearSubwayStation;
    //    }
    //
    //    if (_houseData.transportation != nil) {
    //        NSLog(@"걸어서");
    //    }
    //
    //    if (_houseData.transportationMinutes != nil) {
    //        self.subwayMinutesTextFiled.text = _houseData.transportationMinutes;
    //    }
    //
    //    if (_houseData.introHouse != nil) {
    //        self.introHouse.text = _houseData.introHouse;
    //    }
    
}

- (void)fillhouseData
{
    /* 기입한 정보 (지하철역, 보증금, 월세) 저장하기 */
    
    //    _houseData.title = self.houseTitleTextField.text;
    //    _houseData.nearSubwayStation = self.subwaySearchBtn.titleLabel.text;
    //    _houseData.transportation = @"걸어서";
    //    _houseData.transportationMinutes = self.subwayMinutesTextFiled.text;
    //    _houseData.introHouse = self.introHouse.text;
    //    _houseData.premium = self.premiumBrandName;
}

- (IBAction)subwayStationSearchBtnClicked:(id)sender {
    
}

// subway delegate
- (void) didSelectedSubwayStation:(NSDictionary *) subwayDic
{
    self.subwayStationSearchBtn.titleLabel.text = [subwayDic objectForKey:@"전철역명"];
//    self.housedata.subwayDic = subwayDic;
    
}

- (IBAction)budgetSlider:(id)sender {
    //label에 금액 띄우기
    int budget = maxBudget.value;
    [maxBudgetLabel setText:[NSString stringWithFormat:@"%d", budget]];
    
    //label 위치 변경
    CGRect trackRect = [self.maxBudget trackRectForBounds:self.maxBudget.bounds];
    CGRect thumbRect = [self.maxBudget thumbRectForBounds:self.maxBudget.bounds
                                             trackRect:trackRect
                                                 value:self.maxBudget.value];
    
    maxBudgetLabel.center = CGPointMake(thumbRect.origin.x + self.maxBudget.frame.origin.x,  self.maxBudget.frame.origin.y - 20);
}

- (IBAction)depositSlider:(id)sender {
    int deposit = maxDeposit.value;
    [maxDepositLabel setText:[NSString stringWithFormat:@"%d", deposit]];
    
    //label 위치 변경
    CGRect trackRect = [self.maxDeposit trackRectForBounds:self.maxDeposit.bounds];
    CGRect thumbRect = [self.maxDeposit thumbRectForBounds:self.maxDeposit.bounds
                                                trackRect:trackRect
                                                    value:self.maxDeposit.value];
    
    maxDepositLabel.center = CGPointMake(thumbRect.origin.x + self.maxDeposit.frame.origin.x,  self.maxDeposit.frame.origin.y - 20);
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
        
        //        vc.houseData = _housedata;
        [self fillhouseData];
        
    }
    
    
}

@end
