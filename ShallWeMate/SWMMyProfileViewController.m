//
//  SWMMyProfileViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMMyProfileViewController.h"
#import "NSUserDefaults+RMSaveCustomObject.h"

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
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _memberData = [defaults rm_customObjectForKey:@"myHouse"];
    
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
    UIColor *borderColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0];
    [self.imageView.layer setBorderColor:borderColor.CGColor];
    [self.imageView.layer setBorderWidth:2.0];
    self.imageView.clipsToBounds = YES;
    
    NSString *gender =  _memberData.sex;
    if ([gender isEqualToString:@"1"])  {
        gender = @"여자";
    } else {
        gender = @"남자";
    }
//    NSString *locale = [[NSString alloc] init];
//    if ([[defaults objectForKey:@"locale"] isEqualToString:@"ko_KR"]) {
//        locale = @"대한민국";
//    }
//    NSString *job = [defaults objectForKey:@"job"];
//    NSString *age = [defaults objectForKey:@"age"];
    
    // Update the UI elements with the saved data
    nameLabel.text = _memberData.name;
    genderLabel.text = gender;
//    countryLabel.text = locale;
    ageLabel.text = _memberData.age;
    jobLabel.text = _memberData.job;
    
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
