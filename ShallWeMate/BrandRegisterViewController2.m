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
    
    UIImage *woozooImage = [UIImage imageNamed:@"makefg.php.png"];
    UIImage *othersImage = [UIImage imageNamed:@"face_test.png"];
    
    if ([self.brandNameString  isEqual: @"woozoo"]) {
        self.brandImage.image = woozooImage;
        self.authCode = @"1234";
    } else {
        self.brandImage.image = othersImage;
        self.authCode = @"2345";
    }
    self.brandName.text = brandNameString;
    
//    [[[self navigationController] commitBtn] setTarget:self];
//    [[[self navigationController] commitBtn] setAction:@selector(backBtnUserClicked:)];
//    commitBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];

}

-(void)doneButtonPressed:(id)sender
{
    if ([inputAuthCode.text isEqual:authCode]) {

        PRegisterViewController1 *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"pRegisterViewController1"];
        vc.premiumBrandName = brandNameString;
        NSLog(@" brand controller, brand name : %@", brandNameString);
        [self.view addSubview:vc.view];
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
    self.viewDidLoad;
    //[[self] popViewControllerAnimated:YES];
    //[[self navigationController] popViewControllerAnimated:YES];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"brandRegisterSegue"]) {
        PRegisterViewController1 *vc = [segue destinationViewController];
        vc.premiumBrandName = brandNameString;
        NSLog(@" brand controller, brand name : %@", brandNameString);
    }
}

@end

