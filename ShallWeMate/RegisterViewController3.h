//
//  RegisterViewController3.h
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMAppDelegate.h"
#import "MemberData.h"

@interface RegisterViewController3 : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    UIActionSheet *actionSheet;
    UIPickerView *picker;
    UIButton *ageSelectBtn;
    NSArray *agesArray;
    
}

@property (weak, nonatomic) IBOutlet UILabel *ageTitleLabel;
@property (weak, nonatomic) MemberData *memberData;
@property (retain, nonatomic) IBOutlet UIButton *ageSelectBtn;
//@property (strong, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UIButton *sameSex;
@property (weak, nonatomic) IBOutlet UIButton *mixedSex;

- (IBAction)ageSelect:(id)sender;
- (IBAction)doneButtonClicked:(id)sender;
@end
