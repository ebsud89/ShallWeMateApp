//
//  PRegisterViewController6.h
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionCollectionViewController.h"

@interface PRegisterViewController6 : UIViewController <SelectionCollectionViewDelegate>
{
    SelectionCollectionViewController *selectionCol;
}

@property (strong, nonatomic) HouseData *houseData;

@property (strong, nonatomic) IBOutlet UICollectionView *selectList;

@end
