//
//  ManagementTableViewCell.m
//  start
//
//  Created by 컴049 on 2014. 8. 2..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "ManagementTableViewCell.h"

@implementation ManagementTableViewCell

+ (ManagementTableViewCell*) managementTableViewCell
{
    ManagementTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ManagementTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)awakeFromNib
{
    // Initialization code
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
