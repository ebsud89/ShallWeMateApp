//
//  SWMManagementTableViewController.h
//  ShallWeMate
//
//  Created by 컴038 on 8/20/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMTableViewCell.h"

@interface SWMManagementTableViewCell : SWMTableViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    int numberOfItemsInSection;
}

+ (SWMManagementTableViewCell*) collectionViewTableViewCell;
+ (CGFloat) getHeight;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSArray *imageListArray;
@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSMutableArray *managements;
@property (strong, nonatomic) NSMutableArray *option;
@end
