//
//  SWMMateInfoTableViewCell.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 12..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMTableViewCell.h"

@interface SWMMateInfoTableViewCell : SWMTableViewCell
+ (CGFloat)getHeight;
@property (strong, nonatomic) IBOutlet UILabel *avgAgeLabel;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;

@property (strong, nonatomic) NSString *avgAge;
@property (strong, nonatomic) NSString *gender;
@end
