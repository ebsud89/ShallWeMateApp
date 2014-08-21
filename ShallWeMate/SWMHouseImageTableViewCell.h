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
    
    UIAttachmentBehavior *heartBehavior;
    
    BOOL heartRunning;
    
    NSNumber * likeIt;
    
    UIView* square;
}
+ (CGFloat) getHeight;

@property (strong, nonatomic) NSMutableArray *houseImageArray;

@property (strong, nonatomic) IBOutlet UIImageView *heartImgView;

@property (strong, nonatomic) IBOutlet SWMHouseImageScrollView *imageScrollView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subwayLabel;
@property (strong, nonatomic) IBOutlet UILabel *houseLabel;
@property (strong, nonatomic) IBOutlet UILabel *peopleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *matchResultLabel;

@property (strong, nonatomic) IBOutlet UIImageView *imgeViewSubway;
@property (strong, nonatomic) IBOutlet UIImageView *imageviewHeart;
@property (strong, nonatomic) IBOutlet UIImageView *iamgeviewHouse;
@property (strong, nonatomic) IBOutlet UIImageView *imageviewPeople;

@property (strong, nonatomic) IBOutlet UILabel *costLabel;
@property (strong, nonatomic) IBOutlet UILabel *heartLabel;

@property (nonatomic) BOOL isMainTableView;

- (void) openBadge;
- (void) oneFingerTwoTaps;
- (void) oneFingerOneTap;
- (void) setEnabledBadgeView;
- (void) setEnabledLikeIt;

- (void) setTitleText:(NSString *)text;
@end
