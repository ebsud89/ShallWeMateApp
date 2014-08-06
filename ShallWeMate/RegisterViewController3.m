//
//  RegisterViewController3.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController3.h"

@implementation RegisterViewController3

@synthesize ageSelectBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    agesArray = [[NSArray alloc] initWithObjects:@"20대 초반", @"20대 중반", @"20대 후반", @"30대 초반", @"30대 중반", @"30대 후반", @"40대 이상", nil];
    
}
- (IBAction)ageSelect:(id)sender {
    UIPickerView *agePickerView = [[UIPickerView alloc] init];
    [agePickerView setDelegate:self];
    [agePickerView setDataSource:self];
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    [agePickerView setFrame:CGRectMake(0.0f,
                                       keyWindow.frame.size.height - agePickerView.frame.size.height,
                                       keyWindow.frame.size.width,
                                       agePickerView.frame.size.height)];
    [keyWindow addSubview:agePickerView];
    
}

// pickerView Component 갯수
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// pickerView row 갯수
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [agesArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [ageSelectBtn setTitle:[agesArray objectAtIndex:row] forState:UIControlStateNormal];
    
    //picker view 내리기
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    pickerView.transform = CGAffineTransformMakeTranslation(0, 275); //그냥 아래로 다시 내려주자
    [UIView commitAnimations];
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [agesArray objectAtIndex:row];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
