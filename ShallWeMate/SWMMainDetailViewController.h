//
//  SWMMainDetailViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMMainDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

{
    BOOL shareMode;
    
    BOOL scrollDir;
    
    UIDynamicAnimator *animator;
    UIAttachmentBehavior *behavior;
    
}

@property (strong, nonatomic) HouseData *houseData;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSString *myTitle;

@property (strong, nonatomic) NSArray *houseImageArray;
@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@property (strong, nonatomic) IBOutlet UIButton *mateButton;

-(void) setHouseImageArray:(NSArray *)houseImageArrays;
- (void) scrollViewDidChangedDirection;

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
