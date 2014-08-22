//
//  SWMStartViewController.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 17..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"

@interface SWMStartViewController : UIViewController
@property (strong, nonatomic) IBOutlet FLAnimatedImageView *loadingImageView;

- (void) startView;
- (void) popFacebookLogin;
- (void)goNext;
@end
