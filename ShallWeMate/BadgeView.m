//
//  BadgeView.m
//  DetailViewTest
//
//  Created by Yoon Seok on 2014. 8. 5..
//  Copyright (c) 2014년 YoonSeok. All rights reserved.
//

#import "BadgeView.h"

#define BadgeViewWidth 320
#define BadgeViewHeight 200

#define BadgeViewTag 1999
#define BadgeViewImageHeight 50

#define BadgeViewTitleHeight 0

#define BadgeViewVerticalPadding 10
#define BadgeViewHorizontalMargin 10

#define BadgeViewRriseAnimationID @"BadgeViewRriseAnimationID"
#define BadgeViewDismissAnimationID @"BadgeViewDismissAnimationID"

#define BadgeViewAnimationTime 0.36
#define BadgeViewAnimationInterval (BadgeViewAnimationTime / 5)

#define TumblrBlue [UIColor colorWithRed:45/255.0f green:68/255.0f blue:94/255.0f alpha:1.0]

@interface BadgeItemButton : UIButton
+ (id)TumblrMenuItemButtonWithTitle:(NSString*)title andIcon:(UIImage*)icon andSelectedBlock:(BadgeViewSelectedBlock)block;
@property(nonatomic,copy)BadgeViewSelectedBlock selectedBlock;
@end

@implementation BadgeItemButton


+ (id)TumblrMenuItemButtonWithTitle:(NSString*)title andIcon:(UIImage*)icon andSelectedBlock:(BadgeViewSelectedBlock)block
{
    BadgeItemButton *button = [BadgeItemButton buttonWithType:UIButtonTypeCustom];
    [button setImage:icon forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    button.selectedBlock = block;
    
    return button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, BadgeViewImageHeight, BadgeViewImageHeight);
    self.titleLabel.frame = CGRectMake(0, BadgeViewImageHeight, BadgeViewImageHeight, BadgeViewImageHeight);
}

@end



@implementation BadgeView
{
    UIImageView *mybackgroundView;
    NSMutableArray *buttonsArray;
}
@synthesize backgroundImgView = mybackgroundView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // 탭하면 사라짐
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        ges.delegate = self;
        [self addGestureRecognizer:ges];
        
        
        self.backgroundColor = [UIColor clearColor];
        mybackgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        mybackgroundView.backgroundColor = TumblrBlue;
        mybackgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        mybackgroundView.frame = frame;
        [self addSubview:mybackgroundView];
        buttonsArray = [[NSMutableArray alloc] initWithCapacity:6];
        
    }
    return self;
}

- (void)addMenuItemWithTitle:(NSString*)title andIcon:(UIImage*)icon andSelectedBlock:(BadgeViewSelectedBlock)block
{
    BadgeItemButton *button = [BadgeItemButton TumblrMenuItemButtonWithTitle:title andIcon:icon andSelectedBlock:block];
    
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    [buttonsArray addObject:button];
}

- (CGRect)frameForButtonAtIndex:(NSUInteger)index
{
    NSUInteger columnCount = 3;
    NSUInteger columnIndex =  index % columnCount;
    NSUInteger rowIndex = (int) index / columnCount;
    
    CGFloat verticalPadding = (BadgeViewWidth - BadgeViewImageHeight*columnCount - BadgeViewHorizontalMargin*(columnCount - 1))/2;

    CGFloat offsetX = verticalPadding + columnIndex * (BadgeViewImageHeight + BadgeViewHorizontalMargin);
    
    CGFloat horizontalPadding = (BadgeViewHeight - (BadgeViewImageHeight *2 +BadgeViewVerticalPadding))/2;
    CGFloat offsetY = horizontalPadding + rowIndex * (BadgeViewImageHeight + BadgeViewVerticalPadding);
    
    return CGRectMake(offsetX, offsetY, BadgeViewImageHeight, BadgeViewImageHeight);
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (NSUInteger i = 0; i < buttonsArray.count; i++) {
        BadgeItemButton *button = buttonsArray[i];
        button.frame = [self frameForButtonAtIndex:i];
    }
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer.view isKindOfClass:[BadgeItemButton class]]) {
        return NO;
    }
    
    CGPoint location = [gestureRecognizer locationInView:self];
    for (UIView* subview in buttonsArray) {
        if (CGRectContainsPoint(subview.frame, location)) {
            return NO;
        }
    }
    
    return YES;
}

