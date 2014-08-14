//
//  SWMNoticeViewController.m
//  ShallWeMate
//
//  Created by 컴038 on 8/10/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "SWMNoticeViewController.h"

@implementation SWMNoticeViewController
-(void)viewDidLoad {
    NSLog(@"message : %i\n newhouse : %i\n reply : %i",self.messageNotice.on, self.houseAddNotice.on, self.replyNotice.on);
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

- (IBAction)messageNoticeSwitch:(id)sender {
}

- (IBAction)newHouseNoticeSwitch:(id)sender {
}

- (IBAction)replyNoticeSwitch:(id)sender {
}
@end
