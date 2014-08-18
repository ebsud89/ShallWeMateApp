//
//  SWMPRegisterViewController.m
//  ShallWeMate
//
//  Created by 컴038 on 8/17/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "SWMPRegisterViewController.h"
#import "PRegisterViewController1.h"

@implementation SWMPRegisterViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //navigation bar hidden
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    //background image setting
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"어두운배경.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

@end
