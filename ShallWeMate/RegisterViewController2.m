//
//  RegisterViewController2.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController2.h"

@implementation RegisterViewController2

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

@end