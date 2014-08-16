//
//  BrandRegisterViewController.h
//  start
//
//  Created by 컴038 on 8/4/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandRegisterViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *colorNames;
    NSArray *picData;
}

@property (strong, nonatomic) HouseData *houseData;
@property (strong, nonatomic) NSArray *brandName;
@property (strong, nonatomic) NSArray *picData;
@property (strong, nonatomic) UIImage *brandImage;
- (IBAction)backButtonPressed:(id)sender;
@end
