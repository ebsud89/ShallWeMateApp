//
//  SWMNoticeViewController.h
//  ShallWeMate
//
//  Created by 컴038 on 8/10/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMNoticeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *messageNotice;
@property (weak, nonatomic) IBOutlet UISwitch *replyNotice;
@property (weak, nonatomic) IBOutlet UISwitch *houseAddNotice;
- (IBAction)messageNoticeSwitch:(id)sender;
- (IBAction)newHouseNoticeSwitch:(id)sender;
- (IBAction)replyNoticeSwitch:(id)sender;

@end
