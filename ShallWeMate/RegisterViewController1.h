//
//  RegisterViewController1.h
//  start
//
//  Created by 컴038 on 7/15/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMAppDelegate.h"
#import "MemberData.h"

@interface RegisterViewController1  : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    UIActionSheet *actionSheet;
    UIPickerView *picker;
    UIButton *jobButton;
    NSArray *jobsArray;
    UITextField *userName;
    UIButton *radiobutton1;
    UIButton *radiobutton2;
}
//- (IBAction)inputAge:(id)sender;
@property (strong, nonatomic) MemberData *memberData;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *fbProfilePictureView;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *man;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *woman;


@property (retain, nonatomic) IBOutlet UIButton *jobButton;

@property(strong, nonatomic) UIButton *radiobutton1;
@property(strong, nonatomic) UIButton *radiobutton2;

- (void)radiobuttonSelected:(id)sender;
- (IBAction)jobSelect:(id)sender;
@end