- (void)dismiss:(id)sender
{
    // Background Blur Image Fade-Out
    
    [UIView animateWithDuration:0.6f animations:^{
        mybackgroundView.alpha = 0.0f;
    }completion:^(BOOL finish){
        NSLog(@"Background Blur Image Fade-Out 끝");
    }];
    
    [self dropAnimation];
    
    double delayInSeconds = BadgeViewAnimationTime  + BadgeViewAnimationInterval * (buttonsArray.count + 1);
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self removeFromSuperview];
    });
}


- (void)buttonTapped:(BadgeItemButton*)btn
{
    [self dismiss:nil];
    double delayInSeconds = BadgeViewAnimationTime  + BadgeViewAnimationInterval * (buttonsArray.count + 1);
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        btn.selectedBlock();
        
    });
}


- (void)riseAnimation
{
    NSUInteger columnCount = 3;
    NSUInteger rowCount = buttonsArray.count / columnCount + (buttonsArray.count%columnCount>0?1:0);
    
    
    for (NSUInteger index = 0; index < buttonsArray.count; index++) {
        BadgeItemButton *button = buttonsArray[index];
        button.layer.opacity = 0;
        CGRect frame = [self frameForButtonAtIndex:index];
        
        NSUInteger rowIndex = index / columnCount;
        NSUInteger columnIndex = index % columnCount;
        
        /*
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         */
        
//        CGPoint fromPosition = CGPointMake(frame.origin.x + BadgeViewImageHeight / 2.0,frame.origin.y +  (rowCount - rowIndex + 2)*200 + (BadgeViewImageHeight + BadgeViewTitleHeight) / 2.0);
        
        CGPoint fromPosition = CGPointMake(frame.origin.x - (rowCount - rowIndex +2)*200 - (BadgeViewImageHeight + BadgeViewTitleHeight) /2, frame.origin.y + BadgeViewImageHeight / 2.0);
        
        CGPoint toPosition = CGPointMake(frame.origin.x + BadgeViewImageHeight / 2.0,frame.origin.y + (BadgeViewImageHeight + BadgeViewTitleHeight) / 2.0);
        
        double delayInSeconds = rowIndex * columnCount * BadgeViewAnimationInterval;
        if (!columnIndex) {
            delayInSeconds += BadgeViewAnimationInterval;
        }
        else if(columnIndex == 2) {
            delayInSeconds += BadgeViewAnimationInterval * 2;
        }
        
        CABasicAnimation *positionAnimation;
        
        positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:toPosition];
        positionAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.45f :1.2f :0.75f :1.0f];
        positionAnimation.duration = BadgeViewAnimationTime;
        positionAnimation.beginTime = [button.layer convertTime:CACurrentMediaTime() fromLayer:nil] + delayInSeconds;
        [positionAnimation setValue:[NSNumber numberWithUnsignedInteger:index] forKey:BadgeViewRriseAnimationID];
        positionAnimation.delegate = self;
        
        [button.layer addAnimation:positionAnimation forKey:@"riseAnimation"];
        
        
        
    }
}

