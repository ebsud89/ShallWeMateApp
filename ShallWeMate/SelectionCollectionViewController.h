//
//  SelectionCollectionViewController.h
//  start
//
//  Created by 컴049 on 2014. 7. 23..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SelectionCollectionViewDelegate;

@interface SelectionCollectionViewController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) id<SelectionCollectionViewDelegate>delegate;
@property (nonatomic, assign) NSString *viewController;
@property (strong, nonatomic) UICollectionView *selectList;
@property (assign, nonatomic) int numberOfItemsInSection;
@property (strong, nonatomic) NSArray *picData;
@property (strong, nonatomic) NSArray *unselectedPicData;
@property (strong, nonatomic) NSArray *data;

- (void) selectionListInit;
- (void) selectItem:(int) index;
@end

@protocol SelectionCollectionViewDelegate <NSObject>

@required
- (void) didSelectedItem:(NSIndexPath *) indexPath;
- (void) didDeSelectedItem:(NSIndexPath *) indexPath;

@end