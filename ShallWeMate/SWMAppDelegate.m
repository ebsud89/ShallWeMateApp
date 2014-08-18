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
#import "SWMLoginViewController.h"
#import "SWMCheckRole_VC.h"
#import "HouseData.h"
#import "MemberData.h"

@implementation SWMAppDelegate
@synthesize defaults;

NSString *const FBSessionStateChangedNotification = @"swm.ShallWeMate:FBSessionStateChangedNotification";


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [FBProfilePictureView class];
    [HouseData class];
    
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
                                              
                                              //정보 저장
                                              // Create strings and integer to store the text info
                                              NSString *name = result.name;
                                              NSString *gender = [result objectForKey:@"gender"];
                                              NSString *locale = [result objectForKey:@"locale"];
                                              
                                              
                                              // Create instances of NSData
//                                              UIImage *contactImage = contactImageView.image;
//                                              NSData *imageData = UIImageJPEGRepresentation(contactImage, 100);
                                              
                                              
                                              // Store the data
                                             defaults = [NSUserDefaults standardUserDefaults];
                                              
                                              [defaults setObject:name forKey:@"name"];
                                              [defaults setObject:gender forKey:@"gender"];
                                              [defaults setObject:locale forKey:@"locale"];
//                                              [defaults setInteger:birthday forKey:@"birthday"];
//                                              [defaults setObject:imageData forKey:@"image"];
                                              
                                              [defaults synchronize];
                                          }];
                                         
                                      }];
    }
    
    //default app 설정
    [FBSettings setDefaultAppID:@"329361160549114"];      // JH
//    [FBSettings setDefaultAppID:@"742631819134258"];      // GB
    //    self.fbUserId = @"646117635484916";
    
    //session 유지
    //[[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    
    // Root view controller
    _rootViewController = [[SWMRootViewController alloc] init];
    
                        
    // Main Window View start
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.z
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = _rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // Note this handler block should be the exact same as the handler passed to any open calls.
    [FBSession.activeSession setStateChangeHandler:
     ^(FBSession *session, FBSessionState state, NSError *error) {
         
         // Retrieve the app delegate
         SWMAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
         // Call the app delegate's sessionStateChanged:state:error method to handle session state changes
         [appDelegate sessionStateChanged:session state:state error:error];
         NSLog(@"here?");
     }];
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    //return [FBSession.activeSession handleOpenURL:url];
}


- (BOOL) openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
    
    return [FBSession openActiveSessionWithReadPermissions:nil allowLoginUI:allowLoginUI completionHandler:^(FBSession *session,FBSessionState state, NSError *error) {
        [self sessionStateChanged:session state:state error:error];
        NSLog(@"orhere?");
    }];
}

// This method will handle ALL the session state changes in the app
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error
{
    // If the session was opened successfully
    if (!error && state == FBSessionStateOpen){
        // Show the user the logged-in UI
        //[self userLoggedIn];
        
        //for session check and log
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id<FBGraphUser> result, NSError *error) {
            if (!error) {
                NSLog(@"sessionStateChanged .. user info: %@", result);
                NSLog(@"user's name: %@", result.name);
                NSLog(@"user's objectID(=id): %@", result.objectID);
                self.fbUserId = result.objectID;
                NSLog(@"fbUserID : %@", self.fbUserId);
            } else {
                NSLog(@"sessionStateChanged .. Facebook connection Error!!");
            }
        }];
        
        return;
    }
    if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed){
        // If the session is closed
        NSLog(@"Session closed");
        // Show the user the logged-out UI
        //[self userLoggedOut];
    }
    
    // Handle errors
    if (error){
        NSLog(@"Error");
        // If the error requires people using an app to make an action outside of the app in order to recover
        if ([FBErrorUtility shouldNotifyUserForError:error] == YES){
        } else {
            
            // If the user cancelled login, do nothing
            if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
                NSLog(@"User cancelled login");
                
                // Handle session closures that happen outside of the app
            } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
                //[self showMessage:alertText withTitle:alertTitle];
                
                // Here we will handle all other errors with a generic error message.
                // We recommend you check our Handling Errors guide for more information
                // https://developers.facebook.com/docs/ios/errors/
            } else {
                //Get more error information from the error
                NSDictionary *errorInformation = [[[error.userInfo objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"] objectForKey:@"body"] objectForKey:@"error"];
                //[self showMessage:alertText withTitle:alertTitle];
            }
        }
    }
    
    
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
