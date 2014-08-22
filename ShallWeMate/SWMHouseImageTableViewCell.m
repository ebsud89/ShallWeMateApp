//
//  SWMHouseImageTableViewCell.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 14..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMHouseImageTableViewCell.h"

@implementation SWMHouseImageTableViewCell
+ (CGFloat) getHeight
{
    return 220.0f;
}

- (void)awakeFromNib
{
    // Initialization code
    

    isOpendBadgeView = NO;
    
    [self hiddenSubView:YES];
    [self.heartImgView removeFromSuperview];
    self.imageScrollView.delegate = self;
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.contentView];
    
    
    [self refreshData];
}


- (void) refreshUI
{
    NSLog(@"~~~~~~~~~~============================");

    self.imageScrollView.contentOffset = CGPointMake(_scrollPage,0);
    
}

- (void) setIsMainTableView:(BOOL)isMainTableView with:(HouseData *)houseData
{
    if (isMainTableView) {
        self.houseLabel.text = houseData.roomAll;
        self.peopleLabel.text = houseData.roomEmpty;
        self.costLabel.text = houseData.monthlyRentCost;
        self.subwayLabel.text = houseData.stationCode;
        
//        self.heartLabel.text = houseData
        [self hiddenSubView:NO];
        
        imageArray = [[NSMutableArray alloc]init];
        for (int i=0; i<[houseData.enableLifeStyle count]; i++) {
            NSNumber *num = [houseData.enableLifeStyle objectAtIndex:i];
            if ([num boolValue]) {
                [imageArray addObject:[NSString stringWithFormat:@"lifestyle_0%d copy.png",i+1]];
            }
        }
        
        if ([imageArray count]<6) {
            for (int i= (int)[imageArray count]; i<6; i++) {
                [imageArray addObject:@""];
            }
        }
    }
}

- (void) setTitleText:(NSString *)text
{
    self.titleLabel.text = text;
}

//-(void) setPremium:(UIImageView *)premium
//{
//    self.premium = premium;
//    NSLog(@"preminum : %f", premium.frame.size.height);
//    
//}

-(void) setPremiumImageText:(NSString *)imageStr
{
    self.premium.image = [UIImage imageNamed:imageStr];
    NSLog(@"preminum : %f", self.premium.frame.size.height);
}

- (void) setEnabledLikeIt:(NSNumber *) like with:(BOOL)isHeartImg
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    
    [longPress setMinimumPressDuration:0.5f];
    
    likeIt = like;
    
    [self.imageScrollView addGestureRecognizer:longPress];
    
    UIImage *myHeart;
    
    if (isHeartImg) {
        myHeart = [UIImage imageNamed:@"loveitl.png"];
        
    }
    else
    {
        myHeart = [UIImage imageNamed:@"loveit.png"];
    }
    
    self.heartImgView.image =myHeart;
}


- (void) setEnabledBadgeView
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.contentView addGestureRecognizer:swipeGesture];
    badgeViewPresent = NO;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//    // Configure the view for the selected state
//    
//}

//스크롤이 변경될때 page의 currentPage 설정
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
//    NSLog(@"Scrollololololololololl");
    CGFloat pageWidth = self.imageScrollView.frame.size.width;
    
    // -0.3~0.6 -> 첫페이지
    CGFloat pageIndex = ((self.imageScrollView.contentOffset.x - pageWidth / 3) / pageWidth);
    
    _scrollPage = (int) self.imageScrollView.contentOffset.x / self.contentView.frame.size.width;
    
//    NSLog(@"%f", _scrollPage);
    if (pageIndex <0)
    {
        CGFloat alpha = pageIndex * (-3);
        [self setAlphaSubview:alpha];
        
    }
    else
    {
        CGFloat alpha = 0;
        [self setAlphaSubview:alpha];
    }
}

- (void) longPress:(UILongPressGestureRecognizer*)gesture
{
    if (![likeIt boolValue]) {
        if (!heartRunning) {
            [self.contentView addSubview:self.heartImgView];
            
            [self.heartImgView setFrame:CGRectMake(113, 72, 93, 76)];
            
            self.heartImgView.alpha = 0.0f;
            self.heartImgView.transform = CGAffineTransformMakeScale(0.7, 0.7);
            
            //        heartAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.contentView];
            
            //        heartBehavior = [[UIAttachmentBehavior alloc]initWithItem:self.heartImgView attachedToAnchor:self.heartImgView.frame.origin];
            //
            //        heartBehavior.damping = 0.3;
            //        heartBehavior.length = 10;
            //        heartBehavior.frequency = 2.0;
            //
            //        [heartAnimator addBehavior:heartBehavior];
            
            [UIView animateWithDuration:0.4f animations:^{
                self.heartImgView.alpha = 1.0f;
            } completion:^(BOOL finish){
                [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(zzimEnd) userInfo:nil repeats:NO];
            }];
            
            heartRunning = YES;
        }
    }
    
}

