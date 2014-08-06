//
//  SWMMainDetailViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMMainDetailViewController : UIViewController

{
    BOOL shareMode;
}

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSString *myTitle;
@property (strong, nonatomic) IBOutlet UIScrollView *houseImageScrollView;
@property (strong, nonatomic) NSArray *houseImageArray;
-(void) setHouseImageArray:(NSArray *)houseImageArrays;

// share Page
@property (strong, nonatomic) IBOutlet UIView *shareView;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet UIView *doorView;

@property UIImageView *leftView;
@property UIImageView *rightView;

-(void) startShareViewAni;
-(void) endShareViewAni;
- (UIImageView*) createImg:(UIView*)view;
- (UIImageView*) createImageViewLeft:(UIImageView*)view;
- (UIImageView*) createimageViewRight:(UIImageView*)view;

@end
