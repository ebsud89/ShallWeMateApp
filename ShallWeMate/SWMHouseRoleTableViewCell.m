//
//  SWMHouseRoleTableViewCell.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 14..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMHouseRoleTableViewCell.h"

@implementation SWMHouseRoleTableViewCell
+ (CGFloat)getHeight
{
    return 296.0f;
}

- (IBAction)finishClicked:(id)sender {
//    SWMSummeryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SWMSummeryViewController"];
//    
//    vc.memberData = memberData;
//    [self.view addSubview:vc.view];
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

- (void)setHouseRule:(NSMutableArray *)houseRule
{
//    houseRule
}

@end
