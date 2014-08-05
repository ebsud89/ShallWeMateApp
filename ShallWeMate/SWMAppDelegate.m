//
//  SWMAppDelegate.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 7/31/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "SWMAppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import <UIKit/UIKit.h>
#import "SWMRootViewController.h"
#import "SWMCheckRole_VC.h"


@implementation SWMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Whenever a person opens the app, check for a cached session
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        
        // If there's one, just open the session silently, without showing the user the login UI
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile"]
                                           allowLoginUI:NO
                                      completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
                                          //for fbUser profile picture
                                          self.fbUserId = [[NSString alloc] init];
                                          NSLog(@"default user id setting");
                                          
                                          // Handler for session state changes
                                          // This method will be called EACH time the session state changes,
                                          // also for intermediate states and NOT just when the session open
                                          [self sessionStateChanged:session state:state error:error];
                                          
                                          //for session check and log
                                          [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id<FBGraphUser> result, NSError *error) {
                                              if (!error) {
                                                  NSLog(@"first .. user info: %@", result);
                                                  NSLog(@"user's name: %@", result.name);
                                                  NSLog(@"user's objectID(=id): %@", result.objectID);
                                                  self.fbUserId = result.objectID;
                                                  self.fbUserName = result.name;
                                                  NSLog(@"fbUserID : %@", self.fbUserId);
                                              } else {
                                                  NSLog(@"sessionStateChanged .. Facebook connection Error!!");
                                              }
                                          }];
                                          
                                      }];
    }
    //default app 설정
    [FBSettings setDefaultAppID:@"742631819134258"];
    //    self.fbUserId = @"646117635484916";
    
    //session 유지
    //[[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    
    // Root view controller
    _rootViewController = [[RootViewController alloc] init];
    
                        
    // Main Window View start
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.z
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
