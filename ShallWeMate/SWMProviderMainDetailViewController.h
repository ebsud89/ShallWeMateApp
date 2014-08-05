//
//  SWMProviderMainDetailViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSMenuProtocol.h"

@interface SWMProviderMainDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btn;

- (IBAction)menuBtnTouch:(id)sender;

@end
