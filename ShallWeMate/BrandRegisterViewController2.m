//
//  BrandRegisterViewController2.m
//  start
//
//  Created by 컴038 on 8/4/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "BrandRegisterViewController2.h"
#import "PRegisterViewController1.h"

@implementation BrandRegisterViewController2
@synthesize brandNameString;
@synthesize brandName;
@synthesize brandImage;
@synthesize inputAuthCode;
@synthesize authCode;
@synthesize commitBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self brandImageSetting];
    [self authCodeSetting];
    
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

//브랜드 로고 이미지 세팅하는 함수
-(void)brandImageSetting
{
    UIImage *woozooImage = [UIImage imageNamed:@"p01.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"p02.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"p03.png"];
    UIImage *image4 = [UIImage imageNamed:@"p04.png"];
    UIImage *image5 = [UIImage imageNamed:@"p05.jpg"];
    UIImage *image6 = [UIImage imageNamed:@"p06.jpg"];
    UIImage *image7 = [UIImage imageNamed:@"p07.png"];
    UIImage *image8 = [UIImage imageNamed:@"p08.png"];
    UIImage *image9 = [UIImage imageNamed:@"p09.jpg"];
    
    
    if ([self.brandNameString  isEqual: @"WOOZOO"]) {
        self.brandImage.image = woozooImage;
    } else if ([self.brandNameString  isEqual: @"ZIBOONG"]) {
        self.brandImage.image = image2;
    } else if ([self.brandNameString  isEqual: @"통의동집"]) {
        self.brandImage.image = image3;
    } else if ([self.brandNameString  isEqual: @"한울"]) {
        self.brandImage.image = image4;
    } else if ([self.brandNameString  isEqual: @"함께"]) {
        self.brandImage.image = image5;
    } else if ([self.brandNameString  isEqual: @"언니네하우스"]) {
        self.brandImage.image = image6;
    } else if ([self.brandNameString  isEqual: @"0ZONE"]) {
        self.brandImage.image = image7;
    } else if ([self.brandNameString  isEqual: @"SUN&HOUSE"]) {
        self.brandImage.image = image8;
    }else{
        self.brandImage.image = image9;
    }
    self.houseData.premium = self.brandNameString;
    NSLog(@"brandtest : %@", self.brandNameString);
    NSLog(@"brand : %@", self.houseData.premium);
}

//브랜드 인증 코드 세팅하는 함수
-(void) authCodeSetting
{
    if ([self.brandNameString  isEqual: @"WOOZOO"]) {
        self.authCode = @"1234";
    } else {
        self.authCode = @"2345";
    }
    self.brandName.text = brandNameString;
    
}

-(IBAction)doneButtonPressed:(id)sender
{
    if ([inputAuthCode.text isEqual:authCode]) {
        
        PRegisterViewController1 *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"pRegisterViewController1"];
        vc.premiumBrandName = brandNameString;
        vc.brandName.text =brandNameString;
        SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        appDelegate.brand = brandNameString;
        NSLog(@"te... :%@ %@", brandNameString, appDelegate.brand);
        
        
        //        [self.navigationController popViewControllerAnimated:YES];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"인증코드"
                                                        message:@"불일치"
                                                       delegate:self
                                              cancelButtonTitle:@"돌아가기"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self viewDidLoad];
    //[[self] popViewControllerAnimated:YES];
    //[[self navigationController] popViewControllerAnimated:YES];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//
//    if ([[segue identifier] isEqualToString:@"goBack"]) {
//        PRegisterViewController1 *vc = [segue destinationViewController];
//        vc.premiumBrandName = brandNameString;
//        NSLog(@" brand controller, brand name : %@", brandNameString);
//    }
//}

@end

