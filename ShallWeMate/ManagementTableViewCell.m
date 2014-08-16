//
//  ManagementTableViewCell.m
//  start
//
//  Created by 컴049 on 2014. 8. 2..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "ManagementTableViewCell.h"

@implementation ManagementTableViewCell

+ (CGFloat) getHeight
{
    return 180.0f;
}

+ (ManagementTableViewCell*) managementTableViewCell
{
    ManagementTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ManagementTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)awakeFromNib
{
    // Initialization code
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.contentView];
    animator2 = [[UIDynamicAnimator alloc]initWithReferenceView:self.contentView];
    animator3 = [[UIDynamicAnimator alloc]initWithReferenceView:self.contentView];
    
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    
    [animator removeAllBehaviors];
    
    
    behavior1 = [[UIAttachmentBehavior alloc]initWithItem:self.monthlyBoldLabel attachedToAnchor:CGPointMake(40.0f, 30.0f - (lastSuperViewY -  rectInSuperview.origin.y)* 10)];
    
    
    behavior1.length = 0.5;
    behavior1.damping = 0.9;
    behavior1.frequency = 1.5;
    
    
    [animator addBehavior:behavior1];

    
    [animator2 removeAllBehaviors];
    
    behavior2 = [[UIAttachmentBehavior alloc]initWithItem:self.securityBoldLabel attachedToAnchor:CGPointMake(40.0f, 50.0f- (lastSuperViewY -  rectInSuperview.origin.y)* 10)];
    
    behavior2.length = 0.5;
    behavior2.damping = 0.9;
    behavior2.frequency = 1.8;
    
    [animator2 addBehavior:behavior2];
    
    [animator3 removeAllBehaviors];
    behavior3 = [[UIAttachmentBehavior alloc]initWithItem:self.managementBoldLabel attachedToAnchor:CGPointMake(40.0f, 70.0f - (lastSuperViewY - rectInSuperview.origin.y) * 10)];
    
    behavior3.length = 0.5;
    behavior3.damping = 0.9;
    behavior3.frequency = 2.0;
    
    [animator3 addBehavior:behavior3];
    
    lastSuperViewY = rectInSuperview.origin.y;
    
}

- (void) setMonthlyCost:(NSString *)monthlyCost
{
    if ([monthlyCost isEqualToString:@""]) {
        monthlyCost = @"입력 되지 않았습니다.";
    }
    
    self.monthlyLabel.text = monthlyCost;
}

- (void) setSecurityCost:(NSString *)securityCost
{
    if ([securityCost isEqualToString:@""]) {
        securityCost = @"입력 되지 않았습니다.";
    }
    
    self.securityLabel.text = securityCost;
}

- (void) setManagementCost:(NSString *)managementCost
{
    if ([managementCost isEqualToString:@""]) {
        managementCost = @"입력 되지 않았습니다.";
    }
    
    self.managementLabel.text = managementCost;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
