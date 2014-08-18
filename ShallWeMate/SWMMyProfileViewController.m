//
//  SWMMyProfileViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMMyProfileViewController.h"

@interface SWMMyProfileViewController ()

@end

@implementation SWMMyProfileViewController
@synthesize nameLabel;
@synthesize genderLabel;
@synthesize countryLabel;
@synthesize jobLabel;
@synthesize ageLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *name = [defaults objectForKey:@"name"];
    NSString *gender = [defaults objectForKey:@"gender"];
    NSString *locale = [[NSString alloc] init];
    if ([[defaults objectForKey:@"locale"] isEqualToString:@"ko_KR"]) {
        locale = @"대한민국";
    }
    NSString *job = [defaults objectForKey:@"job"];
    NSString *age = [defaults objectForKey:@"age"];
    
//    int age = [defaults integerForKey:@"age"];
//    NSString *ageString = [NSString stringWithFormat:@"%i",age];
    
//    NSData *imageData = [defaults dataForKey:@"image"];
//    UIImage *contactImage = [UIImage imageWithData:imageData];
    
    // Update the UI elements with the saved data
    nameLabel.text = name;
    genderLabel.text = gender;
    countryLabel.text = locale;
    ageLabel.text = age;
    jobLabel.text = job;
    
//    contactImageView.image = contactImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)menuClicked:(id)sender {
    
    NSLog(@"button is touched");
    [MENU_VIEW_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
