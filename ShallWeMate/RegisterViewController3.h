//
//  RegisterViewController3.h
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMAppDelegate.h"

@interface RegisterViewController3 : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    UIActionSheet *actionSheet;
    UIPickerView *picker;
    UIButton *ageSelectBtn;
    NSArray *agesArray;
    
}
@property (retain, nonatomic) IBOutlet UIButton *ageSelectBtn;
//@property (strong, nonatomic) IBOutlet UITextField *age;

- (IBAction)ageSelect:(id)sender;
@end
