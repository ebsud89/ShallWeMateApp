//
//  ManagementTableViewCell.h
//  start
//
//  Created by 컴049 on 2014. 8. 2..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagementTableViewCell : UITableViewCell

+ (ManagementTableViewCell*) managementTableViewCell;

@property (strong, nonatomic) IBOutlet UILabel *monthlyLabel;
@property (strong, nonatomic) IBOutlet UILabel *securityLabel;
@property (strong, nonatomic) IBOutlet UILabel *managementLabel;


@property (strong, nonatomic) NSString *monthlyCost;
@property (strong, nonatomic) NSString *securityCost;
@property (strong, nonatomic) NSString *managementCost;
@end
