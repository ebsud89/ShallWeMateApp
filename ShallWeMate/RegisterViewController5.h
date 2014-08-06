//
//  RegisterViewController5.h
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController5 : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *inviteOk;
@property (weak, nonatomic) IBOutlet UIButton *inviteNo;
@property (weak, nonatomic) IBOutlet UIButton *petOk;
@property (weak, nonatomic) IBOutlet UIButton *petNo;
@property (weak, nonatomic) IBOutlet UIButton *privacyMore;
@property (weak, nonatomic) IBOutlet UIButton *privacyLess;
@property (weak, nonatomic) IBOutlet UIButton *smokeOk;
@property (weak, nonatomic) IBOutlet UIButton *smokeNo;
@property (weak, nonatomic) IBOutlet UIButton *drinkOk;
@property (weak, nonatomic) IBOutlet UIButton *drinkNo;
-(void)radiobuttonSelected:(id)sender;
@end
