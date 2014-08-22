//
//  BrandRegisterViewController2.h
//  start
//
//  Created by 컴038 on 8/4/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandRegisterViewController2 : UIViewController
{
    UILabel *brandName;
    UITextField *inputAuthCode;
    UIImageView *brandImage;
}

@property (strong, nonatomic) HouseData *houseData;
//@property (strong, nonatomic) IBOutlet UIButton *commitBtn;
@property (strong, nonatomic) NSString *brandNameString;
@property (strong, nonatomic) IBOutlet UILabel *brandName;
@property (strong, nonatomic) NSString *authCode;
@property (strong, nonatomic) IBOutlet UITextField *inputAuthCode;
@property (strong, nonatomic) IBOutlet UIImageView *brandImage;


- (IBAction)doneButtonPressed:(id)sender;

@end
