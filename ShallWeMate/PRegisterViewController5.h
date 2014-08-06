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
    NSArray *avgAgesArray2;
    UIActionSheet *actionSheet;
    UIPickerView *picker;
}

@property (strong, nonatomic) HouseData *houseData;
@property (strong, nonatomic) IBOutlet UIButton *avgAgeButton;

@end
