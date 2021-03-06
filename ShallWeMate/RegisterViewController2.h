//
//  RegisterViewController2.h
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMSubwayViewController.h"
#import "MemberData.h"

@interface RegisterViewController2 : UIViewController <SubwayViewControllerDelegate>
{
    UILabel *maxBudgetLabel;
    UILabel *maxDepositLabel;
    UISlider *maxBudget;
    UISlider *maxDeposit;
    
    
    UILabel *locationLabel;
    UITextField *location;
}


@property (weak, nonatomic) IBOutlet UILabel *stationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stationImg;
@property (strong, nonatomic) MemberData *memberData;
@property (retain, nonatomic) IBOutlet UISlider *maxBudget;
@property (retain, nonatomic) IBOutlet UISlider *maxDeposit;
@property (retain, nonatomic) IBOutlet UILabel *maxBudgetLabel;
@property (retain, nonatomic) IBOutlet UILabel *maxDepositLabel;
//@property (retain, nonatomic) IBOutlet UILabel *locationLabel;
@property (retain, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) IBOutlet UIButton *subwaySearchBtn;

@property (strong, nonatomic) IBOutlet UIButton *subwayStationSearchBtn;

- (IBAction)budgetSlider:(id)sender;
- (IBAction)depositSlider:(id)sender;
@end
