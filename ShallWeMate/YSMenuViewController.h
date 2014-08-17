//
//  YSMenuViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMMenuViewController.h"

@protocol YSMenuViewControllerDelegate;

@interface YSMenuViewController : UIViewController

// Constructors
- (id)init;
- (id)initWithCenterViewController:(UIViewController *)centerViewController;

// Open / Close side view controllers
- (void)openMenuViewControllerAnimated:(BOOL)animated completion:(void(^)(void)) completionBlock;
- (void)openLeftSideViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completionBlock;
//- (void)openRightSideViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completionBlock;
- (void)closeSideViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completionBlock;

// Present center view controller
- (void)presentCenterViewController:(UIViewController *)aViewController animated:(BOOL)animated;

// Gestur recognizer
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *centerPanGestureRecognizer;

// View controllers
@property (nonatomic, strong) UIViewController *centerViewController;
@property (nonatomic, strong) SWMMenuViewController *leftViewController;
@property (nonatomic, strong) UIViewController *rightViewController;

// Animation variables
@property (nonatomic, assign) CGFloat   zoomScale;
@property (nonatomic, assign) UIOffset  edgeOffset;
@property (nonatomic, assign) CGFloat   duration;

// Shadow variables
@property (nonatomic, strong) UIColor   *shadowColor;

@property (nonatomic, assign) CGFloat   shadowOpacity;
@property (nonatomic, assign) CGFloat   shadowRadius;

// Provider = YES, Consumer = NO
@property BOOL ProviderBool;

// delegate
@property (nonatomic, assign) id<YSMenuViewControllerDelegate> menuDelegate;


@end

@protocol YSMenuViewControllerDelegate <NSObject>

@required
- (void)openMenu;

@end
