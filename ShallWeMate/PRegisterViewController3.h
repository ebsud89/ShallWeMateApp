//
//  PRegisterViewController3.h
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRegisterViewController3 : UIViewController
{
    UILabel *allRoomLable;
    UILabel *posibleRoomLabel;
    
    UIButton *avgAgeBtn;
    NSArray *avgAgesArray;
}

@property (strong, nonatomic) HouseData *houseData;

@property (weak, nonatomic) IBOutlet UIScrollView *keywordScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *lifestyleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *optionScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *roomInfoScrollView;
@property (retain, nonatomic) IBOutlet UIButton *avgAgeBtn;

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

- (IBAction)avgAgeSelect:(id)sender;


@end
