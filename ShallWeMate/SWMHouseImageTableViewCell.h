//
//  SWMHouseImageTableViewCell.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 14..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMHouseImageScrollView.h"
#import "BadgeView.h"

@interface SWMHouseImageTableViewCell : UITableViewCell <UIScrollViewDelegate>
{
    BOOL badgeViewPresent;
    
    UIDynamicAnimator *animator;
    
    UIDynamicAnimator* heartAnimator;
    
    UIAttachmentBehavior *heartBehavior;
    
    BOOL heartRunning;
    
    NSNumber * likeIt;
    
    UIView* square;
    
    NSMutableArray * imageArray;
    
    BOOL isOpendBadgeView;
//    CGFloat scrollPage;
}
+ (CGFloat) getHeight;

@property (strong, nonatomic) BadgeView *menuView;

@property ( assign) CGFloat scrollPage;

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
@property (strong, nonatomic) IBOutlet UIImageView *premium;

@property (strong, nonatomic) IBOutlet UILabel *costLabel;
@property (strong, nonatomic) IBOutlet UILabel *heartLabel;

@property (weak, nonatomic) IBOutlet UILabel *costTextLabel;


@property (nonatomic) BOOL isMainTableView;

- (void) openBadge;
- (void) oneFingerTwoTaps;
- (void) oneFingerOneTap;
- (void) setEnabledBadgeView;
- (void) setEnabledLikeIt:(NSNumber *) like with:(BOOL)isHeartImg;

- (void) setTitleText:(NSString *)text;
- (void) setIntroHouse:(NSString *)text;
- (void) refreshUI;
- (void) refreshData;
- (void) setIsMainTableView:(BOOL)isMainTableView with:(HouseData *)houseData;
-(void) setPremiumImageText:(NSString *)imageStr;
@end
