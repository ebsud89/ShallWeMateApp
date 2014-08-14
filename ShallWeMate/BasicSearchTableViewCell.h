//
//  BasicSearchTableViewCell.h
//  start
//
//  Created by 컴049 on 2014. 8. 2..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMTableViewCell.h"

@interface BasicSearchTableViewCell : SWMTableViewCell

+ (BasicSearchTableViewCell*) basicSearchTableViewCell;
+ (CGFloat) getHeight;

@property (strong, nonatomic) IBOutlet UILabel *searchLocationLabel;
@property (strong, nonatomic) IBOutlet UILabel *monthlyCostMaxLabel;
@property (strong, nonatomic) IBOutlet UILabel *securityCostMaxLabel;

@end
