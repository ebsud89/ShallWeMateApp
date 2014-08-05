//
//  SWMAppDelegate.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 7/31/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "RootViewController.h"

@interface SWMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) FBSession *session;
@property (strong, nonatomic) NSString *fbUserId;
@property (strong, nonatomic) NSString *fbUserName;

extern NSString *const FBSessionStateChangedNotification;

- (BOOL) openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
- (void) sessionStateChanged:(FBSession *)session state:(FBSessionState)state error:(NSError *)error;


@property (strong, nonatomic) UIWindow *window;

@end