- (void) zzimEnd
{
    
    [UIView animateWithDuration:0.2f animations:^{
        self.heartImgView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.heartImgView.alpha = 0.0f;
    } completion:^(BOOL finish){
        [self.heartImgView removeFromSuperview];
        likeIt = [NSNumber numberWithDouble:YES];
    }];
    
    NSLog(@"Long Press ended");
    heartRunning = NO;
}



- (void) swipe:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"left swipe");
    if (!badgeViewPresent) {
        [self openBadge];
        badgeViewPresent = YES;
    }

}

/*--------------------------------------------------------------
 * One finger, two taps
 *-------------------------------------------------------------*/
- (void)oneFingerTwoTaps
{
    NSLog(@"Action: One finger, two taps");

    NSLog(@"찜~~~~~~~~~~~~~~~~~");
//    [self buttonClicke:self];
}

- (void) oneFingerOneTap
{
    [super setSelected:YES animated:NO];
    NSLog(@"Action : One Finger, One Taps");
    
    NSLog(@"탭탭탭");
    
}


- (void) openBadge
{
    _menuView = [[BadgeView alloc] init];
    
    for (int i=0 ; i<6; i++) {
        [_menuView addMenuItemWithTitle:@"" andIcon:[UIImage imageNamed:[imageArray objectAtIndex:i]] andSelectedBlock:^{
            NSLog(@"Text selected");
        }];
    }
    
    isOpendBadgeView = YES;
    
    [_menuView show:self.contentView];
}

- (void) refreshData
{
    
    if ([self.houseImageArray count] == 0) {
        
        self.houseImageArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"testImg1.jpg"],[UIImage imageNamed:@"testImg2.jpg"],[UIImage imageNamed:@"testImg3.jpg"],[UIImage imageNamed:@"testImg1.jpg"],[UIImage imageNamed:@"testImg2.jpg"],[UIImage imageNamed:@"testImg3.jpg"], nil];
    }
    
    
    int count = (int) [self.houseImageArray count];
    
    for (int i=0; i<count; i++) {
        CGRect frame;
        frame.origin.x = self.imageScrollView.frame.size.width*i;
        frame.origin.y = 0;
        frame.size = self.imageScrollView.frame.size;
        
        UIImage *myImage = [self.houseImageArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:myImage];
        
        imageView.frame = frame;
        [self.imageScrollView addSubview:imageView];
    }
    
    self.imageScrollView.contentSize = CGSizeMake(self.imageScrollView.frame.size.width * count, self.imageScrollView.frame.size.height);
    
    
}

- (void) hiddenSubView:(BOOL)hidden
{
    self.titleLabel.hidden = hidden;
    self.subwayLabel.hidden = hidden;
    self.houseLabel.hidden = hidden;
    self.peopleLabel.hidden = hidden;
    self.matchResultLabel.hidden = hidden;
    self.imgeViewSubway.hidden = hidden;
    self.imageviewHeart.hidden = hidden;
    self.iamgeviewHouse.hidden = hidden;
    self.imageviewPeople.hidden = hidden;
    
    self.costLabel.hidden = hidden;
    self.heartLabel.hidden = hidden;
    
    self.costTextLabel.hidden = hidden;
    self.premium.hidden = hidden;
}

- (void) setAlphaSubview:(CGFloat)alpha
{
    [self.titleLabel setAlpha:alpha];
    [self.subwayLabel setAlpha:alpha];
    [self.houseLabel setAlpha:alpha];
    [self.peopleLabel setAlpha:alpha];
    [self.matchResultLabel setAlpha:alpha];
    [self.imgeViewSubway setAlpha:alpha];
    [self.imageviewHeart setAlpha:alpha];
    [self.iamgeviewHouse setAlpha:alpha];
    [self.imageviewPeople setAlpha:alpha];
    
    [self.costLabel setAlpha:alpha];
    [self.heartLabel setAlpha:alpha];
    
    [self.costTextLabel setAlpha:alpha];
    [self.premium setAlpha:alpha];
}

@end
