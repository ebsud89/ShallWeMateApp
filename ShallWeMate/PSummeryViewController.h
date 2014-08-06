//
//  PSummeryViewController.h
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSummeryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) HouseData *houseData;

@property (strong, nonatomic) IBOutlet UITableView *contentTableView;


@end
