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
    NSNumber *num = [houseRule objectAtIndex:0];
    if ([num boolValue]) {
        self.firstBtn.text = @"원하지 않아요";
    }
    else
    {
        self.firstBtn.text = @"가능해요";
    }
    
    NSNumber *num2 = [houseRule objectAtIndex:1];
    if ([num2 boolValue]) {
        self.secondBtn.text = @"싫어요";
    }
    else
    {
        self.secondBtn.text = @"키워도 좋아요";
    }
    
    NSNumber *num3 = [houseRule objectAtIndex:2];
    if ([num3 boolValue]) {
        self.thirdBtn.text = @"중요치 않아요";
    }
    else
    {
        self.thirdBtn.text = @"중요해요";
    }
    
    NSNumber *num4 = [houseRule objectAtIndex:3];
    if ([num4 boolValue]) {
        self.fifthBtn.text = @"싫어요";
    }
    else
    {
        self.fifthBtn.text = @"괜찮아요";
    }
    
    NSNumber *num5 = [houseRule objectAtIndex:4];
    if ([num5 boolValue]) {
        self.sixBtn.text = @"싫어요";
    }
    else
    {
        self.sixBtn.text = @"좋아요";
    }
    
    
}

@end
