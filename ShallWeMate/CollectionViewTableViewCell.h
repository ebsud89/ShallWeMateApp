//
//  CollectionViewTableViewCell.h
//  start
//
//  Created by 컴049 on 2014. 8. 1..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewTableViewCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    int numberOfItemsInSection;
}

+ (CollectionViewTableViewCell*) collectionViewTableViewCell;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) NSArray *imageListArray;
@property (strong, nonatomic) NSString *title;

@end
