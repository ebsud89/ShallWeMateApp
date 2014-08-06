//
//  PRegisterViewController1.h
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMSubwayViewController.h"

@interface PRegisterViewController1 : UIViewController <SubwayViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
    HouseData *housedata;
}
@property (strong, nonatomic) IBOutlet UIButton *subwaySearchBtn;
@property (strong, nonatomic) IBOutlet UITextField *houseTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *subwayMinutesTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *introHouse;
@property (strong, nonatomic) IBOutlet UIImageView *houseImageview;

- (void)fillhouseData;
- (void)refreshHouseData;
@end
