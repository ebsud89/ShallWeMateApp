//
//  SWMProviderMainDetailViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSMenuProtocol.h"
#import "SWMMember.h"

@interface SWMProviderMainDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    CGFloat lastScroll;
//    CGPoint lastGestureVelocity;
    BOOL scrollDir;
    
    UIDynamicAnimator *animator;
    UIAttachmentBehavior *behavior;
    
    SWMMember *memberData;
}
@property (strong, nonatomic) IBOutlet UITableView *contentTableView;
@property (strong, nonatomic) IBOutlet UIButton *mateButton;

@property (strong, nonatomic) HouseData *houseData;

- (void) scrollViewDidChangedDirection;

@end
