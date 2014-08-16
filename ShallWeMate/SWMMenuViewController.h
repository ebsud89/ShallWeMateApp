//
//  SWMMenuViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSMenuViewController.h"

@interface SWMMenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *myInfoBtn;
@property (strong, nonatomic) IBOutlet UIButton *houseInfoBtn;
@property (strong, nonatomic) IBOutlet UIButton *settingBtn;

@property (strong, nonatomic) IBOutlet UIView *providerView;
@property (strong, nonatomic) IBOutlet UIView *consumerView;

- (void) setProviderMenu;
- (void) setConsumerMenu;

//-(void)moveLayer:(CALayer*)layer to:(CGPoint)point;
-(void)openMenu;
//-(void)closeMenu;

@end
