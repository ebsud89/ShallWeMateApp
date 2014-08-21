//
//  CollectionViewTableViewCell.h
//  start
//
//  Created by 컴049 on 2014. 8. 1..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMTableViewCell.h"

@interface CollectionViewTableViewCell : SWMTableViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    int numberOfItemsInSection;
}

+ (CollectionViewTableViewCell*) collectionViewTableViewCell;
+ (CGFloat) getHeight;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSArray *imageListArray;
@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSMutableArray *lifestyle;
@property (strong, nonatomic) NSMutableArray *option;
@end
