//
//  SWMHouseImageTableViewCell.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 14..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMHouseImageTableViewCell.h"
#import "BadgeView.h"

@implementation SWMHouseImageTableViewCell
+ (CGFloat) getHeight
{
    return 220.0f;
}

- (void)awakeFromNib
{
    // Initialization code
    
//    UITapGestureRecognizer *oneFingerOneTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneFingerOneTap)];
//    
//    [oneFingerOneTap setNumberOfTapsRequired:1];
//    [oneFingerOneTap setNumberOfTouchesRequired:1];
//    
//    [self.contentView addGestureRecognizer:oneFingerOneTap];
    
    // Create gesture recognizer
    
//    UITapGestureRecognizer *oneFingerTwoTaps =
//    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] ;
//    
//    // Set required taps and number of touches
//    [oneFingerTwoTaps setNumberOfTapsRequired:2];
//    [oneFingerTwoTaps setNumberOfTouchesRequired:1];
//    
//    // Add the gesture to the view
//    [self.imageScrollView addGestureRecognizer:oneFingerTwoTaps];
    
//    // Add gestures
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePanel:)];
//    [panGesture setMinimumNumberOfTouches:1];
//    [panGesture setMaximumNumberOfTouches:1];
//    [panGesture setDelegate:self];
//    
//    [self.contentView addGestureRecognizer:panGesture];
    
    

//    self.heartImgView.frame = CGRectMake(self.heartImgView.frame.origin.x, self.heartImgView.frame.origin.y, self.heartImgView.frame.size.width/2, self.heartImgView.frame.size.height/2);
    

    [self.heartImgView removeFromSuperview];
    self.imageScrollView.delegate = self;
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.contentView];
    
    
    [self refreshData];
}


- (void) setTitleText:(NSString *)text
{
    self.titleLabel.text = text;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
}

//스크롤이 변경될때 page의 currentPage 설정
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = self.imageScrollView.frame.size.width;

    // -0.3~0.6 -> 첫페이지
    CGFloat pageIndex = ((self.imageScrollView.contentOffset.x - pageWidth / 3) / pageWidth);
    if (pageIndex <0)
    {
        [self.titleLabel setAlpha:(pageIndex*-3)];
    }
    else
    {
        [self.titleLabel setAlpha:0.0f];
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
    BadgeView *menuView = [[BadgeView alloc] init];
    [menuView addMenuItemWithTitle:@"Text" andIcon:[UIImage imageNamed:@"makefg.php.png"] andSelectedBlock:^{
        NSLog(@"Text selected");
    }];
    [menuView addMenuItemWithTitle:@"Photo" andIcon:[UIImage imageNamed:@"makefg.php.png"] andSelectedBlock:^{
        NSLog(@"Photo selected");
    }];
    [menuView addMenuItemWithTitle:@"Quote" andIcon:[UIImage imageNamed:@"makefg.php.png"] andSelectedBlock:^{
        NSLog(@"Quote selected");
        
    }];
    [menuView addMenuItemWithTitle:@"Link" andIcon:[UIImage imageNamed:@"makefg.php.png"] andSelectedBlock:^{
        NSLog(@"Link selected");
        
    }];
    [menuView addMenuItemWithTitle:@"Chat" andIcon:[UIImage imageNamed:@"makefg.php.png"] andSelectedBlock:^{
        NSLog(@"Chat selected");
        
    }];
    [menuView addMenuItemWithTitle:@"Video" andIcon:[UIImage imageNamed:@"makefg.php.png"] andSelectedBlock:^{
        NSLog(@"Video selected");
        
    }];
    
    
    [menuView show:self.contentView];
}

- (void) refreshData
{
    
    
    
    //    if ([self.houseImageArray count] == 0) {
    self.houseImageArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"testImg1.jpg"],[UIImage imageNamed:@"testImg2.jpg"],[UIImage imageNamed:@"testImg3.jpg"],[UIImage imageNamed:@"testImg1.jpg"],[UIImage imageNamed:@"testImg2.jpg"],[UIImage imageNamed:@"testImg3.jpg"], nil];
    //    }
    
    
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


@end
