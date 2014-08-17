//
//  SWMLoginViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <FacebookSDK/FBLoginView.h>
#import "SWMAppDelegate.h"

@interface SWMLoginViewController : UIViewController

{
    NSString *userId;
}

@property NSString *userId;
@property (weak, nonatomic) IBOutlet UIButton *login;

- (IBAction)facebookLoginClick:(id)sender;

@end
