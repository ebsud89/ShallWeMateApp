//
//  RegisterViewController4.h
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionCollectionViewController.h"

@interface RegisterViewController4 : UIViewController
{
    SelectionCollectionViewController *selectionCol;
}


@property (strong, nonatomic) IBOutlet UICollectionView *selectList;

@end