- (void)dropAnimation
{
    NSUInteger columnCount = 3;
    for (NSUInteger index = 0; index < buttonsArray.count; index++) {
        BadgeItemButton *button = buttonsArray[index];
        CGRect frame = [self frameForButtonAtIndex:index];
        NSUInteger rowIndex = index / columnCount;
        NSUInteger columnIndex = index % columnCount;
        
        
        // 사라질 때, 나가는 위치
//        CGPoint toPosition = CGPointMake(frame.origin.x + BadgeViewImageHeight / 2.0,frame.origin.y -  (rowIndex + 2)*200 + (BadgeViewImageHeight + BadgeViewTitleHeight) / 2.0);
        
        CGPoint toPosition = CGPointMake(frame.origin.x + (rowIndex + 2)*200 - (BadgeViewImageHeight + BadgeViewTitleHeight) / 2.0,frame.origin.y + BadgeViewImageHeight / 2.0);
        
        CGPoint fromPosition = CGPointMake(frame.origin.x + BadgeViewImageHeight / 2.0,frame.origin.y + (BadgeViewImageHeight + BadgeViewTitleHeight) / 2.0);
        
        double delayInSeconds = rowIndex * columnCount * BadgeViewAnimationInterval;
        if (!columnIndex) {
            delayInSeconds += BadgeViewAnimationInterval;
        }
        else if(columnIndex == 2) {
            delayInSeconds += BadgeViewAnimationInterval * 2;
        }
        CABasicAnimation *positionAnimation;
        
        positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:toPosition];
        positionAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.3 :0.5f :1.0f :1.0f];
        positionAnimation.duration = BadgeViewAnimationTime;
        positionAnimation.beginTime = [button.layer convertTime:CACurrentMediaTime() fromLayer:nil] + delayInSeconds;
        [positionAnimation setValue:[NSNumber numberWithUnsignedInteger:index] forKey:BadgeViewDismissAnimationID];
        positionAnimation.delegate = self;
        
        [button.layer addAnimation:positionAnimation forKey:@"riseAnimation"];
        
        
        
    }
    
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSUInteger columnCount = 3;
    if([anim valueForKey:BadgeViewRriseAnimationID]) {
        NSUInteger index = [[anim valueForKey:BadgeViewRriseAnimationID] unsignedIntegerValue];
        UIView *view = buttonsArray[index];
        CGRect frame = [self frameForButtonAtIndex:index];
        CGPoint toPosition = CGPointMake(frame.origin.x + BadgeViewImageHeight / 2.0,frame.origin.y + (BadgeViewImageHeight + BadgeViewTitleHeight) / 2.0);
        CGFloat toAlpha = 1.0;
        
        view.layer.position = toPosition;
        view.layer.opacity = toAlpha;
        
    }
    else if([anim valueForKey:BadgeViewDismissAnimationID]) {
        NSUInteger index = [[anim valueForKey:BadgeViewDismissAnimationID] unsignedIntegerValue];
        NSUInteger rowIndex = index / columnCount;
        
        UIView *view = buttonsArray[index];
        CGRect frame = [self frameForButtonAtIndex:index];
        CGPoint toPosition = CGPointMake(frame.origin.x + BadgeViewImageHeight / 2.0,frame.origin.y -  (rowIndex + 2)*200 + (BadgeViewImageHeight + BadgeViewTitleHeight) / 2.0);
        
        view.layer.position = toPosition;
    }
}


- (void)show
{
    
    UIViewController *appRootViewController;
    UIWindow *window;
    
    window = [UIApplication sharedApplication].keyWindow;
    
    
    appRootViewController = window.rootViewController;
    
    
    
    UIViewController *topViewController = appRootViewController;
    while (topViewController.presentedViewController != nil)
    {
        topViewController = topViewController.presentedViewController;
    }
    
    if ([topViewController.view viewWithTag:BadgeViewTag]) {
        [[topViewController.view viewWithTag:BadgeViewTag] removeFromSuperview];
    }
    
    self.frame = topViewController.view.bounds;
    [topViewController.view addSubview:self];
    
    [self riseAnimation];
}

- (void) show:(UIView *)cell
{
    self.frame = cell.bounds;
    
    
    //Get a UIImage from the UIView
    UIGraphicsBeginImageContext(cell.bounds.size);
    [cell.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Blur the image
    CIImage *blurImg = [CIImage imageWithCGImage:viewImage.CGImage];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CIFilter *clampFilter = [CIFilter filterWithName:@"CIAffineClamp"];
    [clampFilter setValue:blurImg forKey:@"inputImage"];
    [clampFilter setValue:[NSValue valueWithBytes:&transform objCType:@encode(CGAffineTransform)] forKey:@"inputTransform"];
    
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:clampFilter.outputImage forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat:5.0f] forKey:@"inputRadius"];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImg = [context createCGImage:gaussianBlurFilter.outputImage fromRect:[blurImg extent]];
    UIImage *outputImg = [UIImage imageWithCGImage:cgImg];
    
    // Add background View
    mybackgroundView.image = outputImg;
    
    mybackgroundView.alpha = 0.0f;
    
    [cell addSubview:self];
    
    [cell setUserInteractionEnabled:NO];
    // Background Blur Image Fade-In
    [UIView animateWithDuration:0.6f animations:^{
        mybackgroundView.alpha = 1.0;
    } completion:^(BOOL finish){
        [cell setUserInteractionEnabled:YES];
        NSLog(@"Background Blur Image Fade-In 끝");
    }];
    
    
    
    [self riseAnimation];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
