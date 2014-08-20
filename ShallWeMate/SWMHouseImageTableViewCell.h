//
//  SWMHouseImageTableViewCell.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 14..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMHouseImageScrollView.h"

@interface SWMHouseImageTableViewCell : UITableViewCell <UIScrollViewDelegate>
{
    BOOL badgeViewPresent;
    
    UIDynamicAnimator *animator;
    
    UIDynamicAnimator* heartAnimator;
    
    BOOL heartRunning;
    
    UIView* square;
}
+ (CGFloat) getHeight;

@property (strong, nonatomic) NSMutableArray *houseImageArray;

@property (strong, nonatomic) IBOutlet SWMHouseImageScrollView *imageScrollView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

- (void) openBadge;
- (void) oneFingerTwoTaps;
- (void) oneFingerOneTap;
- (void) setEnabledBadgeView;
- (void) setEnabledLikeIt;

- (void) setTitleText:(NSString *)text;
@end
