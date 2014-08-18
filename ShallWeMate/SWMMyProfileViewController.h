//
//  SWMMyProfileViewController.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMMyProfileViewController : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *nameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *genderLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end
