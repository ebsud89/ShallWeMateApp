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
    
    

    

    
    self.imageScrollView.delegate = self;
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.contentView];
    [self refreshData];
}

- (void) setTitleText:(NSString *)text
{
    self.titleLabel.text = text;
}

- (void) setEnabledLikeIt
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    
    [longPress setMinimumPressDuration:0.5f];
    
    [self.imageScrollView addGestureRecognizer:longPress];
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
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        NSLog(@"Long Press ended");
        return;
    }
    
    NSLog(@"찜~~");
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
