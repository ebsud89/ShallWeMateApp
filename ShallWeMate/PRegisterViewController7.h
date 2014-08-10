//
//  PRegisterViewController7.h
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRegisterViewController7 : UIViewController

@property (strong, nonatomic) HouseData *houseData;
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
