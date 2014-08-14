//
//  SWMSummeryViewController.h
//  ShallWeMate
//
//  Created by 컴038 on 8/15/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMSummeryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) HouseData *houseData;

@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@end
