//
//  BadgeView.h
//  DetailViewTest
//
//  Created by Yoon Seok on 2014. 8. 5..
//  Copyright (c) 2014년 YoonSeok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

typedef void (^BadgeViewSelectedBlock)(void);

@interface BadgeView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, readonly)UIImageView *backgroundImgView;

- (void)addMenuItemWithTitle:(NSString*)title andIcon:(UIImage*)icon andSelectedBlock:(BadgeViewSelectedBlock)block;
- (void)show;
- (void)show:(UIView *)cell;

@end
