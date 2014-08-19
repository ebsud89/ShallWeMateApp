//
//  PRegisterViewController1.h
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMSubwayViewController.h"

@interface PRegisterViewController1 : UIViewController <SubwayViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

{
//    HouseData *housedata;
    NSMutableArray *selectHouseImage;
}

@property (weak, nonatomic) IBOutlet UILabel *stationLabel;
@property (strong, nonatomic) HouseData *housedata;
@property (weak, nonatomic) IBOutlet UIButton *premiumBrand;
@property (strong, nonatomic) IBOutlet UIButton *subwaySearchBtn;
@property (strong, nonatomic) IBOutlet UITextField *houseTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *subwayMinutesTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *introHouse;
@property (strong, nonatomic) NSString *premiumBrandName;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@property (strong, nonatomic) IBOutlet UIScrollView *houseImageScrollView;
@property (strong, nonatomic) IBOutlet UIButton *addPhotoBtn;
@property (weak, nonatomic) IBOutlet UIImageView *brandLogo;
@property (weak, nonatomic) IBOutlet UILabel *brandName;
@property (weak, nonatomic) IBOutlet UIImageView *stationImg;


- (IBAction)premiumBrandRegister:(id)sender;
- (void)fillhouseData;
- (void)refreshHouseData;
- (void) initHouseImageScrollView;

@end
