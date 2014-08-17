//
//  SWMMateInfoTableViewCell.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 12..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMMateInfoTableViewCell.h"

@implementation SWMMateInfoTableViewCell
+ (CGFloat)getHeight
{
    return 130.0f;
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setAvgAge:(NSString *)avgAge
{
    self.avgAgeLabel.text = avgAge;
}

- (void) setGender:(NSString *)gender
{
    self.genderLabel.text = gender;
}

@end
