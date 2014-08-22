//
//  SWMMyProfileViewController.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberData.h"

@interface SWMMyProfileViewController : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *nameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *genderLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
//@property (weak, nonatomic) FBProfilePictureView *fbProfilePictureView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) MemberData *memberData;
@end
