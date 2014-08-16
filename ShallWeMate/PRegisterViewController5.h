//
//  PRegisterViewController5.h
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRegisterViewController5 : UIViewController <UIActionSheetDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *avgAgesArray;
    UIActionSheet *actionSheet;
    UIPickerView *picker;
}

@property (strong, nonatomic) HouseData *houseData;
@property (strong, nonatomic) IBOutlet UIButton *avgAgeButton;
@property (weak, nonatomic) IBOutlet UITextField *existingMenNum;
@property (weak, nonatomic) IBOutlet UITextField *existingWomenNum;
@property (weak, nonatomic) IBOutlet UITextField *wantMenNum;
@property (weak, nonatomic) IBOutlet UITextField *wantWomenNum;

@end
