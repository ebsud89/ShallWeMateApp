//
//  ManagementTableViewCell.h
//  start
//
//  Created by 컴049 on 2014. 8. 2..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMTableViewCell.h"

@interface ManagementTableViewCell : SWMTableViewCell
{
    UIAttachmentBehavior *behavior1;
    UIAttachmentBehavior *behavior2;
    UIAttachmentBehavior *behavior3;
    
    UIDynamicAnimator *animator;
    UIDynamicAnimator *animator2;
    UIDynamicAnimator *animator3;
    
    
    CGFloat lastSuperViewY;
}

+ (ManagementTableViewCell*) managementTableViewCell;
+ (CGFloat) getHeight;

@property (strong, nonatomic) IBOutlet UILabel *monthlyLabel;
@property (strong, nonatomic) IBOutlet UILabel *securityLabel;
@property (strong, nonatomic) IBOutlet UILabel *managementLabel;

@property (strong, nonatomic) IBOutlet UILabel *monthlyBoldLabel;
@property (strong, nonatomic) IBOutlet UILabel *securityBoldLabel;
@property (strong, nonatomic) IBOutlet UILabel *managementBoldLabel;

@property (strong, nonatomic) NSString *monthlyCost;
@property (strong, nonatomic) NSString *securityCost;
@property (strong, nonatomic) NSString *managementCost;
@end
