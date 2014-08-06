//
//  PRegisterViewController2.h
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionCollectionViewController.h"

@interface PRegisterViewController2 : UIViewController <SelectionCollectionViewDelegate>
{
    NSArray *selectArr;
    SelectionCollectionViewController *selectionCollection;
}


@property (strong, nonatomic) IBOutlet UITextField *managementTextField;
@property (strong, nonatomic) IBOutlet UITextField *securityTextField;
@property (strong, nonatomic) IBOutlet UICollectionView *selectList;
@property (strong, nonatomic) IBOutlet UITextField *monthlyRentTextField;


@property (strong, nonatomic) HouseData *houseData;

-(void) refreshHouseData;
-(void) updateHouseData;
@end
