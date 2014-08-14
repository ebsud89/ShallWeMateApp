//
//  PRegisterViewController3.h
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionCollectionViewController.h"

@interface PRegisterViewController3 : UIViewController<SelectionCollectionViewDelegate>
{
    UILabel *allRoomLable;
    UILabel *posibleRoomLabel;
    
    UIButton *avgAgeBtn;
    NSArray *avgAgesArray;
    
    SelectionCollectionViewController *selectionCollection;
}

@property (strong, nonatomic) HouseData *houseData;

@property (strong, nonatomic) IBOutlet UICollectionView *selectList;

@property (retain, nonatomic) IBOutlet UILabel *allRoomLabel;
@property (retain, nonatomic) IBOutlet UILabel *posibleRoomLabel;
@property (retain, nonatomic) IBOutlet UIButton *arMinusBtn;
@property (retain, nonatomic) IBOutlet UIButton *arPlusBtn;
@property (retain, nonatomic) IBOutlet UIButton *prMinusBtn;
@property (retain, nonatomic) IBOutlet UIButton *prPlusBtn;

- (IBAction)arMinus:(id)sender;
- (IBAction)arPlus:(id)sender;

- (IBAction)prMinus:(id)sender;
- (IBAction)prPlus:(id)sender;

@end
